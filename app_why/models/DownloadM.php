<?php
//下载模型处理类
/*后期加缓存*/
class DownloadM extends CI_Model {

	
	public $table;
    public function __construct() {
		parent::__construct();
		$this->table = 'download';
	}
	public function getList($table,$field="*",$where=array(),$page=1,$offset=10)
	{
		$page = $page<=0?1:$page;
		$start = ($page-1)*$offset;
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
	//得到上下篇
	public function getPrevAndNext($table,$value,$field="id,title",$key="id") {
		$query = $this->db->select($field)->where(array("$key<"=>$value))->order_by("$key desc")->from($table)->limit(1,0)->get();
		$prev= $query->row_array();
		$query = $this->db->select($field)->where(array("$key>"=>$value))->order_by("$key asc")->from($table)->limit(1,0)->get();
		$next= $query->row_array();
		return array('prev'=>$prev,'next'=>$next);
	}
	//得到可能喜欢
	public function getLikes($table,$field,$id=0) {
		$rand = $this->db->select("FLOOR(RAND()*COUNT(*)) as offset")->from($table)->get();
		$randInfo = @$rand->row_array();$randInfo = @(int)$randInfo['offset']-1;
		$random = $randInfo<=0?0:$randInfo;
		$query = $this->db->select($field)->where(array('id!='=>$id))->from($table)->limit(4,$random)->get();
		$result = $query->result_array();
		return $result;
	}
	public function updateaddone($table,$field,$where) {
		//获取ip地址
		$check = $this->db->set($field,"$field+1",false)->where($where)->update($table);
		return $check;
	}

	public function getIndexList() {
		$field = "id,title,icon,dnum,ctime";
		$query = $this->db->select($field)->order_by('id desc')->from('download')->limit(6,0)->get();
		$result = $query->result_array();
		return $result;
	}

}
