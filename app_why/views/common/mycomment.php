<!--wangyc-->
<script type="text/javascript" src="/ui/system/comment/js/script_common.js"></script>
<script type="text/javascript" src="/ui/system/comment/js/XTools.js"></script>
<!--评论-->
<link rel="stylesheet" href="/ui/system/comment/styles/commentmod.css">
<style>
.authorc-tx{width:100%;position:relative;}
.authorc-tx a{border:5px solid #fff;box-shadow: 0 1px 5px #666;width:60px;height:60px;display:block;overflow:hidden;position:absolute;top:-30px;left:0;right:0;margin:auto;transition:all 0.8s;-webkit-transition:all 0.8s;}
.authorc-tx a:hover{transform:rotate(360deg);-webkit-transform:rotate(360deg);transition:all 0.8s;-webkit-transition:all 0.8s;}
.authorc-tx a img{width:100%;height:100%;}
</style>
<div class="Comment" id="mycomment">
	<h3 class="form-btn blue-text"><a href="javascript:void(document.getElementById('comment_message').focus())"><i class="el-edit"></i>我要留言</a></h3>
	<div class="pinglun_big_div">
		<div class="authorc-tx">
			<a class="img-circle" href="javascript:void(0);" title="我的头像,点击随机切换" style="height: 60px;">
			<img class="img-circle" id="comment_avatar" onclick="reloadMyAvatar('comment_avatar',true)" src="<?=$_var['baseRes']['avatar'];?>">
			</a>
		</div>
		<div class="album-final-pinglun">
			<p class="review-text-leavings clear"><span style="color: #0181da;float:left;">我也来说几句</span><span id="wrap_letter_leninfo_id" style="color:#0181da;"></span></p>
			<textarea id="comment_message" name="message" rows="4" ></textarea>
			<div class="clearfix snsinfo_fabiao">
					<i class="el el-reddit" id="comment_face" onclick="showFace(this.id, 'comment_message');return false;"></i>
					<input style="height:30px;width:20%;font-size:12px;margin-top:1px;" class="form-control b-email com-nickname-all" id="com_nickname" name="nickname" placeholder="昵称(必填)" type="text">
					<input style="height:30px;width:20%;font-size:12px;margin-top:1px;" class="form-control b-email" id="com_email" name="email" placeholder="接收回复的email地址" type="text">
					<span> <input class="repcom-btn-sure" type="button" value="评论" id="com_sub_btn" onclick="sendcom(0)"/> </span>
			</div>
		</div>
		<div class="all-comment">
			<h4 class="index-title"><i class="el el-comment-alt"></i> 当前共有<span id="replys" style="color:red">0</span> 条评论
				<a href="#paginate" style="float:right;margin-right:10px;"><i class="el el-th-list"></i>浏览所有评论</a>
			</h4>
			<!--网友回复内容-->

<div id="Comment" class="comment-area" data-garbage="true">
	<ul id="comments">
	</ul>
	<div class="page" id="paginate"></div>
</div>





		</div>
	</div>
</div>
<script type="text/javascript" src="/ui/system/comment/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/ui/system/comment/js/commentajax.js"></script>
