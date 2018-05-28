<!--主题框架开始-->
<?php $this->_cdata['_title']="友情链接－".$this->_cdata['_title'];?>

<?php $this->load->aview('common/header',$this->_cdata);?>
<!--主题框架开始-->
<style type="text/css">
    .table th, .table td {
        text-align: center;
        vertical-align: middle!important;
    }
</style>
<?php $this->load->aview('common/left',$this->_cdata);?>

<div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>
        <ul class="breadcrumb">
            <li>
                <i class="icon-home"></i>
                <a href="javascript:void(0)">其他</a>
            </li>
            <li class="active">友情链接</li>
        </ul><!-- .breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">

                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-header">
                            共<span style="color:yellow;" class="allcount"><?=$flink['page']['count']?></span>条数据
                        </div>
                        <div class="table-responsive">
                            <div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
                                <!--search-->
                                <div class="row" style="padding:5px;">
                                    <div class="col-sm-6">
                                        <div id="sample-table-2_length" class="dataTables_length">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="dataTables_filter" id="sample-table-2_filter">
                                        </div>
                                    </div>
                                </div>
                                <!--search-->

                                <!--table-->
                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center">ID</th>
                                        <th>标题</th>
                                        <th>email</th>
                                        <th>网站</th>
                                        <th>描述</th>
                                        <th>排序</th>
                                        <th>状态</th>
                                        <th><i class="icon-time bigger-110 hidden-480"></i>申请时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($flink['data'] as $k=>$v):?>
                                        <tr class="delMark<?=$v['id'];?>">
                                            <td class="center"><?=$v['id']?></td>
                                            <td title="<?=$v['title']?>"><?=mb_substr($v['title'],0,9,"utf-8");?></td>
                                            <td title="<?=$v['email']?>"><?=mb_substr($v['email'],0,9,"utf-8");?></td>
                                            <td title="<?=$v['website']?>"><a target="_blank" href="<?=$v['website']?>"><?=mb_substr($v['website'],0,9,"utf-8");?></a></td>
                                            <td title="<?=toStriForHtmlSpeChar($v['desc'])?>"><?=mb_substr( strip_tags($v['desc']),0,9,"utf-8");?></td>
                                            <td><?=$v['order']?></td>
                                            <td>
                                                <?php if($v['status']==1){?>
                                                    <span class="label label-sm label-success">审核通过</span>
                                                <?php }elseif($v['status']==2){?>
                                                    <span class="label label-sm label-danger">未通过</span>
                                                <?php }else{?>
                                                    <span class="label label-sm label-warning">未审核</span>
                                                <?php }?>
                                            </td>
                                            <td><?=$v['createtime']?></td>
                                            <td>
                                                <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                    <a class="blue" target="_blank" href="/index/friendlink">
                                                        <i class="icon-zoom-in bigger-130"></i>
                                                    </a>
                                                    <a class="green" href="/admin/other/friendlink_edit?id=<?=$v['id']?>">
                                                        <i class="icon-pencil bigger-130"></i>
                                                    </a>
                                                    <a class="red" onclick="del_func(<?=$v['id'];?>)" href="javascript:void(0);"><i class="icon-trash bigger-130"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php endforeach;?>
                                    </tbody>
                                </table>
                                <!--table-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--page-->
                <div style="margin:0 auto;text-align:center;">
                    <ul class="pagination no-margin" id="paginate"></ul>
                </div>
                <script type="text/javascript" src="/ui/admin/assets/js/jquery.pagination.js?v=1"></script>
                <script type="text/javascript">
                    function del_func(id){
                        $.ajax({
                            type : "POST",
                            url : "/admin/other/friendlink_del",
                            dataType : "json",
                            async : true,
                            data:{'id':id},
                            success : function(data) {
                                if(data.code==1){
                                    layer.msg("删除成功！");
                                    $(".delMark"+id).hide();
                                    var count = parseInt($(".allcount").html())-1;
                                    $(".allcount").html(count);
                                }else{
                                    layer.msg(data.msg);
                                }
                            },
                            error: function(res) { layer.msg("请求错误！");}
                        });
                    }
                    jQuery('#paginate').pagination(<?=$flink['page']['count']?>,{
                        current_page:<?=$flink['page']['curpage']?>,
                        items_per_page:<?=$flink['page']['per']?>,
                        link_to:"/admin/other/friendlink/__id__"
                    });
                </script>
                <!--page-->

                <!-- PAGE CONTENT ENDS -->

            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->
<!---底部开始-->
<?php $this->load->aview('common/footer',$this->_cdata);?>
<!---底部结束-->
