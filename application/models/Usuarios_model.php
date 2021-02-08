<?php
class Usuarios_model extends CI_Model {
  protected $_tabla = 'usuario';
  public function is_user($email,$passwd){
    $this->db->select('*');
    $this->db->from($this->_tabla);
    $this->db->where('usuario_usrname',$email);
    $this->db->where('usuario_pwd',$passwd);
    return $this->db->get()->result_array();
  }
}
