<?
Class router extends core_router
{
	public $route;

	public function __construct($route)
	{
		$this->route = $route;
		

		if(isset($this->route))
		{
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
		 			$this->assign_mod();
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
					unset($this->route);
					$_SESSION['error'] = "Le call _GET au routeur n'existe pas:  controller = Router on passe au construct";
			}	
		}
	}


}