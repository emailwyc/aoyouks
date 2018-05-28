<!--主题框架开始-->
<?php $this->_cdata['_title']="添加文章－".$this->_cdata['_title'];?>
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
            <li class="active">文章</li>
            <li class="active">添加</li>
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
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1" style="margin-top: 10px;"> ICON* </label>
                        <div class="col-sm-9 image">
                            <div class="img-add-photo">
                                <input type="file" capture="camera" accept="image/*" name="file0">
                            </div>
                            <div class="img-show ace-thumbnails">
                                <img width="64px;" height="64px" data-action="zoom" src="" alt="" style="cursor:zoom-in;">
                                <input name="article_icon" value="" type="hidden">
                            </div>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 打赏 </label>
                        <div class="col-sm-9">
                            <input name="is_reward" class="ace ace-switch ace-switch-4" type="checkbox" checked="checked" />
                            <span class="lbl"></span>
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
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 前端显示 </label>
                        <div class="col-sm-9">
                            <input name="status" class="ace ace-switch ace-switch-4" type="checkbox" checked="checked"/>
                            <span class="lbl"></span>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 文章分类 </label>
                        <div class="col-sm-9">
                            <select name="cid" aria-controls="sample-table-2">
                                <?php foreach ($artClass as $v):?>
                                    <option value="<?=$v['id']?>"><?=$v['name']?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 标签 </label>
                        <div class="col-sm-9" style="vertical-align: middle!important;">
                            <?php foreach ($tags as $v):?>
                                <input name="tags" type="checkbox" value="<?=$v['id']?>"><?=$v['name']?>&nbsp;
                            <?php endforeach;?>
                        </div>
                    </div>
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 文章描述* </label>
                        <div class="col-sm-9">
                            <textarea name="short" class="form-control" placeholder="请用简短的话描述一下吧"></textarea>
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
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
    $(document).ready(function(){
        updateimgone(120,90,"article_icon","");
    });
    function settingpwd_check(forms){
        $.ajax({
            type : "POST",
            url : "/admin/article/lists_add",
            dataType : "json",
            async : true,
            data:{
                'title':forms['title'].value,
                'article_icon':forms['article_icon'].value,
                'is_reward':forms['is_reward'].checked,
                'is_hot':forms['is_hot'].checked,
                'status':forms['status'].checked,
                'cid':forms['cid'].value,
                'tags':getCheckBoxVal("tags"),
                'short':forms['short'].value,
                'content':ue.getContent(),
                'oper':true
            },
            success : function(data) {
                if(data.code==1){
                    layer.msg("成功！");
                    //跳转到上一页
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