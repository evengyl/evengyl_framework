<?
Class router extends core_router
{
	public $route;

	public function __construct($route)
	{
		$this->route = $route;
		

		if(isset($this->route))
		{
			//assign_mod($module_different_du_get = false, $modul_secondaire = false, $var_mod = false, $tpl_uniquement =false)
			switch($this->route)
			{
				case 'home':
					$this->assign_mod();
					break;

				case 'sign_up':	
					$this->assign_mod();
					break;

				case 'admin':
					$this->is_connect()->assign_mod();
					break;
			
				case 'login':
		 			$this->assign_mod('security', false, false, false);
		 			break;

				case 'logout':
	 				logout();
		 			break;

				case 'test':
					$this->assign_mod();
					break;

				case 'contact':
					$this->assign_mod();
					break;

				case 'my_account':
					$this->is_connect()->assign_mod();
					break;

				case 'avatar':
					$this->assign_mod();
					break;

				case 'password_change':
					$this->assign_mod('my_account');
					break;

				case 'mail_box':
					$this->assign_mod('my_account');
					break;

				case 'consommation':
					$this->is_connect()->assign_mod();
					break;
				
				default:
					$_SESSION['error'] = "Cette route n'existe pas, veuiller vérifier le nom donner dans vos controlleurs : ".$this->route;
					unset($this->route);
			}	
		}
	}
}