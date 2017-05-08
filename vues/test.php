<?
	//test sur l'elec jour


$one_percent_graph = 0.05; //kwh?>
<div class="col-xs-12 col-without-padding connect-form">	
	<div class="col-xs-12">
		<h3>Prix Eau</h3>
		<div class="col-xs-12" style="padding:5px 5px 0px 5px;">
			<div class="col-xs-12" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_eau as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-1" style='width:5%;'>
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12" style="font-size:11px; text-align:center; background:black;  height:<?= $mois['relever']/$one_percent_graph ?>px;">
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
		<h3>Prix Electricité jour</h3>
		<div class="col-xs-12" style="padding:5px 5px 0px 5px;">
			<div class="col-xs-12" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_electricite_jour as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-1" style='width:5%;'>
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12" style="font-size:11px; text-align:center; background:black;  height:<?= $mois['relever']/$one_percent_graph ?>px;">
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
		<h3>Prix Electricité nuit</h3>
		<div class="col-xs-12" style="padding:5px 5px 0px 5px;">
			<div class="col-xs-12" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_electricite_nuit as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-1" style='width:5%;'>
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12" style="font-size:11px; text-align:center; background:black;  height:<?= $mois['relever']/$one_percent_graph ?>px;">
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



$one_percent_graph = 0.2; //kwh?>
<div class="col-xs-12 col-without-padding connect-form">	
	<div class="col-xs-12">
		<h3>Prix Gaz</h3>
		<div class="col-xs-12" style="padding:5px 5px 0px 5px;">
			<div class="col-xs-12" style="height:100px; background:#eaeaea;"><?
				foreach($res_fx_gaz as $annees)
				{
					foreach($annees as $moi_name => $mois)
					{
						if($mois['relever'] == '0') continue; ?>
						<div class="col-xs-1" style='width:5%;'>
							<div class="col-xs-12 col-without-padding" style=" position:absolute; bottom:-99px; ">
								<div class="col-xs-12" style="font-size:11px; text-align:center; background:black;  height:<?= $mois['relever']/$one_percent_graph ?>px;">
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
