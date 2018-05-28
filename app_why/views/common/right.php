	<!--=========右侧开始==========-->
<aside class="myaside">
<!--关注我-->
<div class="focus-me bg-color animation-div">
	<h4 class="index-title"><i class="el-heart"></i>关注我<small>Focus Me</small></h4>
		<div class="xiangguan">
				<div><a class="benbo" href="http://weibo.com/u/5107691374" target="_blank"><i class="el el-home"></i></a><span>新浪微博</span></div>
				<!-- <div><a class="benbo" href="#" target="_blank"><span id="qq" style="padding-top:45px;">QQ空间</span></a><span>QQ空间</span></div> -->
				<div><a class="taobao" href="http://user.qzone.qq.com/1285263707/main" target="_blank"><i class="el el-star"></i></a><span>QQ空间</span></div>
				<div><a class="side-fx"><i class="el-share-alt"></i></a><span>分享本博</span></div>
				<div><a class="mail-btn" href="javascript:;"><i class="el-envelope"></i></a><span>订阅我</span></div>
		</div>
		<div class="mail-dy">
			<div>
				<span>订阅</span>
				<input name="subscribe" id="soone_subscribe" placeholder="输入邮箱点击订阅吧" onfocus="this.placeholder=''" onblur="this.placeholder='输入邮箱点击订阅吧'" type="text">
				<i class="el-envelope"><input onclick="subscribe();" type="button"></i>
			</div>
			<i class="el-remove fx-close"></i>
		</div>
		<div class="bd-fx side-bdfx ">
			<i class="el-remove fx-close"></i>
			<ul class="bdsharebuttonbox bdshare-button-style1-32" data-bd-bind="1488780402523">
				<li><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></li>
				<li><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></li>
				<li><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a></li>
				<li><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a></li>
			</ul>
		</div>
</div>
<!--右侧个人统计-->
<div class="web-author bg-color animation-div">
		<div class="author-tx">
			<a class="img-circle" href="/about" title="点击查看详细信息">
				<img class="img-circle" src="<?=$_var['baseRes']['avatar'];?>">
			</a>
		</div>
		<div class="author-name"><span class="blue-text"><?=$_var['baseRes']['author'];?></span><p><?=$_var['baseRes']['desc'];?></p></div>
		<div class="data-info">
			<ul>
				<li><strong><?=$_var['runing'];?></strong><span>运行天数</span></li>
				<li><strong><?=$_cvisit;?></strong><span>今日访问ip</span></li>
				<li><strong><?=$_var['varRes']['visitnum'];?></strong><span>总访问量</span></li>
			</ul>
		</div>
</div>
<!--END 右侧个人统计-->
<!--搜索-->
<div class="search animation-div">
	<form action="/search" method="get" onsubmit="return checkKeyWord();">
		<div class="search-index">
		<input name="keyword" id="soone_keyword" value="<?=@$_skeyword?>" placeholder="请输入关键字" onfocus="this.placeholder=''" onblur="this.placeholder='请输入关键字'" type="text">
			<i class="el-search"><input value="" type="submit"></i>
		</div>
	</form>
</div>
<!--最新更新-->
<div class="clos-new bg-color animation-div">
	<h4 class="index-title"><i class="el-bulb"></i>最新更新<small>Close New</small></h4>
	<ul>
	<!-- <li><i class="el-cloud"></i><iframe id="tianqi"  scrolling="no" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=34&icon=1&num=3"></iframe></li> -->
	<li><span><i class="el-arrow-up"></i>最近：<font class="blue-text"><?=$_var['baseRes']['author'];?></font> <?=@$_publog['strdate']?>&nbsp;&nbsp;&nbsp;</span><a title="<?=@$_publog['content']?>">更新了<b class="<?=@$_publog['class']?>"><?=@$_publog['class_name']?></b></a></li>
	<li><i class="el-calendar"></i>历史上的今天：<a title="<?=@$_historyToday['year']?>年<?=@$_historyToday['month']?>月<?=@$_historyToday['day']?>日 <?=@$_historyToday['title']?>" class="orange-text"><?=@$_historyToday['title']?></a></li>
