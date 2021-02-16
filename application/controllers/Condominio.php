<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Condominio extends CI_Controller {

  public function __construct()
  {
      parent::__construct();
      header( 'X-Content-Type-Options: nosniff' );
      header( 'X-Frame-Options: SAMEORIGIN' );
      header( 'X-XSS-Protection: 1;mode=block' );
      date_default_timezone_set('America/Mexico_City');
      setlocale(LC_ALL,"es_MX");
      $this->load->model('Usuarios_model');
  }
	public function index()
	{
    /*no debe regresar nada*/
    echo "hola";
	}
  public function save_condominio(){
    $this->form_validation->set_rules('nombre_con', 'Nombre', 'required|trim|xss_clean',array('required' => 'Ingresa el nombre del condominio'));
    $this->form_validation->set_rules('calle_con', 'Calle', 'required|trim|xss_clean',array('required' => 'Ingresa la calle del condominio'));
    $this->form_validation->set_rules('municipio_con', 'Municipio', 'required|trim|xss_clean',array('required' => 'Ingresa el municipio donde esta el condominio'));
    $this->form_validation->set_rules('numero_con', 'Número', 'required|trim|xss_clean',array('required' => 'Ingresa el número del condominio'));
    $this->form_validation->set_rules('pais_con', 'Pais', 'required|trim|xss_clean',array('required' => 'Ingresa el país donde esta el condominio'));
    $this->form_validation->set_rules('estado_con', 'Estado', 'required|trim|xss_clean',array('required' => 'Ingresa el estado donde esta el condominio'));
    $this->form_validation->set_rules('cp_con', 'C.P.', 'required|trim|xss_clean|numeric',array('required' => 'Ingresa el código postal','numeric' =>'El código postal solo debe contener números'));
    $this->form_validation->set_rules('colonia_con', 'Colonia', 'required|trim|xss_clean',array('required' => 'Ingresa la colonia donde esta el condominio');
    /*aqui falta la foto esa se valida diferente*/
    $msg = '';
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
      //checar si ya existe una casa con ese nombre
      if ($this->input->post('passwd') != $this->input->post('passwd1')) {
        $msg = 'Las contraseñas no coinciden';
      }else {
        $datos = array(
          'usuario_usrname' => $this->input->post('correo'),
          'usuario_pwd' => $this->input->post('passwd'),
        );
        $ok = $$this->Usuarios_model->save_user($datos);
        if ($ok) {
          $msg = true;
        }else {
          $msg = 'Algo inesperado ocurrio al guardar el usuario';
        }
      }
      //guardar usuario
    }
    $data = array('response' => true,
    'msg' => $msg,//true o false si encontro al usuario
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));
  }
  public function get_condominio(){
    $this->form_validation->set_rules('id_con', 'Condominio', 'required|trim|xss_clean',array('required' => 'Elige un condominio'));
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
      /*obtenemos el condominio*/
    }
    $data = array('response' => true,
    'msg' => $msg,//true o false si encontro al usuario
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));

  }
}
