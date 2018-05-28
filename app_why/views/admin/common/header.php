<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><?=$_title?></title>
    <meta name="keywords" content="<?=$_var['author']?>,<?=$_var['author']?>个人博客后台" />
    <meta name="description" content="<?=$_var['author']?>,<?=$_var['author']?>个人博客后台" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="/ui/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/ui/admin/assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="/ui/admin/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <link rel="stylesheet" href="/ui/admin/assets/css/googleapis.css?family=Open+Sans:400,300" />

    <!-- ace styles -->
    <link rel="stylesheet" href="/ui/admin/assets/css/ui.jqgrid.css" />
    <link rel="stylesheet" href="/ui/admin/assets/css/ace.min.css" />
    <link rel="stylesheet" href="/ui/admin/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="/ui/admin/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="/ui/system/css/layer.css" id="layui_layer_skinlayercss" style="">
    <link rel="stylesheet" href="/ui/admin/assets/css/datepicker.css" />
    <link rel="stylesheet" href="/ui/admin/assets/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="/ui/admin/assets/css/daterangepicker.css" />


    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/ui/admin/assets/css/ace-ie.min.css" />
    <![endif]-->


    <link rel="stylesheet" href="/ui/admin/assets/css/soonebaby.css" />


    <script type="text/javascript" src="/ui/admin/assets/js/jquery1.7.2.js"></script>
    <script type="text/javascript" src="/ui/admin/assets/js/zoom/zooming.js"></script>
    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="/ui/admin/assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="/ui/admin/assets/js/html5shiv.js"></script>
    <script src="/ui/admin/assets/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/ui/admin/assets/js/soonebaby.js"></script>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    <?=$_var['author']?>博客后台管理
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <!--
                <li class="grey">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-bell-alt icon-animated-bell"></i>
                        <span class="badge badge-important">1</span>
                    </a>

                    <ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="icon-warning-sign"></i>
                            1条通知(后期加)
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-pink icon-comment"></i>
												文章评论
											</span>
                                    <span class="pull-right badge badge-info">+3</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                -->
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="<?=$_var['avatar']?>" alt="<?=$_var['author']?>" />
                        <span class="user-info">
									<small title="<?=$_var['desc']?>"><?=$_var['desc']?></small>
									<?=$_var['author']?>
								</span>
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/admin/setting/pwd">
                                <i class="icon-lock"></i>
                                密码修改
                            </a>
                        </li>
                        <li>
                            <a href="/admin/setting/admin">
                                <i class="icon-cog"></i>
                                账号设置
                            </a>
                        </li>

                        <li>
                            <a href="/admin/setting/author">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="/admin/login/logout">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>



<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <div class="main-container-inner">