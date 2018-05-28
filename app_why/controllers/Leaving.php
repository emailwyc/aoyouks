<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Leaving extends HomeBase{

	public function __construct(){
		parent::__construct();
	}   
	//留言
	public function index() {
		$this->load->view('leaving/index',$this->_cdata);
	}

}
