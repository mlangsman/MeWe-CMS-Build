<?php

	if( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	if( ! defined('HJ_SB_version') || ! defined('HJ_SB_description') || ! defined('HJ_SB_docs_url')) {
	
		define('HJ_SB_version', '0.9.6.6');
		define('HJ_SB_description', 'The HJ Social Bookmarks plugin adds social bookmarking links to your channel entries.');
		define('HJ_SB_docs_url', 'http://www.berrytimmermans.nl/add-ons/hj-social-bookmarks/');
		
	}
		
	$plugin_info = Array(
		'pi_name' => 'HJ Social Bookmarks',
		'pi_version' => HJ_SB_version,
		'pi_author' => 'Berry Timmermans',
		'pi_author_url' => 'http://www.berrytimmermans.nl/',
		'pi_description' => HJ_SB_description,
		'pi_usage' => Hj_social_bookmarks::usage()
	);
	
	/**
	 * HJ Social Bookmarks Class
	 *
	 * @package			ExpressionEngine
	 * @category		Plugin
	 * @author			Berry Timmermans
	 * @copyright		Copyright (c) 2010, Berry Timmermans
	 * @link			http://www.berrytimmermans.nl/
	 */
	
	class Hj_social_bookmarks {
		
		var $version = HJ_SB_version;
		
		var $description = HJ_SB_description;
		
		var $docs_url = HJ_SB_docs_url;
	
		var $return_data = '';
	
		// --------------------------------------------------------------------
	
		/**
		 * HJ Social Bookmarks
		 *
		 * This function adds social bookmarking functionality to ExpressionEngine
		 *
		 * @access	public
		 * @return	string
		 */
	
	  	function Hj_social_bookmarks() {
	  		    
		    $this->EE =& get_instance();
		    		    
		    // fetch params
		    $sites = $this->EE->TMPL->fetch_param('sites');
		    $entry_id = $this->EE->TMPL->fetch_param('entry_id');
		    $field_name = $this->EE->TMPL->fetch_param('field_name');
		    $show_hyperlink_text = $this->EE->TMPL->fetch_param('show_hyperlink_text'); // 0.9.6
   		    $tweet_via = (!$this->EE->TMPL->fetch_param('tweet_via')) ? '' : '&amp;via=' . $this->EE->TMPL->fetch_param('tweet_via'); // 0.9.6.3
		    $class_name = (!$this->EE->TMPL->fetch_param('class')) ? 'hj_social_bookmarks' : $this->EE->TMPL->fetch_param('class'); // 0.9.4
		    		    	        
		    // Set the image path to the images
			$imagepath = '/images/hj-social-bookmarks/';
			
			// Check for https
		    $protocol = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ? 'https' : 'http');
		    
		 	// Return the full address
		    $permalink = urlencode($protocol . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
		    			
			// Load $field_id if $field_name isset
			if(isset($field_name) && $field_name != '') {

				$query = $this->EE->db->query("SELECT * FROM exp_channel_fields WHERE field_name = '$field_name'");
						
				if($query->num_rows() > 0) {
			
					foreach($query->result_array() as $row)	{
					
						$field_id = 'field_id_' . $row['field_id'];
												
					}
				
				}

			}
			
			// Load $title and $site_label if $entry_id isset
			if(isset($entry_id) && $entry_id != '' && is_numeric($entry_id)) { 
						
				$query = $this->EE->db->query("SELECT *
					FROM exp_channel_titles
					LEFT JOIN exp_channel_data ON (exp_channel_titles.entry_id = exp_channel_data.entry_id)
					LEFT JOIN exp_sites ON (exp_channel_titles.site_id = exp_sites.site_id)
					WHERE exp_channel_titles.entry_id = $entry_id");
			
				if($query->num_rows() > 0) {
					
					foreach($query->result_array() as $row)	{
											
						// Clean $title for use with links
						$title = str_replace('+', '%20', urlencode($row['title']));
						
						// Clean $site_label for use with links
						$site_label = str_replace('+', '%20', urlencode($row['site_label']));
						
						if(isset($field_id) && $field_id != '') {
													
							$excerpt = strip_tags($row[$field_id]);
							
						 	$search = Array("/\r/", "/[\n\t]+/", '/[ ]{2,}/', '/&(nbsp|#160);/i', '/&(quot|rdquo|ldquo|#8220|#8221|#147|#148);/i', '/&(apos|rsquo|lsquo|#8216|#8217);/i', '/&gt;/i', '/&lt;/i', '/&(amp|#38);/i', '/&(copy|#169);/i', '/&(trade|#8482|#153);/i', '/&(reg|#174);/i', '/&(mdash|#151|#8212);/i', '/&(ndash|minus|#8211|#8722);/i', '/&(bull|#149|#8226);/i', '/&(pound|#163);/i', '/&(euro|#8364);/i', '/&[^&;]+;/i', '/[ ]{2,}/');
										    
						    $replace = Array('', ' ', ' ', ' ', '"', "'", '>', '<', '&', '(c)', '(tm)', '(R)', '--', '-', '*', '£', 'EUR', '', ' ');
													
							$excerpt = trim(preg_replace($search, $replace, $excerpt));
							
							$excerpt_length = 250;
												
					    	if(strlen($excerpt) > $excerpt_length) {
					        	
					        	$substr_excerpt = substr($excerpt, 0, $excerpt_length);
					        	$excerpt = substr($excerpt, 0, mb_strrpos($substr_excerpt, ' ')) . ' [...]';
					    	
					    	}
						 
							// Clean $excerpt for use with links
							$excerpt = str_replace('+', '%20', urlencode($excerpt));
						
						} else {
						
							$excerpt = '';
							
						}
	
					}
	
				}
			
			}
			
			if(isset($title) && $title != '' && isset($sites) && $sites != '') {
			
				// Contains all sites that HJ Social Bookmarks supports
				$social_sites = Array(
				
					'Bebo' => Array(
						'favicon' => 'bebo.png',
						'url' => 'http://www.bebo.com/c/share?Url=' . $permalink . '&amp;Title=' . $title
					),
					
					'BlinkList' => Array(
						'favicon' => 'blinklist.png',
						'url' => 'http://www.blinklist.com/index.php?Action=Blink/addblink.php&amp;Url=' . $permalink . '&amp;Title=' . $title
					),
			
					'Delicious' => Array(
						'favicon' => 'delicious.png',
						'url' => 'http://del.icio.us/post?url=' . $permalink . '&amp;title=' . $title . '&amp;notes=' . $excerpt,
						'description' => 'Del.icio.us'
					),
					
					'DesignFloat' => Array(
						'favicon' => 'designfloat.png',
						'url' => 'http://www.designfloat.com/submit.php?url=' . $permalink . '&amp;title=' . $title
					),
									
					'Digg' => Array(
						'favicon' => 'digg.png',
						'url' => 'http://digg.com/submit?phase=2&amp;url=' . $permalink . '&amp;title=' . $title . '&amp;bodytext=' . $excerpt
					),
					
					'Diigo' => Array(
						'favicon' => 'diigo.png',
						'url' => 'http://www.diigo.com/post?url=' . $permalink . '&amp;title=' . $title
					),
					
					'eKudos' => Array(
						'favicon' => 'ekudos.png',
						'url' => 'http://www.ekudos.nl/artikel/nieuw?url=' . $permalink . '&amp;title=' . $title . '&amp;desc=' . $excerpt
					),
		
					'Email' => Array(
						'favicon' => 'email.png',
						'url' => 'mailto:?subject=' . $title . '&amp;body=' . $permalink,
						'description' => 'E-mail'
					),
					
					'Evernote' => Array(
						'favicon' => 'evernote.png',
						'url' => 'http://www.evernote.com/clip.action?url=' . $permalink . '&amp;title=' . $title
					),
	
					'Facebook' => Array(
						'favicon' => 'facebook.png',					
						'url' => 'http://www.facebook.com/sharer.php?u=' . $permalink . '&amp;t=' . $title
					), // 0.9.6.1
					
					'FriendFeed' => Array(
						'favicon' => 'friendfeed.png',
						'url' => 'http://www.friendfeed.com/share?title=' . $title . '&amp;link=' . $permalink
					),
					
					'Friendster' => Array(
						'favicon' => 'friendster.png',
						'url' => 'http://www.friendster.com/sharer.php?u=' . $permalink . '&amp;t=' . $title
					),
									
					'Google' => Array (
						'favicon' => 'google.png',
						'url' => 'http://www.google.com/bookmarks/mark?op=edit&amp;bkmk=' . $permalink . '&amp;title=' . $title . '&amp;annotation=' . $excerpt,
						'description' => 'Google Bookmarks'
					),
					
					'GoogleBuzz' => Array (
						'favicon' => 'googlebuzz.png',
						'url' => 'http://www.google.com/buzz/post?message=' . $title . '&amp;url=' . $permalink,
						'description' => 'Google Buzz'
					), // 0.9.6.1
					
					'Google+' => Array (
						'favicon' => 'googleplus.png',
						'url' => 'https://plusone.google.com/_/+1/confirm?hl=en&amp;url=' . $permalink . '&amp;title=' . $title,
						'height' => '650',
						'width' => '890'
					), // 0.9.6.5
					
					'Hyves' => Array (
						'favicon' => 'hyves.png',
						'url' => 'http://www.hyves-share.nl/button/tip/?tipcategoryid=12&amp;rating=5&amp;title=' . $title . '&amp;body=' . $excerpt . ' [url=' . $permalink. ']' . $permalink . '[/url]',
						'height' => '520',
						'width' => '570'
					),
					
					'LinkedIn' => Array(
						'favicon' => 'linkedin.png',
						'url' => 'http://www.linkedin.com/shareArticle?mini=true&amp;url=' . $permalink. '&amp;title=' . $title . '&amp;source=' . $site_label . '&amp;summary=' . $excerpt,
						'height' => '520',
						'width' => '570'
					),
					
					'Live' => Array(
						'favicon' => 'live.png',
						'url' => 'https://favorites.live.com/quickadd.aspx?marklet=1&amp;url=' . $permalink. '&amp;title=' . $title,
						'description' => 'Windows Live'
					),
					
					'MisterWong' => Array(
						'favicon' => 'misterwong.png',
						'url' => 'http://www.mister-wong.com/addurl/?bm_url=' . $permalink . '&amp;bm_description=' . $title,
						'description' => 'Mister Wong'
					),
					
					// 0.9.6.4 Deleted Mixx.com: Recently acquired, doesn't support share functions anymore
					
					'MySpace' => Array(
						'favicon' => 'myspace.png',
						'url' => 'http://www.myspace.com/Modules/PostTo/Pages/?u=' . $permalink . '&amp;t=' . $title
					),
					
					// 0.9.6.4 Deleted Netvibes: Stopped sharing
						
					'Newsvine' => Array(
						'favicon' => 'newsvine.png',
						'url' => 'http://www.newsvine.com/_tools/seed&amp;save?u=' . $permalink . '&amp;h=' . $title
					),
					
					'NuJij' => Array(
						'favicon' => 'nujij.png',
						'url' => 'http://nujij.nl/jij.lynkx?t=' . $title . '&amp;u=' . $permalink . '&amp;b=' . $excerpt,
						'description' => 'NUjij'
					),
					
					'Orkut' => Array(
						'favicon' => 'orkut.png',
						'url' => 'http://promote.orkut.com/preview?nt=orkut.com&amp;tt=' . $title . '&amp;du=' . $permalink . '&amp;cn=' . $excerpt
					), // 0.9.6.1
					
					'Posterous' => Array(
						'favicon' => 'posterous.png',
						'url' => 'http://posterous.com/share?linkto=' . $permalink . '&amp;title=' . $title . '&amp;selection=' . $excerpt
					),
					
					'PrintFriendly' => Array(
						'favicon' => 'printfriendly.png',
						'url' => 'http://www.printfriendly.com/print/new?url=' . $permalink
					),
					
					'Reddit' => Array(
						'favicon' => 'reddit.png',
						'url' => 'http://reddit.com/submit?url=' . $permalink . '&amp;title=' . $title
					),
					
					// 0.9.6.4 Deleted Slashdot: New bookmark creation is no longer supported
					
					'Sphinn' => Array(
						'favicon' => 'sphinn.png',
						'url' => 'http://sphinn.com/index.php?c=post&amp;m=submit&amp;link=' . $permalink
					),
					
					'StumbleUpon' => Array(
						'favicon' => 'stumbleupon.png',
						'url' => 'http://www.stumbleupon.com/submit?url=' . $permalink . '&amp;title=' . $title
					),
									
					'Technorati' => Array(
						'favicon' => 'technorati.png',
						'url' => 'http://technorati.com/faves?add=' . $permalink
					),
					
					'Tumblr' => Array(
						'favicon' => 'tumblr.png',
						'url' => 'http://www.tumblr.com/share?v=3&amp;u=' . $permalink . '&amp;t=' . $title . '&amp;s=' . $excerpt
					),
				
					'Twitter' => Array(
						'favicon' => 'twitter.png',
						'url' => 'http://twitter.com/share?url=' . $permalink . '&amp;text=' . $title . ':' . $tweet_via,
						'height' => '520',
						'width' => '570'
					), // 0.9.6.3
					
					'VKontakte' => Array( 
						'favicon' => 'vkontakte.png',
						'url' => 'http://vkontakte.ru/share.php?url=' . $permalink . '&amp;title=' . $title,
						'height' => '260',
						'width' => '570'
					), // 0.9.6.1
					
					'Yahoo' => Array(
						'favicon' => 'yahoo.png',
						'url' => 'http://bookmarks.yahoo.com/toolbar/savebm?opener=tb&amp;u=' . $permalink . '&amp;t=' . $title . '&amp;d=' . $excerpt,
						'description' => 'Yahoo! Bookmarks'
					)
				
				);
			
		    	$sites_to_activate = array_unique(array_map('trim', explode('|', $sites)));
			    		    
			    $active_sites = array_intersect($sites_to_activate, array_keys($social_sites)); 
			    
			    $total_active_sites = count($active_sites);		    
			    			    
			    $count_active_sites = 0;
			    			
				foreach ($active_sites as $active_site) {
					
					$count_active_sites ++;
										
					if(isset($social_sites[$active_site]['description']) && $social_sites[$active_site]['description'] != '') {
					
						$description = $social_sites[$active_site]['description'];
				
					} else {
						
						$description = $active_site;
						
					}
					
					if($count_active_sites == 1) {
						
						$this->return_data = '
<!-- 
** HJ Social Bookmarks v' . $this->version . ' **
' . $this->description . '
See: ' . $this->docs_url . ' for more information. 
-->
';
						$this->return_data .= '<ul ';
						
						$this->return_data .= 'class="' . $class_name . '"'; // 0.9.4 
						
						$this->return_data .= '>' . "\n";
						
						$this->return_data .= '<li class="first">';
				
					} elseif($count_active_sites == $total_active_sites) {
					
						$this->return_data .= '<li class="last">';
							
					} else {
						
						$this->return_data .= '<li>';
						
					}
										
			    	$this->return_data .= '<a rel="nofollow" href="' . $social_sites[$active_site]['url'] . '" title="' . $description . '"';
			    	
			    	if($active_site != 'Email') { 
			    		
			    		$this->return_data .= ' target="_blank"';
			    		
			    	}
			    	
			    	if((isset($social_sites[$active_site]['height']) && $social_sites[$active_site]['height'] != '' && is_numeric($social_sites[$active_site]['height'])) && (isset($social_sites[$active_site]['width']) && $social_sites[$active_site]['width'] != '' && is_numeric($social_sites[$active_site]['width']))) {
			    	
			    		$this->return_data .= ' onclick="window.open(this.href,\'_blank\',\'height=' . $social_sites[$active_site]['height'] . ',width=' . $social_sites[$active_site]['width'] . '\');return false;"'; // 0.9.5
			    		
			    	}
			    	
			    	$this->return_data .= '>';
			    				    	
			    	if(isset($show_hyperlink_text) && $show_hyperlink_text == 'left') {
			    		
			    		$this->return_data .= $description . ' '; // 0.9.6
			    		
			    	}
			    	
			    	if(isset($show_hyperlink_text) && $show_hyperlink_text == 'only') {
			    		
			    		$this->return_data .= $description; // 0.9.6.6
			    		
			    	} else {

				    	$this->return_data .= '<img src="' . $imagepath . $social_sites[$active_site]['favicon'] . '" alt="' . $description . '" />';
				    	
			    	}
				    	
			    	if(isset($show_hyperlink_text) && $show_hyperlink_text == 'right') {
			    		
			    		$this->return_data .= ' ' . $description; // 0.9.6
			    		
			    	}
			    	
			    	$this->return_data .= '</a>';
			    	
			    	$this->return_data .= '</li>' . "\n";						
					
				}
				
				if($count_active_sites >= 1) {
				
					$this->return_data .= '</ul>';
				
				}				
			
			} 
					      
		}
	
		// --------------------------------------------------------------------
	
		/**
		 * Usage
		 *
		 * This function describes how the plugin is used.
		 *
		 * @access	public
		 * @return	string
		 */
		
	  	//  Make sure and use output buffering
	
	  function usage() {
	  
	  	ob_start(); 
	  
	  	?>
	  	
		=============================
		The Tag
		=============================

        Add the following code between the opening {exp:channel:entries} and closing {/exp:channel:entries} tags.
        
        {exp:hj_social_bookmarks sites="Facebook|Twitter" entry_id="{entry_id}"}

		=============================
		Tag Parameters
		=============================

        sites=
        	
        	[REQUIRED]
        	
        	You can use the pipe character ('|') to separate multiple values.
        	
            - Bebo
            - BlinkList
            - Delicious
            - DesignFloat
            - Digg
            - Diigo
            - eKudos
            - Email
            - Evernote
            - Facebook
            - FriendFeed
            - Friendster
            - Google
            - GoogleBuzz
            - Google+
            - Hyves
            - LinkedIn
            - Live
            - MisterWong
            - MySpace
            - Newsvine
            - NuJij
            - Orkut
            - Posterous
            - PrintFriendly
            - Reddit
            - Sphinn
            - StumbleUpon
            - Technorati
            - Tumblr
            - Twitter
            - VKontakte
            - Yahoo

        entry_id=
        	
        	[REQUIRED]
        	
        	The ID number of the channel entry.
        	
        field_name=
			
			[OPTIONAL]
			
			When defining a field_name, HJ Social Bookmarks creates a short text summary of the selected field's content.
			
		show_hyperlink_text=
			
			[OPTIONAL]
			
			This parameter allows you to show hyperlink text left or right from the icon. You can also set it to 'only' and show only hyperlink text.
			
			Valid options are:
			
			- left
			- right
			- only
			
			By default, no hyperlink text will be showed.
			
		tweet_via=
		
			[OPTIONAL]
			
			This parameter allows you to attribute a screen name to a tweet. By default, no screen name will be attributed.
			
		class=
			
			[OPTIONAL]
			
			This lets you specify the value of the "class" attribute in the opening <ul> tag. The default value is "hj_social_bookmarks".
	
		<?php
	  
	  		$buffer = ob_get_contents();
		
	  		ob_end_clean(); 
	
	  		return $buffer;
	  	
	  	}
	  
	 	// END
	
	}
	
	/* End of file pi.hj_social_bookmarks.php */ 
	/* Location: ./system/expressionengine/third_party/memberlist/pi.hj_social_bookmarks.php */ 