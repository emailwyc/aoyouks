<?php
//相册模型处理类
/*后期加缓存*/
class AlbumM extends CI_Model {

	
	public $table;
	public $table1;
    public function __construct() {
		parent::__construct();
		$this->table = 'album';
		$this->table1 = 'album_class';
	}
	public function getList($table,$where=array(),$page=1,$offset=10)
	{
		$page = $page<=0?1:$page;
		$start = ($page-1)*$offset;
		$field = "*";
		$query = $this->db->select($field)->where($where)->order_by('id desc')->from($table)->limit($offset,$start)->get();
		$result = $query->result_array();
		$count  = $this->db->where($where)->count_all_results($table);
		$allpage = ceil($count/$offset);
		$res = array("page"=>array('per'=>$offset,'curpage'=>$page,'count'=>$count),'data'=>$result);
		return $res;
	}

	public function getDetailById($table,$id)
	{
		$query = $this->db->select("*")->where(array('id'=>$id))->from($table)->limit(1,0)->get();
		$result = $query->row_array();
		return $result;
	}
}
