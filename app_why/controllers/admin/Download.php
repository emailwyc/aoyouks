<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Download extends AdminBase{

    public function __construct(){
        parent::__construct();
    }

    public function index($page=1)
    {
        $this->_cdata['dwnList'] = $this->CModel->getArtList('download',(int)$page,array(),8);
        $this->load->aview('download/index',$this->_cdata);
    }
    public function index_add()
    {
        $params = $this->params;
        if(!empty($params['oper'])){
            //检查参数
            $this->emptyCheck($params,array('title','download_icon','is_hot','content'));
            $this->emptyCheck1($params,array('title','download_icon'));
            $params['is_hot'] = $params['is_hot']=="true"?1:0;
            $newdata = array(
                'title'=>$params['title'],
                'kwd'=>$params['kwd'],
                'icon'=>$params['download_icon'],
                'dnum'=>0,
                'durl'=>$params['durl'],
                'lurl'=>$params['lurl'],
                'pv'=>0,
                'is_hot'=>(int)$params['is_hot'],
                'uptime'=>date('Y-m-d H:i:s',time()),
                'ctime'=>date('Y-m-d H:i:s',time()),
                'content'=>$params['content']
            );
            $aid = $this->CModel->insertTableRid("download",$newdata);
            if($aid){
                $this->CModel->updateaddone("system_variable","value",array("mark"=>"resnum"));
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"添加失败！"));
            }
        }
        $this->load->aview('download/index_add',$this->_cdata);
    }
    public function index_edit()
    {
        $id = isset($_GET['id'])?(int)$_GET['id']:0;
        $detail = $this->CModel->getDetailById('download',array('id'=>$id));
        $params = $this->params;
        if(!empty($params['oper'])){
            if(empty($detail)){returnjson(array('code'=>11,'msg'=>"未找到该资源！"));}
            //检查参数
            $this->emptyCheck($params,array('title','download_icon','is_hot','content'));
            $this->emptyCheck1($params,array('title','download_icon'));
            $params['is_hot'] = $params['is_hot']=="true"?1:0;
            $newdata = array(
                'title'=>$params['title'],
                'kwd'=>$params['kwd'],
                'icon'=>$params['download_icon'],
                'durl'=>$params['durl'],
                'lurl'=>$params['lurl'],
                'is_hot'=>(int)$params['is_hot'],
                'uptime'=>date('Y-m-d H:i:s',time()),
                'content'=>$params['content']
            );
            $aid = $this->CModel->updateOne("download",$newdata,array('id'=>$id));
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"更新失败！"));
            }
        }
        $this->_cdata['download'] = $detail;
        if(empty($detail)) { show_error("未找到该资源!");}
        $this->load->aview('download/index_edit',$this->_cdata);
    }
    public function index_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $check=$this->CModel->delTable("download",array('id'=>(int)$params['id']));
            if($check) {
                $count = $this->CModel->getCount("download",array());
                $this->CModel->updateOne("system_variable", array("value"=>$count), array("mark" => "resnum"));
            }
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }

    public function index_edit_upload()
    {
        $cur_time = time();
        $month = date('Ym',$cur_time);
        $this->load->helper(array('form', 'url'));
        $config['upload_path']      = './ui/attachment/download/'.$month."/";
        $config['allowed_types']    = 'gif|jpg|png|zip|rar|gz|tar|php|html|js';
        $config['file_name']      = $cur_time.getRandomPass(4);
        $this->load->library('upload', $config);
        mk_dir($config['upload_path']);
        //print_r($_FILES);exit;
        if ( ! $this->upload->do_upload('durl'))
        {
            returnjson(array('code'=>2,'msg'=>$this->upload->display_errors()));
        }
        else
        {
            $data = $this->upload->data();
            $file_url =  $config['upload_path'].$data['file_name'];
            returnjson(array('code'=>1,'msg'=>$file_url));
        }
    }

}