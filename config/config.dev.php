<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Development config overrides & db credentials
 * 
 * Our database credentials and any environment-specific overrides
 * 
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */

$env_db['hostname'] = 'localhost';
$env_db['username'] = 'mewe';
$env_db['password'] = 'KEEymEqpjMUYWuUU';
$env_db['database'] = 'mewe';

/* Config for CE_IMG Plugin */

$config['ce_image_src_regex'] = array(
'^http://localhost/MeWe_CMS/' => $base_path . '/',
'^http://mewe_cms.local/' => $base_path . '/'
);

$env_global['global:contact_email'] = 'marc@projoosr.com';

/* End of file config.dev.php */
/* Location: ./config/config.dev.php */