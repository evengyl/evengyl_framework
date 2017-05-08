<?php

class Config
{
    public static $hote = "localhost";
    public static $user = "root";
    public static $Mpass = "darkevengyl";
    public static $base = 'even_appart';
    public static $prefix_sql = 'appart_';

    public static $path_public = "";
    public static $base_path = "/evenwork";

    public static $mail = "dark.evengyl@gmail.com";


    public static $view_time_executed_in_footer_page = false;
    public static $view_sql_list = false;
    public static $time_start_exec = 0;

    public static $is_connect = 0;
    public static $list_req_sql = array();


    public static function set_name_base($base)
    {
        self::$base = $base;
    }

    
    
    public static function set_list_req_sql($req_sql)
    {
            self::$list_req_sql[] = $req_sql;    
    }
    public static function get_sql_list()
    {
        if(self::$view_sql_list)
            affiche_pre(self::$list_req_sql);
    }

}
