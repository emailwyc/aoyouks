<?php $this->_cdata['_title']="申请友情链接";?>
<?php $this->load->view('common/header',$this->_cdata);?>
<!--主题框架开始-->
<div class="container">
	<!--左侧开始-->
	<section class="mysection">
<article>
 <div class="blog_hd">
	<h4 class="index-title"><i class="el-comment"></i>最近留言的会显示在这里，显示7条。&nbsp;&nbsp;&nbsp;&nbsp;(为了留言收录,敬请谅解...)</h4>
	<ul>
		<?php foreach($leaving as $k=>$v):?>
		<li><a rel="nofollow" title="<?=$v['nickname']?>"><img src="<?=$v['avatar']?>" class="img-circle img_45x45"></a>
		<div class="hd_right"><a rel="nofollow" title="<?=shtmlspecialchars($v['content'])?>"><?=$v['nickname']?></a><br> <a style="color:#333;" title="<?=$v['address']?>"><?=$v['address']?></a></div> </li>
		<?php endforeach;?>
	</ul>
</div>

	<div class="blog_links">
		<h4 class="index-title" id="New2"><i class="el-paper-clip"></i> 本站友情链接：</h4>
		<ul>
		<?php foreach($linkyes as $v):?>
		<li> <a href="<?=$v['website']?>" target="_blank" title="<?=$v['title']?>"><?=$v['title']?></a> <span><?=$v['website']?></span> </li>
		<?php endforeach;?>
		</ul>
	</div>

	<div class="blog_links"> <h4 class="index-title"><i class="el-ban-circle"></i> 最近审核不通过链接：</h4>
	<ul>
	<?php foreach($linkno as $v):?>
	<li style="border-color:#888;"> <a style="color:#888;" title="<?=$v['title']?>"><?=$v['title']?></a> <span style="color:#888;"><?=$v['website']?></span> </li>
	<?php endforeach;?>
	</ul>
	</div>

	<div class="blog_links">
		<h4 class="index-title"><i class="el-paper-clip-alt"></i> 待审链接：以下为未审核。</h4>
		<ul>
		<?php foreach($linkapply as $v):?>
		<li style="border-color:#888;"> <a style="color:#888;" title="<?=$v['title']?>"><?=$v['title']?></a> <span style="color:#888;"><?=$v['website']?></span> </li>
		<?php endforeach;?>
		</ul>
	</div>

<!--编辑的内容-->
<div class="link-edit"><h4 class="index-title">
	<i class="el-info-circle"></i><span style="font-size:14px;font-family:'Microsoft YaHei';">申请说明:</span>
</h4>
<p>
	<span style="font-size:14px;font-family:'Microsoft YaHei';">1、</span><span style="color:#E53333;font-size:14px;font-family:'Microsoft YaHei';"><strong>在您申请本站友情链接之前请先做好本站链接</strong></span><span style="font-size:14px;font-family:'Microsoft YaHei';">，谢谢！</span><br>
<span style="font-size:14px;font-family:'Microsoft YaHei';"> 2、网站内容无意义，百度收录5页都没有的暂不交换！</span><br>
<span style="font-size:14px;font-family:'Microsoft YaHei';"> 3、淘宝、色情、反动、病毒、擦边球、纯商业、违法中华人民共和国法律的网站暂不交换！</span><br>
<span style="font-size:14px;font-family:'Microsoft YaHei';"> 4、申请成功后请毋随意撤下链接，其他原因撤下请通知我，否则本站也会删除对应链接！</span><br>
<span style="font-size:14px;font-family:'Microsoft YaHei';"> 5、我会对成功的链接定时访问，对于被K的站点，暂时会将链接撤回！</span>
</p>
<br>
<h4 class="index-title">
	<i class="el-idea"></i><span style="font-size:14px;font-family:'Microsoft YaHei';">站点信息:</span>
</h4>
<p>
	<span style="font-size:14px;font-family:'Microsoft YaHei';">频率：每月至少更新原创文章1篇；</span><br>
