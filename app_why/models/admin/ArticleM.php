<?php
//文章模型处理类
/*后期加缓存*/
class ArticleM extends CI_Model {


    public $table;
    public function __construct() {
        parent::__construct();
        $this->table = 'article';
    }
    //得到滚动消息
    public function getArtList($page,$where=array(),$offset=8) {
        $page = $page<=0?1:$page;
        $start = ($page-1)*$offset;
        $field = "article.id,article.title,article.pv,article.comnum,article.status,article_class.name,article.img,article.createtime,article.cid";
        $query = $this->db->select($field)->where($where)->order_by('article.id desc')->from($this->table)->join('article_class', "article.cid=article_class.id",'left')->limit($offset,$start)->get();
        $result = $query->result_array();
        $count  = $this->db->where($where)->count_all_results($this->table);
        $allpage = ceil($count/$offset);
        $res = array("page"=>array('per'=>$offset,'curpage'=>$page,'count'=>$count),'data'=>$result);
        return $res;
    }


}
