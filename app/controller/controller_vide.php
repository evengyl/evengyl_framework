<?php 

Class name extends base_module
{

	public function __construct()
	{		
		parent::__construct(__CLASS__);


		//use pour acceder a tout les query
			$this->sql;
			$this->all_query;
			$this->mysql;

		//pour assigner des var c'est ->assign_var('nameDansTpl', $var)
		//pour assigner un tpl spécifique c'est ->use_template('TplName')
		$this->get_html_tpl = $this->render_tpl();
	}
}
