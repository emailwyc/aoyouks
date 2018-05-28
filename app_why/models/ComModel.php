<?php
//公共模型处理类
/*后期加缓存*/
class ComModel extends CI_Model {

	
	public $table;
    public function __construct() {
		parent::__construct();
		$this->table = '';
	}
	//得到滚动消息
	public function getMsgRoll()
	{
		$where = array('starttime <'=>$this->curtime,'endtime >'=>$this->curtime);
		$query = $this->db->select("message")->where($where)->get('message_rolling', 10,0);
		$result = $query->result_array();
		return $result;
	}

	//得到文章分类
	public function getArtClass()
	{
		$query = $this->db->select("a.id,a.name,count(b.id) as number")
            ->join('article as b', 'b.cid = a.id','left')
            ->group_by("a.id")
            ->order_by("a.id asc")
            ->get('article_class as a', 20,0);
		$result = $query->result_array();
		return $result;
	}
	
	//得到系统变量
	public function getVariable()
	{
		$query = $this->db->select("*")->where(array('init'=>1))->get('system_variable');
		$varRes = ArrKeyFromId($query->result_array(),'mark','value');
		$query = $this->db->select("*")->where(array('init'=>1))->get('system_base');
		$baseRes = ArrKeyFromId($query->result_array(),'mark','value');
		$runing = ceil(($this->curtime-$baseRes['stime'])/86400);
		$res = array('baseRes'=>$baseRes,'varRes'=>$varRes,'runing'=>$runing);
		return $res;
	}

	//得到今日访问ip数
	public function getVisitNum()
	{
		$start = date("Y-m-d 00:00:00",$this->curtime);
		$query = $this->db->select("ip")->where(array('ut>='=>$start))->count_all_results('visit_logs');
		return $query;
	}

	//访客访问处理方法（ip存储等）
	public function visitHandle() {
		//获取ip地址
		$ip = getClientIp();
		$query = $this->db->where(array('ip'=>$ip))->count_all_results('visit_logs');
		if($query){
			$this->db->set('vnum','vnum+1',false)->where(array('ip'=>$ip))->update('visit_logs');
		}else{
			$ipInfo = get_addr_by_ip($ip);
			$this->db->insert('visit_logs',array('ip'=>$ipInfo['ip'],'addr'=>$ipInfo['addr'],'vnum'=>1,'ct'=>date('Y-m-d H:i:s',$this->curtime)));
		}
		$this->db->set('value','value+1',false)->where('mark','visitnum')->update('system_variable');
		//更新总访问量
	}
	//updateaddone
	public function updateaddone($table,$field,$where) {
		//获取ip地址
		$check = $this->db->set($field,"$field+1",false)->where($where)->update($table);
		return $check;
	}

	//得到最新更新
	public function getPublishLog() {
		$query = $this->db->select("*")->from('publish_logs')->order_by('id desc')->limit(1,0)->get();
		$result = $query->row_array();
		if($result){
			$result['class_name'] = @$this->config->item("_publishType")[$result['class']];
			$result['class'] = 'lable'.$result['class'];
			$result['strdate'] = format_date(strtotime($result['createtime']));
		}
		return $result;
	}

	//得到最新更新
	public function historyToday() {
		for($j=1;$j<=12;$j++){
			for($i=1;$i<=31;$i++){
				$query = $this->db->select("*")->where(array('month'=>$j,'day'=>$i))->from('history_today')->limit(1,0)->get();
				$result = $query->row_array();
				if(empty($result)){
					echo "$j-$i<br>";
				}
				/*
				$result = file_get_contents("http://api.jisuapi.com/todayhistory/query?appkey=e23aff748e0b1286&month=$j&day=$i");
				$w=@(array)json_decode($result,true);
				if(!empty($w['result'])&&$w['status']==0){
					foreach($w['result'] as $v){
						$this->db->insert('history_today',array('year'=>$v['year'],'month'=>$j,'day'=>$i,'title'=>$v['title']));
					}
				}
				 */
					
			}
		}
		echo 'ok';
		exit;
	}
	//得到历史今天
	public function getHistoryToday($time) {
		$month = date('m',$time);
		$day= (int)date('d',$time);
		$query = $this->db->select("*")->where(array('month'=>$month,'day'=>$day))->from('history_today')->limit(6,0)->get();
		$result = $query->result_array();
		if($result){
			$rand = array_rand($result);
			return $result[$rand];
		}else{
			return array();	
		}
	}

	//得到说说
	public function getSaying() {
		$query = $this->db->select("*")->from('saying')->order_by("id desc")->limit(3,0)->get();
		$result = $query->result_array();
		return $result;
	}
	//得到热门文章
	public function getArtHot() {
		$query = $this->db->select("id,title,img,createtime,pv,short")->from('article')->order_by("is_hot desc,id desc")->limit(3,0)->get();
		$result = $query->result_array();
		return $result;
	}

	//得到文章评论
	public function getArtComment() {
		$query = $this->db->select("id,aid,nickname,avatar,content,createtime")->where(array('type'=>1))->from('article_comment')->order_by("id desc")->limit(5,0)->get();
		$result = $query->result_array();
		return $result;
	}

	//得到热门文章
	public function getArtTop() {
		$query = $this->db->select("id,title,pv")->from('article')->order_by("pv desc")->limit(5,0)->get();
		$result = $query->result_array();
		return $result;
	}
	//得到标签
	public function getTags() {
        $query = $this->db->select("a.id,a.name,count(b.id) as number")
            ->join('article_tags as b', 'b.tid = a.id','left')
            ->group_by("a.id")
            ->from('tags_cloud as a')
            ->order_by("a.order asc,a.id asc")
            ->limit(30,0)
            ->get();
        $result = $query->result_array();
		return $result;
	}
	//得到下载排行
	public function getDwTop() {
		$query = $this->db->select("id,title,pv")->from('download')->order_by("pv desc")->limit(5,0)->get();
		$result = $query->result_array();
		return $result;
	}

	//得到最新留言
	public function getLeaveNew() {
		$query = $this->db->select("id,aid,nickname,avatar,content,createtime")->where(array('type'=>1))->from('leaving_comment')->order_by("id desc")->limit(3,0)->get();
		$result = $query->result_array();
		return $result;
	}

	//得博主相册
	public function getAlbumNew() {
		$query = $this->db->select("id,name,icon,photo_num")->where(array('status'=>1))->from('album_class')->order_by("id desc")->limit(12,0)->get();
		$result = $query->result_array();
		return $result;
	}

	public function getLinks()
	{
		$query = $this->db->select("title,website")->where(array('status'=>1))->order_by("order asc,id desc")->from('friend_links')->limit(12,0)->get();
		$result = $query->result_array();
		return $result;
	}
	public function insertTable($table,$data) {
		$check = $this->db->insert($table,$data);
		return $check;
	}


}
