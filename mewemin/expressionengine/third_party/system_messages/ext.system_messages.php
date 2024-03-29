<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if (! defined('CSM_VERSION'))
{
    // get the version from config.php
    require PATH_THIRD.'system_messages/config.php';
    define('CSM_VERSION', $config['version']);
    define('CSM_NAME', $config['name']);
    define('CSM_DESCRIPTION', $config['description']);
}

/**
 * ExpressionEngine 2.x Custom System Messages Extension
 *
 * @package     ExpressionEngine
 * @subpackage  Extensions
 * @category    Custom System Messages
 * @author      Brian Litzinger
 * @copyright   Copyright (c) 2010, 2011 - Brian Litzinger
 * @link        http://boldminded.com/add-ons/csm
 * @license 
 *
 * Copyright (c) 2011, 2012. BoldMinded, LLC
 * All rights reserved.
 *
 * This source is commercial software. Use of this software requires a
 * site license for each domain it is used on. Use of this software or any
 * of its source code without express written permission in the form of
 * a purchased commercial or other license is prohibited.
 *
 * THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * As part of the license agreement for this software, all modifications
 * to this source must be submitted to the original author for review and
 * possible inclusion in future releases. No compensation will be provided
 * for patches, although where possible we will attribute each contribution
 * in file revision notes. Submitting such modifications constitutes
 * assignment of copyright to the original author (Brian Litzinger and
 * BoldMinded, LLC) for such modifications. If you do not wish to assign
 * copyright to the original author, your license to  use and modify this
 * source is null and void. Use of this software constitutes your agreement
 * to this clause.
 */

class System_messages_ext {

    public $settings       = array();
    public $name           = CSM_NAME;
    public $version        = CSM_VERSION;
    public $description    = CSM_DESCRIPTION;
    public $settings_exist = 'y';
    public $docs_url       = 'http://boldminded.com/add-ons/csm/';

    /**
     * Constructor
     */
    public function System_messages_ext($settings = '') 
    {
        $this->EE =& get_instance();
        $settings = $this->_get_settings();
        
        // All settings
        $this->global_settings = $settings;
        
        // Site specific settings
        $site_id = $this->EE->config->item('site_id');
        $this->settings = isset($settings[$site_id]) ? $settings[$site_id] : array();
    }
    
    /**
     * Install the extension
     */
    public function activate_extension()
    {
        // Delete old hooks
        $this->EE->db->query("DELETE FROM exp_extensions WHERE class = '". __CLASS__ ."'");
        
        // Add new hooks
        $ext_template = array(
            'class'    => __CLASS__,
            'settings' => '',
            'priority' => 1,
            'version'  => $this->version,
            'enabled'  => 'y'
        );
        
        $extensions = array(
            array('hook'=>'output_show_message', 'method'=>'output_show_message'),
            array('hook'=>'sessions_start', 'method'=>'extend_output_class')
        );
        
        foreach($extensions as $extension)
        {
            $ext = array_merge($ext_template, $extension);
            $this->EE->db->insert('exp_extensions', $ext);
        }       
    }

    /**
     * @param string $current currently installed version
     */
    public function update_extension($current = '') 
    {
        if ($current < '2.4')
        {
            // Add new hooks
            $ext_template = array(
                'class'    => __CLASS__,
                'settings' => serialize($this->global_settings),
                'priority' => 1,
                'version'  => $this->version,
                'enabled'  => 'y'
            );
            
            $extensions = array(
                array('hook'=>'template_post_parse', 'method'=>'template_post_parse')
            );
            
            foreach($extensions as $extension)
            {
                $ext = array_merge($ext_template, $extension);
                $this->EE->db->insert('exp_extensions', $ext);
            }   

            $this->EE->db->where('class', __CLASS__)
                         ->update('exp_extensions', array(
                            'version' => $this->version
                        ));
        }
    }

    /**
     * Uninstalls extension
     */
    public function disable_extension() 
    {
        $this->EE->db->query("DELETE FROM exp_extensions WHERE class = '" . __CLASS__ . "'");
    }
    
