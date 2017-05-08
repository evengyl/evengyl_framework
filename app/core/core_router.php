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
			$this->route = 'login';
			return $this;
		}
	}

	protected function assign_tpl()
	{
		echo "__TPL_".$this->route."__";
	}

	protected function assign_bread($title_brd)
	{
		echo '__MOD_breadcrumb("'.$title_brd.'")__';
		return $this;
	}

	protected function assign_mod($specific_module = false)
	{
		if(!$specific_module)
			echo "__MOD_".$this->route."__";
		else
			echo "__MOD_".$specific_module."__";
	}

	protected function assign_mod_var($var)
	{
		echo "__MOD_".$this->route."(".$var.")__";
	}

	protected function assign_mod2_var($var)
	{
		echo "__MOD2_".$this->route."(".$var.")__";
	}
}
