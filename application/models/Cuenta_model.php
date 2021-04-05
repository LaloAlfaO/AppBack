<?php
class Cuenta_model extends CI_Model{
    protected  $_tabla = 'cuenta';
    public $_id_cuenta = 'cuenta_id';
    
    public function save_cuenta($data){
        return $this->db->insert($this->_tabla,$data);
    }

    public function get_cuenta($id_cuenta){
        $this->db->select('*');
        $this->db->from($this->_tabla);
        $this->db->where($this->_id_cuenta,$id_cuenta);
        return $this->db->get()->result_array(); 
    }

    public function update_cuenta($data,$id_cuenta){
        $this->db->where($this->_id_cuenta,$id_cuenta);
        return $this->db->update($this->_tabla,$data);
      }

    public function delete_cuenta($data,$id_cuenta){
        $this->db->where($this->_id_cuenta,$id_cuenta);
        return $this->db->delete($this->_tabla);
      }
}