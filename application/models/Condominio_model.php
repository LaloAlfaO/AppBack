<?php
class Condominio_model extends CI_Model {
  protected $_tabla = 'casa';
  public function save_condominio($data){
    return $this->db->insert($this->_tabla,$data);    
  }
}
