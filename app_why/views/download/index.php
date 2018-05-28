<?php $this->_cdata['_title']=$this->_cdata['_titleb']."下载列表";?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
<!--左侧开始-->
<section class="mysection">
<div class="sucailist">

<ul class="su">
		<?php foreach($download['data'] as $k=>$v):?>
	<div class="wall-column">
			<div class="su-li <?php if($v['is_hot']){ echo "Hot";}?>">				<!-- <li class="su-li" id="Hot"> -->
			<a href="/download/detail/<?=$v['id']?>" title="<?=$v['title']?>">
				<div class="sucaiimg img_loading">
					<img src="<?=$v['icon']?>" alt="<?=$v['title']?>">
				</div>
			  </a>
			  <div class="sucai-right">
				  <h4 class="blue-text"><a href="/download/detail/<?=$v['id']?>" title="<?=$v['title']?>"><?=$v['title']?></a></h4>
					<ul>
						<li><a title="<?=$v['title']?> <?=date('Y-m-d',strtotime($v['ctime']));?>发表 "><i class="el-time"></i> <?=date('Y-m-d',strtotime($v['ctime']));?></a></li>
						<li class="mob-hidden">
						  <i class="el-download-alt"></i>
						  <a href="javascript::void(0);"><?=$v['dnum']?></a>&nbsp;
						</li>
					</ul>
			  </div>
		  </div>
	</div>
	  <?php endforeach;?>
</ul>
</div>
<div class="page" id="paginate"> </div>
<script type="text/javascript" src="/ui/system/js/jquery.pagination.js"></script>
<script type="text/javascript">	
jQuery('#paginate').pagination(<?=$download['page']['count']?>,{
	current_page:<?=$download['page']['curpage']?>,
	items_per_page:<?=$download['page']['per']?>,
	link_to:"/download/index/__id__"
});
</script>

<script type="text/javascript">
$(function(){
		$(".img_loading").removeClass("img_loading");
		//瀑布流
		$('.su').jaliswall({ item: '.su-li' });
	});
</script>
</section>
<!--左侧结束-->
<!--=========右侧开始==========-->
<?php $this->load->view('common/right',$this->_cdata);?>
<!--=========END右侧==========-->
</div>

<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
