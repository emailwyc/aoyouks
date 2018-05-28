<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Common extends TempBase{

	public function __construct(){
		parent::__construct();
	}   

	public function visit()
	{
		if($this->input->is_ajax_request()){
			$this->load->model('ComModel');
			$this->ComModel->visitHandle();
			echo 1;exit;
		}else{
			echo 0;exit;
		}
	}
	//申请友情链接
	public function applyFlink() {
		$this->load->model('ComModel');
		if(!$this->input->is_ajax_request()){ echo 0;exit;}
		$post = $this->input->post();
		if(empty($post['name']) || empty($post['email']) || empty($post['website']) || empty($post['desc']) || empty($post['captcha'])){ echo 0;exit;}
		$cap = strtolower($_SESSION["verification"]);
		if($cap!=strtolower($post['captcha'])){
			echo 2;	exit;
		}
		$data = array('title'=>$post['name'],'email'=>$post['email'],'website'=>$post['website'],'desc'=>$post['desc'],'status'=>0);
		$this->ComModel->insertTable('friend_links',$data);
		echo 1;exit;
	}
	//访问统计
	public function visits() {
		if(!$this->input->is_ajax_request()){ echo 0;}
		$post = $this->input->post();
		if(empty($post['type']) || empty($post['aid'])){ echo 0;}
		if($post['type']=="article"){
			$this->load->model('ArticleM');
			$this->ArticleM->visitHandle((int)$post['aid']);
			echo 1;exit;
		}elseif($post['type']=="saying"){
			$this->load->model('ComModel');
			$this->ComModel->updateaddone('saying','pv',array('id'=>(int)$post['aid']));
			echo 1;exit;
		}elseif($post['type']=="download"){
			$this->load->model('ComModel');
			$this->ComModel->updateaddone('download','pv',array('id'=>(int)$post['aid']));
			echo 1;exit;
		}
	}
	//generate
	public function captcha() {
		$str = generate(4);
		//验证码图片的宽度
		$width  = 50;     
		//验证码图片的高度
		$height = 25;    
		//声明需要创建的图层的图片格式
		@ header("Content-Type:image/png");
		//创建一个图层
		$im = imagecreate($width, $height);
		//背景色
		$back = imagecolorallocate($im, 0xFF, 0xFF, 0xFF);
		//模糊点颜色
		$pix  = imagecolorallocate($im, 187, 230, 247);
		//字体色
		$font = imagecolorallocate($im, 41, 163, 238);
		//绘模糊作用的点
		mt_srand();
		for ($i = 0; $i < 100; $i++) {
			imagesetpixel($im, mt_rand(0, $width), mt_rand(0, $height), $pix);
		}
		//输出字符
		imagestring($im, 5, 7, 5, $str, $font);
		//输出矩形
		imagerectangle($im, 0, 0, $width -1, $height -1, $font);
		//输出图片
		imagepng($im);
		imagedestroy($im);
		//选择 cookie
		//SetCookie("verification", $str, time() + 7200, "/");
		$_SESSION["verification"] = $str;
	}






}
