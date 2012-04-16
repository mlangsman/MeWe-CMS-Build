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
  'pi_usage'        => 'bah blah'
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
	
	/*
	*  Helper function to output debugiing info
	*/
	private function logger($output)
	{
		file_put_contents('php://stderr', $output, TRUE);
	}
	
    public function __construct()
    {
		
		$this->logger("\n\n--------\n\n ** Eventbrite Class Constructed! ".time()."\n\n");
		
		/* start a new session if there isnt one already */	
		if(!isset($_SESSION))
		{
			session_start();
		}
	
	
        $this->EE =& get_instance();
		
		
		/* Fecth data from eventbrite if we dont have any data cached already or 
 		*  if there has been at least 30 seconds since we last fetched the data
		*/
		if (!isset($_SESSION['eventbrite_data']) || !isset($_SESSION['eventbrite_last_activity']) || (time() - $_SESSION['eventbrite_last_activity']) > 30)
		{
			$this->logger("\n\n** calling api\n");
			$this->eb_client = new Eventbrite( array('app_key'  => $this->app_key,'user_key' => $this->user_key) );
			
			try {
		        /* Run the eventbrite api query */
				$this->events = $this->eb_client->user_list_events(array('event_statuses' => 'live,started', 'do_not_display' => 'venue,logo,style,organizer'));
				
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
			$this->logger("\n\n** Retrieveing Cookie data\n");
			$this->events = unserialize($_SESSION['eventbrite_data']);
		}
		
		
    }

	public function isFutureEvent()
	{
		
		return "true";
		
	}


	public function test()
	{
		if( isset($this->events->events) )
		{
			return var_dump($this->events);
		}	
		
	}

	/*
	*	Check to see if there is an upcoming event in the data returned from Eventbrite.
	*	If so return it's details to the expressionengine template tag. Otherwise return 
	*	isNextEvent to false so we can check this in the template.
	*/
	public function nextEvent()
	{
		$nextEventDetails = array();
		
		/* If there has been an event returned, extract the details to return to the EE tags */
		if (isset($this->events->events[0]->event))
		{
			/* Get the first event in the list */
			$nextEvent = $this->events->events[0]->event;
			
			/* Pull out and format the details */
			$title = $nextEvent->title;
			$url = $nextEvent->url;
			$date = strtotime($nextEvent->start_date);
			$day = date('d', $date );
			$month = strtoupper(date('M', $date));
			$description = substr(strip_tags($nextEvent->description),0,200)."...";
		
			/* push all the event details onto a return array which we can use in the EE tags */
			array_push($nextEventDetails, array(	'title' => $title,
													'url' => $url,
													'day' => $day,
													'month' => $month,
													'description' => $description, 
													'isNextEvent' => 'true') );
		}
		else
		{
			/* Otherwise just return isNextEvent as being false */
			array_push($nextEventDetails, array('isNextEvent' => 'false'));
		}
		
	    return $this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, $nextEventDetails);
	}

	public function futureEvents()
	{
		$futureEvents = array();
		
		if (isset($this->events->events))
		{
			foreach( $this->events->events as $evnt )
			{
				$date = date('jS F Y',strtotime($evnt->event->start_date));
				array_push($futureEvents, array('title'=> $evnt->event->title, 'date'=> $date));
			}
			
			return $this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, $futureEvents);
			
		}
		
	    return;
	}	
	
	
	
}
?>