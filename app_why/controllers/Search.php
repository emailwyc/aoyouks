<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Search extends HomeBase{

	public function __construct(){
		parent::__construct();
	}   

	public function index($page=1) {
		$params = $this->input->get();
		if(!isset($params['keyword'])){ show_error("参数有误！"); }
		$this->load->model('ArticleM');
		$this->_cdata['artList'] = $this->ArticleM->getArtListByKw($params['keyword'],(int)$page,15);
		$this->_cdata['_skeyword']  = $params['keyword'];
		$this->load->view('article/search',$this->_cdata);
	}
}
