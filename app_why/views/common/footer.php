<!---底部开始-->
<footer>
	<div class="footer-area">
	<!--博客相关-->
	<div class="about-blog">
		<h4>素材排行</h4>
		<div class="ft-part1">
			<!--素材排行-->
			<ul class="paihang-ul" style="display:block;width:100%;">
		<?php foreach($_dwtop as $v):?>
		<li><span></span><a href="/download/detail/<?=$v['id']?>" title="<?=$v['title']?>"><?=$v['title']?><b>(<?=$v['pv']?>)</b></a></li>
		<?php endforeach;?>
			</ul>
		</div>
	</div>
	<!--最新留言-->
	<div class="close-fd mob-hidden">
		 <h4>留言频道</h4>
		 <ul>
		<?php foreach($_leavenew as $v):?>
			<li> <div class="sd-tx"> <a href="javascript:void(0)" rel="nofollow" title="昵称：<?=$v['nickname']?>"><img src="<?=$v['avatar']?>" alt="昵称：<?=$v['nickname']?>" class="img-circle"> </a> </div>
			<div class="sd-name">
			<span><?=$v['nickname']?></span>
			<a class="blue-text" href="/leaving#mycomment" title="<?php echo shtmlspecialchars($v['content']);?>"><?=$v['content']?></a>
			</div> </li>
		<?php endforeach;?>
		</ul>
	</div>

	<!--图文频道-->
	<div class="tuwen-pd mob-hidden">
		<h4>博主相册</h4>
		<ul>
			<?php foreach($_albumnew as $v):?>
			<li> <a class="orange-text" href="album/photos/<?=$v['id']?>" title="<?=$v['name']?>——共(<?=$v['photo_num']?>)张">
			<img class="img-circle" alt="<?=$v['name']?>" src="<?=$v['icon']?>" >
			</a> </li>
			<?php endforeach;?>
		</ul>
	</div>
		<!--数据统计-->
	<div class="data-count ">
		<h4>数据统计</h4>
		<ul>
			<li> <span> <i class="el-picture"></i>图片数量：</span> <a title="共有 <?=$_var['varRes']['photonum'];?> 张图片"><?=$_var['varRes']['photonum'];?></a> 张</li>
			<li><span><i class="el-headphones"></i>说说数量：</span><a title="共有 <?=$_var['varRes']['saynum'];?> 条说说"><?=$_var['varRes']['saynum'];?></a> 条</li>
			<li><span><i class="el-pencil"></i>文章数量：</span><a title="共有 <?=$_var['varRes']['artnum'];?> 篇文章"><?=$_var['varRes']['artnum'];?></a> 篇</li>
			<li><span><i class="el-comment"></i>留言数量：</span><a title="共有 <?=$_var['varRes']['leavenum'];?> 条留言"><?=$_var['varRes']['leavenum'];?></a> 条</li>
			<li><span><i class="el-comment-alt"></i>评论数量：</span><a title="共有 <?=$_var['varRes']['comnum'];?> 条评论"><?=$_var['varRes']['comnum'];?></a> 条</li>
			<li><span><i class="el-paper-clip"></i>资源个数：</span><a title="共有 <?=$_var['varRes']['resnum'];?> 个"><?=$_var['varRes']['resnum'];?></a> 个</li>
			<li><span><i class="el-cog"></i>运行天数：</span><a title="雷小天博客 已正常运行 <?=$_var['runing'];?> 天"><?=$_var['runing'];?></a> 天</li>

			<li><span><i class="el-adjust-alt"></i>访问统计：</span><a title="累计访问<?=$_var['varRes']['visitnum'];?>"><?=$_var['varRes']['visitnum'];?></a> 次</li>
		</ul>
	</div>

	</div>
	<!--底部导航-->
	<div class="foot-nav">
	<div class="copy-right"><span>CopyRight © 2017-2019 <?=$_var['baseRes']['author'];?>博客 &nbsp;Design by SooneBaby</span></div>
		<div class="bottom-nav">
			<span><a href="/sitemap.xml" target="_blank">网站地图</a>-<a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"> 京ICP备0007</a></span>
		</div>
	</div>
<div id="toTop">Back to Top</div>
<script type="text/javascript;">
window.onload=function(){
	$(".img_loading").removeClass("img_loading");
	$(".silde-title").show();
}
    // 替换
    document.body.innerHTML = document.body.innerHTML.replace(/\[Q([0-9]*)\]/g, "<img src='/ui/system/images/$1.gif'/>");
    document.body.innerHTML = document.body.innerHTML.replace(/\[yc_([0-9]*)\]/g,"<img src='/ui/system/images/$1.gif'/>");
    document.body.innerHTML = document.body.innerHTML.replace(/\[ali_([0-9]*)\]/g,"<img src='/ui/system/images/$1.gif'/>");
</script></footer>


<!--换肤--->
<div class="select-skin">
	<div class="skin-btn">
		<a href="javascript:void(0);" class="skin-btn-open">换<br>肤</a>
	</div>
	<div class="skin-content">
		<h1>选择主题<span class="skin-close">关闭</span></h1>
		<div class="skin-content-list">
			<div class="skin-list"><a href="#" onclick="setActiveStyleSheet('qingxin'); return false;" class="btn1">清新</a></div>
			<div class="skin-list"><a href="#" onclick="setActiveStyleSheet('jianyue'); return false;" class="btn2">简约</a></div>
			 <div class="skin-list"><a href="#" onclick="setActiveStyleSheet('qingshuang'); return false;" class="btn3">清爽</a></div>
		</div>
	</div>
</div>
<!---END 底部结束-->
<ul id="supersized" class="quality" style="visibility: visible;"></ul></body></html>
<!-- 百度统计 -->
<!-- 百度统计 end-->
<script type="text/javascript" src="/ui/system/js/swiper.js"></script>
<script type="text/javascript" src="/ui/system/js/common.js?v=1"></script>
<script type="text/javascript" src="/ui/system/js/my.js"></script>
<script type="text/javascript" src="/ui/system/js/superbg.js"></script>
<script type="text/javascript" src="/ui/system/js/superbg-custom.js"></script>
<script type="text/javascript" src="/ui/system/js/album.js"></script>
<script type="text/javascript" src="/ui/system/js/tooltip.js"></script>
<script type="text/javascript" src="/ui/system/js/share.js"></script>
<!--<script type="text/javascript" src="/ui/system/js/face.js"></script>评论表情-->
<script type="text/javascript" src="/ui/system/js/layer.js"></script>
<script type="text/javascript" src="/ui/system/js/checkform.js" charset="utf-8"></script>
<script type="text/javascript" src="/ui/system/js/skin.js"></script>
<!--[if lte IE 9]>
<![endif]-->
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
