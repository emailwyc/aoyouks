<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Index extends AdminBase{

	public function __construct(){
		parent::__construct();
	}   

	public function index()
	{
	    $sysvar = $this->CModel->getAll('system_variable',array('init'=>1));
        $sysvar = ArrKeyFromId($sysvar,'mark','value');
        $sysvar['runing'] = ceil(($this->curtime-$this->_cdata['_var']['stime'])/86400);
        //得到今日访问ip
        $start = date("Y-m-d 00:00:00",$this->curtime);
        $sysvar['curipnum'] = $this->CModel->getCount('visit_logs',array('ut>='=>$start));
        $this->_cdata['sysvar'] = $sysvar;
		$this->load->aview('index/index',$this->_cdata);
	}

}
