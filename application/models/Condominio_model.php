<?php
class Condominio_model extends CI_Model {
  protected $_tabla = 'condominio';
  public $_id_condominio = 'condominio_id';

  public function save_condominio($data){
    return $this->db->insert($this->_tabla,$data);
  }

  public function get_condominio($id_condominio){
    $this->db->select('*');
    $this->db->from($this->_tabla);
    $this->db->where($this->_id_condominio,$id_condominio);
    return $this->db->get()->result_array();
  }

  public function update_condominio($data,$id_condominio){
    $this->db->where($this->_id_condominio,$id_condominio);
    return $this->db->update($this->_tabla,$data);
  }
  public function delete_condominio($data,$id_condominio){
    $this->db->where($this->_id_condominio,$id_condominio);
    return $this->db->delete($this->_tabla);
  }
}
