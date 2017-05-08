<?
class Autoloader
{
    static function register()
    {
        spl_autoload_register(array(__CLASS__, 'autoload'));
    }

    static function autoload($class)
    {
       
        if($class == "_db_connect")
        	require "../app/modele/".$class.".class.php";

        else if($class == "router")
        	require "../app/".$class.".php";

        else if($class == "core_router")
            require "../app/core/".$class.".php";

        else if($class == "all_query")
            require "../app/core/sql_core/".$class.".php";

        else if($class == "parser")
            require "../app/includes/".$class.".php";

        else if(strpos($class, "admin_") !== false)
            require "admin_tool/".$class.".php";
        else
        	require $class.'.php';
    }
}?>