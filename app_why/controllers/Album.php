<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Album extends HomeBase{

	public function __construct(){
		parent::__construct();
		$this->load->model('AlbumM');
	}   

	public function index($page=1){
		$this->_cdata['album_class'] = $this->AlbumM->getList('album_class',array('status'=>1),(int)$page,12);
		$this->load->view('album/index',$this->_cdata);
	}
	//照片列表
	public function photos($cid,$page=1){
		$this->_cdata['album_class'] = $this->AlbumM->getDetailById('album_class',(int)$cid);
		if(empty($this->_cdata['album_class'])){ show_error("官人,未找到该相册!");}
		$this->_cdata['album'] = $this->AlbumM->getList('album',array('cid'=>(int)$cid),(int)$page,12);
		$this->load->view('album/photos',$this->_cdata);
	}

}
