<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Saying extends HomeBase{

	public function __construct(){
		parent::__construct();
		$this->load->model('SayingM');
	}   
	//说说列表
	public function index($page=1) {
		$this->_cdata['list'] = $this->SayingM->getList((int)$page);
		$this->load->view('saying/index',$this->_cdata);
	}
	//说说详情
	public function detail($id=0) {
		if(empty($id)){ show_error("未找到该说说!");}
		$this->_cdata['saying'] = $this->SayingM->getDetailById($id);
		if(empty($this->_cdata['saying'])){ show_error("未找到该说说!");}
		$this->load->view('saying/detail',$this->_cdata);
	}

}
