<?php
//公共模型处理类
/*后期加缓存*/
class CModel extends CI_Model {


    public $table;
    public function __construct() {
        parent::__construct();
        $this->table = '';
    }
    //comment count
    public function getCount($table,$where)
    {
        $count  = $this->db->where($where)->count_all_results($table);
        return $count;
    }
    public function getList($table,$where,$offset=10,$page=1,$order="id desc")
    {
        $page = $page<=0?1:$page;
        $start = ($page-1)*$offset;
        $query = $this->db->where($where)->order_by($order)->from($table)->limit($offset,$start)->get();
        $result = $query->result_array();
        return $result;
    }
    public function insertTable($table,$data) {
        $check = $this->db->insert($table,$data);
        return $check;
    }
    public function insertBatch($table,$data) {
        $check = $this->db->insert_batch($table,$data);
        return $check;
    }

    public function insertTableRid($table,$data) {
        $check = $this->db->insert($table,$data);
        if($check) {
            return $this->db->insert_id();
        }else{
            return false;
        }
    }
    public function delTable($table,$where) {
        $check = $this->db->delete($table, $where);
        return $check;
    }
    //updateaddone
    public function updateOne($table,$data,$where) {
        //获取ip地址
        $check = $this->db->where($where)->update($table,$data);
        return $check;
    }
    //updateaddone
    public function updateBatch($table,$data,$key) {
        //获取ip地址
        $check = $this->db->update_batch($table,$data,$key);
        return $check;
    }
    //得到详情
    public function getDetailById($table,$where) {
        $query = $this->db->select("*")->where($where)->from($table)->limit(1,0)->get();
        $result = $query->row_array();
        return $result;
    }
    //得到所有
    public function getAll($table,$where,$order="") {
        $query = $this->db->select("*")->where($where)->order_by($order)->get($table);
        $result = $query->result_array();
        return $result;
    }
    //updateaddone
    public function updateaddone($table,$field,$where) {
        //获取ip地址
        $check = $this->db->set($field,"$field+1",false)->where($where)->update($table);
        return $check;
    }
    public function updatejianone($table,$field,$where) {
        //获取ip地址
        $check = $this->db->set($field,"$field-1",false)->where($where)->update($table);
        return $check;
    }
    //得到滚动消息
    public function getArtList($table,$page,$where=array(),$offset=8) {
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
    //得到所有
    public function getAllByIn($table,$where,$wherein,$order="") {
        $query = $this->db->select("*")->where($where)->where_in($wherein['field'],$wherein['arr'])->order_by($order)->get($table);
        $result = $query->result_array();
        return $result;
    }

    //得到列表
    public function getListPage($table,$page,$where=array(),$offset=8,$order="id desc") {
        $page = $page<=0?1:$page;
        $start = ($page-1)*$offset;
        $field = "*";
        $query = $this->db->select($field)->where($where)->order_by($order)->from($table)->limit($offset,$start)->get();
        $result = $query->result_array();
        $count  = $this->db->where($where)->count_all_results($table);
        $allpage = ceil($count/$offset);
        $res = array("page"=>array('per'=>$offset,'curpage'=>$page,'count'=>$count),'data'=>$result);
        return $res;
    }


}
