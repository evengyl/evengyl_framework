<?

$one_percent_graph = 1; //kwh?>
<div class="col-xs-12 col-without-padding connect-form">	
	<div class="col-xs-12">
		<h3>Electricité jour : Total = <?= $total_consomation_elec_jour ?> Kw/h ------------ Prix moyen du kw/h : <?= round($prix_kwh_elec_jour,2) ?> €</h3>

		<div class="col-xs-12" style="padding:0px;">
			<div class="col-xs-12 col-without-padding" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_electricite_jour as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-2 col-sm-1">
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12 barrette" style="height:<?= $mois['relever']/$one_percent_graph ?>px;">
								<?= $mois['relever'] ?> kw/h<br>
								<?= $mois['prix_moyen'] ?>+/-<br>
								<?= $moi_name ?>
								</div>
							</div>
						</div><?
					}
				}?>
			</div>
		</div>
	</div>
</div>
<?


$one_percent_graph = 1; //kwh?>
<div class="col-xs-12 col-without-padding connect-form">	
	<div class="col-xs-12">
		<h3>Electricité nuit : Total = <?= $total_consomation_elec_nuit ?> Kw/h ------------ Prix moyen du kw/h : <?= round($prix_kwh_elec_nuit,2) ?> €</h3>

		<div class="col-xs-12" style="padding:0px;">
			<div class="col-xs-12 col-without-padding" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_electricite_nuit as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-2 col-sm-1">
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12 barrette" style="height:<?= $mois['relever']/$one_percent_graph ?>px;">
								<?= $mois['relever'] ?> kw/h<br>
								<?= $mois['prix_moyen'] ?>+/-<br>
								<?= $moi_name ?>
								</div>
							</div>
						</div><?
					}
				}?>
			</div>
		</div>
	</div>
</div>
<?



$one_percent_graph = 0.2; //kwh?>

<div class="col-xs-12 col-without-padding connect-form"  style='margin-bottom:40px;'>	
	<div class="col-xs-12">
		<h3>Gaz : Total = <?= $total_consomation_gaz ?> M³ ------------ Prix moyen du m³ : <?= round($prix_kwh_gaz,2) ?> €</h3>

		<div class="col-xs-12" style="padding:0px;">
			<div class="col-xs-12 col-without-padding" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_gaz as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-2 col-sm-1">
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12 barrette" style="height:<?= $mois['relever']/$one_percent_graph ?>px;">
								<?= $mois['relever'] ?> m³<br>
								<?= $mois['prix_moyen'] ?>+/-<br>
								<?= $moi_name ?>
								</div>
							</div>
						</div><?
					}
				}?>
			</div>
		</div>
	</div>
</div>

<?
$one_percent_graph = 0.05; //kwh?>

<div class="col-xs-12 col-without-padding connect-form">	
	<div class="col-xs-12">
		<h3>Eau : Total = <?= $total_consomation_eau ?> M³ ------------ Prix moyen du m³ : <?= round($prix_m_eau,2) ?> €</h3>

		<div class="col-xs-12" style="padding:0px;">
			<div class="col-xs-12 col-without-padding" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_eau as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-2 col-sm-1">
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12 barrette" style="height:<?= $mois['relever']/$one_percent_graph ?>px;">
								<?= $mois['relever'] ?> m³<br>
								<?= $mois['prix_moyen'] ?>+/-<br>
								<?= $moi_name ?>
								</div>
							</div>
						</div><?
					}
				}?>
			</div>
		</div>
	</div>
</div>

<form method="post" action="#" class="form-inline" class="col-xs-12">
	<div class="form-group col-xs-7 col-sm-2">
		<input type="text" class="form-control" name="relever_elec_jour" placeholder="Relever Elec Jour">
	</div>
	<div class="col-xs-12"> </div>

	<div class="form-group col-xs-7 col-sm-2">
		<input type="text" class="form-control" name="relever_elec_nuit" placeholder="Relever Elec Nuit">
	</div>
	<div class="col-xs-12"> </div>

	<div class="form-group col-xs-7 col-sm-2">
		<input type="text" class="form-control" name="relever_gaz" placeholder="Relever Gaz">
	</div>
	<div class="col-xs-12"> </div>

	<div class="form-group col-xs-7 col-sm-2">
		<input type="text" class="form-control" name="relever_eau" placeholder="Relever Eau">
	</div>
	<div class="form-group col-xs-7 col-sm-2">
		<button type="submit" class="btn btn-default col-xs-5 col-sm-2">Valider</button>
		</div>	
</form>
<div class="col-xs-12"> </div>

<? unset($_SESSION['error']);