<!--主题框架开始-->
<?php $this->_cdata['_title']="编辑相册－".$this->_cdata['_title'];?>
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
                <i class="icon-user"></i>
                <a href="javascript:void(0)"></a>
            </li>
            <li class="active">相册</li>
            <li class="active">编辑</li>
        </ul><!-- .breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form class="form-horizontal jzr-form" role="form" onsubmit="return settingpwd_check(this)">
                    <div class="space-4"></div>
                    <div class="space-4"></div>
                    <!--用户名称-->
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 标题* </label>
                        <div class="col-sm-9">
                            <input type="text" name="title" value="<?=$album['name']?>"  class="col-xs-10 col-sm-5" />
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1" style="margin-top: 10px;"> ICON* </label>
                        <div class="col-sm-9 image">
                            <div class="img-add-photo">
                                <input type="file" capture="camera" accept="image/*" name="file0">
                            </div>
                            <div class="img-show ace-thumbnails">
                                <img width="64px;" height="64px" data-action="zoom" src="<?=$album['icon']?>" alt="" style="cursor:zoom-in;">
                                <input name="album_icon" value="<?=$album['icon']?>" type="hidden">
                            </div>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 前端显示 </label>
                        <div class="col-sm-9">
                            <input name="status" class="ace ace-switch ace-switch-4" type="checkbox" <?php if($album['status']){?>checked="checked"<?php }?>/>
                            <span class="lbl"></span>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit">
                                <i class="icon-ok bigger-110"></i>
                                提交
                            </button>
                            &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset">
                                <i class="icon-undo bigger-110"></i>
                                重置
                            </button>

                        </div>
                    </div>
                    <div class="space-4"></div>
                </form>
                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->

<!-- 编辑器源码文件 -->
<!-- 实例化编辑器 -->
<script type="text/javascript">
    $(document).ready(function(){
        updateimgone(150,100,"album_icon","");
    });
    function settingpwd_check(forms){
        $.ajax({
            type : "POST",
            url : "/admin/album/index_edit?id=<?=$album['id']?>",
            dataType : "json",
            async : true,
            data:{
                'title':forms['title'].value,
                'icon':forms['album_icon'].value,
                'status':forms['status'].checked,
                'oper':true
            },
            success : function(data) {
                if(data.code==1){
                    layer.msg("成功！");
                    window.history.go(-1);
                }else{
                    layer.msg(data.msg);
                }
            },
            error: function(res) {
                layer.msg("请求错误！");
            }
        });
        return false;
    }
</script>
<!---底部开始-->
<?php $this->load->aview('common/footer',$this->_cdata);?>
<!---底部结束-->