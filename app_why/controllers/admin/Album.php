<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Album extends AdminBase{

    public function __construct(){
        parent::__construct();
    }

    public function index($page=1)
    {
        $this->_cdata['albumClass'] = $this->CModel->getArtList('album_class',(int)$page,array(),8);
        $this->load->aview('album/index',$this->_cdata);
    }
    public function index_add()
    {
        $params = $this->params;
        if(!empty($params['oper'])){
            $this->emptyCheck1($params,array('title','icon'));
            $status = $params['status']=="true"?1:0;
            $newdata = array(
                'name'=>$params['title'],
                'icon'=>$params['icon'],
                'photo_num'=>0,
                'status'=>$status
            );
            $aid = $this->CModel->insertTableRid("album_class",$newdata);
            if($aid){
                $this->CModel->insertTable("publish_logs",array("class"=>3,"content"=>$params['title']));
                returnjson(array('code'=>1,'msg'=>"成功！",'aid'=>$aid));
            }else{
                returnjson(array('code'=>3,'msg'=>"添加失败！"));
            }
        }
        $this->load->aview('album/index_add',$this->_cdata);
    }
    public function index_edit()
    {
        $id = isset($_GET['id'])?(int)$_GET['id']:0;
        $detail = $this->CModel->getDetailById('album_class',array('id'=>$id));
        $params = $this->params;
        if(!empty($params['oper'])){
            if(empty($detail)){returnjson(array('code'=>11,'msg'=>"未找到该相册！"));}
            //检查参数
            $this->emptyCheck1($params,array('title','icon'));
            $status = $params['status']=="true"?1:0;
            $newdata = array(
                'name'=>$params['title'],
                'icon'=>$params['icon'],
                'status'=>$status
            );
            $aid = $this->CModel->updateOne("album_class",$newdata,array('id'=>$id));
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"更新失败！"));
            }
        }
        $this->_cdata['album'] = $detail;
        if(empty($detail)) { show_error("未找到该相册!");}
        $this->load->aview('album/index_edit',$this->_cdata);
    }
    public function index_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $check=$this->CModel->delTable("album_class",array('id'=>(int)$params['id']));
            if($check) {
                //删除照片
                $this->CModel->delTable("album",array('cid'=>(int)$params['id']));
                $count = $this->CModel->getCount("album",array());
                $this->CModel->updateOne("system_variable", array("value"=>$count), array("mark" => "photonum"));
            }
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }

    public function photo($aid=0)
    {
        $page=!empty($_GET['page'])?(int)$_GET['page']:1;
        $album = $this->CModel->getDetailById("album_class",array('id'=>(int)$aid));
        if(empty($album)){ show_error("未找到该相册!");}
        $this->_cdata['album'] = $album;
        $this->_cdata['photo'] = $this->CModel->getListPage('album',(int)$page,array('cid'=>(int)$aid),23,"id desc");
        $this->load->aview('album/photo',$this->_cdata);
    }

    public function photo_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $check=$this->CModel->delTable("album",array('id'=>(int)$params['id']));
            if($check) {
                $count = $this->CModel->getCount("album",array());
                $this->CModel->updateOne("system_variable", array("value"=>$count), array("mark" => "photonum"));
                if($params['cid']) {
                    $count1 = $this->CModel->getCount("album", array("cid"=>(int)$params['cid']));
                    $this->CModel->updateOne("album_class", array("photo_num"=>$count1), array("id" =>(int)$params['cid']));
                }
            }
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }

    public function photo_add()
    {
        $this->load->model('ImgM');
        $params = $this->params;
        $this->emptyCheck($params,array('img_info','img_type','tp','cid'));
        $result = $this->ImgM->imgUploadOne($params);
        if($result['code']==1){
            $img_cion = str_replace(".png","_thumb.png",$result['msg']);
            $newdata = array("cid"=>(int)$params['cid'],"img"=>$result['msg'],"img_icon"=>$img_cion);
            $newdata['scale'] = !empty($result['data']['scale'])?$result['data']['scale']:0;
            $aid = $this->CModel->insertTableRid("album",$newdata);
            if($aid){
                $this->CModel->updateaddone("album_class","photo_num",array("id"=>(int)$params['cid']));
                $this->CModel->updateaddone("system_variable","value",array("mark"=>"photonum"));
            }
            $result['aid'] = $aid;
        }
        echo json_encode($result);
    }

}