<span style="font-size:14px;font-family:'Microsoft YaHei';"> 名称：SooneBaby博客</span><br>
<span style="font-size:14px;font-family:'Microsoft YaHei';"> 地址：</span><a href="<?=$this->config->item("base_url")?>" target="_blank" title=""><span style="font-size:14px;font-family:'Microsoft YaHei';"><?=$this->config->item("base_url")?></span></a><br>
<span style="font-size:14px;font-family:'Microsoft YaHei';"> 介绍：原创性独立个人博客，个人网站；记录生活、网络心得体验。</span>
</p></div>

<h4 class="index-title"><i class="el-edit"></i> 开始申请: 欢迎交换友链</h4>
	<div id="Join" class="form-zd form-in">
					<!--昵称-->
						<div class="input-prepend">
							<span class="add-on"><i class="el-user"></i></span>
							<input name="u_name" id="fd_name" size="16" placeholder="网站名称（必须）" type="text">
						</div>
					<!--邮箱-->
						<div class="input-prepend">
							<span class="add-on"><i class="el-envelope"></i></span>
							<input name="u_mail" id="fd_email" size="16" placeholder="您的邮箱（必须）" type="text">
						</div>
					<!--网址-->
						<div class="input-prepend">
							<span class="add-on"><i class="el-globe"></i></span>
							<input name="u_url" id="fd_website" size="16" placeholder="您的网站（必须）" type="text">
						</div>
					<!--内容-->
						<textarea class="link-text" style="height:150px;width:70%;" name="u_content" id="fd_desc" placeholder="网站介绍（必须）"></textarea>
					<!--验证码-->
					<div class="input-prepend yzm">
						<i class="el-question-sign"></i>
						<input name="txt_check" id="fd_captcha" size="16" placeholder="验证码" type="text">
						<span>
							<img src="/common/captcha " title="点击刷新验证码?" onclick="this.src='/common/captcha?t='+(new Date().getTime());">
						</span>
					</div>
					<!--提交表单-->
					<div class="feed-sub"><input class="btn btn-inverse" id="fd_submit" value="提交申请" type="button">  </div>
	</div>
		</article>
<script type="text/javascript;">
$(document).ready(function(){
	$("#fd_submit").click(function(){
		//验证
		var name = trim($("#fd_name").val());
		var email= trim($("#fd_email").val());
		var website= trim($("#fd_website").val());
		var desc = trim($("#fd_desc").val());
		var captcha = trim($("#fd_captcha").val());
		if(name==""){ layer.msg("网站名称不能为空");$("#fd_name").focus();return false;}
		if(name.length>20){ layer.msg("网站名称太长啦(20byte)");$("#fd_name").focus();return false;}
		if(email==""){ layer.msg("邮箱不能为空");$("#fd_email").focus();return false;}
		var reg=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		if(email.length>50){ layer.msg("邮箱名称太长啦(40byte)");$("#fd_email").focus();return false;}
	    if(!reg.test(email) ){ layer.msg('邮箱格式错误喔');return }
		if(website==""){ layer.msg("网站不能为空");$("#fd_website").focus();return false;}
		if(website.length>50){ layer.msg("网站地址太长啦（50byte）");$("#fd_website").focus();return false;}
		if(desc.length>255){ layer.msg("描述太长啦");$("#fd_desc").focus();return false;}
		if(captcha==""){ layer.msg("不能为空");$("#fd_captcha").focus();return false;}
		if(captcha.length>20){ layer.msg("验证码太长啦");$("#fd_captcha").focus();return false;}
		$.ajax({
			type : "POST",
			url : "/common/applyFlink",
			dataType : "json",
			async : true,
			data:{'name':name,'email':email,'website':website,'desc':desc,'captcha':captcha},
			success : function(data) {
				if(data=="1"){
					layer.msg("申请成功");
					$("#fd_name").val(""); $("#fd_email").val(""); $("#fd_website").val(""); $("#fd_desc").val(""); $("#fd_captcha").val("");
				}else if(data=="2"){
					layer.msg("验证码错误或过期");
				}else{
					layer.msg("提交失败！");
				}
			},
			error: function(res) {
				layer.msg("申请失败");
			},
		});
	});
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
