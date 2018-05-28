<!--主题框架开始-->
<?php $this->_cdata['_title']="友情链接－".$this->_cdata['_title'];?>
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
            <li class="active">其他</li>
            <li class="active">友情链接</li>
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
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 标题 </label>
                        <div class="col-sm-9">
                            <?=$flink['title']?>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 网站 </label>
                        <div class="col-sm-9">
                            <a target="_blank" href="<?=$flink['website']?>"><?=$flink['website']?></a>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 排序数字（1-99999）* </label>
                        <div class="col-sm-9">
                            <input type="text" name="order" value="<?=$flink['order']?>"  class="col-xs-10 col-sm-5" />
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 审核状态* </label>
                        <div class="col-sm-9">
                            <select name="status" aria-controls="sample-table-2">
                                <option value="0" <?php if($flink['status']==0){ echo "selected='selected'";}?>>未审核</option>
                                <option value="1" <?php if($flink['status']==1){ echo "selected='selected'";}?>>通过</option>
                                <option value="2" <?php if($flink['status']==2){ echo "selected='selected'";}?>>不通过</option>
                            </select>
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
<!-- 实例化编辑器 -->
<script type="text/javascript">
    function settingpwd_check(forms){
        $.ajax({
            type : "POST",
            url : "/admin/other/friendlink_edit?id=<?=$flink['id']?>",
            dataType : "json",
            async : true,
            data:{
                'status':forms['status'].value,
                'order':forms['order'].value,
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