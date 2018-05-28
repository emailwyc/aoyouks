<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Json extends TempBase{

    public $params;
    public $adminInfo;
    public function __construct(){
        parent::__construct();
        $this->load->model('admin/ComModel');
        $this->load->model('admin/CModel');
        $this->adminInfo = $this->ComModel->checkLogin(0);
        if(!$this->adminInfo){ returnjson(array('code'=>11,'msg'=>"失败，登录失效！"));}
        if(!$this->input->is_ajax_request()){ returnjson(array('code'=>12,'msg'=>"请求源不正常！"));}
        $this->params = $this->input->post();
    }
    //修改管理源密码
    public function user_editpwd() {
        $params = $this->params;
        $this->emptyCheck($params,array('oldpassword','newpassword','new1password'));
        if(empty($params['newpassword'])){
            returnjson(array('code'=>2,'msg'=>"新密码不能为空！"));
        }
        //两个新密码是否相同
        if($params['newpassword']!=$params['new1password']){
            returnjson(array('code'=>3,'msg'=>"两次输入新密码不一致！"));
        }
        //验证就密码是否正确
        $postPwd = md5(($params['oldpassword'].$this->config->item("encryption_key")));
        if($this->adminInfo['password']!=$postPwd){
            returnjson(array('code'=>4,'msg'=>"旧密码错误！"));
        }
        //更新密码
        $newpwd = md5(($params['newpassword'].$this->config->item("encryption_key")));
        $this->CModel->updateOne('admin_user',array('password'=>$newpwd),array('id'=>$this->adminInfo['id']));
        session_destroy();
        setcookie("admin_auth", "", time()-3600,"/");
        returnjson(array('code'=>1,'msg'=>"成功！"));
    }
    //编辑管理员资料
    public function user_editinfo() {
        $params = $this->params;
        $this->emptyCheck($params,array('username','errornum','logins'));
        if(empty($params['username'])){
            returnjson(array('code'=>2,'msg'=>"用户名不能为空！"));
        }
        $token = $params['logins']=="true"?1:0;
        $data = array('username'=>$params['username'],'errornum'=>(int)$params['errornum'],'logins'=>$token);
        $this->CModel->updateOne('admin_user',$data,array('id'=>$this->adminInfo['id']));
        //更新session
        $_SESSION['admin_user'] = $this->CModel->getDetailById('admin_user',array('id'=>$this->adminInfo['id']));
        $auth = $_SESSION['admin_user']['username'].":".$_SESSION['admin_user']['token'];
        setcookie("admin_auth", $auth, time()+3600*24*7,"/");
        returnjson(array('code'=>1,'msg'=>"成功！"));
    }
    //上传图片
    public function uploadImg() {
        $this->load->model('ImgM');
        $params = $this->params;
        $this->emptyCheck($params,array('img_info','img_type','tp'));
        $result = $this->ImgM->imgUploadOne($params);
        echo json_encode($result);
    }
    //编辑作者资料
    public function user_author() {
        $params = $this->params;
        $this->emptyCheck($params,array('username','desc','avatar'));
        if(empty($params['avatar'])){ returnjson(array('code'=>2,'msg'=>"头像不能为空！"));}
        $data = array(
            array('mark'=>'author','value'=>$params['username']),
            array('mark'=>'avatar','value'=>$params['avatar']),
            array('mark'=>'desc','value'=>$params['desc']),
        );
        $this->CModel->updateBatch('system_base',$data,'mark');
        returnjson(array('code'=>1,'msg'=>"成功！"));
    }




}
