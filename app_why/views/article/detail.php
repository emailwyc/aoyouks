<?php $this->_cdata['_title']=$article['title'];?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
	<!--左侧开始-->
	<section class="mysection">
	<article>
	<h3 class="arc-title index-title"><?=$article['title']?></h3>
		<div class="post-line bg-color">
			<ul>
				<li><a title="<?=$article['author'];?>发表于<?=date('Y-m-d',strtotime($article['createtime']))?>"><i class="el-time"></i><time><?=date('Y-m-d',strtotime($article['createtime']))?></time></a></li>
				<li><a href="<?=$article['author_link']?>" title="本文作者：<?=$article['author'];?>"><i class="el-user"></i><?=$article['author'];?></a></li>
				<li><a href="#Comment" title="转到评论"><i class="el-comment"></i><?=$article['comnum']?>条</a></li>
				<li><a title="已有 <?=($article['pv']+1);?> 次浏览"><i class="el-eye-open"></i>(<?=($article['pv']+1);?>)</a></li>
			</ul>
		</div>

				<div class="article-content bg-color">
			<!-- <div class="article-content bg-color" id="Hotbg"> -->
			<!--文章正文-->
				<div class="article-body">
					<?=$article['content']?>
				</div>
				<!--END 文章正文-->
				<!--分享-->
				<div class="article-fx"><span class="img-circle" href="javascript:void(0)" onclick="dashangToggle()">打赏</span>&nbsp;&nbsp;&nbsp;<a class="fx-btn img-circle" href="javascript:;">分享</a>
					<div class="bd-fx arc-bdfx">
						<i class="el-remove fx-close"></i>
						<ul class="bdsharebuttonbox bdshare-button-style1-32" data-tag="share_1" data-bd-bind="148914533">
							<li><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></li>
							<li><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></li>
							<li><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a></li>
							<li><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a></li>
						</ul>
						<script>
						window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"32"} };
						with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];	
						</script>

					</div>
				</div>
				<!--END 分享-->
			<hr>
				<!--标签-->
				<div class="article_tag">
          <ul>
				<!--		<li><a title="soonebaby 当前位于：北京市区">北京市区</a></li>-->
				<!-- <li><a href="/article/category" title="归类："></a></li> -->
				<?php foreach($tags as $k=>$v):?>
				<li> <a class="b-tag-name" title="标签：<?=$v['name']?>" href="article/tags/<?=$v['id']?>"><?=$v['name']?></a> </li>          
				<?php endforeach;?>
				</ul>
        </div>
			</div>
	</article>
<!--上下篇文章-->
	<div class="shangyip bg-color">
		<?php if(!empty($prevAndNext['prev'])){?>
		<span><i class="el-arrow-up"></i>上一篇：<a class="blue-text" href="/article/detail/<?=$prevAndNext['prev']['id']?>" title="上一篇：<?=$prevAndNext['prev']['title']?>"><?=$prevAndNext['prev']['title']?></a></span>
		<?php }else{?>
		<span><i class="el-arrow-up"></i>上一篇：<a class="blue-text" href="javascript:void(0);" title="上一篇：没有了">没有了</a></span>
		<?php }?>

		<?php if(!empty($prevAndNext['next'])){?>
		<span><i class="el-arrow-down"></i>下一篇：<a class="blue-text" href="article/detail/<?=$prevAndNext['next']['id']?>" title="下一篇：<?=$prevAndNext['next']['title']?>"><?=$prevAndNext['next']['title']?></a></span>
		<?php }else{?>
		<span><i class="el-arrow-down"></i>下一篇：<a class="blue-text" href="javascript:void(0);" title="上一篇：没有了">没有了</a></span>
		<?php }?>
	</div>
<!--上下篇文章-->


<!--随机推荐-->
<div class="maybe-love">
	<h4 class="index-title"><i class="el-heart"></i>您还可能喜欢</h4>
	<ul>
		<?php foreach($likes as $k=>$v):?>
		<li>
			<a href="/article/detail/<?=$v['id']?>">
			<img src="<?=$v['img']?>" alt="<?=$v['title']?>" title="<?=$v['title']?>">
			<span><?=$v['title']?></span>
			</a>
		</li>
		<?php endforeach;?>
	</ul>
</div>
<!--随机推荐-->

<!--评论-->
<input type="hidden" id="snsinfo_get_offset" value="5">
<input type="hidden" id="snsinfo_type" value="article">
<input type="hidden" id="snsinfo_aid" value="<?=$article['id']?>">
<?php $this->load->view('common/mycomment',$this->_cdata);?>
<!--评论-->

<!--打赏-->
<?php $this->load->view('common/dashang');?>
<!--打赏-->

</section>
<!--左侧结束-->
<!--=========右侧开始==========-->
<?php $this->load->view('common/right',$this->_cdata);?>
<!--=========END右侧==========-->
</div>
<!--主题框架结束-->
<script>
$(document).ready(function(){
	$.ajax({  type : "POST",  url : "/common/visits",  dataType : "json",  async : true,  data:{'type':'article','aid':<?=$article['id']?>},  success : function(data) { }, error: function(res) {   }, }); 
}); </script>


<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
