<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Article extends AdminBase{

    public function __construct(){
        parent::__construct();
        $this->load->model('admin/ArticleM');
    }

    public function classes()
    {
        //获取所有文章分类
        $this->_cdata['classes'] = $this->ComModel->getArtClass();
        $this->_cdata['count'] = count($this->_cdata['classes']);
        $this->load->aview('article/classes',$this->_cdata);
    }

    public function classes_handle() {
        $params = $this->params;
        $data = array();
        if($params['oper']=="add"){
            $data = array("name"=>$params['name']);
            $data['id'] = $this->CModel->insertTableRid('article_class',$data);
            if(!$data['id']){returnjson(array('code'=>11,'msg'=>"失败！"));}
        }elseif($params['oper']=="del"){
            //判断是否有关联文章
            $count = $this->CModel->getCount('article',array('cid'=>@$params['id']));
            if($count){returnjson(array('code'=>12,'msg'=>"无法删除，存在关联文章！"));}
            $this->CModel->delTable('article_class',array('id'=>@$params['id']));
        }elseif($params['oper']=="edit"){
            $this->CModel->updateOne('article_class',array("name"=>$params['name']),array('id'=>@$params['id']));
        }
        returnjson(array('code'=>1,'data'=>$data,'msg'=>"成功！"));
    }
    public function tags()
    {

        $this->_cdata['tags'] = $this->ComModel->getTags();
        $this->_cdata['count'] = count($this->_cdata['tags']);
        $this->load->aview('article/tags',$this->_cdata);
    }
    public function tags_handle() {
        $params = $this->params;
        $data = array();
        if($params['oper']=="add"){
            $data = array("name"=>$params['name'],"order"=>(int)$params['order']);
            $data['id'] = $this->CModel->insertTableRid('tags_cloud',$data);
            if(!$data['id']){returnjson(array('code'=>11,'msg'=>"失败！"));}
        }elseif($params['oper']=="del"){
            //删除文章关联信息
            $this->CModel->delTable('article_tags',array('tid'=>@$params['id']));
            $this->CModel->delTable('tags_cloud',array('id'=>@$params['id']));
        }elseif($params['oper']=="edit"){
            $this->CModel->updateOne('tags_cloud',array("name"=>$params['name'],"order"=>(int)$params['order']),array('id'=>@$params['id']));
        }
        returnjson(array('code'=>1,'data'=>$data,'msg'=>"成功！"));
    }
    public function lists($page=1)
    {
        $get = $this->input->get();
        $classes = !empty($get['classes'])?(int)$get['classes']:"";
        $where = array();
        if($classes){
            $where['article.cid']=$classes;
        }
        //获取文章所有分类
        $this->_cdata['artClass'] = $this->CModel->getAll('article_class',array());
        //获取文章列表
        $this->_cdata['artList'] = $this->ArticleM->getArtList((int)$page,$where);
        $this->_cdata['classes'] = $classes;
        $this->load->aview('article/lists',$this->_cdata);
    }
    //文章添加或编辑
    public function lists_add()
    {
        $params = $this->params;
        if(!empty($params['oper'])){
            //检查参数
            $this->emptyCheck($params,array('title','article_icon','is_reward','content'));
            $this->emptyCheck1($params,array('title','article_icon','short','content'));
            $params['is_reward'] = $params['is_reward']=="true"?1:0;
            $params['is_hot'] = $params['is_hot']=="true"?1:0;
            $params['status'] = $params['status']=="true"?1:0;
            $newdata = array(
                'title'=>$params['title'],
                'img'=>$params['article_icon'],
                'is_reward'=>(int)$params['is_reward'],
                'is_hot'=>(int)$params['is_hot'],
                'status'=>(int)$params['status'],
                'cid'=>(int)$params['cid'],
                'short'=>$params['short'],
                'author'=>@$_SESSION['admin_user']['username'],
                'content'=>$params['content']
                );
            $aid = $this->CModel->insertTableRid("article",$newdata);
            if($aid){
                //增加文章数量
                $this->CModel->updateaddone("system_variable","value",array("mark"=>"artnum"));
                //添加tags
                $this->CModel->delTable("article_tags",array("aid"=>$aid));
                $this->CModel->insertTable("publish_logs",array("class"=>1,"content"=>$params['title']));
                if(!empty($params['tags'])) {
                    $tags = array();
                    foreach ($params['tags'] as $v) {
                        $tags[]= array('aid'=>$aid,'tid'=>(int)$v);
                    }
                    $this->CModel->insertBatch("article_tags",$tags);
                }
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"添加失败！"));
            }
        }

        $this->_cdata['tags'] = $this->CModel->getAll('tags_cloud',array());
        $this->_cdata['artClass'] = $this->CModel->getAll('article_class',array());
        $this->load->aview('article/lists_add',$this->_cdata);
    }

    //文章添加或编辑
    public function lists_edit()
    {
        $id = isset($_GET['id'])?(int)$_GET['id']:0;
        $detail = $this->CModel->getDetailById('article',array('id'=>$id));
        $params = $this->params;
        if(!empty($params['oper'])){
            if(empty($detail)){returnjson(array('code'=>11,'msg'=>"未找到改文章！"));}
            //检查参数
            $this->emptyCheck($params,array('title','article_icon','is_reward','content'));
            $this->emptyCheck1($params,array('title','article_icon','short','content'));
            $params['is_reward'] = $params['is_reward']=="true"?1:0;
            $params['is_hot'] = $params['is_hot']=="true"?1:0;
            $params['status'] = $params['status']=="true"?1:0;
            $newdata = array(
                'title'=>$params['title'],
                'img'=>$params['article_icon'],
                'is_reward'=>(int)$params['is_reward'],
                'is_hot'=>(int)$params['is_hot'],
                'status'=>(int)$params['status'],
                'cid'=>(int)$params['cid'],
                'short'=>$params['short'],
                'author'=>@$_SESSION['admin_user']['username'],
                'content'=>$params['content']
            );
            $aid = $this->CModel->updateOne("article",$newdata,array('id'=>$id));
            if($aid){
                //添加tags
                $this->CModel->delTable("article_tags",array("aid"=>$id));
                $this->CModel->insertTable("publish_logs",array("class"=>1,"content"=>$params['title']));
                if(!empty($params['tags'])) {
                    $tags = array();
                    foreach ($params['tags'] as $v) {
                        $tags[]= array('aid'=>$id,'tid'=>(int)$v);
                    }
                    $this->CModel->insertBatch("article_tags",$tags);
                }
                returnjson(array('code'=>1,'msg'=>"成功！"));
            }else{
                returnjson(array('code'=>3,'msg'=>"更新失败！"));
            }
        }
        $this->_cdata['art'] = $detail;
        if(empty($detail)) { show_error("未找到该文章!");}
        $atags = $this->CModel->getAll('article_tags',array('aid'=>$id));
        $this->_cdata['atags'] = ArrKeyAll($atags,"tid");
        $this->_cdata['tags'] = $this->CModel->getAll('tags_cloud',array());
        $this->_cdata['artClass'] = $this->CModel->getAll('article_class',array());
        $this->load->aview('article/lists_edit',$this->_cdata);
    }
    //文章删除
    public function lists_del()
    {
        $params = $this->params;
        if(!empty($params['id'])){
            $check=$this->CModel->delTable("article",array('id'=>(int)$params['id']));
            $this->CModel->delTable("article_tags",array("aid"=>(int)$params['id']));
            if($check) {
                $count = $this->CModel->getCount("article",array());
                $this->CModel->updateOne("system_variable", array("value"=>$count), array("mark" => "artnum"));
            }
            returnjson(array('code'=>1,'msg'=>"删除成功！"));
        }else{
            returnjson(array('code'=>2,'msg'=>"参数错误！"));
        }
    }


}
