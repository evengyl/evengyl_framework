<?php 

Class nav_top extends base_module
{

	public function __construct()
	{		
		parent::__construct(__CLASS__);


		$this->get_html_tpl =  $this->use_template('nav_top')->render_tpl();
	}
}
