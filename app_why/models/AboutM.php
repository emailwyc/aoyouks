<?php
//关于模型处理类
/*后期加缓存*/
class AboutM extends CI_Model {

	
	public $table;
    public function __construct() {
		parent::__construct();
		$this->table = 'system_text';
	}
	public function getAll($table,$where=array())
	{
		$field = "*";
		$query = $this->db->select($field)->where($where)->from($table)->get();
		$result = $query->result_array();
		return $result;
	}

	public function getDetailById($table,$id)
	{
		$query = $this->db->select("*")->where(array('id'=>$id))->from($table)->limit(1,0)->get();
		$result = $query->row_array();
		return $result;
	}
}
