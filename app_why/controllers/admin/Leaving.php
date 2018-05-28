<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Leaving extends AdminBase{

    public function __construct(){
        parent::__construct();
    }

    public function index($page=1)
    {
        $lists = $this->CModel->getArtList('leaving_comment',(int)$page,array('type'=>1),8);
        $lists['data'] = ArrKeyFromId($lists['data']);
        $ids = ArrKeyAll($lists['data'],'id');
        $hf = $this->CModel->getAllByIn('leaving_comment',array('type'=>2),array("field"=>"pid","arr"=>$ids));
        if($hf){
            foreach ($hf as $k=>$v){
                if(empty($lists['data'][$v['pid']]['pinglun'])){
                    $lists['data'][$v['pid']]['pinglun'] = "";
                }
                $lists['data'][$v['pid']]['pinglun'] .= $v['content']."<br>";
            }
        }
        $this->_cdata['lists'] = $lists;
        $this->load->aview('leaving/index',$this->_cdata);
    }
    public function index_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $check=$this->CModel->delTable("leaving_comment",array('id'=>(int)$params['id']));
            if($check) {
                $this->CModel->delTable("leaving_comment",array('pid'=>(int)$params['id'],'type'=>2));
                $count = $this->CModel->getCount("leaving_comment",array('type'=>1));
                $this->CModel->updateOne("system_variable", array("value"=>$count), array("mark" => "leavenum"));
            }
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }

}
