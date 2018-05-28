<?php $this->_cdata['_title']=$this->_cdata['_titleb']."-相册列表";?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
<!--左侧开始-->
<div class="album w95">
			<h4 class="index-title"><a href="#paginate" class="all"><i class="el-camera"></i>查看所有相册&gt; &gt;</a></h4>
			<ul class="wall" id="album-wall" style="margin-bottom: 90px;">
				<?php foreach($album_class['data'] as $k=>$v):?>
					<div class="wall-column" style="animation-name:zhengshang;"><div class="wall-li">
							<a class="orange-text" href="/album/photos/<?=$v['id']?>" title="<?=$v['name']?>">
							<img alt="<?=$v['name']?>" src="<?=$v['icon']?>">
							<p><?=$v['name']?></p>
						<small><i class="el-time"></i><?=date('Y-m-d',strtotime($v['createtime']));?></small>
						<small><i class="el-picture"></i><?=$v['photo_num']?></small>
					</a>
				</div></div>
				<?php endforeach;?>
			</ul>
			<div class="page" id="paginate"> </div>
			<script type="text/javascript" src="/ui/system/js/jquery.pagination.js"></script>
			<script type="text/javascript">	
			jQuery('#paginate').pagination(<?=$album_class['page']['count']?>,{
					current_page:<?=$album_class['page']['curpage']?>,
					items_per_page:<?=$album_class['page']['per']?>,
					link_to:"/album/index/__id__"
				});
			</script>

<!-- End gallery list-->
<script type="text/javascript">
		$(function(){
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
		});
</script>
</div>
<!--左侧结束-->
<!--=========右侧开始==========-->
<!--=========END右侧==========-->
</div>

<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
