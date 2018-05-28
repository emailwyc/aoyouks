<?php $this->_cdata['_title']=$this->_cdata['_titleb']."-关于我";?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
	<!--左侧开始-->
<section class="mysection">
	<article>
		<div class="about-content" style="padding:0;">
			<h4 class="index-title"> <i class="el el-info-circle"></i>关于本站 </h4>
				<?=@$about['website']?>
			<h4 class="index-title"> <i class="el el-list-alt"></i>站长简介 </h4>
				<?=@$about['owner']?>
			<h4 class="index-title"> <i class="el el-list-alt"></i>网站简介 </h4>
				<?=@$about['desc']?>
			<h4 class="index-title"> <i class="el el-file-edit"></i>扩展更多,敬请期待... </h4>
				<p> 扩展更多,敬请期待...  </p>
		</div>
	</article>
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