    public function extend_output_class()
    {
        $vars = array('action', 'error');
        
        foreach ($vars as $var)
        {
            // $this->EE->config->_global_vars[$var] = FALSE;
            $this->EE->config->_global_vars['csm:'.$var] = FALSE;
        }

        @session_start();

        // Create early parsed global vars for the redirect_to_template option
        if (isset($_SESSION['csm_data']))
        {
            foreach ($_SESSION['csm_data'] as $key => $value)
            {
                $this->EE->config->_global_vars['csm:'.$key] = $value;
            }
        }
        
        $this->EE->output = new System_Messages_Output;
    }

    public function template_post_parse($final_template, $sub, $site_id)
    {
        @session_start();

        // Create late parsed vars for the redirect_to_template option
        if (isset($_SESSION['csm_data']))
        {
            foreach ($_SESSION['csm_data'] as $key => $value)
            {
                $final_template = str_replace('{'.$key.'}', $value, $final_template);
            }
        }

        return $final_template;
    }

    /**
    * Where the magic happens
    *
    * @param $data     array    The array of variables and their values used in the error template: heading, content, link, refresh, meta
    * @return string            Returns/prints out the final rendered template. w00t
    */
    public function output_show_message($data)
    {        
        // If the request is from the control panel, stop, we don't want to hijack CP error screens
        if(defined('REQ') AND REQ == 'CP')
            return false;
            
        if(!isset($this->EE->TMPL))
        {
            $this->EE->load->library('template');
            $this->EE->TMPL = new EE_Template();
        }
        
        $settings = $this->settings;
        
        // Get the ACT ID if present
        $action_id = $this->EE->input->get_post('ACT', false);
        
        // Lets add some additional variables to the page
        $data['referrer'] = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
        $data['action'] = $action_id;
        
        // Before going any further see if bypass on success is enabled.
        if(
            isset($settings['bypass_success']) AND $settings['bypass_success'] == 'y' AND 
            isset($data['redirect']) AND $data['redirect'] != '' AND
            $data['redirect'] != $data['referrer']
        ){
            $this->EE->load->helper('url');
            redirect($data['redirect']);
        }
        
        $this->EE->lang->loadfile('system_messages');

        if(empty($settings))
        {
            $this->EE->output->show_user_error('general', array(lang('no_settings')));
        }
        
        // If we have an ACT ID, it takes prescedence over other defined templates.
        // If data['type'] is not false, meaning it's 'submission' or 'general', then we have a form submission error
        // so we can't use the action overrides b/c ACT=12, logout, is used on success or failure.

        // Added in version 2.1
        if(
            $action_id AND isset($settings['actions']) AND 
            (in_array($action_id, $settings['actions']) AND $data['type'] === false) OR
            (in_array($action_id.'_error', $settings['actions']) AND $data['type'] !== false)
        ){
            // Fix from Todd Perkins v2.1.8
            if(in_array($action_id.'_error', $settings['actions']) AND $data['type'] !== false)
            {
                $template_id = array_search($action_id.'_error', $settings['actions']);
            }
            else
            {
                $template_id = array_search($action_id, $settings['actions']);
            }
            
            $template = isset($settings['action_templates'][$template_id]) ? $settings['action_templates'][$template_id] : false;
            
            if(!$template)
            {
                return $this->EE->output->show_user_error('general', array(lang('error_no_template')));
            }
            else
            {
                $template = explode('/', $template);
            }
        }
        else
        {
            if(!isset($settings['general_template']) AND !isset($settings['submission_template'])) 
            {
                return $this->EE->output->show_user_error('general', array(lang('error_no_template')));
            }
        
            if($data['type'] == 'submission' AND isset($settings['submission_template']))
            {
                $template = explode('/', $settings['submission_template']);
            } 
            elseif(isset($settings['general_template']))
            {
                $template = explode('/', $settings['general_template']);
            }
            else
            {
                return $this->EE->output->show_user_error('general', array(lang('error_no_template')));
            }
        
            if(isset($template[1]))
            {
                $query = $this->EE->db->query("SELECT g.group_name, t.template_name
                                    FROM exp_template_groups g, exp_templates t
                                    WHERE g.group_id = t.group_id
                                    AND g.site_id = '".$this->EE->db->escape_str($this->EE->config->item('site_id'))."'
                                    AND template_name = '".$this->EE->db->escape_str($template[1])."'");
                            
                if($query->num_rows == 0) 
                {
                    return $this->EE->output->show_user_error('general', array(lang('error_not_found')));
                }
            }
            else
            {
                return $this->EE->output->show_user_error('general', array(lang('error_not_found')));
            }
        }
        
        // Grab the ACT ID and add it to the global vars so it can be used in a conditional: ?ACT=12
        // Added in version 2.1
        $this->EE->config->_global_vars['action'] = $action_id;
        // Create the alias too just so people don't get confused.
        $this->EE->config->_global_vars['csm:action'] = $action_id;
        // If $data['type'] isset, then we have an error
        $this->EE->config->_global_vars['error'] = $data['type'] ? TRUE : FALSE;
        // Create alias for this too, just for consistency
        $this->EE->config->_global_vars['csm:error'] = $this->EE->config->_global_vars['error'];
        
        // Add all the variables to the global vars with a prefix. Provides alternative variables to use
        // in certain cases (in conditionals) since the normal ones are not parsed in time.
        // see: http://expressionengine.com/forums/viewthread/167393/
        // Added in version 2.1.2
        foreach($data as $var => $value)
        {
            $this->EE->config->_global_vars['csm:'.$var] = $value;
        }

        // Parse the template
        $this->EE->TMPL->run_template_engine($template[0], $template[1]);
        
        // Replace our template variables
        foreach ($data as $key => $val)
        {
            // Since we can control this page now, lets provide more options :)
            // What else might be useful here?
            if($key == 'link' AND isset($setting['accessibility']))
            {
                $pattern = "/<a(.*)>(.*)<\/a>/";
                preg_match_all($pattern, $val, $matches);

                switch($settings['accessiblity'])
                {
                    case 'both':
                        $val .= '<noscript><a href="'. $_SERVER['HTTP_REFERER'] .'">'. $matches[2][0] .'</a></noscript>';
                    break;
                    case 'referrer':
                        $val = '<a href="'. $_SERVER['HTTP_REFERER'] .'">'. $matches[2][0] .'</a>';
                    break;
                }
            }
            $this->EE->TMPL->final_template = str_replace('{'.$key.'}', $val, $this->EE->TMPL->final_template);
        }
        
        // Replace our {page_url:N} variables so it works with Wyvern. I'm allowed to do this, b/c their both my add-ons
        // but first see if Wyvern is installed so we don't do any uncessary processing
        $query = $this->EE->db->get_where('extensions', array('class' => 'Wyvern_ext', 'enabled' => 'y'), 1, 0);

        if($query->num_rows() == 1)
        {
            $pages = $this->EE->config->item('site_pages');
            $site_id = $this->EE->config->item('site_id');
            $site_url = $this->EE->config->item('site_url');
            // Make sure the site_url does NOT have a trailing slash
            $site_url = substr($site_url, -1) == '/' ? substr($site_url, 0, -1) : $site_url;

            // Make sure pages exist, otherwise we get notices
            if(!isset($pages[$site_id]['uris'])) {
                $this->cache['pages_list'] = '';
            } else {
                $this->cache['pages_list'] = $pages;
            }
           
            // Only do this if there is page data, and we're not within the control panel
            if($pages AND REQ != 'CP')
            {
                foreach($pages[$site_id]['uris'] as $id => $url)
                {
                    $this->EE->TMPL->final_template = str_replace('{page_url:'. $id .'}', $site_url . $url, $this->EE->TMPL->final_template);
                }
            }
        }

        /*
            Added ver 2.2
            
            If we have an ajax request, send a valid json response instead of the EE redirect stuff.
            Special thanks to Nate Iler for the initial code contribution/idea.
            
            $data['type'] === false , success
            $data['type'] !== false , failure
        */
        
        if (
            $this->EE->input->is_ajax_request() AND
            ( !isset($settings['enable_ajax']) OR ( isset($settings['enable_ajax']) AND $settings['enable_ajax'] == 'y') )
        )
        {       
            if(isset($data['type']) AND $data['type'] === false)
            {
                $data['success'] = true;
            }
            else
            {
                $data['success'] = false;
            }
            
            $this->EE->output->send_ajax_response($data);
            exit;
        }

        /*
            Added ver 2.4
            
            Instead of sending all errors through the site's home page, redirect to the requested template.
        */
        if (isset($settings['redirect_to_template']) AND $settings['redirect_to_template'] == 'y')
        {
            $_SESSION['csm_data'] = $data;
            $_SESSION['csm_post'] = $_POST;

            $site_index = $this->EE->functions->fetch_site_index(true);
            $template = $template[1] == 'index' ? $template[0] : $template[0].'/'.$template[1];

            $this->EE->functions->redirect($site_index.$template);
        }

        // Display final output if redirect isn't set.
        $this->EE->output->_display($this->EE->TMPL->final_template);
        
        exit;
    }

    public function settings_form($vars)
    {
        $this->EE->lang->loadfile('system_messages');

        $fields = array();
        $action_fields = array();
        $action_templates = array();
        
        $template_options = $this->_get_templates();
        $actions_options = $this->_get_actions();
        
        // $vars sent from core are basically the settings, 
        // but to make it MSM compat, we need to grab our settings instead.
        $vars = $this->settings;
        
        $accessiblity_options = array(
            'default' => $this->EE->lang->line("accessibility_option_default"),
            'referrer' => $this->EE->lang->line("accessibility_option_referrer"),
            'both' => $this->EE->lang->line("accessibility_option_both")
        );
        
        // Create fields
        $fields[] = array(
            'name' => 'enable_ajax',
            'label' => $this->EE->lang->line('enable_ajax'),
            'detail' => $this->EE->lang->line('enable_ajax_detail'),
            'options' => array('n' => 'No', 'y' => 'Yes'),
            'selected' => isset($vars['enable_ajax']) ? $vars['enable_ajax'] : ''
        );
        
        $fields[] = array(
            'name' => 'bypass_success',
            'label' => $this->EE->lang->line('bypass_success_label'),
            'detail' => $this->EE->lang->line('bypass_success_detail'),
            'options' => array('n' => 'No', 'y' => 'Yes'),
            'selected' => isset($vars['bypass_success']) ? $vars['bypass_success'] : ''
        );

        if ($this->EE->config->item('app_version') >= 240)
        {
            $fields[] = array(
                'name' => 'redirect_to_template',
                'label' => $this->EE->lang->line('redirect_to_template_label'),
                'detail' => $this->EE->lang->line('redirect_to_template_detail'),
                'options' => array('n' => 'No', 'y' => 'Yes'),
                'selected' => isset($vars['redirect_to_template']) ? $vars['redirect_to_template'] : ''
            );
        }
        
        $fields[] = array(
            'name' => 'submission_template',
            'label' => $this->EE->lang->line('submission_label'),
            'detail' => $this->EE->lang->line('submission_detail'),
            'options' => $template_options,
            'selected' => isset($vars['submission_template']) ? $vars['submission_template'] : ''
        );
        
        $fields[] = array(
            'name' => 'general_template',
            'label' => $this->EE->lang->line('general_label'),
            'detail' => $this->EE->lang->line('general_detail'),
            'options' => $template_options,
            'selected' => isset($vars['general_template']) ? $vars['general_template'] : ''
        );
        
        $fields[] = array(
            'name' => 'accessibility',
            'label' => $this->EE->lang->line('accessibility_label'),
            'detail' => $this->EE->lang->line('accessibility_detail'),
            'options' => $accessiblity_options,
            'selected' => isset($vars['accessibility']) ? $vars['accessibility'] : ''
        );
        
        if(!isset($this->settings['actions']) OR count($this->settings['actions']) == 0)
        {
            $action_fields[] = array(
                'name' => 'actions[0]',
                'options' => $actions_options,
                'selected' => isset($vars['actions[0]']) ? $vars['actions[0]'] : ''
            );
            
            $action_templates[] = array(
                'name' => 'action_templates[0]',
                'options' => $template_options,
                'selected' => isset($vars['action_templates[0]']) ? $vars['action_templates[0]'] : ''
            );
        }
        else
        {
            foreach($this->settings['actions'] as $k => $action)
            {
                $action_fields[] = array(
                    'name' => 'actions['. $k .']',
                    'options' => $actions_options,
                    'selected' => isset($vars['actions'][$k]) ? $vars['actions'][$k] : ''
                );
                
                $action_templates[] = array(
                    'name' => 'action_templates['. $k .']',
                    'options' => $template_options,
                    'selected' => isset($vars['action_templates'][$k]) ? $vars['action_templates'][$k] : ''
                );
            }
        }
        
        $vars['hidden'] = array('file' => 'system_messages');
        $vars = array_merge($vars, array(
            'fields' => $fields, 
            'action_fields' => $action_fields, 
            'action_templates' => $action_templates
        ));
        
        // Load it up and return it to addons_extensions.php for rendering
        return $this->EE->load->view('settings_form', $vars, TRUE);
    }
    
    public function save_settings()
    {
        // unset things we don't want to save
        unset($_POST['submit']);
        unset($_POST['file']);
        
        $insert = array();
        $insert['enable_ajax'] = $this->EE->input->post('enable_ajax');
        $insert['bypass_success'] = $this->EE->input->post('bypass_success');
        $insert['redirect_to_template'] = $this->EE->input->post('redirect_to_template');
        $insert['submission_template'] = $this->EE->input->post('submission_template');
        $insert['general_template'] = $this->EE->input->post('general_template');
        $insert['accessibility'] = $this->EE->input->post('accessibility');
        
        $actions = $this->EE->input->post('actions');
        $action_templates = $this->EE->input->post('action_templates');
        
        $insert['actions'] = array();
        
        if($actions)
        {
            foreach($actions as $k => $action)
            {
                if(isset($actions[$k]) AND isset($action_templates[$k]))
                {
                    $insert['actions'][$k] = $action;
                    $insert['action_templates'][$k] = $action_templates[$k];
                }
            }
        }
        
        // Save our settings to the current site ID for MSM.
        $site_id = $this->EE->config->item('site_id');
        $settings = $this->global_settings;
        $settings[$site_id] = $insert;
        
        $this->EE->db->where('class', strtolower(__CLASS__));
        $this->EE->db->update('extensions', array('settings' => serialize($settings)));
        
        $this->EE->session->set_flashdata('message_success', $this->EE->lang->line('preferences_updated'));
    }
    
    private function _get_templates()
    {
        $template_options = array();
        
        // Get the current Site ID
        $site_id = $this->EE->config->item('site_id');

        $sql = "SELECT tg.group_name, t.template_name, t.template_id
                FROM exp_template_groups tg, exp_templates t
                WHERE tg.group_id = t.group_id
                AND tg.site_id = '".$site_id."' 
                ORDER BY tg.group_name, t.template_name";
        
        $result = $this->EE->db->query($sql);
        
        if($result->num_rows() == 0)
        {
            $template_options = array('' => 'No templates found');
        }
        else
        {
            $template_options[''] = '-- Select --';
            foreach($result->result_array() as $row) {
                $file = $row['group_name'] .'/'. $row['template_name'];
                $template_options[$file] = $file;
            }
        }
        
        return $template_options;
    }
    
    private function _get_actions()
    {
        $action_options = array();
        
        $sql = "SELECT * FROM exp_actions";
        $result = $this->EE->db->query($sql);
        
        $action_options[''] = '-- Select --';
        foreach($result->result_array() as $row)
        {
            $action_options[$row['action_id']] = '('. $row['action_id'] .') '. ucwords(str_replace('_', ' ', $row['method']));
            $action_options[$row['action_id'] .'_error'] = '('. $row['action_id'] .') '. ucwords(str_replace('_', ' ', $row['method'])) .' (On Error)';
        }
        
        return $action_options;
    }

    /**
    * Get the site specific settings from the extensions table
    * Originally written by Leevi Graham? Modified for EE2.0
    *
    * @param $force_refresh     bool    Get the settings from the DB even if they are in the session
    * @return array                     If settings are found otherwise false. Site settings are returned by default.
    */
    private function _get_settings($force_refresh = FALSE)
    {
        // assume there are no settings
        $settings = FALSE;
        $this->EE->load->helper('string');

        // Get the settings for the extension
        if(isset($this->cache['settings']) === FALSE || $force_refresh === TRUE)
        {
            // check the db for extension settings
            $query = $this->EE->db->query("SELECT settings FROM exp_extensions WHERE enabled = 'y' AND class = '" . __CLASS__ . "' LIMIT 1");

            // if there is a row and the row has settings
            if ($query->num_rows() > 0 && $query->row('settings') != '')
            {
                // save them to the cache
                $this->cache['settings'] = strip_slashes(unserialize($query->row('settings')));
            }
        }

        // check to see if the session has been set
        // if it has return the session
        // if not return false
        if(empty($this->cache['settings']) !== TRUE)
        {
            $settings = $this->cache['settings'];
        }

        return $settings;
    }
    
    private function debug($str)
    {
        echo '<pre>';
        var_dump($str);
        echo '</pre>';
    }
}

/**
* Extend the Output Class
* 
* Thanks to Nathan Pitman of (Nine Four) http://ninefour.co.uk/labs. I didn't even
* think of extending the class in this way to avoid having to add a core hack.
*
* I could just modify the code below instead using a hook, but I'm leaving it
* intact just incase, and simply adding the hook. If any reason this extension fails,
* the default system message should still be delivered to the user.
*
*/

class System_Messages_Output extends EE_Output
{
    /**
     * Show message
     *
     * This function and the next enable us to show error messages to
     * users when needed. For example, when a form is submitted without
     * the required info.
     *
     * This is not used in the control panel, only with publicly
     * accessible pages.
     *
     * @access  public
     * @param   mixed
     * @param   bool
     * @return  void
     */
    function show_message($data, $xhtml = TRUE, $type = FALSE)
    {
        $EE =& get_instance();
        
        @header("Cache-Control: no-cache, must-revalidate");
        @header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");
        @header("Pragma: no-cache");
        
        foreach (array('title', 'heading', 'content', 'redirect', 'rate', 'link') as $val)
        {
            if ( ! isset($data[$val]))
            {
                $data[$val] = '';
            }
        }
        
        if ( ! is_numeric($data['rate']) OR $data['rate'] == '')
        {
            $data['rate'] = $this->refresh_time;
        }
        
        $data['meta_refresh']   = ($data['redirect'] != '') ? "<meta http-equiv='refresh' content='".$data['rate']."; url=".$EE->security->xss_clean($data['redirect'])."'>" : '';
        $data['charset']        = $EE->config->item('output_charset');  
                
        if (is_array($data['link']) AND count($data['link']) > 0)
        {
            $refresh_msg = ($data['redirect'] != '' AND $this->refresh_msg == TRUE) ? $EE->lang->line('click_if_no_redirect') : '';
        
            $ltitle = ($refresh_msg == '') ? $data['link']['1'] : $refresh_msg;
            
            $url = (strtolower($data['link']['0']) == 'javascript:history.go(-1)') ? $data['link']['0'] : $EE->security->xss_clean($data['link']['0']);
        
            $data['link'] = "<a href='".$url."'>".$ltitle."</a>";
        }

        if ($xhtml == TRUE)
        {
            $EE->load->library('typography');
    
            $data['content'] = $EE->typography->parse_type(stripslashes($data['content']), array('text_format' => 'xhtml'));
        }   

        // -------------------------------------------
        // 'output_show_message' hook.
        //  - Let users override the lame default system error page
        //  - Added 1.6.8, 2009-12-31
        //
            $data['type'] = $type;
            $edata = $EE->extensions->universal_call('output_show_message', $data);
            // if ($EE->extensions->end_script === TRUE) return;
        //
        // -------------------------------------------

        $query = $EE->db->query("SELECT template_data FROM exp_specialty_templates WHERE site_id = '".$EE->db->escape_str($EE->config->item('site_id'))."' AND template_name = 'message_template'");
        
        $row = $query->row_array();
        
        foreach ($data as $key => $val)
        {
            $row['template_data']  = str_replace('{'.$key.'}', $val, $row['template_data'] );
        }

        echo  stripslashes($row['template_data'] );     
        exit;
    } 

    // --------------------------------------------------------------------

    /**
     * Show user error
     *
     * @access  public
     * @param   string
     * @param   mixed
     * @param   string
     * @return  void
     */
    function show_user_error($type = 'submission', $errors, $heading = '')
    {
        $EE =& get_instance();
        
        if ($type != 'off')
        {     
            switch($type)
            {
                case 'submission' : $heading = $EE->lang->line('submission_error');
                    break;
                case 'general'  : $heading = $EE->lang->line('general_error');
                    break;
                default         : $heading = $EE->lang->line('submission_error');
                    break;
            }
        }
        
        $content  = '<ul>';
        
        if ( ! is_array($errors))
        {
            $content.= "<li>".$errors."</li>\n";
        }
        else
        {
            foreach ($errors as $val)
            {
                $content.= "<li>".$val."</li>\n";
            }
        }
        
        $content .= "</ul>";
        
        $data = array(  'title'     => $EE->lang->line('error'),
                        'heading'   => $heading,
                        'content'   => $content,
                        'redirect'  => '',
                        'link'      => array('JavaScript:history.go(-1)', $EE->lang->line('return_to_previous'))
                     );
                
        $this->show_message($data, 0, $type);
    }
}