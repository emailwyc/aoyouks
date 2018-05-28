<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
	<!--左侧开始-->
	<section class="mysection">
		<div class="swiper-container swiper-container-horizontal swiper-container-autoheight">
			<ul class="slides swiper-wrapper">
				<?php foreach($swiper as $key=>$val):?>
				<li class="swiper-slide <?php if($key==0){ ?>swiper-slide-active<?php }?>" style="width: 650px;">
				<a href="<?=$val['link']?>" title="<?=$val['title']?>">
					<img src="<?=$val['img']?>" alt="<?=$val['title']?>">
					</a>
					<div class="swiper-pagination swiper-pagination-fraction"><span class="swiper-pagination-current"><?=$swiperc?></span> / <span class="swiper-pagination-total"><?=$swiperc?></span></div>
					<span class="silde-title" style=""><?=$val['title']?></span>
				</li>
				<?php endforeach;?>
			</ul>
			<!-- Add Arrows -->
			<div class="swiper-button-next swiper-button-disabled"></div>
			<div class="swiper-button-prev"></div>
		</div>
		<div class="arclist">
		<h4 class="index-title homeh4" style="animation: 0.8s ease 0s normal none 1 running fuxiasuo;"><a href=""><i class="el-certificate"></i>最新文章<small>New Article</small></a></h4>
			<!--列表开始-->
			<ul>
				<?php foreach($artList['data'] as $key=>$val):?>
				<li style="animation-name: fuxiasuo; animation-duration: 1s;">				<!-- <li id="Hot"> -->
					<div class="arcimg">
					<img src="<?=$val['img']?>" alt="<?=$val['title']?>" title="<?=$val['title']?>">
					</div>
					<div class="arc-right">
					<h4 class="blue-text"><a href="/article/detail/<?=$val['id']?>" title="<?=$val['title']?>"><?=$val['title']?></a></h4>
					<p><?=$val['short']?></p>
						<ul>
						<li><a title="<?=$val['author']?><?=$val['createtime']?>发表"><i class="el-time"></i><?=date('Y-m-d',strtotime($val['createtime']));?></a></li>
						<li><a href="<?=$val['author_link']?>" title="作者： <?=$val['author']?>"><i class="el-user"></i><?=$val['author']?></a></li>
						<li><a href="/article/detail/<?=$val['id']?>#Comment" title="已有 <?=$val['comnum']?> 条评论"><i class="el-comment"></i><?=$val['comnum']?></a></li>
						<li><a title="已有 <?=$val['pv']?> 次浏览"><i class="el-eye-open"></i><?=$val['pv']?></a></li>
						<li><a href="/article/category/<?=$val['cid']?>" title="查看分类"><i class="el-th-list"></i><?=$val['name']?></a></li>
						</ul>
					</div>
					</li>
				<?php endforeach;?>	
			</ul>
		<script type="text/javascript" src="/ui/system/js/jquery.pagination.js"></script>
		<div class="page" id="paginate">
		</div>
<script type="text/javascript">	
jQuery('#paginate').pagination(<?=$artList['page']['count']?>,{
		current_page:<?=$artList['page']['curpage']?>,
		items_per_page:<?=$artList['page']['per']?>,
		link_to:"/index/index/__id__"
	});
</script>

			<!--列表结束-->
		<div class="sucailist mob-hidden">
			<h4 class="index-title"><a href=""><i class="el-certificate"></i>最新资源<small>New sucai</small></a></h4>
			<!--列表开始-->
			<ul class="su"><div class="wall-column">
			<?php foreach($dwList as $v):?>
				<div class="su-li" id="">				<!-- <li class="su-li"id="Hot"> -->
				<a href="/download/detail/<?=$v['id']?>" title="<?=$v['title']?>">
					<div class="sucaiimg">
						<img src="<?=$v['icon']?>" alt="<?=$v['title']?>">
					</div>
				  </a>
					<div class="sucai-right">
					<h4 class="blue-text"><a href="/download/detail/<?=$v['id']?>" title="<?=$v['title']?>"><?=$v['title']?></a></h4>
						<ul>
						<li><a title="<?=$v['title']?><?=date('Y-m-d',strtotime($v['ctime']))?>发表 "><i class="el-time"></i><?=date('Y-m-d',strtotime($v['ctime']))?></a></li>
							<li class="mob-hidden">
							  <i class="el-download-alt"></i>
							  <a href="javascript::void(0);"><?=$v['dnum']?></a>&nbsp;
							</li>
						</ul>
					</div>
				</div>
				<?php endforeach;?>
			</div></ul>
			<!--列表结束-->
		</div>
	</div></section>
	<!--左侧结束-->
<script type="text/javascript">
	$(function(){
		var swiper = new Swiper('.swiper-container', {
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev',
			pagination: '.swiper-pagination',
			paginationType: 'fraction',
			centeredSlides: true,
			autoplay: 5000,//自动播放时间
			autoHeight: true //自动高度
		});
	//瀑布流
		$('.su').jaliswall({ item: '.su-li' });
	});
</script>
<!--=========右侧开始==========-->
<?php $this->load->view('common/right',$this->_cdata);?>
<!--=========END右侧==========-->
</div>
<!--主题框架结束-->
<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
