<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class About extends HomeBase{

	public function __construct(){
		parent::__construct();
		$this->load->model('AboutM');
	}   
	//关于
	public function index() {
		$about = $this->AboutM->getAll('system_text',array('group'=>'about'));
		$this->_cdata['about'] = ArrKeyFromId($about,'mark','value');
		$this->load->view('about/index',$this->_cdata);
	}

}
