<?php 

Class consommation extends base_module
{
	public $prix_m_eau = 0;
	public $prix_kwh_elec_nuit = 0;
	public $prix_kwh_elec_jour = 0;
	public $prix_kwh_gaz = 0;



	public $prix_location_compteur_eau = 120/12;
	public $prix_location_compteur_gaz = 40/12;
	public $prix_location_compteur_elec = 60/12;

	public $prix_compteur = 0;

	public $total_consomation_eau = 0;
	public $total_consomation_elec_jour = 0;
	public $total_consomation_elec_nuit = 0;
	public $total_consomation_gaz = 0;

	public function __construct(&$_app)
	{		
		$_app->module_name = __CLASS__;
		parent::__construct($_app);

		if(isset($_POST['relever_eau']) && !empty($_POST['relever_eau']))
			$this->push_relever_sql("eau", $_POST['relever_eau']);

		if(isset($_POST['relever_elec_jour']) && !empty($_POST['relever_elec_jour']))
			$this->push_relever_sql("electricite_jour", $_POST['relever_elec_jour']);

		if(isset($_POST['relever_elec_nuit']) && !empty($_POST['relever_elec_nuit']))
			$this->push_relever_sql("electricite_nuit", $_POST['relever_elec_nuit']);

		if(isset($_POST['relever_gaz']) && !empty($_POST['relever_gaz']))			
			$this->push_relever_sql("gaz", $_POST['relever_gaz']);


		$this->get_prix_m_eau();
		$this->get_prix_kwh_elec_nuit();
		$this->get_prix_kwh_elec_jour();
		$this->get_prix_kwh_gaz();


		$req_sql = new stdClass;
		$req_sql->table = "eau";
		$req_sql->var = "*";
		$req_sql->order = "id";
		$res_fx_eau = $this->sql->select($req_sql);
		$tmp_array = $this->render_array_for_tpl($res_fx_eau, $this->prix_m_eau);
		$res_fx_eau = $tmp_array[0];
		$this->total_consomation_eau = $tmp_array[1];

		$req_sql = new stdClass;
		$req_sql->table = "electricite_jour";
		$req_sql->var = "*";
		$req_sql->order = "id";
		$res_fx_electricite_jour = $this->sql->select($req_sql);
		$tmp_array = $this->render_array_for_tpl($res_fx_electricite_jour, $this->prix_kwh_elec_jour);
		$res_fx_electricite_jour = $tmp_array[0];
		$this->total_consomation_elec_jour = $tmp_array[1];

		$req_sql = new stdClass;
		$req_sql->table = "electricite_nuit";
		$req_sql->var = "*";
		$req_sql->order = "id";
		$res_fx_electricite_nuit = $this->sql->select($req_sql);
		$tmp_array = $this->render_array_for_tpl($res_fx_electricite_nuit, $this->prix_kwh_elec_nuit);
		$res_fx_electricite_nuit = $tmp_array[0];
		$this->total_consomation_elec_nuit = $tmp_array[1];


		$req_sql = new stdClass;
		$req_sql->table = "gaz";
		$req_sql->var = "*";
		$req_sql->order = "id";
		$res_fx_gaz = $this->sql->select($req_sql);
		$tmp_array = $this->render_array_for_tpl($res_fx_gaz, $this->prix_kwh_gaz);
		$res_fx_gaz = $tmp_array[0];
		$this->total_consomation_gaz = $tmp_array[1];

		$this->prix_compteur = $this->prix_location_compteur_eau + $this->prix_location_compteur_gaz + $this->prix_location_compteur_elec;


		$this->_app->navigation->set_breadcrumb("Consommation");

		$this->get_html_tpl = $this
						->assign_var("res_fx_eau", $res_fx_eau)
						->assign_var("res_fx_electricite_jour", $res_fx_electricite_jour)
						->assign_var("res_fx_electricite_nuit", $res_fx_electricite_nuit)
						->assign_var("res_fx_gaz", $res_fx_gaz)

						->assign_var("prix_m_eau", $this->prix_m_eau + $this->prix_location_compteur_eau)
						->assign_var("prix_kwh_elec_jour", $this->prix_kwh_elec_jour + $this->prix_location_compteur_elec)
						->assign_var("prix_kwh_elec_nuit", $this->prix_kwh_elec_nuit + $this->prix_location_compteur_elec)
						->assign_var("prix_kwh_gaz", $this->prix_kwh_gaz + $this->prix_location_compteur_gaz)

						->assign_var("prix_compteur_eau", $this->prix_m_eau + $this->prix_location_compteur_eau)
						->assign_var("prix_compteur_elec_jour", $this->prix_kwh_elec_jour + $this->prix_location_compteur_elec)
						->assign_var("prix_compteur_elec_nuit", $this->prix_kwh_elec_nuit + $this->prix_location_compteur_elec)
						->assign_var("prix_compteur_gaz", $this->prix_kwh_gaz + $this->prix_location_compteur_gaz)

						->assign_var("total_consomation_eau", $this->total_consomation_eau)
						->assign_var("total_consomation_elec_jour", $this->total_consomation_elec_jour)
						->assign_var("total_consomation_elec_nuit", $this->total_consomation_elec_nuit)
						->assign_var("total_consomation_gaz", $this->total_consomation_gaz)				
						
						->render_tpl();
	}


	private function get_prix_m_eau()
	{
		// moyen de m3 tout compris pour max 40 m³
		$moyenne_m3 = 1.5;
		$this->prix_m_eau = $moyenne_m3;
	}

	private function get_prix_kwh_elec_nuit()
	{
		$nuit = 0.0568;
		$transport_nuit  = 0.0689;
		$taxe = 0.0053;
		$redevance = 0.00075;
		$this->prix_kwh_elec_nuit = $nuit + $transport_nuit + $taxe + $redevance;
	}

	private function get_prix_kwh_elec_jour()
	{
		$jour = 0.0785;
		$transport_jours = 0.1085;
		$taxe = 0.0053;
		$redevance = 0.00075;
		$this->prix_kwh_elec_jour = $jour + $transport_jours + $taxe + $redevance;
	}

	private function get_prix_kwh_gaz()
	{
		$gaz = 0.51;
		$this->prix_kwh_gaz = $gaz;
	}

	private function render_array_for_tpl($res_sql, $prix_moyen)
	{
		foreach($res_sql as $row)
		{
			preg_match("/([0-9]{4})\-([0-9]{2})\-([0-9]{2})/", $row->date_relever, $match);	
			
			$array_value_relever_render[$match[1]][$match[2]][$match[3]] = $row->relever;
		}


		foreach($array_value_relever_render as $key_annee => $annees)
		{
			foreach($annees as $key_mois => $mois)
			{
				$array_render[$key_annee][$key_mois] = end($mois);
			}
		}
		$array_render = $this->render_array_conso($array_render, $prix_moyen);
		return $array_render;
	}

	private function render_array_conso($res_sql_conso, $prix_moyen)
	{
		$tmp = 0;
		$tmp_array = [];

		$array_month = array('00' => "", '01' => "Janvier", '02' => "Février", '03' => "Mars", 
						  	 '04' => "Avril",'05' => "Mai",'06' => "Juin",'07' => "Juillet",
						  	 '08' => "Août",'09' => "Septembre",'10' => "Octobre",'11' => "Novembre",'12' => "Décembre");
		foreach($res_sql_conso as $key_annee => $row_annee)
		{
			foreach($row_annee as $key_moi => $value)
			{
				if($value >= $tmp)
				{
					$tmp_array[$key_annee][$array_month[$key_moi]]['relever'] = $value - $tmp;
					$tmp_array[$key_annee][$array_month[$key_moi]]['prix_moyen'] = round((($value - $tmp) * $prix_moyen) + ($this->prix_compteur), 3).' €';
					$tmp = $value;
				}
			}
		}
		$_conso_total = $tmp;
		return  array($tmp_array, $_conso_total);
	}

	private function render_conso_total($res_sql_conso)
	{
		$conso_total = 0;
		foreach($res_sql_conso as $row)
		{
			$conso_total += $row->relever;
		}
		return $conso_total;
	}

	private function push_relever_sql($name_relever_table, $relever)
	{
		$relever = str_replace(',', '.', $relever);
		$relever = trim($relever);
		$relever = preg_replace('/[a-zA-Z]+/', '', $relever);
		preg_match_all('/([.])+/' , $relever, $match);

		if(isset($match[2]))
			return $_SESSION['error'] = "Il y a un problème avec le relever envoyé il contient trop de '.'";
		else
		{
			$date_relever = date("Y-m-d");
    		$req_sql = new stdClass;
			$req_sql->ctx = new stdClass;
			$req_sql->ctx->relever = $relever;
			$req_sql->ctx->date_relever = $date_relever;
			$req_sql->table = $name_relever_table;
			$this->sql->insert_into($req_sql);
			
			return $_SESSION['error'] = "Insertion Bien faite";
		}
	}
}
