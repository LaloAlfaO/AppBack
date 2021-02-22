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
      $this->load->model('Condominio_model');
  }
	public function index()
	{
    /*no debe regresar nada*/
    echo "hola";
	}
  /**
   * ejecuta el guardado de un condominio
   * @author E_apanco
   * @param post con los datos del condominio
   * @return data con mensaje de error y con los datos que requiera el front
   */
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
      //guardar condominio
      $data = array(
        'condominio_nombre'    => $this->input->post('nombre_con'),
        'condominio_calle'     => $this->input->post('calle_con'),
        'condominio_municipio' => $this->input->post('municipio_con'),
        'condominio_numero'    => $this->input->post('numero_con'),
        'condominio_pais'      => $this->input->post('pais_con'),
        'condominio_estado'    => $this->input->post('estado_con'),
        'condominio_CP'        => $this->input->post('cp_con'),
        'condominio_colonia'   => $this->input->post('colonia_con'),
      );
      $ok = $this->Condominio_model->save_condominio($data);
      if ($ok) {
        $msg = true;
      }else {
        $msg = 'Algo inesperado ocurrio al guardar el condominio';
      }
    }
    $data = array('response' => true,
    'msg' => $msg,//true si guardo el condominio cadena en otros caso del error que ocurrio
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));
  }
  /**
   * obtiene los datos de un condominio
   * @author E_apanco
   * @param post con el id del condominio a obtener sus datos
   * @return data con mensaje de error y con los datos que requiera el front
   */
  public function get_condominio(){
    $this->form_validation->set_rules('id_con', 'Condominio', 'required|trim|xss_clean',array('required' => 'Elige un condominio'));
    $condominio = null;
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
      /*obtenemos el condominio*/
      $ok = $this->Condominio_model->get_condominio($this->input->post('id_con'));
      if ($ok) {
        $msg = true;
        $condominio = $ok;
      }else {
        $msg = 'Algo inesperado ocurrio al obtener el condominio';
      }
    }
    $data = array('response' => true,
    'msg' => $msg,//true o false
    'condominio' =>$condominio,//datos del condominio
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));
  }
  /**
   * actualiza los datos de un condominio
   * @author E_apanco
   * @param post con los datos a actualizar
   * @return data con mensaje de error y con los datos que requiera el front
   */
  public function update_condominio(){
    $this->form_validation->set_rules('id_con', 'Condominio', 'required|trim|xss_clean',array('required' => 'Elige un condominio'));
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
      //guardar condominio
      $data = array(
        'condominio_nombre'    => $this->input->post('nombre_con'),
        'condominio_calle'     => $this->input->post('calle_con'),
        'condominio_municipio' => $this->input->post('municipio_con'),
        'condominio_numero'    => $this->input->post('numero_con'),
        'condominio_pais'      => $this->input->post('pais_con'),
        'condominio_estado'    => $this->input->post('estado_con'),
        'condominio_CP'        => $this->input->post('cp_con'),
        'condominio_colonia'   => $this->input->post('colonia_con'),
      );
      $ok = $this->Condominio_model->update_condominio($data,$this->input->post('id_con'));
      if ($ok) {
        $msg = true;
      }else {
        $msg = 'Algo inesperado ocurrio al guardar el condominio';
      }
    }
    $data = array('response' => true,
    'msg' => $msg,//true si guardo el condominio cadena en otros caso del error que ocurrio
    );
    $this->output->set_content_type('application/json')->set_output(json_encode( $data ));
  }
  /**
   * elimina un condominio
   * @author E_apanco
   * @param post con el id del condominio a eliminar
   * @return data con mensaje de error y con los datos que requiera el front
   */
  public function delete_condominio(){
    $this->form_validation->set_rules('id_con', 'Condominio', 'required|trim|xss_clean',array('required' => 'Elige un condominio'));
    if($this->form_validation->run() == FALSE){
        $msg = validation_errors();
    }else{
      /*obtenemos el condominio*/
      $ok = $this->Condominio_model->delete_condominio($this->input->post('id_con'));
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
