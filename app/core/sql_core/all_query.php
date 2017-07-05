<?php
##########################################
#	Createur : Evengyl
#	Date de creation : 29-09-2014
#	Version : 1.2
#	Date de modif : 20-09-2016
##########################################

class all_query extends _db_connect
{
	public $db_link;

	public function select($req_sql)
	{
		if(strpos($req_sql->table, Config::$prefix_sql) === false)
			$req_sql->table = Config::$prefix_sql.$req_sql->table;

		$select =  new select($req_sql);
		$construct_req = $select->get_string();

		$i = 0;

		while($row = parent::fetch_object($construct_req))
		{
			$res_fx[$i] = $row;
			$i++;
		}

		unset($construct_req); //vide le buffer de memoire $req_sql pour liberer de la place 
		if(!isset($res_fx))
			return '';
		else 
			return $res_fx;		


		
	}


	public function insert_into($res_sql) // opérationnel et fonctionnel , reste à tester sur la validation
	{
		$this->set_db_link();

		if(strpos($res_sql->table, Config::$prefix_sql) === false)
			$res_sql->table = Config::$prefix_sql.$res_sql->table;

		$toute_les_colonnes = "";
		$toute_les_valeurs = "";

		foreach($res_sql->ctx as $nom_colonne => $valeur)
		{			
			$valeur = mysqli_real_escape_string($this->db_link, $valeur);

			if($nom_colonne == "id")
				$valeur = intval($valeur);

			$toute_les_colonnes = $toute_les_colonnes.', '.$nom_colonne;
			$toute_les_valeurs = $toute_les_valeurs.', "'.$valeur.'"';			
		}

		$toute_les_colonnes = substr($toute_les_colonnes,2);

		$toute_les_valeurs = substr($toute_les_valeurs,2);
		$req_sql = "INSERT INTO ".$res_sql->table." (".$toute_les_colonnes.") VALUES (".$toute_les_valeurs.")";

		parent::query($req_sql);
		unset($req_sql);

	}


	public function update($object)
	{
		$set_all = "";

		$this->set_db_link();

		if(strpos($object->table, Config::$prefix_sql) === false)
			$object->table = Config::$prefix_sql.$object->table;

		foreach($object->ctx as $key => $values)
		{
			$values = mysqli_real_escape_string($this->db_link, $values);

			if($key == "id")
				$values = intval($values);

			$set_all = $set_all.', '.$key.' = "'.$values.'"';				
		}
	
		$set_all = substr($set_all,2);

		if(isset($object->where))
		{				
			if($object->where == "" OR $object->where == " ")
				$req_sql = 'UPDATE '.$object->table.' SET '.$set_all;
			else
				$req_sql = 'UPDATE '.$object->table.' SET '.$set_all.' WHERE '.$object->where;	
		}

		$requete_win_lost = parent::query_update($req_sql);
		if($requete_win_lost > 0)
			return $erreur = 'modification bien appliquée';
		else
		{
			return false;
		}
		unset($req_sql);
        return $erreur = 'modification bien appliquée';

	}


	public function delete_row($table, $where)
	{
		if(strpos($table, Config::$prefix_sql) === false)
			$table = Config::$prefix_sql.$table;

		$req_sql = "DELETE FROM ".$table." WHERE ".$where;
		parent::query($req_sql);
	}

	public function delete($obj)
	{
		$construct_req = "";

		if(strpos($obj->table, Config::$prefix_sql) === false)
			$obj->table = Config::$prefix_sql.$obj->table;

		if(is_object($obj))
		{
			if(isset($obj->where) && $obj->where != "")
			{
				$construct_req = "DELETE FROM ".$obj->table ." WHERE ". $obj->where ."";	
				parent::query($construct_req);
			}
			else
				return 0;
		}
		else
			return 0;
	}




	public function other_query($req_sql)
	{
		if(isset($req_sql))
		{
			$i = 0;
			while($row = parent::fetch_object($req_sql))
			{
				$res_fx[$i] = $row;
				$i++;
			}
            if(isset($res_fx))
            {
                if(empty($res_fx))
                {
                    return $res_fx = NULL;
                }
                else
                {
                    return $res_fx;
                }
            }
            else
            {
                return $res_fx = NULL;
            }
		}
		else
		{
			return false;
		}
	}

