<?php
//公共模型处理类
/*后期加缓存*/
class ComModel extends CI_Model {

	
	public $table;
    public function __construct() {
		parent::__construct();
		$this->table = '';
	}
	//得到最新更新
	public function getUserByName($name) {
		$query = $this->db->select("*")->from('admin_user')->where(array('username'=>$name))->limit(1,0)->get();
		$result = $query->row_array();
		return $result;
	}
	public function reduceErrorNum($id)
    {
        $check = $this->db->set('errornum', 'errornum-1', false)->where(array('id' => $id))->update('admin_user');
        return $check;
    }
	public function insertTable($table,$data) {
		$check = $this->db->insert($table,$data);
		return $check;
	}
    //updateaddone
    public function updateOne($table,$data,$where) {
        //获取ip地址
        $check = $this->db->where($where)->update($table,$data);
        return $check;
    }

    public function updateToken($userinfo) {
        if($userinfo['logins']){
            $token = md5(uniqid(rand(), TRUE));
            $check = $this->ComModel->updateOne('admin_user',array('token'=>$token),array('id'=>$userinfo['id']));
            $auth = $userinfo['username'].":".$token;
            if($check) {
                setcookie("admin_auth", $auth, time() + 3600 * 24 * 7, "/");
            }
        }
        return true;

    }

    public function checkLogin($isDump=1) {
        if(!empty($_SESSION["admin_user"])){
            //更新tooken
            $this->updateToken($_SESSION["admin_user"]);
            return $_SESSION["admin_user"];
        }else{
            if(empty($_COOKIE['admin_auth'])) {
                if ($isDump) {
                    header('Location:/admin/login');exit;
                }
                return false;
            }else{
                $arr = explode(":",$_COOKIE['admin_auth']);
               // print_r($arr);exit;
                if(count($arr)!=2){
                    if ($isDump) { header('Location:/admin/login');exit;}
                    return false;
                }else{
                    $where = array("username"=>$arr[0],"token"=>$arr[1]);
                    $query = $this->db->select("*")->from('admin_user')->where($where)->limit(1,0)->get();
                    $result = $query->row_array();
                    if(!empty($result)){
                        //更新tooken
                        $this->updateToken($result);
                        $_SESSION["admin_user"] = $result;
                        return $result;
                    }else{
                        if ($isDump) { header('Location:/admin/login');exit;}
                        return false;
                    }
                }
            }
        }
    }
    //得到系统变量
    public function getVariable()
    {
        $query = $this->db->select("*")->where(array('init'=>1))->get('system_base');
        $baseRes = ArrKeyFromId($query->result_array(),'mark','value');
        return $baseRes;
    }
    //得到文章分类
    public function getArtClass()
    {
        $query = $this->db->select("a.id,a.name,count(b.id) as number")
            ->join('article as b', 'b.cid = a.id','left')
            ->group_by("a.id")
            ->order_by("a.id asc")
            ->get('article_class as a', 100,0);
        $result = $query->result_array();
        return $result;
    }

    //得到标签
    public function getTags() {
        $query = $this->db->select("a.id,a.name,count(b.id) as number,a.order")
            ->join('article_tags as b', 'b.tid = a.id','left')
            ->group_by("a.id")
            ->from('tags_cloud as a')
            ->order_by("a.order asc,a.id asc")
            ->limit(100,0)
            ->get();
        $result = $query->result_array();
        return $result;
    }

}
