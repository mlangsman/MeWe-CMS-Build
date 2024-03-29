<?php

/**
 * Environment Declaration
 * 
 * This switch statement sets our environment. The environment is used primarily
 * in our custom config file setup. It is also used, however, in the front-end
 * index.php file and the back-end admin.php file to set the debug mode
 * 
 * @package    Focus Lab Master Config
 * @version    1.1.1
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */

if ( ! defined('ENV'))
{
	switch ($_SERVER['HTTP_HOST']) {
		case 'mewe360.com' :
		case 'www.mewe360.com' :
		case 'www.mewefoundation.com' :
		case 'mewefoundation.com' :
			define('ENV', 'prod');
			define('ENV_FULL', 'Production');
			define('ENV_DEBUG', FALSE);
		break;
		
		case 'mewe-staging.projoosr.com' :
			define('ENV', 'stage');
			define('ENV_FULL', 'Staging');
			define('ENV_DEBUG', FALSE);
		break;

		default :
			define('ENV', 'dev');
			define('ENV_FULL', 'Development');
			define('ENV_DEBUG', TRUE);
		break;
	}
}

/* End of file config.env.php */
/* Location: ./config/config.env.php */