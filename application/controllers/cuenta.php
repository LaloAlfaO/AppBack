<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class Cuenta extends CI_Controller {

    public function __construct()
    {
        parent:: __construct();
        header( 'X-Content-Type-Options: nosniff' );
        header( 'X-Frame-Options: SAMEORIGIN' );
        header( 'X-XSS-Proteccion: 1;mode=block' );
        date_default_timezone_set('America/Mexico_City');
        setlocale(LC_ALL,"es_MX");
        $this->load->model('Cuenta_model');
    }

    /*
    *ejecuta el guardado de una cuenta
    *@author a.cielo
   * @param post con los datos de cuenta
   * @return data con mensaje de error y con los datos que requiera el front
   */ 
  public function save_cuenta(){
      $this->form_validation->set_rules('nombre_cuenta', 'Nombre', 'required|trim|xss_clean', array('required' => 'Ingresa el nombre del usuario'));
      $this->form_validation->set_rules('ap_cuenta', 'Apellido Paterno', 'required|trim|xss_clean', array('required' => 'Ingresa el nombre del usuario'));
      $this->form_validation->set_rules('am_cuenta', 'Apellido Materno', 'required|trim|xss_clean', array('required' => 'Ingresa el nombre del usuario'));
      $this->form_validation->set_rules('correo_cuenta', 'Correo', 'required|trim|xss_clean', array('required' => 'Ingresa el nombre del usuario'));
      $this->form_validation->set_rules('contra_cuenta', 'Contraseña', 'required|trim|xss_clean', array('required' => 'Ingresa el nombre del usuario'));
      $this->form_validation->set_rules('num_cuenta', 'Numero', 'required|trim|xss_clean', array('required' => 'Ingresa el nombre del usuario'));
      $this->form_validation->set_rules('calle_cuenta', 'Cuenta', 'required|trim|xss_clean', array('required' => 'Ingresa el nombre del usuario'));
      $msg = '';
      if ($this->form_validation->run() == FALSE){
          $msg = validation_errors();
      }else{
          //guardar cuenta
          $data = array(
            'cuenta_nombre'    => $this->input->post('nombre_cuenta'),
            'cuenta_ap'     => $this->input->post('ap_cuenta'),
            'cuenta_am' => $this->input->post('am_cuenta'),
            'cuenta_correo'    => $this->input->post('correo_cuenta'),
            'cuenta_contra'      => $this->input->post('contra_cuenta'),
            'cuenta_num_casa'    => $this->input->post('num_cuenta'),
            'cuenta_calle'        => $this->input->post('calle_cuenta'),
          );
          $ok = $this->Cuenta_model->save_cuenta($data);
          if ($ok){
              $msg = true;
          }else {
              $msg = 'Algo inesperado ocurrio al guardar la cuenta';
          }
      }
      $data = array('response' => true,
      'msg' => $msg,//true si guardo la cuenta, cadena en otros casos del error que ocurrio
    );
    $this->output->set_content_type('application/json')->set_output(json_encode($data));
  }

  /**
   * obtiene los datos de un condominio
   * @author a.cielo
   * @param post con el id de la cuenta a obtener sus datos
   * @return data con mensaje de error y con los datos que requiera el front
   */
  public function get_cuenta(){
    $this->form_validation->set_rules('id_cuenta', 'Cuenta', 'required|trim|xss_clean',array('required' => 'Elige una cuenta'));
    $cuenta = null;
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
      /*obtenemos el condominio*/
      $ok = $this->Cuenta_model->get_condominio($this->input->post('id_cuenta'));
      if ($ok) {
        $msg = true;
        $cuenta = $ok;
      }else {
        $msg = 'Algo inesperado ocurrio al obtener el condominio';
      }
    }
    $data = array('response' => true,
    'msg' => $msg,//true o false
    'cuenta' =>$cuenta,//datos del condominio
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));
  }

  /*
  *actualiza los datos de la cuenta
  *@author a.cielo
  *@param post con los datos a actualizar
  *@return data con mensaje de error y con los datos que requiera el front
  */
  public function update_cuenta(){
    $this->form_validation->set_rules('nombre_cuenta', 'Nombre', 'required|trim|xss_clean',array('required' => 'Ingresa el nombre del condominio'));
    $this->form_validation->set_rules('ap_cuenta', 'Apellido Paterno', 'required|trim|xss_clean',array('required' => 'Ingresa la calle del condominio'));
    $this->form_validation->set_rules('am_cuenta', 'Apellido Materno', 'required|trim|xss_clean',array('required' => 'Ingresa el municipio donde esta el condominio'));
    $this->form_validation->set_rules('correo_cuenta', 'Correo', 'required|trim|xss_clean',array('required' => 'Ingresa el número del condominio'));
    $this->form_validation->set_rules('contra_cuenta', 'Contraseña', 'required|trim|xss_clean',array('required' => 'Ingresa el país donde esta el condominio'));
    $this->form_validation->set_rules('num_cuenta', 'Numero', 'required|trim|xss_clean',array('required' => 'Ingresa el estado donde esta el condominio'));
    $this->form_validation->set_rules('calle_cuenta', 'Calle', 'required|trim|xss_clean|numeric',array('required' => 'Ingresa el código postal','numeric' =>'El código postal solo debe contener números'));
    /*aqui falta la foto esa se valida diferente*/
    $msg = '';
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
      //guardar condominio
      $data = array(
        'cuenta_nombre'    => $this->input->post('nombre_cuenta'),
        'cuenta_ap'     => $this->input->post('ap_cuenta'),
        'cuenta_am' => $this->input->post('am_cuenta'),
        'cuenta_correo'    => $this->input->post('correo_cuenta'),
        'cuenta_contra'      => $this->input->post('contra_cuenta'),
        'cuenta_num_casa'    => $this->input->post('num_cuenta'),
        'cuenta_calle'        => $this->input->post('calle_cuenta'),
      );
      $ok = $this->Condominio_model->update_condominio($data,$this->input->post('id_con'));
      if ($ok) {
        $msg = true;
      }else {
        $msg = 'Algo inesperado ocurrio al guardar la cuenta';
      }
    }
    $data = array('response' => true,
    'msg' => $msg,//true si guardo la cuenta cadena en otros caso del error que ocurrio
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));


  }


  
  /**
   * elimina un condominio
   * @author a.cielo
   * @param post con el id de la cuenta a eliminar
   * @return data con mensaje de error y con los datos que requiera el front
   */
  public function delete_cuenta(){
    $this->form_validation->set_rules('id_cuenta', 'Cuenta', 'required|trim|xss_clean',array('required' => 'Elige una cuenta'));
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
      /*obtenemos la cuenta*/
      $ok = $this->Cuenta_model->delete_cuenta($this->input->post('id_con'));
      if ($ok) {
        $msg = true;
      }else {
        $msg = 'Algo inesperado ocurrio al eliminar el condominio';
      }
    }
    $data = array('response' => true,
    'msg' => $msg,//true o false
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));
  }




}

