<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Comment extends TempBase{

	public $get;
	public $ctype;
	public function __construct(){
		parent::__construct();
		$this->get = $this->input->get();
		$this->load->model('CommentM');
		$typeAll = array(
			'article'=>array('tb'=>'article_comment','offset'=>5,'tbs'=>'article','tbsu'=>true),
			'saying'=>array('tb'=>'saying_comment','offset'=>8,'tbs'=>'saying','tbsu'=>true),
			'album'=>array('tb'=>'album_comment','offset'=>8,'tbs'=>'album','tbsu'=>false),
			'leaving'=>array('tb'=>'leaving_comment','offset'=>12,'tbs'=>'leaving','tbsu'=>false),
			'download'=>array('tb'=>'download_comment','offset'=>5,'tbs'=>'download','tbsu'=>false)
		);
		if(!$this->input->is_ajax_request()){ echo $_REQUEST['callback']."(".json_encode(0).")";exit; }
		if(!isset($this->get['com_type']) || empty($typeAll[$this->get['com_type']])){
			echo $_REQUEST['callback']."(".json_encode(0).")";exit;	
		}
		$this->ctype = $typeAll[$this->get['com_type']];
	}   

	public function getcommentcount()
	{
		$post = $this->input->get();
		if(!isset($post['arcid'])){ echo $_REQUEST['callback']."(".json_encode(0).")";exit; }
		$where = array('aid'=>(int)$post['arcid'],'type'=>1);
		$count = $this->CommentM->getCount($this->ctype['tb'],$where);
		echo $_REQUEST['callback']."(".json_encode($count).")";exit;
	}
	public function getcomment() {
		$this->emptyCheck($this->get,array('aid','page'));	
		$where = array('aid'=>(int)$this->get['aid'],'type'=>1);
		$list  = $this->CommentM->getList($this->ctype['tb'],$where,$this->ctype['offset'],$this->get['page'],"id desc"); $ids = ArrKeyAll($list,'id');
		$replycount = $this->CommentM->getReplyCount($this->ctype['tb'],array('type'=>2),"pid",$ids);
		$res = array('clist'=>$list,'rcount'=>$replycount);
		echo $_REQUEST['callback']."(".json_encode($res).")";exit;
	}

	public function getRepCom() {
		$this->emptyCheck($this->get,array('tid','page'));	
		if(empty($this->get['tid'])){ echo $_REQUEST['callback']."(".json_encode(0).")";exit; }
		$where = array('pid'=>(int)$this->get['tid'],'type'=>2);
		$list  = $this->CommentM->getList($this->ctype['tb'],$where,$this->ctype['offset'],$this->get['page'],"id desc");
		$res = array('replist'=>$list);
		echo $_REQUEST['callback']."(".json_encode($res).")";exit;
	}
	//content,nickname,avatar,aid,pid,com_type,email
	public function send() {
        $this->load->model('admin/ComModel');
	    $adminname = array("管理员","博主","SooneBaby","soonebaby","Soonebaby","管 理 员","系统管理员");
		$params = $this->get;
		$this->emptyCheck($params,array('content','nickname','avatar','aid','pid','email'));
		$ip = getClientIp();
		$ipSearch = $this->CommentM->getDetailById('visit_logs',array('ip'=>$ip));
		if($ipSearch){ $ipaddr = $ipSearch['addr']; }else{ $ipaddr = get_addr_by_ip($ip);}

		$inArr = array('nickname'=>$params['nickname'],'content'=>$params['content'],'avatar'=>$params['avatar'],'aid'=>$params['aid'],'pid'=>$params['pid'],'email'=>$params['email'],'ip'=>$ip,'address'=>$ipaddr);
		$inArr['type'] = empty($params['pid'])?1:2;
        $inArr['nickname'] = trim($inArr['nickname']);
        $varw  = $this->ComModel->getVariable();
        $inArr['avatar']=$varw['avatar']==$inArr['avatar']?"":$inArr['avatar'];
        $inArr['nickname'] = in_array($inArr['nickname'],$adminname)?"假".$inArr['nickname']:$inArr['nickname'];
		if(!empty($_SESSION['admin_user'])){
            $inArr['nickname']="管理员";
            $inArr['avatar'] = $varw['avatar'];
        }
		$this->config->load('contentkeyword',TRUE);
		$this->load->library('KeyWord',array('keyWord'=>$this->config->item('keyWord','contentkeyword')),'keyword');
		if($rMessage = $this->keyword->replace($inArr['content'])){ $inArr['content']=$rMessage;}
		//长度判断
		$msgLen = get_msg_len($inArr['content']);
		if($msgLen <= 0 || $msgLen > 500){
			echo $_REQUEST['callback']."(3)";exit;
		}
		$inArr['content'] = bbCode(getStr($inArr['content'],0,1,1));

		$check = $this->CommentM->insert($this->ctype['tb'],$inArr);
		if($check && $inArr['type'] ==1){
			//评论数＋１，总评论数加＋１
			if($this->ctype['tbsu']){
				$this->CommentM->updateaddone($this->ctype['tbs'],'comnum',array('id'=>$inArr['aid']));
			}
			if($this->get['com_type']=='leaving'){
				$this->CommentM->updateaddone('system_variable','value',array('mark'=>'leavenum'));
			}else{
				$this->CommentM->updateaddone('system_variable','value',array('mark'=>'comnum'));
			}
		}
		if(!$check){echo $_REQUEST['callback']."(".json_encode(0).")";exit;}
		$inArr['createtime'] = date('Y-m-d H:i:s',time()); $inArr['id'] = $check;
		echo $_REQUEST['callback']."(".json_encode($inArr).")";exit;
	}

	protected function emptyCheck($params,$key_arr) {
		foreach($key_arr as $v){
			if(!isset($params[$v])){
				echo $_REQUEST['callback']."(".json_encode(0).")";exit;
			}   
		}   
	}

}
