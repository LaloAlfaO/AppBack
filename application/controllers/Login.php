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
    /*no debe regresar nada*/
	}
  /**
   * ejecuta la autenticacion de un usario para acceder a la app
   * @author E_apanco
   * @param post con el usuario y el pasword para poder buscar al usuario y accedes
   * @return data con mensaje de error y con los datos que requiera el front
   */
  public function ingresa(){
      //recibir post que manden del front procesarlas y mandar los datos o solo una bandera
      $data = array('response' => true,
      'msg' => true,//true o false si encontro al usuario
      //usuario =  datos del usuario que se logueo
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));
  }
  /**
   * ejecuta la subida de un archivo al servidr a partir del nombre del formulario y el nombre que se le desea dar al archivo
   * @author E_apanco
   * @param post con datos del usuario a editar
   * @return data con mensaje de error y con los datos que requiera el front
   */
   public function editar_usuario(){

   }
}
