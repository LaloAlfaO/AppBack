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
    $this->load->view('ingreso');
	}
  /**
   * ejecuta la autenticacion de un usario para acceder a la app
   * @author E_apanco
   * @param post con el usuario y el pasword para poder buscar al usuario y accedes
   * @return data con mensaje de error y con los datos que requiera el front
   */
  public function ingresa(){
    $this->form_validation->set_rules('correo', 'Email', 'required|trim|xss_clean|valid_email',array('required' => 'Ingresa tu email','valid_email' =>'Tu correo esta mal escrito'));
    $this->form_validation->set_rules('passwd', 'Contraseña', 'required|trim|xss_clean|alpha_numeric',array('required' => 'Ingresa tu contraseña','alpha_numeric' =>'Tu contraseña solo es de numeros y/o letras'));
    $usuario = null;
    $msg = '';
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
    $datos = $this->Usuarios_model->is_user($this->input->post('correo'),$this->input->post('passwd'));
      if($datos){
        $usuario = $datos;
        $msg = true;
      }else {
        $msg = 'Tu correo o contraseña estan mal escritos';
      }
    }
      //recibir post que manden del front procesarlas y mandar los datos o solo una bandera
      $data = array('response' => true,
      'msg' => $msg,//true o false si encontro al usuario
      'usuario' =>  $usuario//datos del usuario que se logueo
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));

  }

}
