<!--主题框架开始-->
<?php $this->_cdata['_title']="控制台－".$this->_cdata['_title'];?>
<?php $this->load->aview('common/header',$this->_cdata);?>
<!--主题框架开始-->
                <?php $this->load->aview('common/left',$this->_cdata);?>

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="javascript:void(0)">控制台</a>
                            </li>
                            <li class="active">首页</li>
						</ul><!-- .breadcrumb -->
					</div>

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">


								<!-- PAGE CONTENT BEGINS -->
                                        <h3 class="header smaller lighter blue">数据控制台</h3>
                                    <div>
                                        <label>
                                            <a href="/admin/saying/index_add" title="">
                                                <button class="btn btn-sm btn-success">发表说说</button>
                                            </a>
                                        </label>
                                        <label>
                                            <a href="/admin/article/lists_add" title="">
                                                <button class="btn btn-sm btn-warning">发表文章</button>
                                            </a>
                                        </label>
                                        <label>
                                            <a href="/admin/album/index_add" title="">
                                                <button class="btn btn-sm btn-danger">添加相册</button>
                                            </a>
                                        </label>
                                        <label>
                                            <a href="/admin/download/index_add" title="">
                                                <button class="btn btn-sm btn-info">添加资源</button>
                                            </a>
                                        </label>
                                        <label>
                                            <a href="/admin/download/index_add" title="">
                                                <button class="btn btn-sm btn-inverse">查看留言</button>
                                            </a>
                                        </label>
                                    </div>
                                        <div class="table-header"><img width="32px;" height="32px;" src="<?=$_var['avatar']?>"/>&nbsp;&nbsp;&nbsp;作者：<?=$_var['author']?>---<?=$_var['desc']?></div>

                                        <div class="table-responsive">
                                            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                                <tbody>
                                                <tr>
                                                    <td class="label-lg label-warning">今日访问IP</td>
                                                    <td class="label-lg label-warning"><?=$sysvar['curipnum']?>个</td>
                                                    <td class="hidden-480" rowspan=7></td>
                                                    <td class="label-lg label-warning">总访问量</td>
                                                    <td class="hidden-480 label-lg label-warning"><?=$sysvar['visitnum']?>个</td>
                                                </tr>
                                                <tr>
                                                    <td class="label-lg label-pink">图片数量</td>
                                                    <td class="label-lg label-pink"><?=$sysvar['photonum']?>个</td>
                                                    <td class="label-lg label-pink">说说数量</td>
                                                    <td class="hidden-480 label-lg label-pink"><?=$sysvar['saynum']?>个</td>
                                                </tr>
                                                <tr>
                                                    <td class="label-lg label-info">文章数量</td>
                                                    <td class="label-lg label-info"><?=$sysvar['artnum']?>个</td>
                                                    <td class="label-lg label-info">留言数量</td>
                                                    <td class="hidden-480 label-lg label-info"><?=$sysvar['leavenum']?>个</td>
                                                </tr>
                                                <tr>
                                                    <td class="label-lg label-danger">评论数量</td>
                                                    <td class="label-lg label-danger"><?=$sysvar['comnum']?>个</td>
                                                    <td class="label-lg label-danger">资源数量</td>
                                                    <td class="hidden-480 label-lg label-danger"><?=$sysvar['resnum']?>个</td>
                                                </tr>
                                                <tr>
                                                    <td class="label-lg label-success">运行天数</td>
                                                    <td class="label-lg label-success"><?=$sysvar['runing']?>天</td>
                                                    <td class="label-lg label-success"></td>
                                                    <td class="hidden-480 label-lg label-success"></td>
                                                </tr>


                                                <tr>
                                                    <td class="label-lg label-warning">未完待续……</td>
                                                    <td class="label-lg label-warning"></td>
                                                    <td class="label-lg label-warning"></td>
                                                    <td class="hidden-480 label-lg label-warning"></td>
                                                </tr>


                                                </tbody>
                                            </table>
                                        </div>


								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
<!---底部开始-->
<?php $this->load->aview('common/footer',$this->_cdata);?>
<!---底部结束-->
