<?

require "../app/core/tools.php";
require "../app/modele/Config.php";

Config::set_config_base();

require "../app/core/sql_core/create_sql.php";
require "../app/core/sql_core/check_sql.php";
require '../app/controller/load_class.php'; 