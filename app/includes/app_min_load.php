<?
$_app = new stdClass();

require "../app/core/tools.php";

require "../app/modele/Config.php";

Config::set_config_base();

require "../app/core/sql_core/create_sql.php";
require "../app/core/sql_core/check_sql.php";
require '../app/core/load_class.php'; 


require_once "../app/includes/navigation.php";

$_app->navigation = new navigation();

start_exec_page_timer();

//mise en route de l'autoload

Autoloader::register(); 
