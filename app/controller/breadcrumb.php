<?php

Class breadcrumb extends base_module
{

	public function __construct($var_in_match)
	{	

		parent::__construct(__CLASS__);


		if(!empty($var_in_match))
		{
			$breadcrumb = array("Accueil" => "?page=home", $var_in_match => "?page=".$_GET['page']);
		
		}
		else if(isset($_GET['page']))
		{
			$breadcrumb = array("Accueil" => "?page=home", $_GET['page'] => "?page=".$_GET['page']);
		}
		else
		{
			$breadcrumb = array("Accueil" => "?page=home");
		}

		
		$title_page ="<h1 style='margin-top:0px; margin-bottom:-4px; display:inline-block;'><div class='home_button_bread'><a class='hidden-xs' href='?page=home'><span class='glyphicon glyphicon-home'></span></a></div>";

		$i = count($breadcrumb);
		foreach($breadcrumb as $title => $link)
		{
			$i--;
			$title_page .= "<div class='level_bread'><a style='color:#C0C0C0;' href='".$link."'>";

			if($i==0) $title_page .= $title;
				else $title_page .= $title.'&nbsp;&nbsp;>&nbsp;&nbsp;';

			$title_page .= "</a></div>";
		}
		$title_page .= "</h1>";


		$this->get_html_tpl = $this->assign_var("breadcrumb", $title_page)->render_tpl();
	}

}


