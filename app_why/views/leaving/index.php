<?php $this->_cdata['_title']=$this->_cdata['_titleb']."-留言板";?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
	<!--左侧开始-->
<section class="mysection">


	<img src="/ui/system/images/leaving.png" style="width:100%;">
	<!--评论-->
	<input type="hidden" id="snsinfo_get_offset" value="12">
	<input type="hidden" id="snsinfo_get_louceng" value="true">
	<input type="hidden" id="snsinfo_type" value="leaving">
	<input type="hidden" id="snsinfo_aid" value="0">
	<?php $this->load->view('common/mycomment',$this->_cdata);?>
	<!--评论-->


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
