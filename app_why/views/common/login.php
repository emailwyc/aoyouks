<style type="text/css">
.TY-login-window {
	font-size:12px;
	line-height:1.5;
	font-family:"微软雅黑",Arial,Helvetica;
	padding:15px;
	/*background:#fff;
	border-radius:6px;*/
}
.login-window-header {
	height:65px;
	overflow:hidden;
	position:relative;
	*zoom:1;
}
.loginWin-tab {
	text-align:center;
	margin-bottom:15px;
}
.loginWin-tab-list {
	display:inline-block;
	vertical-align:middle;
	*display:inline;
	*zoom:1;
}
.loginWin-tab-list li {
	float:left;
	display:inline;
	border-bottom:1px solid #aaa;
	color:#aaa;
	width:143px;
	height:21px;
	line-height:21px;
}
.loginWin-tab-list li span {
	padding-left:16px;
	/*background:url(resources/images/loginWin_icons.png?_v=20170104) no-repeat;*/
	cursor:pointer;
}
.loginWin-tab-list .normal-login-tab span {
	background-position:0 -159px;
}
.loginWin-tab-list .qrcode-login-tab span {
	background-position:0 -95px;
}
.loginWin-account {
	width:286px;
	margin:0 auto 15px;
}
.loginWin-account-title {
	color:#000;
	font-size:14px;
	margin-bottom:15px;
	text-indent:10px;
}
.loginWin-account-list {
	margin-right:-10px!important;
	height:152px;
	overflow:hidden;
}
.loginWin-account-list li {
	float:left;
	display:inline;
	margin-right:10px;
}
.loginWin-account-list li a {
	display:block;
	padding:9px 10px;
	line-height:20px;
	width:118px;
	color:#aaa;
	white-space:nowrap;
	text-overflow:ellipsis;
	overflow:hidden;
	text-decoration:none;
}
.loginWin-account-list li a:hover {
	color:#308ee3;
}
.loginWin-account-list li.checked a {
	color:#fff;
	background:#308ee3;
	border-radius:6px;
}
.loginWin-account-list li.checked a:hover {
	color:#fff;
}
.loginWin-form {
	color:#000;
}
.loginWin-login-form {
	width:286px;
	margin:0 auto;
}
.loginWin-login-form a,.loginWin-login-form a:link,.loginWin-login-form a:visited {
	color:#308ee3;
	text-decoration:none;
}
.loginWin-login-form a:hover,.loginWin-login-form a:active {
	color:#308ee3;
	text-decoration:underline;
}
.loginWin-form-item {
	margin-bottom:10px;
}
.loginWin-form-item .input-text {
	border:1px solid #aaa;
	border-radius:6px;
	padding:6px 12px;
	width:286px;
	height:38px;
	line-height:38px;
	outline:0 none;
}
.loginWin-form-item .input-text:focus {
	border-color:#308ee3;
}
.loginWin-form-item .input-checkbox {
	vertical-align:middle;
	margin:-2px 4px 0 0;
	outline:0 none;
}
.loginWin-submit-btn {
	border:0 none;
	width:286px;
	height:38px;
	line-height:38px;
	font-size:16px;
	color:#fff;
	text-align:center;
	background:#308ee3;
	border-radius:6px;
	cursor:pointer;
	vertical-align:middle;
	outline:0 none;
}
.loginWin-account-input,.loginWin-password-input {
	position:relative;
	*zoom:1;
}
.loginWin-account-input .input-text,.loginWin-password-input .input-text {
	padding-left:42px;
	width:286;
}
.loginWin-account-input label,.loginWin-password-input label {
	position:absolute;
	width:24px;
	height:24px;
	font-size:0;
	line-height:0;
	left:12px;
	top:6px;
	background:url(/Template/xiao/Home/Public/images/icon/loginWin_icons.png?_v=20170104) no-repeat;
}
.fr {
    float: right;
    display: inline;
}
.loginWin-account-input label {
	background-position:0 -256px;
}
.loginWin-password-input label {
	background-position:0 -338px;
}
.loginWin-account-input .input-text:focus ~ label {
	background-position:0 -296px;
}
.loginWin-password-input .input-text:focus ~ label {
	background-position:0 -381px;
}
.switch-login-toggle,.normal-login-toggle {
	color:#f9a30f;
	padding-left:15px;
	/*background:url(resources/images/loginWin_icons.png?_v=20170104) no-repeat;*/
	cursor:pointer;
}
.normal-login-toggle {
	background-position:0 -190px;
}
.switch-login-toggle {
	background-position:0 -223px;
}
.loginWin-qrcode {
	margin-top:50px;
	height:273px;
}
.loginWin-qrcode-box {
	width:180px;
	padding-left:216px;
	margin:0 auto;
	text-align:center;
	/*background:url(resources/images/loginWin_qrcode_bg.png?_v=20170104) no-repeat;*/
	position:relative;
	*zoom:1;
}
.loginWin-third {
	width:286px;
	margin:20px auto 0;
}
.loginWin-third-title {
	text-align:center;
	margin-bottom:20px;
	position:relative;
	*zoom:1;
}
.loginWin-third-title:before {
	content:"";
	width:100%;
	height:1px;
	background:#aaa;
	position:absolute;
	top:50%;
	left:0;
}
.loginWin-third-title span {
	padding:0 10px;
	color:#aaa;
	background:#fff;
	position:relative;
	*zoom:1;
}
.loginWin-third-list {
	margin-right:-53px!important;
	overflow:hidden;
}
.loginWin-third-list li {
	float:left;
	display:inline;
	width:60px;
	height:60px;
	margin-right:53px;
}
.loginWin-third-list li a {
	display:block;
	width:60px;
	height:60px;
	background:url(/Template/xiao/Home/Public/images/icon/loginWin_third.png?_v=20170104) no-repeat;
}
.loginWin-third-list .weixin-login {
	background-position:0 0;
}
.loginWin-third-list .qq-login {
	background-position:0 -60px;
}
.loginWin-third-list .weibo-login {
	background-position:0 -120px;
}
#loginWin_content_wrapper {
	padding:10px 0;
}
.loginWin-switch-login-wrapper .loginWin-tab,.loginWin-switch-login-wrapper .loginWin-qrcode,.loginWin-switch-login-wrapper .loginWin-third,.loginWin-switch-login-wrapper .loginWin-account-input,.loginWin-switch-login-wrapper .loginWin-register-link,.loginWin-switch-login-wrapper .switch-login-toggle {
	display:none;
}
.loginWin-normal-login-wrapper .loginWin-account,.loginWin-normal-login-wrapper .loginWin-qrcode,.loginWin-normal-login-wrapper .normal-login-toggle {
	display:none;
}
.loginWin-normal-login-wrapper .normal-login-tab {
	border-bottom-color:#308ee3;
	color:#308ee3;
}
.loginWin-normal-login-wrapper .normal-login-tab span {
	background-position:0 -127px;
	cursor:text;
}
.loginWin-qrcode-login-wrapper .loginWin-account,.loginWin-qrcode-login-wrapper .loginWin-form,.loginWin-qrcode-login-wrapper .loginWin-third {
	display:none;
}
.loginWin-qrcode-login-wrapper .qrcode-login-tab {
	border-bottom-color:#308ee3;
	color:#308ee3;
}
.loginWin-qrcode-login-wrapper .qrcode-login-tab span {
	background-position:0 -64px;
	cursor:text;
}
</style>
<div class="hide_box2"></div>
<div class="shang_box2">
  <a class="shang_close2" href="javascript:void(0)" onclick="dashangToggle2()" title="关闭"><img src="%E7%94%A8PHP%E5%81%9A%E7%BD%91%E7%AB%99%E7%9A%84PV%E3%80%81UV%E3%80%81IP%E8%AE%BF%E5%AE%A2%E7%BB%9F%E8%AE%A1-%E9%9B%B7%E5%B0%8F%E5%A4%A9%E5%8D%9A%E5%AE%A2_files/close.jpg" alt="取消"></a>
    <img class="shang_logo2" src="%E7%94%A8PHP%E5%81%9A%E7%BD%91%E7%AB%99%E7%9A%84PV%E3%80%81UV%E3%80%81IP%E8%AE%BF%E5%AE%A2%E7%BB%9F%E8%AE%A1-%E9%9B%B7%E5%B0%8F%E5%A4%A9%E5%8D%9A%E5%AE%A2_files/logo2.png" alt="雷小天博客">
  <!-- <div class="ty-content clearfix shang_box2" style="padding:0;"> -->
    <div class="TY-login-window">

      <div class="login-window-body">
        <div id="loginWin_content_wrapper" class="loginWin-normal-login-wrapper">
          <div class="loginWin-tab">
            <ul class="loginWin-tab-list cf">
              <li class="normal-login-tab"><span>普通登录</span></li>
              <li class="qrcode-login-tab"><span>扫码登录</span></li>
            </ul>
          </div>
          <div class="loginWin-form">
            <form class="loginWin-login-form" id="topguideloginform" name="topguideloginform" method="post" action="javascript::void(0);" accept-charset="UTF-8" target="_top">
              <div class="loginWin-form-item loginWin-account-input"><input class="input-text" id="vwriter" name="vwriter" placeholder="用户名/手机/邮箱" autocomplete="off" type="text">
                <input id="user_action" name="action" value="f7.1483930809431.111114|b2de5928fa17c27cadcda46f7cd0197f|d41d8cd98f00b204e9800998ecf8427e|Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36|0|9|v2.2" type="hidden"><label for="vwriter"></label>
              </div>
              <div class="loginWin-form-item loginWin-password-input">
                <input class="input-text" id="vpassword" name="vpassword" placeholder="密码" type="password"><label for="vpassword"></label>
              </div>
              <div class="loginWin-form-item cf"><label class="fl">
                <input class="input-checkbox" id="rmflag" name="rmflag" value="1" checked="checked" type="checkbox">下次自动登录</label><a class="loginWin-password-link fr" href="javascript::void(0);" onclick="return alert('暂不开放！');" target="_blank">忘记密码？</a>
              </div>
              <div class="loginWin-form-item"><button type="submit" onclick="return alert('暂不开放，请选择第三方！');" class="loginWin-submit-btn">登 录</button>
              </div>
              <div class="cf"><a class="loginWin-register-link fl" href="javascript::void(0);" onclick="return alert('暂不开放，请选择第三方！');" target="_blank">立即注册</a><span class="normal-login-toggle fr">返回登录</span>
              </div>
            </form>
            </div>
            <div class="loginWin-third"><p class="loginWin-third-title"><span>使用第三方账号登录</span></p>
              <ul class="loginWin-third-list cf">
                <li><a class="weixin-login" title="微信账号登录" href="http://www.blog.com/Home/User/oauth_login/type/wechat.html"></a></li>
                <li><a class="qq-login" title="QQ账号登录" href="http://www.blog.com/Home/User/oauth_login/type/qq.html"></a></li>
                <li><a class="weibo-login" title="新浪微博账号登录" href="http://www.blog.com/Home/User/oauth_login/type/sina.html"></a></li>
              </ul>
            </div>

          </div>
        </div>
      </div>
    <!-- </div> -->

    <!-- <ul class="row">
        <li class="col-xs-6 col-md-4 col-lg-4 b-login-img">
            <a href="/Home/User/oauth_login/type/qq.html"><img src="/Template/xiao/Home/Public/images/icon/qq-login.png" alt="QQ登录" title="QQ登录"></a>
        </li>
        <li class="col-xs-6 col-md-4 col-lg-4 b-login-img">
            <a href="/Home/User/oauth_login/type/sina.html"><img src="/Template/xiao/Home/Public/images/icon/sina-login.png" alt="微博登录" title="微博登录"></a>
        </li>
        <li class="col-xs-6 col-md-4 col-lg-4 b-login-img">
            <a href="/Home/User/oauth_login/type/douban.html"><img src="/Template/xiao/Home/Public/images/icon/douban-login.png" alt="豆瓣登录" title="豆瓣登录"></a>
        </li>
        <li class="col-xs-6 col-md-4 col-lg-4 b-login-img">
            <a href="/Home/User/oauth_login/type/renren.html"><img src="/Template/xiao/Home/Public/images/icon/renren-login.png" alt="人人登录" title="人人登录"></a>
        </li>
        <li class="col-xs-6 col-md-4 col-lg-4 b-login-img">
            <a href="/Home/User/oauth_login/type/kaixin.html"><img src="/Template/xiao/Home/Public/images/icon/kaixin-login.png" alt="开心网登录" title="开心网登录"></a>
        </li>
        <li class="col-xs-6 col-md-4 col-lg-4 b-login-img">
            <a href="/Home/User/oauth_login.html"><img src="" alt="待定" title="待定"></a>
        </li>
    </ul> -->

</div>
<script type="text/javascript">
function k2(){
  $(".hide_box2").fadeToggle();
  $(".shang_box2").fadeToggle();
}
</script>

