<?php 


Class base_module
{

	public $get_html_tpl;
	public $var_to_extract;
	public $template_name;
	public $template_path;
	public $user;
	public $module_tpl_name;
	public $sql;
	public $mysql;
	public $all_query;

	public function __construct($module_tpl_name = "")
	{
		$this->module_tpl_name = $module_tpl_name;
		$this->sql = new all_query();
		$this->user = singleton::getInstance()->user;
	}

	public function assign_var($var_name , $value)
	{
		if(empty($var_name) && !empty($value))
			$this->var_to_extract[$value] = $value;

		else if(empty($value) && !empty($var_name))
			$this->var_to_extract[$var_name] = $var_name;
		else		
        	$this->var_to_extract[$var_name] = $value;
        
        return $this;
	}

//partie setter du get_html_tpl


	public function render_tpl()
	{
		ob_start();
			if(!empty($this->var_to_extract))
				extract($this->var_to_extract);

			$this->set_template_path();	

			require($this->template_path);

			$get_html_tpl = ob_get_contents();
		ob_end_clean();
		return $get_html_tpl;
	}

	public function use_template($template_name = "")
	{
		$this->template_name = $template_name;
		$this->set_template_path();
			
		return $this;
	}

	public function set_template_path()
	{
		if(empty($this->template_name))
			$this->template_name = $this->module_tpl_name;

		if(strpos($this->template_name, "admin_") !== false)
			$this->template_path = "../vues/admin_tool/".$this->template_name.".php";
		else
			$this->template_path = "../vues/".$this->template_name.".php";

	}

	public function breadcrumb($title_brd)
	{
		global $_app;
		$_app['navigation'][] = $title_brd;
	}
}