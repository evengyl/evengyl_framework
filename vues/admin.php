<div class="col-xs-12 col-without-padding col-without-radius content_game"><?

		if($_GET['page'] == "admin")
		{
			if(isset($_GET["action"]))
			{
				if($_GET['action'] == "pull_git")
				{
					?>__MOD_admin_git_pull__<?
				}
					
				else if($_GET['action'] == "edit_config_app")
				{
					?>__MOD_admin_git_pull__<?
				}
					
			}
		}?>
		<div class="col-xs-6 col-xs-offset-3">
			<?=($_SERVER['HTTP_HOST'] != "localhost")?'<a href="?page=admin&action=pull_git" type="button" class="btn btn-primary btn-lg btn-block">Git Pull To gitHub Origin master</a>':''?>
			<a href="?page=admin&action=edit_config_app" type="button" class="btn btn-primary btn-lg btn-block">Edit Option Config</a>
		</div>

		
		
		<div style='font-size:13px; margin-bottom:0; color:red' class="col-xs-12 form-group <?php echo (isset($_SESSION['error']))?'has-error':''; ?>">
			<?php echo (isset($_SESSION['error']))?'<label for="exampleInputPassword1">'.$_SESSION['error'].'</label>':''; ?>
		</div>
		</div>
	</div>
</div>
