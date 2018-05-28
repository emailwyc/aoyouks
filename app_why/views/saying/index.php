<?php $this->_cdate['_title']="说说";?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
<!--左侧开始-->
	<section class="mysection">
			<!--列表开始-->
		<div class="shuo-area">
			<article>
				<ul>
					<?php foreach($list['data'] as $k=>$v):?>
					<li>
						<div class="shuo-ava">
							<a href="javascript:void(0);"><img class="img-circle" src="<?=$_var['baseRes']['avatar'];?>" alt="<?=$_var['baseRes']['author'];?>"></a>
							<span class="blue-text mob-hidden"><a title="发表于<?=$v['createtime'];?> "><?=date('Y-m-d',strtotime($v['createtime']));?> </a></span>
						</div>
						<div class="shuo-info arrow_box ">
						<!-- <div class="shuo-info arrow_box "id="Hot"> -->
						<div class="shuo-content ">
							<a title="点击查看详情:<?=toHtmlSpecialChars($v['content'])?>" href="/saying/detail/<?=$v['id']?>"><?=$v['title']?></a>
						</div>
							<div class="shuo-line pc-hidden">
								<ul>
									<li><a title="发表于<?=$v['createtime'];?> "><i class="el-time"></i><?=date('Y-m-d',strtotime($v['createtime']));?> </a></li>
								</ul>
							</div>
						</div>
					</li>
					<?php endforeach;?>
				</ul>
			</article>
		</div>
			<!--列表结束-->
			<script type="text/javascript" src="/ui/system/js/jquery.pagination.js"></script>
			<div class="page" id="paginate"> </div>
			<script type="text/javascript">	
				jQuery('#paginate').pagination(<?=$list['page']['count']?>,{
					current_page:<?=$list['page']['curpage']?>,
					items_per_page:<?=$list['page']['per']?>,
					link_to:"/saying/index/__id__"
				});
			</script>
	</section>
<!--左侧结束-->
<!--=========右侧开始==========-->
<?php $this->load->view('common/right',$this->_cdata);?>
<!--=========END右侧==========-->
</div>
<!--主题框架结束-->
<!---底部开始-->
<?php $this->load->view('common/footer',$this->_cdata);?>
<!---底部结束-->
