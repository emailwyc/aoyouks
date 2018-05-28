<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Other extends AdminBase{

    public function __construct(){
        parent::__construct();
    }
    //滚动消息
    public function rollmsg($page=1)
    {
        $this->_cdata['lists'] = $this->CModel->getArtList('message_rolling',(int)$page,array(),8);
        $this->load->aview('other/rollmsg',$this->_cdata);
    }
    public function rollmsg_add()
    {
        $params = $this->params;
        if(!empty($params['oper'])){
            $this->emptyCheck1($params,array('message'));
            $starttime = !empty($params['starttime'])?strtotime($params['starttime']):0;
            $endtime   = !empty($params['endtime'])?strtotime($params['endtime']):1999999999;
            $newdata = array(
                'message'=>$params['message'],
                'starttime'=>$starttime,
                'endtime'=>$endtime
            );
            $aid = $this->CModel->insertTableRid("message_rolling",$newdata);
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"添加失败！"));
            }
        }
        $this->load->aview('other/rollmsg_add',$this->_cdata);
    }
    public function rollmsg_edit()
    {
        $id = isset($_GET['id'])?(int)$_GET['id']:0;
        $detail = $this->CModel->getDetailById('message_rolling',array('id'=>$id));
        $params = $this->params;
        if(!empty($params['oper'])){
            if(empty($detail)){returnjson(array('code'=>11,'msg'=>"未找到该记录！"));}
            $this->emptyCheck1($params,array('message'));
            $starttime = !empty($params['starttime'])?strtotime($params['starttime']):0;
            $endtime   = !empty($params['endtime'])?strtotime($params['endtime']):1999999999;
            $newdata = array(
                'message'=>$params['message'],
                'starttime'=>$starttime,
                'endtime'=>$endtime
            );
            $aid = $this->CModel->updateOne("message_rolling",$newdata,array('id'=>$id));
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"更新失败！"));
            }
        }
        $this->_cdata['msg'] = $detail;
        if(empty($detail)) { show_error("未找到该记录!");}
        $this->load->aview('other/rollmsg_edit',$this->_cdata);
    }
    public function rollmsg_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $this->CModel->delTable("message_rolling",array('id'=>(int)$params['id']));
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }




    //轮播图
    public function rollpic($page=1)
    {
        $get = $this->input->get();
        $classes = !empty($get['classes'])?$get['classes']:"index";
        $where = array();
        if($classes){
            $where['position']=$classes;
        }
        $this->_cdata['classes'] = $classes;
        $this->_cdata['pic'] = $this->CModel->getListPage('swiper_slide',(int)$page,array(),8,"order asc");
        $this->load->aview('other/rollpic',$this->_cdata);
    }

    public function rollpic_add()
    {
        $params = $this->params;
        if(!empty($params['oper'])){
            $this->emptyCheck1($params,array('title','img','position'));
            $newdata = array(
                'title'=>$params['title'],
                'img'=>$params['img'],
                'link'=>$params['link'],
                'order'=>(int)$params['order'],
                'position'=>$params['position']
            );
            $aid = $this->CModel->insertTableRid("swiper_slide",$newdata);
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"添加失败！"));
            }
        }
        $this->load->aview('other/rollpic_add',$this->_cdata);
    }
    public function rollpic_edit()
    {
        $id = isset($_GET['id'])?(int)$_GET['id']:0;
        $detail = $this->CModel->getDetailById('swiper_slide',array('id'=>$id));
        $params = $this->params;
        if(!empty($params['oper'])){
            if(empty($detail)){returnjson(array('code'=>11,'msg'=>"未找到该记录！"));}
            $this->emptyCheck1($params,array('title','img','position'));
            $newdata = array(
                'title'=>$params['title'],
                'img'=>$params['img'],
                'link'=>$params['link'],
                'order'=>(int)$params['order'],
                'position'=>$params['position']
            );
            $aid = $this->CModel->updateOne("swiper_slide",$newdata,array('id'=>$id));
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"更新失败！"));
            }
        }
        $this->_cdata['pic'] = $detail;
        if(empty($detail)) { show_error("未找到该记录!");}
        $this->load->aview('other/rollpic_edit',$this->_cdata);
    }
    public function rollpic_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $this->CModel->delTable("swiper_slide",array('id'=>(int)$params['id']));
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }

    //友情链接
    public function friendlink($page=1)
    {
        $this->_cdata['flink'] = $this->CModel->getListPage('friend_links',(int)$page,array(),8,"status asc,order asc");
        $this->load->aview('other/friendlink',$this->_cdata);
    }
    public function friendlink_edit()
    {
        $id = isset($_GET['id'])?(int)$_GET['id']:0;
        $detail = $this->CModel->getDetailById('friend_links',array('id'=>$id));
        $params = $this->params;
        if(!empty($params['oper'])){
            if(empty($detail)){returnjson(array('code'=>11,'msg'=>"未找到该记录！"));}
            $this->emptyCheck1($params,array('status'));
            $newdata = array(
                'status'=>(int)$params['status'],
                'order'=>(int)$params['order']
            );
            $aid = $this->CModel->updateOne("friend_links",$newdata,array('id'=>$id));
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"更新失败！"));
            }
        }
        $this->_cdata['flink'] = $detail;
        if(empty($detail)) { show_error("未找到该记录!");}
        $this->load->aview('other/friendlink_edit',$this->_cdata);
    }
    public function friendlink_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $this->CModel->delTable("friend_links",array('id'=>(int)$params['id']));
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }

}
