<?
Class home extends base_module
{
	public function __construct()
	{		
		parent::__construct();
		
		$this->get_html_tpl =  $this->use_template("home")->render_tpl();
	}
}