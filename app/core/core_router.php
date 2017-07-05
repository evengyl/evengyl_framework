<?
Class core_router
{
	
	protected function is_connect()
	{
		if(Config::$is_connect == 1)
			return $this;
		else
		{
			//permet de retourner sur la page login quand une page non permise est demandée
			$this->route = 'security';
			return $this;
		}
	}



	protected function assign_mod($specific_module = false, $module_secondaire = false, $var_module = false, $tpl = false)
	{
		if($tpl)
			$pre_echo_mod = "__TPL";
		else
			$pre_echo_mod = "__MOD";

		if($module_secondaire)
			$pre_echo_mod .= "2_";
		else
			$pre_echo_mod .= "_";

		if($specific_module)
			$pre_echo_mod .= $specific_module;
		else
			$pre_echo_mod .= $this->route;

		if($var_module)
			$pre_echo_mod .= "(".$var_module.")";


		$pre_echo_mod .= "__";
		echo $pre_echo_mod;
	}

}