</ul>
</div>
<!--说说-->
<div class="bg-color animation-div">
	<h4 class="index-title"><i class="el-headphones"></i>说说<small>Shuo Shuo</small></h4>
	<div class="shuo-side">
		<ul>
		<?php foreach($_saying as $k=>$v):?>
			<li id="Hots">
			<span class="shuobg<?=($k+1)?>"><strong><?=@date('m-d',strtotime($v['createtime']));?> </strong></span>
			<div><a href="/saying/detail/<?=$v['id']?>" title="<?=shtmlspecialchars($v['content'])?>"><?=$v['title']?></a><b title="点击<?=$v['pv']?>">(<?=$v['pv']?>)</b></div>
			</li>
		<?php endforeach;?>
		</ul>
	</div>
</div>
<!--推荐图文-->
<div class="article-push  bg-color animation-div">
	<h4 class="index-title"><i class="el-asl"></i>推荐图文<small>Push Article</small></h4>
	<ul>

		<?php foreach($_arthot as $k=>$v):?>
		<li>
			<div class="arcimg">
			<a href="/article/detail/<?=$v['id']?>" target="_blank">
			<img src="<?=$v['img']?>" alt="<?=$v['title']?>" title="<?=$v['title']?>">
        </a>
			</div>
			<div class="arc-right">
			<h4 class="blue-text"><a href="/article/detail/<?=$v['id']?>"><?=$v['title']?></a></h4>
			<p><?=$v['short']?></p>
				<ul>
				<li><a title="发表于<?=@date('Y-m-d',strtotime($v['createtime']));?>"><i class="el-time"></i><?=@date('Y-m-d',strtotime($v['createtime']));?></a></li>
				<li><a title="<?=$v['pv']?>次浏览"><i class="el-fire"></i><?=$v['pv']?></a></li>
				</ul>
			</div>
		</li>
		<?php endforeach;?>
</ul>
</div>
<!--文章排行tab-->
<div class="mytab bg-color animation-div">
	<div class="tab-btn"><a class="hd-btn tab-active" href="javascript:;"><i class="el-comment-alt"></i>文章互动</a><a class="ph-btn" href="javascript:;"><i class="el-signal"></i>文章排行</a></div>
	<ul class="hudong-ul">
<!--=======查询相册=============-->
		<?php foreach($_artcomment as $k=>$v):?>
		<li> <div class="sd-tx"> <a href="/article/detail/<?=$v['aid']?>#mycomment" target="_blank" rel="nofollow" title="去<?=$v['nickname']?>评论详情看看"> <img src="<?=$v['avatar']?>" alt="<?=$v['nickname']?>" class="img-circle"> </a> </div>
			<div class="sd-name">
			<span><i class="el-user"></i><?=$v['nickname']?><time><?=@date('Y-m-d',strtotime($v['createtime']));?></time></span>
			<span><a class="blue-text" href="/article/detail/<?=$v['aid']?>#mycomment" title="<?php echo shtmlspecialchars($v['content']);?>"><?=$v['content']?></a></span>
			</div> </li>
		<?php endforeach;?>
	</ul>
	<!--文章排行-->
	<ul class="paihang-ul">
		<?php foreach($_arttop as $k=>$v):?>
		<li><span></span><a href="/article/detail/<?=$v['id']?>" title="<?=$v['title']?>"><?=$v['title']?><b>(<?=$v['pv']?>)</b></a></li>
		<?php endforeach;?>
	</ul>
	</div>
<!--标签-->
<div class="cloud bg-color animation-div">
    <h4 class="index-title"><i class="el-tags"></i>标签云<small>Tags Clouds</small></h4>
	<ul id="3dcloud">
	<?php foreach($_tags as $k=>$v):?>
	<li><a href="/article/tag/<?=$v['id']?>" title="标签：<?=$v['name']?> "><?=$v['name']?> (<?=$v['number']?>)</a></li>
		<?php endforeach;?>
	</ul>
</div>
<!--友情链接-->
<div class="side-link ">
	<h4 class="index-title"><i class="el-paper-clip"></i>友情链接<small>Friend Links</small><a href="/index/friendlink"><i class="el el-plus"></i>申请</a></h4>
	<ul>
		<li><a href="http://weibo.com/p/1005055107691374" target="_blank" title="soonebaby微博">SooneBaby微博</a></li>
		<?php foreach($_linkyes as $k=>$v):?>
		<li><a href="<?=$v['website'];?>" target="_blank" title="<?=$v['title']?>"><?=$v['title']?></a></li>
		<?php endforeach;?>
	</ul>
</div>
</aside>
<!--=========END右侧==========-->
