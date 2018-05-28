<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ImgM extends CI_Model {

    private $img_type =  array('gif'=>1,'jpg'=>1,'png'=>1,'bmp'=>1,'jpeg'=>1,'GIF'=>1,'JPG'=>1,'PNG'=>1,'BMP'=>1,'JPEG'=>1);
    function __construct()
    {
        parent::__construct();
        $this->load->library('image_lib');
    }

    private function setWm($source_image){
        $config = array();
        $config['source_image'] = $source_image;
        $config['wm_overlay_path'] = "./ui/system/images/logo3.gif";
        $config['wm_type'] = 'overlay';
        $config['wm_vrt_alignment'] = 'bottom';
        $config['wm_hor_alignment'] = 'right';
        $config['wm_hor_offset'] = 5;
        $config['wm_vrt_offset'] = 5;
        $this->image_lib->initialize($config);
        $this->image_lib->watermark();
    }

    private function getParams($thumb){
        $configLarge = array();
        $configLarge['image_library'] = 'gd2';
        $configLarge['create_thumb'] = TRUE;
        $configLarge['maintain_ratio'] = TRUE; //保持图片比例
        $configLarge['master_dim'] = 'auto';
        $configLarge['quality'] = '90%';
        $configLarge['width'] = !empty($thumb['w'])?$thumb['w']:100;
        $configLarge['height'] = !empty($thumb['h'])?$thumb['h']:100;
        $configLarge['dynamic_output'] = FALSE;
        $configLarge['thumb_marker'] = "_thumb";
        return $configLarge;
    }
    //单张base64位图片上传
    public function imgUploadOne($Info){
        $error = array('code'=>1,'msg'=>"成功");
        if(empty($Info['img_info']) || empty($Info['img_type']) || empty($Info['tp'])){ $error['code'] = 1000; $error['msg'] = "参数错误！"; return $error; }
        $cur_time = time();
        $createFn = $cur_time.getRandomPass(4);
        $month = date('Ym',$cur_time);
        $streamFile = @base64_decode(urldecode($Info['img_info']));//图片流
        if(empty($streamFile)){ $error['code'] = 1000; $error['msg'] = "参数错误！"; return $error; }
        //写入图片
        $img_type_all = array('gif'=>1,'jpg'=>1,'png'=>1,'bmp'=>1,'jpeg'=>1,'GIF'=>1,'JPG'=>1,'PNG'=>1,'BMP'=>1,'JPEG'=>1);
        if(!isset($img_type_all[$Info['img_type']])){ $error['code'] = 1001; $error['msg'] = "图片格式错误！"; return $error; }
        $md5filename = md5($createFn);
        $md5fn = $md5filename.".".$Info['img_type'];
        //保存成文件格式
        $dbfiles = './ui/attachment/'.$Info['tp'].'/'.$month."/";
        $temp_file = $dbfiles.$md5fn;
        mk_dir($dbfiles);
        $hder = "Content-Type: image/".$Info['img_type'];
        header($hder);
        $file = fopen($temp_file,"w");//打开文件准备写入
        fwrite($file,$streamFile);//写入
        fclose($file);//关闭
        header("Content-type: text/html; charset=utf-8");
        //判断是否是真正图片
        $im = @getimagesize($temp_file);
        //$img_size=@ceil(filesize($temp_file)/1048576);
        if($im == false){
            $error['code'] = 1002; $error['msg'] = "上传图片不符合规则或已损坏！！"; return $error;
        }else{
            $this->setWm($temp_file);
            $scan = number_format($im['0']/$im['1'],2,'.','');
            $error['data']['scale'] = $scan;
        }
        //处理图片
        if($Info['thumb']) {
            $conf = $this->getParams($Info['thumb']);
            $conf['source_image'] = $temp_file;
            $conf['new_image'] = $temp_file;
            $this->image_lib->initialize($conf);
            $this->image_lib->resize();
        }
        $error['code'] = 1; $error['msg'] = substr($temp_file,1);
        return $error;
    }



}
