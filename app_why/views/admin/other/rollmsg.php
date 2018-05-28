<!--主题框架开始-->
<?php $this->_cdata['_title']="滚动消息－".$this->_cdata['_title'];?>

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
            <li class="active">滚动消息</li>
        </ul><!-- .breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">

                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-header">
                            共<span style="color:yellow;" class="allcount"><?=$lists['page']['count']?></span>条数据
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
                                            <label>
                                                <a href="/admin/other/rollmsg_add"><button class="btn btn-sm btn-warning">发表消息</button></a>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <!--search-->

                                <!--table-->
                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center">ID</th>
                                        <th>内容</th>
                                        <th><i class="icon-time bigger-110 hidden-480"></i>开始时间</th>
                                        <th><i class="icon-time bigger-110 hidden-480"></i>结束时间</th>
                                        <th><i class="icon-time bigger-110 hidden-480"></i>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($lists['data'] as $k=>$v):?>
                                        <tr class="delMark<?=$v['id'];?>">
                                            <td class="center"><?=$v['id']?></td>
                                            <td title="<?=toStriForHtmlSpeChar($v['message'])?>"><?=mb_substr( strip_tags($v['message']),0,9,"utf-8");?></td>
                                            <td><?=date("Y-m-d",$v['starttime'])?></td>
                                            <td><?=date("Y-m-d",$v['endtime'])?></td>
                                            <td><?=$v['createtime']?></td>
                                            <td>
                                                <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                    <a class="green" href="/admin/other/rollmsg_edit?id=<?=$v['id']?>">
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
                            url : "/admin/other/rollmsg_del",
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
                    jQuery('#paginate').pagination(<?=$lists['page']['count']?>,{
                        current_page:<?=$lists['page']['curpage']?>,
                        items_per_page:<?=$lists['page']['per']?>,
                        link_to:"/admin/other/rollmsg/__id__"
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
