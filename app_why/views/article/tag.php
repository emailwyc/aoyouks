<?php $this->_cdata['_title']=$this->_cdata['_titleb'].$this->_cdata['tag']['name']."标签列表";?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
	<!--左侧开始-->
	<section class="mysection">
			<h4 class="index-title">
				<a href="javascript:void(0)"><i class="el-search-alt"></i>您查询的标签： </a>
				<span class="orange-text"><?=$tag['name'];?></span>
				<span style="float:right;margin-right:10px;">共有文章:<font class="orange-text"> <?=$artList['page']['count']?> </font>篇</span>
			</h4>




			<!--列表开始-->
			<div class='arclist'>
				<ul>
					<?php foreach($artList['data'] as $key=>$val):?>
					<li class="<?php if($val['is_hot']){ echo "Hot";}?>">				<!-- <li id="Hot"> -->
						<div class="arcimg">
						<img src="<?=$val['img']?>" alt="<?=$val['title']?>" title="<?=$val['title']?>">
						</div>
						<div class="arc-right">
							<h4 class="blue-text"><a href="/article/detail/<?=$val['id']?>" title="<?=$val['title']?>"><?=$val['title']?></a></h4>
							<p><?=$val['short']?></p>
							<ul>
							<li><a title="<?=$val['author']?><?=$val['createtime']?>发表"><i class="el-time"></i><?=date('Y-m-d',strtotime($val['createtime']));?></a></li>
							<li><a href="<?=$val['author_link']?>" title="作者： <?=$val['author']?>"><i class="el-user"></i><?=$val['author']?></a></li>
							<li><a href="/article/detail/<?=$val['id']?>#Comment" title="已有 0 条评论"><i class="el-comment"></i>0</a></li>
							<li><a title="已有 <?=$val['pv']?> 次浏览"><i class="el-eye-open"></i><?=$val['pv']?></a></li>
							<li><a href="/article/category/<?=$val['cid']?>" title="查看分类"><i class="el-th-list"></i><?=$val['name']?></a></li>
							</ul>
						</div>
						</li>
					<?php endforeach;?>	
				</ul>
				<div class="page" id="paginate"> </div>
			</div>
		<script type="text/javascript" src="/ui/system/js/jquery.pagination.js"></script>
		<script type="text/javascript">	
		jQuery('#paginate').pagination(<?=$artList['page']['count']?>,{
				current_page:<?=$artList['page']['curpage']?>,
				items_per_page:<?=$artList['page']['per']?>,
				link_to:"/article/category/<?=$tag['id'];?>/__id__"
			});
		</script>

			<!--列表结束-->
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
