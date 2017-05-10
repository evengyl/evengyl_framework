<?php
require_once('Cdebug.php');
require_once('tools.php');

class Console {
    private static $instance;
    private static $content = array();
    
    private function __construct(){
        // private = Avoid construct this object
    }
    
    private function __clone()
    {
        // private = Avoid cloning object
    }
    
    public static function get(){
        if (!isset(self::$instance)) {
            self::$instance = new static;
        }
        return self::$instance;
    }
    
    public static function log($filename, $txt){
        self::$content[] = (object)array('filename'=>$filename,
                                         'txt'=>$txt);
        //$debug->add($filename,$txt);
    }
    
    public static function render($no_check=false){
        global $security;
        if ((!is_object($security) || !$security->is_dev()) && !$no_check) return;
        $txt = "<div id='log'><table class='nico-table'>";
        foreach(self::$content as $content){
            $txt .= "<tr><th>".$content->filename.'</th><td>'.$content->txt.'</td></tr>';
        }
        $txt .= "</table>".self::render_queries()."</div>";
        return $txt;
    }
    
    public static function render_queries(){
        global $db;
        $txt = '<h3>Queries</h3>';
        $txt .= "<table class='nico-table'>";
        foreach ($db->queries as $key=>$query){
            $txt .= '<tr><td>'.$key.'</td><td>'.sprintf('%.3f', $query->duration).'</td><td>'.htmlentities($query->sql).'</td></tr>';
        }
        $txt .= '</table>';
        return $txt;
    }
    
    public static function web_error($txt){
        global $config;
        $error_email = $config->get('error_email');
        if (!$error_email) return;
        $mail = new tools\Mail('Matedex web error', 'website@matedex.be');
        $console_txt = self::render(true);
        $user_agent = $_SERVER['HTTP_USER_AGENT'];
        $html = $txt.'<hr>User agent: '.$user_agent.'<hr>console:<br>'.$console_txt;
        $mail->set_html($html)
             ->send($error_email);
    }
    
    public function add($filename, $txt){ // Old function for compatibility
        self::log($filename, $txt);
    }
    
    public function render_txt($no_check=false){ // Old function for compatibility
        return self::render($no_check);
    }
    
    public function website_error($txt){ // Old function for compatibility
        self::web_error($txt);
    }
}

$console = Console::get();
$app->console = &$console;

// Log all exception and error
function exception_handler($exception) {
    global $console;
    $console->web_error($exception);
}

set_exception_handler('exception_handler');


function human_readable_error($error_no)
{
    switch($error_no)
    {
        case E_ERROR: // 1
            return 'E_ERROR';
        case E_WARNING: // 2
            return 'E_WARNING';
        case E_PARSE: // 4
            return 'E_PARSE';
        case E_NOTICE: // 8
            return 'E_NOTICE';
        case E_CORE_ERROR: // 16
            return 'E_CORE_ERROR';
        case E_CORE_WARNING: // 32
            return 'E_CORE_WARNING';
        case E_COMPILE_ERROR: // 64
            return 'E_COMPILE_ERROR';
        case E_COMPILE_WARNING: // 128
            return 'E_COMPILE_WARNING';
        case E_USER_ERROR: // 256
            return 'E_USER_ERROR';
        case E_USER_WARNING: // 512
            return 'E_USER_WARNING';
        case E_USER_NOTICE: // 1024
            return 'E_USER_NOTICE';
        case E_STRICT: // 2048
            return 'E_STRICT';
        case E_RECOVERABLE_ERROR: // 4096
            return 'E_RECOVERABLE_ERROR';
        case E_DEPRECATED: // 8192
            return 'E_DEPRECATED';
        case E_USER_DEPRECATED: // 16384
            return 'E_USER_DEPRECATED';
    }
    return "";
}

function error_handler($errno, $errstr, $errfile, $errline) {
    global $console;
    $msg =  '['.human_readable_error($errno).'] '.$errstr.' in file '.$errfile.' at line '.$errline; 
    $console->web_error($msg);
    return false; //Execute php internal error handler
}
set_error_handler('error_handler');
