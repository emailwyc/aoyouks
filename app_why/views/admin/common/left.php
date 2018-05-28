<a class="menu-toggler" id="menu-toggler" href="#">
    <span class="menu-text"></span>
</a>

<div class="sidebar" id="sidebar">
    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
    </script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="icon-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="icon-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="icon-group"></i>
            </button>

            <button class="btn btn-danger">
                <i class="icon-cogs"></i>
            </button>
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div><!-- #sidebar-shortcuts -->

    <ul class="nav nav-list">

        <li class="nav-default">
            <a href="/admin/index">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 控制台 </span>
            </a>
        </li>
        <li class="menu-two">
            <a href="javascript:void(0)" class="dropdown-toggle">
                <i class="icon-file-text"></i>
                <span class="menu-text"> 文章 </span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li>
                    <a href="/admin/article/classes" menu-two="true">
                        <i class="icon-double-angle-right"></i>
                        文章分类
                    </a>
                </li>
                <li>
                    <a href="/admin/article/tags" menu-two="true">
                        <i class="icon-double-angle-right"></i>
                        云标签
                    </a>
                </li>
                <li>
                    <a href="/admin/article/lists" menu-two="true">
                        <i class="icon-double-angle-right"></i>
                        文章列表
                    </a>
                </li>
            </ul>
        </li>

        <li>
            <a href="/admin/saying">
                <i class="icon-leaf"></i>
                <span class="menu-text"> 说说 </span>
            </a>
        </li>
        <li>
            <a href="/admin/album">
                <i class="icon-picture"></i>
                <span class="menu-text"> 相册列表 </span>
            </a>
        </li>
        <li>
            <a href="/admin/download">
                <i class="icon-download"></i>
                <span class="menu-text"> 下载列表 </span>
            </a>
        </li>
        <li>
            <a href="/admin/leaving">
                <i class="icon-comments"></i>
                <span class="menu-text"> 留言 </span>
            </a>
        </li>

        <li class="menu-two">
            <a href="javascript:void(0)" class="dropdown-toggle">
                <i class="icon-cogs"></i>
                <span class="menu-text"> 其他 </span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li>
                    <a href="/admin/other/rollmsg" menu-two="true">
                        <i class="icon-double-angle-right"></i>
                        滚动消息
                    </a>
                </li>
                <li>
                    <a href="/admin/other/rollpic" menu-two="true">
                        <i class="icon-double-angle-right"></i>
                        轮播图设置
                    </a>
                </li>
                <li>
                    <a href="/admin/other/friendlink" menu-two="true">
                        <i class="icon-double-angle-right"></i>
                        友情链接
                    </a>
                </li>
            </ul>
        </li>

    </ul><!-- /.nav-list -->

    <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
    </div>

    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    </script>
</div>