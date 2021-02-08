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
   * ejecuta la subida de un archivo al servidr a partir del nombre del formulario y el nombre que se le desea dar al archivo
   * @author E_apanco
   * @param post con datos del usuario a editar
   * @return data con mensaje de error y con los datos que requiera el front
   */
   public function save_usuario(){
     $this->form_validation->set_rules('correo', 'Email', 'required|trim|xss_clean|valid_email',array('required' => 'Ingresa tu email','valid_email' =>'Tu correo esta mal escrito'));
     $this->form_validation->set_rules('passwd', 'Contraseña', 'required|trim|xss_clean|alpha_numeric',array('required' => 'Ingresa tu contraseña','alpha_numeric' =>'Tu contraseña solo es de numeros y/o letras'));
     $this->form_validation->set_rules('passwd1', 'Contraseña', 'required|trim|xss_clean|alpha_numeric',array('required' => 'Ingresa tu confimacion de contraseña','alpha_numeric' =>'Tu contraseña solo es de numeros y/o letras'));
         $msg = '';
     if($this->form_validation->run() == FALSE){
         $msg = validation_errors();
     }else{
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
}
