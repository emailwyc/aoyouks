<?php $this->_cdata['_title']=$saying['title'];?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
	<!--左侧开始-->
	<section class="mysection">
		<article>
			<div class="shuos-area bg-color">
				<div class="shuos-ava">
					<img src="<?=$_var['baseRes']['avatar'];?>">
					<a class="blue-text" title="<?=$_var['baseRes']['author'];?>"><i class="el-headphones"></i> <?=$_var['baseRes']['author'];?> <time><?=date('Y-m-d',strtotime($saying['createtime']));?> </time>说：</a>
				</div>
				<div class="shuos-content"><?=$saying['content']?></div>
				<ul>
				<li><a title="已有 <?=$saying['comnum']?>条 条评论"><i class="el-comment"></i><?=$saying['comnum']?>条</a></li>
				<li><a title="已有 <?=($saying['pv']+1)?> 次浏览"><i class="el-eye-open"></i><?=($saying['pv']+1)?></a></li>
				<li><a title="<?=$_var['baseRes']['author'];?>位于<?=$saying['addr']?> "><i class="el-map-marker"></i> <?=$saying['addr']?></a></li>
				</ul>
			</div>
				<!--分享-->
				<div class="article-fx"><span class="img-circle" href="javascript:void(0)" onclick="dashangToggle()">打赏</span>&nbsp;&nbsp;&nbsp;<a class="fx-btn img-circle" href="javascript:;">分享</a>
					<div class="bd-fx arc-bdfx">
						<i class="el-remove fx-close"></i>
						<ul class="bdsharebuttonbox bdshare-button-style1-32" data-tag="share_1" data-bd-bind="14891453">
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
		</article>


<!--评论-->
<input type="hidden" id="snsinfo_get_offset" value="8">
<input type="hidden" id="snsinfo_type" value="saying">
<input type="hidden" id="snsinfo_aid" value="<?=$saying['id']?>">
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
	$.ajax({  type : "POST",  url : "/common/visits",  dataType : "json",  async : true,  data:{'type':'saying','aid':<?=$saying['id']?>},  success : function(data) { }, error: function(res) {   }, }); 
}); </script>


<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
