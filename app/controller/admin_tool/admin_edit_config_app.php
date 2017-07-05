<?php 

Class admin_edit_config_app extends base_module
{

	public function __construct(&$_app)
	{		
		$_app->module_name = __CLASS__;
		parent::__construct($_app);

		//on recup le contenu sous forme d'objet du jason config
		$_get_config = $this->get_config_base();

		//operation de modification du JSON recu
		if(isset($_POST['form__config']) && $_POST['form__config'] == 71414242)
		{
			unset($_POST['form__config']);

			foreach($_POST as $key_post => $row_post)
			{
				if(empty($row_post))
					unset($_POST[$key_post]);
			}

			$_new_config = array_merge((array)$_get_config, $_POST);

			$this->push_config_base($_new_config);

			$_get_config = $this->get_config_base();
		}
		
		$this->get_html_tpl = $this->assign_var('_config', $_get_config)->use_template()->render_tpl();
	}


    public function get_config_base()
    {
        $_config = file_get_contents('../app/modele/Config.conf');

        return json_decode($_config);
    }

    public function push_config_base($_get_config_to_push)
    {
    	$_get_config_to_push = json_encode($_get_config_to_push);
    	file_put_contents('../app/modele/Config.conf', $_get_config_to_push);
    }
}
