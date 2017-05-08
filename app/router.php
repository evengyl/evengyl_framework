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
					$this->assign_bread("")->assign_mod();
					break;

				case 'sign_up':	
					$this->assign_bread("Page d'inscription")->assign_mod();
					break;

				case 'admin':
					$this->is_connect()->assign_bread("Page d'administration diverse")->assign_mod();
					break;
			
				case 'login':
		 			$this->assign_bread("Page de connexion")->assign_mod();
		 			break;

				case 'logout':
	 				logout();
		 			break;

				case 'test':
					$this->assign_bread("test")->assign_mod();
					break;

				case 'contact':
					$this->assign_bread("Page de contact")->assign_mod();
					break;

				case 'my_account':
					$this->is_connect()->assign_bread("Mon compte")->assign_mod();
					break;

				case 'avatar':
					$this->assign_bread("Test avatar GD")->assign_mod();
					break;

				case 'password_change':
					$this->assign_bread("Changement de mot de passe de votre compte")->assign_mod('my_account');
					break;

				case 'mail_box':
					$this->assign_bread("Boite de réception")->assign_mod('my_account');
					break;

				case 'consommation':
					$this->is_connect()->assign_bread("Page consommation")->assign_mod();
					break;
				
				default:
					unset($this->route);
					$_SESSION['error'] = "Le call _GET au routeur n'existe pas:  controller = Router on passe au construct";
			}	
		}
	}


}