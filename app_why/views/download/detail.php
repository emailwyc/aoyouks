<?php $this->_cdata['_title']=$this->_cdata['_titleb'].$this->_cdata['dw']['title'];?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
<!--左侧开始-->
<section class="mysection">
		
<article>
	<h3 class="arc-title index-title"> <?=$dw['title']?></h3>
	<div class="post-line bg-color">
		<ul>
			<li><a title="<?=$_var['baseRes']['author'];?>;?>发表于<?=date('Y-m-d',strtotime($dw['ctime']))?>"><i class="el-time"></i><time><?=date('Y-m-d',strtotime($dw['ctime']))?></time></a></li>
			<li><a href="javascript:void(0)" title="本文作者：<?=$_var['baseRes']['author'];?>"><i class="el-user"></i><?=$_var['baseRes']['author'];?></a></li>
			<li><a href="#dw" title="已下载<?=$dw['dnum']?>次"><i class="el-download-alt"></i><?=$dw['dnum']?>次</a></li>
			<li><a title="已有 <?=$dw['pv']?> 次浏览"><i class="el-eye-open"></i>(<?=$dw['pv']?>)</a></li>
		</ul>
	</div>
	<div class="article-content bg-color">			<!-- <div class="article-content bg-color"id="Hotbg"> -->
		<!--文章正文-->
		<div class="article-body">
		<?=$dw['content']?>
		<div class="edit-time"><i class="el-edit"></i>最后编辑时间：<?=$dw['uptime']?></div>
		</div>
		<!--END 文章正文-->
		<!--分享-->
		<div class="article-fx">
			<a class="down-btn" rel="nofollow" target="_blank" href="/download/dw/<?=$dw['id']?>" id="dw"><i class="el-download-alt"></i>下载地址</a>
			<a class="fx-btn sucai-fx" href="javascript:void(0);" title=""><i class="el-share"></i>分享本文</a>
			<div class="bd-fx arc-bdfx" style="display: none;">
				<i class="el-remove fx-close"></i>
				<ul class="bdsharebuttonbox bdshare-button-style1-32" data-bd-bind="1490147735430">
					<li><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></li>
					<li><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></li>
					<li><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a></li>
					<li><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a></li>
				</ul>
			</div>
		</div>
		<!--END 分享-->
		<hr>
			<!--标签-->
		<div class="article_tag">
			<ul>
				<li><a href="javascript:void(0)" title="关键词： <?=$dw['kwd']?>"><?=$dw['kwd']?></a>&nbsp;</li>
			</ul>
		</div>
	</div>
</article>

<!--上下篇-->
<div class="shangyip bg-color">
		<?php if(!empty($prevAndNext['prev'])){?>
		<span><i class="el-arrow-up"></i>上一篇：<a class="blue-text" href="/download/detail/<?=$prevAndNext['prev']['id']?>" title="上一篇：<?=$prevAndNext['prev']['title']?>"><?=$prevAndNext['prev']['title']?></a></span>
		<?php }else{?>
		<span><i class="el-arrow-up"></i>上一篇：<a class="blue-text" href="javascript:void(0);" title="上一篇：没有了">没有了</a></span>
		<?php }?>
		<?php if(!empty($prevAndNext['next'])){?>
		<span><i class="el-arrow-down"></i>下一篇：<a class="blue-text" href="/download/detail/<?=$prevAndNext['next']['id']?>" title="下一篇：<?=$prevAndNext['next']['title']?>"><?=$prevAndNext['next']['title']?></a></span>
		<?php }else{?>
		<span><i class="el-arrow-down"></i>下一篇：<a class="blue-text" href="javascript:void(0);" title="上一篇：没有了">没有了</a></span>
		<?php }?>
</div>
<!--上下篇-->

<!--可能喜欢-->
<div class="maybe-love">
	<h4 class="index-title"><i class="el-heart"></i>您还可能喜欢</h4>
	<ul>
		<?php foreach($likes as $k=>$v):?>
		<li>
			<a href="/download/detail/<?=$v['id']?>">
			<img src="<?=$v['icon']?>" alt="<?=$v['title']?>" title="<?=$v['title']?>">
			<span><?=$v['title']?></span>
			</a>
		</li>
		<?php endforeach;?>
	</ul>
</div>
<!--可能喜欢-->

<!--留言-->
<!--评论-->
<input type="hidden" id="snsinfo_get_louceng" value="false">
<input type="hidden" id="snsinfo_get_offset" value="5">
<input type="hidden" id="snsinfo_type" value="download">
<input type="hidden" id="snsinfo_aid" value="<?=$dw['id']?>">
<?php $this->load->view('common/mycomment',$this->_cdata);?>
<!--评论-->
<!--打赏-->
<?php $this->load->view('common/dashang');?>
<!--打赏-->
<!--留言-->




</section>
<!--左侧结束-->
<!--=========右侧开始==========-->
<?php $this->load->view('common/right',$this->_cdata);?>
<!--=========END右侧==========-->
</div>
<script>
$(document).ready(function(){
	$.ajax({  type : "POST",  url : "/common/visits",  dataType : "json",  async : true,  data:{'type':'download','aid':<?=$dw['id']?>},  success : function(data) { }, error: function(res) {   }, }); 
}); </script>

<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
