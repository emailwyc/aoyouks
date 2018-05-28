<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Download extends HomeBase{

	public function __construct(){
		parent::__construct();
		$this->load->model('DownloadM');
	}   

	public function index($page=1){
		$field = "id,title,icon,dnum,pv,is_hot,ctime";
		$this->_cdata['download'] = $this->DownloadM->getList('download',$field,array(),(int)$page,12);
		$this->load->view('download/index',$this->_cdata);
	}
	//详情
	public function detail($cid){
		$this->_cdata['dw'] = $this->DownloadM->getDetailById('download',(int)$cid);
		if(empty($this->_cdata['dw'])){ show_error("官人,未找到该素材!");}
		//得到上一篇和下一篇
		$this->_cdata['prevAndNext'] = $this->DownloadM->getPrevAndNext('download',(int)$cid);
		//得到可能喜欢
		$field = "id,title,icon";
		$this->_cdata['likes'] = $this->DownloadM->getLikes('download',$field,(int)$cid);
		$this->load->view('download/detail',$this->_cdata);
	}

	//详情
	public function dw($cid){
		$dw = $this->DownloadM->getDetailById('download',(int)$cid);
		if(empty($dw)){ show_error("官人,未找到该素材!");}
		//更新下载次数
		$this->DownloadM->updateaddone('download','dnum',array('id'=>(int)$cid));
		$this->load->helper('download');
		if(!empty($dw['lurl'])){
			Header("Location: ".$dw['lurl']);exit;
		}
		if(!empty($dw['durl'])){
			force_download($dw['durl'], NULL);exit;
		}
	}

}
