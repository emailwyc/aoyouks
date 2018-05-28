<!--主题框架开始-->
<?php $this->_cdata['_title']="设置－".$this->_cdata['_title'];?>
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
                <a href="javascript:void(0)">个人中心</a>
            </li>
            <li class="active">设置</li>
            <li class="active">账号设置</li>
        </ul><!-- .breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->

                <form class="form-horizontal" role="form" onsubmit="return settingpwd_check(this)">
                    <div class="space-4"></div>
                    <div class="space-4"></div>
                    <!--用户名称-->
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 登录名 </label>
                        <div class="col-sm-9">
                            <input type="text" name="username" value="<?=$info['username']?>"  class="col-xs-10 col-sm-5" />
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <!--密码错误次数-->
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 密码剩余错误次数 </label>
                        <div class="col-sm-9">
                            <input type="text" value="<?=$info['errornum']?>" name="errornum" class="input-mini" id="spinner3" />
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <!--请求是否验证token-->
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 请求是否验证Token </label>
                        <div class="col-sm-9">
                            <input name="tokencheck" class="ace ace-switch ace-switch-4" type="checkbox" <?php if($info['logins']==1){?>checked="checked"<?php }?> />
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
<script type="text/javascript">
    $(document).ready(function(){
        $('#spinner3').ace_spinner({value:<?=$info['errornum']?>,min:-100,max:100,step:1, on_sides: true, icon_up:'icon-plus smaller-75', icon_down:'icon-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
    });
    function settingpwd_check(forms){
        $.ajax({
            type : "POST",
            url : "/admin/json/user_editinfo",
            dataType : "json",
            async : true,
            data:{
                'username':forms['username'].value,
                'errornum':forms['errornum'].value,
                'logins':forms['tokencheck'].checked
            },
            success : function(data) {
                if(data.code==1){
                    layer.msg("成功！");
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