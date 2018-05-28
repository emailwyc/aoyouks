<!--主题框架开始-->
<?php $this->_cdata['_title']="添加资源－".$this->_cdata['_title'];?>
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
            <li class="active">下载</li>
            <li class="active">添加资源</li>
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
                            <input type="text" name="title" value=""  class="col-xs-10 col-sm-5" />
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 关键词 </label>
                        <div class="col-sm-9">
                            <input type="text" name="kwd" value=""  class="col-xs-10 col-sm-5" />
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
                                <img width="64px;" height="64px" data-action="zoom" src="" alt="" style="cursor:zoom-in;">
                                <input name="download_icon" value="" type="hidden">
                            </div>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 热门 </label>
                        <div class="col-sm-9">
                            <input name="is_hot" class="ace ace-switch ace-switch-4" type="checkbox"/>
                            <span class="lbl"></span>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上传资源（选择后立即上传）[如有下载地址可略过] </label>
                        <div class="col-sm-4">
                            <input type="file" name="durl" id="id-input-file-2"/><span style='color:red'>(不可重复上传哦！)</span>
                            <input type="hidden" name="download_res" id="download_res"/>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 下载地址（非必须（优先）） </label>
                        <div class="col-sm-9">
                            <input type="text" name="lurl" class="col-xs-10 col-sm-5" />
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 正文* </label>
                        <div class="col-sm-9">
                            <script id="container" name="content" type="text/plain"></script>
                        </div>
                    </div>

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
<script type="text/javascript" src="/ui/system/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/ui/system/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="/ui/admin/assets/js/jquery1.7.2.js"></script>
<script type="text/javascript" src="/ui/admin/assets/js/ajaxfileupload.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
    $(document).ready(function(){
        updateimgone(150,100,"download_icon","");
        $('#id-input-file-2').ace_file_input({
            no_file:'未选择文件',
            btn_choose:'选择',
            btn_change:'更改',
            droppable:false,
            onchange:null,
            icon_remove:null,
            thumbnail:false, //| true | large
            //whitelist:'gif|png|jpg|jpeg'
            //blacklist:'exe|php'
            //onchange:''
            //
            before_change: function(files, dropped){
                var sloading = layer.load(2, { shade: [0.6,'#ccc'] });
                $.ajaxFileUpload
                (
                    {
                        url: '/admin/download/index_edit_upload', //用于文件上传的服务器端请求地址
                        secureuri: false, //是否需要安全协议，一般设置为false
                        fileElementId: 'id-input-file-2', //文件上传域的ID
                        dataType: 'json', //返回值类型 一般设置为json
                        success: function (data, status)  //服务器成功响应处理函数
                        {
                            layer.close(sloading);
                            if(data.code==1){
                                $('#download_res').val(data.msg);
                            }else{
                                layer.msg(data.msg);
                            }
                        },
                        error: function (data, status, e)//服务器响应失败处理函数
                        {
                            layer.close(sloading);
                            layer.msg("上传文件错误！");

                        }
                    }
                );
                return true;
            }
        });
    });
    function settingpwd_check(forms){
        $.ajax({
            type : "POST",
            url : "/admin/download/index_add",
            dataType : "json",
            async : true,
            data:{
                'title':forms['title'].value,
                'kwd':forms['kwd'].value,
                'download_icon':forms['download_icon'].value,
                'is_hot':forms['is_hot'].checked,
                'durl':forms['download_res'].value,
                'lurl':forms['lurl'].value,
                'content':ue.getContent(),
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