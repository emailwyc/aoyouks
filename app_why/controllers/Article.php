<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Article extends HomeBase{

	public function __construct(){
		parent::__construct();
		$this->load->model('ArticleM');
	}   

	public function detail($id=0) {
		if(empty($id)){ show_error("未找到该文章!");}
		//得到文章详情
		$this->_cdata['article'] = $this->ArticleM->getDetailById($id);
		if(empty($this->_cdata['article'])){ show_error("未找到该文章!");}
		$this->_cdata['artClass'] = $this->ArticleM->getClassById($this->_cdata['article']['cid']);
		//得到文章上下篇
		$this->_cdata['prevAndNext'] = $this->ArticleM->getPrevAndNext($id);
		//得到文章云标签
		$this->_cdata['tags'] = $this->ArticleM->getTags($id);
		//得到文章可能喜欢
		$this->_cdata['likes'] = $this->ArticleM->getLikes($this->_cdata['article']['cid'],$id);
		$this->load->view('article/detail',$this->_cdata);
	}

	//根据分类找到文章
	public function category($class,$page=1) {
		if(empty($class)){ show_error("未找到该文章!");}
		$this->_cdata['cate'] =  $this->ArticleM->getClassById($class);
		if(empty($this->_cdata['cate'])){ show_error("未找到该分类!");}
		$where = array('article.status'=>1,'article.cid'=>$class);
		$this->_cdata['artList'] = $this->ArticleM->getArtList((int)$page,$where,10);
		$this->_cdata['category'] = $class;
		$this->load->view('article/category',$this->_cdata);
	}
	//根据标签查找文章
	public function tag($tag,$page=1) {
		if(empty($tag)){ show_error("参数有误!");}
		$this->_cdata['tag'] =  $this->ArticleM->getTagById($tag);
		if(empty($this->_cdata['tag'])){ show_error("未找到该标签!");}
		$this->_cdata['artList'] = $this->ArticleM->getArtListByTag((int)$page,(int)$tag,15);

		$this->load->view('article/tag',$this->_cdata);
	}
}
