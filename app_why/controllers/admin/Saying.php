<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Saying extends AdminBase{

    public function __construct(){
        parent::__construct();
    }

    public function index($page=1)
    {
        $this->_cdata['sayList'] = $this->CModel->getArtList('saying',(int)$page,array(),8);
        $this->load->aview('saying/index',$this->_cdata);
    }
    public function index_add()
    {
        $params = $this->params;
        if(!empty($params['oper'])){
            $this->emptyCheck1($params,array('title','content'));
            $ip = getClientIp();
            $ipSearch = $this->CModel->getDetailById('visit_logs',array('ip'=>$ip));
            if($ipSearch){ $ipaddr = $ipSearch['addr']; }else{ $ipaddr = get_addr_by_ip($ip);}
            $newdata = array(
                'title'=>$params['title'],
                'content'=>$params['content'],
                'comnum'=>0,
                'ip'=>$ip,
                'pv'=>0,
                'addr'=>$ipaddr
            );
            $aid = $this->CModel->insertTableRid("saying",$newdata);
            if($aid){
                $this->CModel->updateaddone("system_variable","value",array("mark"=>"saynum"));
                $this->CModel->insertTable("publish_logs",array("class"=>2,"content"=>$params['title']));
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"添加失败！"));
            }
        }
        $this->load->aview('saying/index_add',$this->_cdata);
    }
    public function index_edit()
    {
        $id = isset($_GET['id'])?(int)$_GET['id']:0;
        $detail = $this->CModel->getDetailById('saying',array('id'=>$id));
        $params = $this->params;
        if(!empty($params['oper'])){
            if(empty($detail)){returnjson(array('code'=>11,'msg'=>"未找到该说说！"));}
            //检查参数
            $this->emptyCheck1($params,array('title','content'));
            $newdata = array(
                'title'=>$params['title'],
                'content'=>$params['content']
            );
            $aid = $this->CModel->updateOne("saying",$newdata,array('id'=>$id));
            if($aid){
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"更新失败！"));
            }
        }
        $this->_cdata['say'] = $detail;
        if(empty($detail)) { show_error("未找到该说说!");}
        $this->load->aview('saying/index_edit',$this->_cdata);
    }
    public function index_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $check=$this->CModel->delTable("saying",array('id'=>(int)$params['id']));
            if($check) {
                $count = $this->CModel->getCount("saying",array());
                $this->CModel->updateOne("system_variable", array("value"=>$count), array("mark" => "saynum"));
            }
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }

}
