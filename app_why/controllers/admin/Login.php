<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Login extends TempBase{

	public function __construct(){
		parent::__construct();
        $this->load->model('admin/ComModel');
	}   

	public function index() {
        $isLogin = $this->ComModel->checkLogin(0);
        if($isLogin){
            header('Location:/admin/index');exit;
        }
		$this->load->aview('login/index',$this->_cdata);
	}
	//异步登录
	public function login() {
		if(!$this->input->is_ajax_request()){ echo 0;exit;}
		$post = $this->input->post();
		if(empty($post['name']) || empty($post['pwd'])){ echo 0;exit;}
		//查询用户信息验证
        $userInfo = $this->ComModel->getUserByName($post['name']);
        if(empty($userInfo)){ echo 0;exit;}
        if($userInfo['errornum']<=0){ echo 2;exit;}
        $postPwd = md5(($post['pwd'].$this->config->item("encryption_key")));
        if($postPwd!=$userInfo['password']){
            //减少剩余次数
            $this->ComModel->reduceErrorNum($userInfo['id']);
            echo 0;exit;
        }


        //验证通过（生成token,设置session\cookie);
        $_SESSION['admin_user'] = $userInfo;
        $token = md5(uniqid(rand(), TRUE));
        //更新数据库token()
        $ip = $ip = getClientIp();
        $this->ComModel->updateOne('admin_user',array('token'=>$token,'ip'=>$ip),array('id'=>$userInfo['id']));
        $auth = $userInfo['username'].":".$token;
        if(!empty($post['remember'])){
            setcookie("admin_auth", $auth, time()+3600*24*7,"/");
        }
		echo 1;exit;
		
	}

    //异步登录
    public function logout() {
        session_destroy();
        setcookie("admin_auth", "", time()-3600,"/");
        header('Location:/admin/login');

    }


}
