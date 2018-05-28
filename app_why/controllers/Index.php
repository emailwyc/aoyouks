<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Index extends HomeBase{

	public function __construct(){
		parent::__construct();
		$this->load->model('SwiperM');
		$this->load->model('ArticleM');
	}   

	public function index($page=1)
	{
		//获取轮播图片(最多获取8张)
		$this->load->model('DownloadM');
		$this->_cdata['swiper'] = $this->SwiperM->getIndexSwiper();
		$this->_cdata['swiperc'] = count($this->_cdata['swiper']);
		$this->_cdata['artList'] = $this->ArticleM->getArtList((int)$page);
		$this->_cdata['dwList'] = $this->DownloadM->getIndexList();
		$this->load->view('index/index',$this->_cdata);
	}

	public function friendlink() {
		$this->load->model('FriendLinkM');
		$this->load->model('CommentM');
		$this->_cdata['leaving'] = $this->CommentM->getList('leaving_comment',array('type'=>1),7,1,"id desc");
		$this->_cdata['linkyes'] = $this->FriendLinkM->getList('friend_links',array('status'=>1),30,1,"order asc,id desc");
		$this->_cdata['linkno'] = $this->FriendLinkM->getList('friend_links',array('status'=>2),7,1,"id desc");
		$this->_cdata['linkapply'] = $this->FriendLinkM->getList('friend_links',array('status'=>0),10,1,"id desc");
		$this->load->view('index/friendlink',$this->_cdata);
	}
}
