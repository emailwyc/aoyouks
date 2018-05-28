<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Setting extends AdminBase{

    public function __construct(){
        parent::__construct();
    }

    public function admin()
    {
        //获取用户信息
        $this->_cdata['info'] = $_SESSION['admin_user'];
        $this->load->aview('setting/admin',$this->_cdata);
    }
    public function pwd()
    {
        $this->load->aview('setting/pwd',$this->_cdata);
    }

    public function author()
    {
        $this->load->aview('setting/author',$this->_cdata);
    }

}
