<?php 

Class admin_edit_config_app extends base_module
{

	public function __construct()
	{		
		parent::__construct(__CLASS__);

		//var pouvant être modififée du config pour l'app
		//prefixe, mail, base_sql
		//tous doivent être dans un fichier disctinct pour la lecture

		$this->get_html_tpl = $this->render_tpl();
	}
}
