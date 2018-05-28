<?php
//说说模型处理类
/*后期加缓存*/
class SayingM extends CI_Model {

	
	public $table;
    public function __construct() {
		parent::__construct();
		$this->table = 'saying';
	}
	public function getList($page)
	{
		$offset = 10;
		$page = $page<=0?1:$page;
		$start = ($page-1)*$offset;
		$field = "*";
		$query = $this->db->select($field)->order_by('id desc')->from($this->table)->limit($offset,$start)->get();
		$result = $query->result_array();
		$count  = $this->db->count_all_results($this->table);
		$allpage = ceil($count/$offset);
		$res = array("page"=>array('per'=>$offset,'curpage'=>$page,'count'=>$count),'data'=>$result);
		return $res;
	}

	public function getDetailById($id)
	{
		$query = $this->db->select("*")->where(array('id'=>$id))->from($this->table)->limit(1,0)->get();
		$result = $query->row_array();
		return $result;
	}
}
