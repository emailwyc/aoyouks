<?php $this->_cdata['_title']=$this->_cdata['_titleb']."-".$this->_cdata['album_class']['name'];?>
<?php $this->load->view('common/header',$this->_cdata);?>
<link rel="stylesheet" href="/ui/system/css/lightbox.css">
<script type="text/javascript" src="/ui/system/js/lightbox.js"></script>
<!--主题框架开始-->
<div class="container">
<!--左侧开始-->
<div class="gallery2  w95">
	<h4 class="index-title w95"><a href="#paginate" class="all"><i class="el-th-large"></i>所有相片</a><span><i class="el-picture"></i>当前：<?=$album_class['name']?><font><?=$album['page']['count']?></font>张</span></h4>
	<ul class="wall baguetteBoxOne gallery">
		<?php foreach($album['data'] as $k=>$v):?>
			<div class="wall-column"><div class="wall-li">
				<a class="show-pic lightbox" href="<?=$v['img']?>" title="发表于<?=date('Y-m-d',strtotime($v['createtime']));?>">
				<img src="<?=$v['img_icon']?>" alt=""　 >
				</a>
				<p><small><?=date('Y-m-d',strtotime($v['createtime']));?></small></p>
			</div></div>
		<?php endforeach;?>
	</ul>

	<div class="page" id="paginate1"> </div>
	<script type="text/javascript" src="/ui/system/js/jquery.pagination.js"></script>
	<script type="text/javascript">	
	jQuery('#paginate1').pagination(<?=$album['page']['count']?>,{
			current_page:<?=$album['page']['curpage']?>,
			items_per_page:<?=$album['page']['per']?>,
			link_to:"/album/photos/<?=$album_class['id']?>/__id__"
		});
	</script>
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
	<div class="return-xc"><a href="/album" title=""><i class="el-arrow-left"></i>返回相册列表</a></div>



<!--评论-->
<input type="hidden" id="snsinfo_get_offset" value="8">
<input type="hidden" id="snsinfo_type" value="album">
<input type="hidden" id="snsinfo_aid" value="<?=$album_class['id']?>">
<?php $this->load->view('common/mycomment',$this->_cdata);?>
<!--评论-->
<!--打赏-->
<?php $this->load->view('common/dashang');?>
<!--打赏-->



<!-- End gallery list-->
<script type="text/javascript">
		$(function(){
		//瀑布流
			$('.wall').jaliswall({ item: '.wall-li' });

			var xlen=$(".wall .wall-column").length
			for (var x=0;x<=xlen;x++){

						$(".wall .wall-column").eq(x).css({
							"-webkit-animation-name":"zhengshang",
							"-webkit-animation-duration":x/5+0.5+"s",
							"animation-name":"zhengshang",
							"animation-duration":x/5+0.5+"s"
				});


			}
			baguetteBox.run('.baguetteBoxOne');
		});
//lightbox
</script>
</div>
<!--左侧结束-->
<!--=========右侧开始==========-->
<!--=========END右侧==========-->
</div>

<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
