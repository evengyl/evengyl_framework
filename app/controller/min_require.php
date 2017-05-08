<?php 

Class min_require extends user
{
    public $user_infos;


	public function __construct()
	{
		parent::__construct();

        if(isset($_SESSION['is_connect']) && $_SESSION['is_connect'])
        {
            $this->get_variable_user();
        }
    }	
}