	public function set_db_link()
	{
		$this->db_link = parent::get_db_link();
	}

    public function query_simple($query)
    {
        parent::query($query);
    }


	public function generate_form_unpdate($table_needed, $id)
	{
		if(strpos($table_needed, Config::$prefix_sql) === false)
			$table_needed = Config::$prefix_sql.$table_needed;

		$req_simply = new stdClass();
		$req_simply->table = $table_needed;
		$req_simply->var = "*";
		$req_simply->where = "id = '". $id ."'";
		$req_simply = $this->select($req_simply);?>
		
	    <div class='contenu_compte'>
	        <div class="row">
	            <div class="col-lg-12">
	                <form class="form-inline" style="margin:auto;" role="form" action="" method="POST">
	                    <br><?php
	                    foreach($req_simply[0] as $key => $value)
	                    {?>
	                            <div class="form-group <?
		                            if($key == 'id')
		                                echo  'has-error';
		                            else
	    	                            echo 'has-success';
        	                    	?>" style="margin-right:30px;">

	                                <div class="input-group">
	                                    <div style="width: 200px;" class="input-group-addon"><?php echo $key ?></div>
	                                    <input style='width:450px;' type="text" <?php echo ($key == 'id')? 'disabled id="disabledInput"':'id="inputSuccess1"'; ?>
                                            id="disabledInput" value="<?= $value ?>"
	                                        class="form-control" name="<?php echo $key ?>">

	                                </div>

	                            </div>
	                            <br><?
	                    }?>
	                    <input type="hidden" name="id" value="<?= $id ?>">
	                    <button style="width: 650px; margin-top:15px;" type="submit" class="btn btn-default">Submit</button>
	                </form>
	            </div>
	        </div>
	    </div><?
	}


	public function generate_form_insert_into($table_needed, $option = array("TYPE" => null, "CHAMPS" => array()))
	{
		if(strpos($table_needed, Config::$prefix_sql) === false)
			$table_needed = Config::$prefix_sql.$table_needed;

		$req_simply = new stdClass();
		$req_simply->table = $table_needed;
		$req_simply->var = "*";
		$req_simply = $this->select($req_simply);?>
		
	    <div class='contenu_compte'>
	        <div class="row">
	            <div class="col-lg-12">
	                <form class="" style="margin:auto;" role="form" action="" method="POST">
	                    <br><?php
	                    foreach($req_simply[0] as $key => $value)
	                    {
                    		if(in_array($key, $option['CHAMPS']) && $option['TYPE'] != null)
							{
								if($option['TYPE'] == "select")
								{
									$for_select = new stdClass();
									$for_select->table = Config::$prefix_sql.$table_needed;
									$for_select->var = "marque";
									$for_select->distinct = true;
									$for_select = $this->select($for_select);?>
									
									<div class="input-group">
										<div style="width: 200px;" class="input-group-addon"><?php echo $key ?></div>
										<select name="<?= $key; ?>" style="width:450px;" class="form-control "><?
											foreach($for_select as $row_select)
											{?>
												<option value="<?= $row_select->{$option['CHAMPS'][array_search($key, $option['CHAMPS'])]} ?>"><?= $row_select->{$option['CHAMPS'][array_search($key, $option['CHAMPS'])]} ?></option><?
											}?>
										</select>
									</div><br><?
								}
							}
							else
							{?>
								<div class="form-group <?
		                            if($key == 'id')
		                                echo  'has-error';
		                            else
	    	                            echo 'has-success';
        	                    	?>" style="margin-right:30px;">

	                                <div class="input-group">
	                                    <div style="width: 200px;" class="input-group-addon"><?php echo $key ?></div>
	                                    <input style='width:450px;' type="text"
	                                        <?php echo ($key == 'id')? 'disabled id="disabledInput"':'id="inputSuccess1"'; ?>
	                                        <?php echo ($key == 'id_category')? 'disabled id="disabledInput" placeholder="'.$value_2.'"':'id="inputSuccess1"'; ?>
	                                           class="form-control" name="<?php echo $key ?>">

	                                </div>
	                            </div><?
							}
	                    }?>
	                    <button style="width: 650px; margin-top:15px;" type="submit" class="btn btn-default">Submit</button>
	                </form>
	            </div>
	        </div>
	    </div><?
	}
}

?>