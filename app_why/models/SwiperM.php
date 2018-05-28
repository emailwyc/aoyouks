<?php
//公共模型处理类
/*后期加缓存*/
class SwiperM extends CI_Model {

	
	public $table;
    public function __construct() {
		parent::__construct();
		$this->table = 'swiper_slide';
	}
	//得到轮播图片
	public function getIndexSwiper()
	{
		$where = array('position'=>'index');
		$query = $this->db->where($where)->order_by('order asc')->get($this->table, 8,0);
		$result = $query->result_array();
		return $result;
	}


}
