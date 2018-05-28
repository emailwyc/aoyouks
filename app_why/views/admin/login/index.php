<!DOCTYPE html> 
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8" />
		<title>登录页面 - 博客后台</title>
		<meta name="keywords" content="博客后台,登录页面" />
		<meta name="description" content="博客后台,登录页面" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="/ui/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/ui/admin/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="/ui/admin/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- ace styles -->
		<link rel="stylesheet" href="/ui/admin/assets/css/ace.min.css" />
		<link rel="stylesheet" href="/ui/admin/assets/css/ace-rtl.min.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/ui/admin/assets/css/ace-ie.min.css" />
		<![endif]-->
		<!-- inline styles related to this page -->
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="/ui/admin/assets/js/html5shiv.js"></script>
		<script src="/ui/admin/assets/js/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="/ui/system/css/layer.css" id="layui_layer_skinlayercss" style="">
		<link rel="shortcut icon" href="/ui/system/images/favicon.ico">
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="icon-leaf green"></i>
									<span class="red">后台</span>
									<span class="white">博客系统</span>
								</h1>
								<h4 class="blue">&copy; SooneBaby</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												登录
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="login_username" class="form-control" placeholder="用户名" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" id="login_pwd" class="form-control" placeholder="密码" />
															<i class="icon-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" id="login_remember" class="ace" />
															<span class="lbl"> 记住</span>
														</label>

                                                        <button type="button" id="login_submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                            <i class="icon-key"></i>
                                                            登录
                                                        </button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">Or Login Using</span>
											</div>
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
										</div>
									</div><!-- /widget-body -->
                                </div><!-- /login-box -->


							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='/ui/admin/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/ui/admin/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='/ui/admin/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
$(document).ready(function(){
	$("#login_submit").click(function(){
		//验证
		var name = trim($("#login_username").val());
		var pwd = trim($("#login_pwd").val());
		var remember = $("#login_remember").is(":checked")?1:0;
		if(name==""){ layer.msg("用户名不能为空");$("#login_username").focus();return false;}
		if(pwd==""){ layer.msg("密码不能为空");$("#login_pwd").focus();return false;}
		$.ajax({
			type : "POST",
			url : "/admin/login/login",
			dataType : "json",
			async : true,
			data:{'name':name,'pwd':pwd,'remember':remember},
			success : function(data) {
				if(data=="1"){
					layer.msg("登录成功");
					window.location.href="/admin/index"
				}else if(data=="2"){
					layer.msg("尝试次数过多，账户已暂时冻结");
				}else{
					layer.msg("用户名或者密码错误！");
				}
			},
			error: function(res) {
				layer.msg("登录失败");
			},
		});
	});
});

		</script>
<script type="text/javascript" src="/ui/admin/assets/js/common.js"></script>
<script type="text/javascript" src="/ui/system/js/layer.js"></script>
</body>
</html>
