<?php
//评论模型处理类
class FriendLinkM extends CI_Model {

	
	public $table;
    public function __construct() {
		parent::__construct();
		$this->table = 'friend_links';
	}
	//comment count
	public function getCount($table,$where)
	{
		$count  = $this->db->where($where)->count_all_results($table);
		return $count;
	}
	//comment list
	public function getList($table,$where,$offset=10,$page=1,$order="id desc")
	{
		$page = $page<=0?1:$page;
		$start = ($page-1)*$offset;
		$query = $this->db->where($where)->order_by($order)->from($table)->limit($offset,$start)->get();
		$result = $query->result_array();
		return $result;
	}
	//reply count
	public function getReplyCount($table,$where,$group,$wherein)
	{
		$query= $this->db->select("$group,count(id) as count")->where($where)->where_in($group,$wherein)->group_by($group)->get($table);
		$result = $query->result_array();
		$list = ArrKeyFromId($result,$group,'count');
		return $list;
	}

	//insert
	public function insert($table,$data) {
		$check = $this->db->insert($table,$data);
		if($check){
			return $this->db->insert_id();
		}else{
			return false;
		}
	}
	//updateaddone
	public function updateaddone($table,$field,$where) {
		//获取ip地址
		$check = $this->db->set($field,"$field+1",false)->where($where)->update($table);
		return $check;
	}

	//得到详情
	public function getDetailById($table,$where) {
		$query = $this->db->select("*")->where($where)->from($table)->limit(1,0)->get();
		$result = $query->row_array();
		return $result;
	}




}
