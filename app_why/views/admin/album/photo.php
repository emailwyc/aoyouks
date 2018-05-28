<!--主题框架开始-->
<?php $this->_cdata['_title']="照片－".$this->_cdata['_title'];?>

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
                <a href="javascript:void(0)">相册</a>
            </li>
            <li class="active">添加照片</li>
        </ul><!-- .breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">

                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-header">
                            共<span style="color:yellow;" class="allcount"><?=$photo['page']['count']?></span>条数据
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
                                <div class="jzr-form">
                                    <div class="col-sm-12 image">
                                        <div class="img-add" width="100px;" height="100px;">
                                            <input  style="width: 80px;height:80px;" type="file" capture="camera" accept="image/*" name="file0">
                                        </div>
                                        <div class="row-fluid">
                                            <ul class="ace-thumbnails img-show">
                                                <?php foreach ($photo['data'] as $k=>$v):?>
                                                <li class="delMark<?=$v['id']?>">
                                                    <img src="<?=$v['img']?>" data-action="zoom" data-scale="<?=$v['scale']?>"/>
                                                    <div class="tools tools-bottom">
                                                        <a href="javascript:void(0)" onclick="del_func(<?=$v['id'];?>)"><i class="icon-remove red"></i></a>
                                                    </div>
                                                </li>
                                                <?php endforeach;?>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!--table-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--page-->
                <div style="margin:0 auto;text-align:center;">
                    <br>
                    <ul class="pagination no-margin" id="paginate"></ul>
                </div>
                <input type="hidden" id="album_id" value="<?=$album['id']?>">
                <script type="text/javascript" src="/ui/admin/assets/js/jquery.pagination.js?v=1"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        albumaddimg(800,800,"album_photo",<?=$album['id']?>,{'w':200,'h':200});
                    });
                    function del_func(id){
                        //询问框
                        layer.confirm('官人,你真的要删除我吗？', {
                            btn: ['删除','留着吧'] //按钮
                        }, function(){
                            var cid=$("#album_id").val();
                            $.ajax({
                                type : "POST",
                                url : "/admin/album/photo_del",
                                dataType : "json",
                                async : true,
                                data:{'id':id,'cid':cid},
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
                        }, function(){
                            layer.msg('谢谢官人救命之恩！');
                        });

                    }
                    jQuery('#paginate').pagination(<?=$photo['page']['count']?>,{
                        current_page:<?=$photo['page']['curpage']?>,
                        items_per_page:<?=$photo['page']['per']?>,
                        link_to:"/admin/album/photo/<?=$album['id']?>?page=__id__"
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
