<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

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
    //recibir post que manden del front procesarlas y mandar los datos o solo una bandera
    $datos = array('response' => true,
    'msg' => true,//true o false si encontro al usuario
    //usuario =  datos del usuario que se logueo
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $datos ));
	}
}
