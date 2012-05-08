<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Eventbrite Class
 *
 * @package     ExpressionEngine
 * @category    Plugin
 * @author      Marc Langsman
 * @copyright   Copyright (c) 2012, Marc Langsman
 * @link        
 */

$plugin_info = array(
  'pi_name'         => 'Eventbriteapi',
  'pi_version'      => '1.0',
  'pi_author'       => 'Marc Langsman',
  'pi_author_url'   => 'http://example.com/',
  'pi_description'  => 'Returns event data from eventbrite',
  'pi_usage'        => ''
);

include "Eventbrite.php"; 

/*
*	This class is designed to retrieve a list of events from the Eventbrite API service and to
* 	extract event details (such as title, description etc) to be rendered in an ExpressionEngine Template
*
*/
Class Eventbriteapi
{
	private $eb_client;
	private $events;
	
	/* Eventbrite API key details */
	private $app_key = 'CDTQ7VUSGFTI47U5RN';
	private $user_key = '132930389027459422873';
	
	/* Turn debugging on/off */
	private $debug = false;
	
	
	/*
	*  Helper function to output debugiing info
	*/
	private function logger($output)
	{
		if ($this->debug)
		{
			file_put_contents('php://stderr', $output, TRUE);
		}
	}
	
    public function __construct()
    {
		
		$this->logger("\n\n--------\n\n ** Eventbrite Class Constructed! ".time()."\n\n");
		
		/* start a new session if there isnt one already */	
		if(!isset($_SESSION))
		{
			session_start();
		}
	
		try 
		{
        	$this->EE =& get_instance();
		}
		catch ( Exception $e )
		{
			$this->EE = "";
			$this->logger("Error calling Eventbrite API: " + $e);	
		}
		
		
		/* Get the 'limit' paramter from the expressionengne tags */ 
		$this->limit = $this->EE->TMPL->fetch_param('limit');
		$this->logger("\n\n** Limit is: ".$this->limit);
		
		/* Fecth data from eventbrite if we dont have any data cached already or 
 		*  if there has been at least 30 seconds since we last fetched the data
		*/
		if (!isset($_SESSION['eventbrite_data']) || !isset($_SESSION['eventbrite_last_activity']) || (time() - $_SESSION['eventbrite_last_activity']) > 30)
		{
			$this->logger("\n\n** calling api\n");
			$this->eb_client = new Eventbrite( array('app_key'  => $this->app_key,'user_key' => $this->user_key) );
			
			try {
		        /* Run the eventbrite api query */
				$this->events = $this->eb_client->user_list_events(array('event_statuses' => 'live,started', 'do_not_display' => 'venue,organizer'));
				
				/* Store the results in a session variable */
				$_SESSION['eventbrite_data'] = serialize($this->events);
				
				$this->logger("\n\n** debug session:\n".$_SESSION['eventbrite_data']);
				
				/* Set a timestamp in the session to record when the data was fecthed */
				$_SESSION['eventbrite_last_activity'] = time();
				
				
		    } catch ( Exception $e ) {

		        $this->events = array();
		    }
			
		}
		else
		{
			/* Otherwise we can just retrieve the event data from the session */
			$this->logger("\n\n** Retrieveing session data\n");
			$this->events = unserialize($_SESSION['eventbrite_data']);
		}
		
		
    }

	/*
	*  Check to see if there are any events in the list retrieved from Eventbrite
	*/
	public function isUpcomingEvent()
	{
		
		$returnValue;
		
		if (isset($this->events))
		{
			$returnValue = 'true';
		}
		else
		{
			$returnValue = 'false';
		}
		
		return $returnValue;
	}


	/*
	*	Test function - just outputs the events stored from the eventbrite query
	*/
	public function test()
	{
		if( isset($this->events->events) )
		{
			return var_dump($this->events);
		}	
		
	}

	/*
	*	Check to see if there are  upcoming events in the data returned from Eventbrite.
	*	If so return their details to the expressionengine template tag. Otherwise return 
	*	isNextEvent to false so we can check this in the template.
	*/
	public function upcomingEvents()
	{
		$nextEventDetails = array();
		
		/* If there has been an event returned, extract the details to return to the EE tags */
		if (isset($this->events->events))
		{
			foreach( $this->events->events as $evnt )
			{
				
				// Ensure we only return the number of events specified by the limit parameter
				if ( ($this->limit == "") || ( count($nextEventDetails) < $this->limit ) )
				{
					$this->logger("\n\n** Doing it, count =".count($nextEventDetails)." limit =".$this->limit);
					// Get the event object from the sub-list 
					$nextEvent = $evnt->event;
			
					// Pull out and format the details
					$title = $nextEvent->title;
				
					if (isset($nextEvent->logo)) 
						$logoURL = $nextEvent->logo;
					else $logoURL="";
				
					$url = $nextEvent->url;
					$date = strtotime($nextEvent->start_date);
					$day = date('d', $date );
					$month = strtoupper(date('M', $date));
					$niceDate = date('jS F Y',$date);
					$description = strip_tags($nextEvent->description);
					$excerpt = $this->_truncate_words($description, 15, "...");
				
		
					// push all the event details onto a return array which we can use in the EE tags 
					array_push($nextEventDetails, array(	'title' => $title,
															'url' => $url,
															'day' => $day,
															'month' => $month,
															'date' => $niceDate,
															'logoURL' => $logoURL,
															'description' => $description,
															'excerpt' => $excerpt
														)
								);
				}
			}						
		}
		else
		{
			// Otherwise just return isNextEvent as being false 
			array_push($nextEventDetails, array('isNextEvent' => 'false'));
		}
		

		return $this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, $nextEventDetails);

	}
	
	function _truncate_words($content, $limit, $append) {
    $num_words = str_word_count($content, 0);
	if ($num_words > $limit) {
	  $words = str_word_count($content, 2);
      $pos = array_keys($words);
      $content = substr($content, 0, ($pos[$limit]-1)) . $append;
    }
    return $content;
    }
	
	
}
?>