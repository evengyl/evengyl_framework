<? session_start(); ?>
<!DOCTYPE html>
<?
//require de base avec les fonciton diverse et le loader, la fonction microtime est la uniquement pour le temps d'execution des requete pour optimiser
require "../app/core/app_min_load.php";


//mise en route de l'autoload

Autoloader::register(); 
start_exec_page_timer();
$_app = array(); //contiendra tout les modules de l'applications appelé sur la page. apres execution de celui ci, il est placé dans l'app.

//mise en route de la session


if(!isset($_GET['page']))
	$_GET['page'] = 'home';

ob_start();



//va être appeler a chaque démarage de script page et va checker si le joueur est connecter ou pas.
$login = new login();


if(Config::$is_connect)
{
	$user = singleton::getInstance();
}?>


<html lang="Fr-be">
	<head>
		__TPL_top_head__
	</head>
	<body>
		__MOD_header__test
		
		<?  $route = new router($_GET['page']); ?>
			
		__TPL_footer__
	</body>
	__TPL2_bottom_head__
</html><?


$page = ob_get_clean();
//appel le parseur qui rendra tout les modules et tout les vues
$parser = new parser();
$page = $parser->parser_main($page);
//affiche la page complete avec toute les données traitée
echo $page; 





if(Config::$view_time_executed_in_footer_page)
	view_time_exec_page();


//affiche les messages d'erreur du code
if(!empty($_SESSION['error']))
{
	paragraphe_style($_SESSION['error']);
	unset($_SESSION['error']);
}

Config::get_sql_list();

if(!empty($_POST))
{
	foreach($_POST as $key => $values)
	{
		unset($_POST[$key]);
	}
}



affiche_pre($_app['stack_module']);