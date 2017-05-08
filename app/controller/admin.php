<?
Class admin extends base_module
{

	public function __construct()
	{		
		parent::__construct(__CLASS__);

		$this->get_html_tpl =  $this->render_tpl();
	}

}
