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


Class Eventbriteapi
{
	private $eb_client;
	private $events;
	
    public function __construct()
    {
        $this->EE =& get_instance();
		$this->eb_client = new Eventbrite( array('app_key'  => 'CDTQ7VUSGFTI47U5RN','user_key' => '132930389027459422873') );
		
		try {
	        $this->events = $this->eb_client->user_list_events();
	    } catch ( Exception $e ) {

	        $this->events = array();
	    }
		
		// If there are some events in the list...
		if( isset($this->events->events) )
		{ 
			foreach( $this->events->events as $event )
			{
		        /*	$title=$event->title;*/
			}
		}
		
    }

	public function isFutureEvent()
	{
		return "true";
	}

	public function nextEventTitle()
	{
		if( isset($this->events->events) )
		{
			return $this->events->events[0]->event->title;
		}	
	}
	
	public function nextEventDescription()
	{
		if( isset($this->events->events) )
		{
			$description = $this->events->events[0]->event->description;
			return substr(strip_tags($description),0,200)."...";
		}	
	}
	
	public function nextEventDay()
	{
		if( isset($this->events->events) )
		{
			$day = date('d', strtotime($this->events->events[0]->event->start_date));
			return $day;
		}	
	}

	public function nextEventMonth()
	{
		if( isset($this->events->events) )
		{
			$month = date('M', strtotime($this->events->events[0]->event->start_date));
			return strtoupper($month);
		}	
	}

	public function test()
	{
		if( isset($this->events->events) )
		{
			return var_dump($this->events);
		}	
	}

		
	
	
}
?>