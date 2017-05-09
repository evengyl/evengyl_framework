<?php 

Class admin_edit_config_app extends base_module
{

	public function __construct()
	{		
		parent::__construct(__CLASS__);

		//var pouvant être modififée du config pour l'app
		//prefixe, mail, base_sql
		//tous doivent être dans un fichier disctinct pour la lecture
		$_get_config = get_config_base();
		affiche_pre($_get_config);


		$this->get_html_tpl = $this->render_tpl();
	}


    public function get_config_base()
    {
        $_config = file_get_contents('../app/modele/Config.conf', 'r');

        return json_decode($_config);
    }
}
