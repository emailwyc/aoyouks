<!--评论-->
<h3 class="form-btn blue-text"><a href="javascript:;"><i class="el-edit"></i>我要留言 / 展开表单</a></h3>
<!-- 通用评论开始 -->
<script>
    var userEmail='';
</script>
<style type="text/css">

.b-head-img{
  width: 45px;
  height: 45px;
  position: absolute;
  left: 15px;top: 5px;
}
.b-box-textarea{
  margin: 5px 0;
  height: 120px;
  border-radius: 4px;
  position: relative;z-index: 1;
  border:#ddd 1px solid;
  box-sizing:border-box;
  box-shadow:inset 0 0 2px rgba(0,0,0,0.05);
  font-family:'Microsoft YaHei';
  /*text-indent:10px;*/
  background:rgba(255,255,255,0.5);transition:all 0.5s;
  -webkit-transition:all 0.5s;
}
.b-box-content{
  padding: 5px;
  height: 75px;
  border: none;
  border-bottom: 1px solid #E6EAED;
  color: #999;overflow-y: auto;
  font-size: 12px;
}
.b-box-content:focus{
  outline:none;border:#ff6700 1px solid;box-shadow: 0 0 8px rgba(255, 103, 0,0.7);
}
.b-submit-button{
  position: absolute;
  right: 0.5px;
  bottom: 1px;
}
.b-submit-button input{
  height:30px;
  width:60px;
}
</style>
  <div id="b-login-word">
    <!-- <img class="img-circle" src="/Template/xiao/Home/Public/images/icon/default_head_img.gif" alt="雷小天博客" title="雷小天博客"> -->
    <img class="img-circle" src="%E7%94%A8PHP%E5%81%9A%E7%BD%91%E7%AB%99%E7%9A%84PV%E3%80%81UV%E3%80%81IP%E8%AE%BF%E5%AE%A2%E7%BB%9F%E8%AE%A1-%E9%9B%B7%E5%B0%8F%E5%A4%A9%E5%8D%9A%E5%AE%A2_files/default_head_img.gif" alt="雷小天博客" title="雷小天博客">
        <a href="javascript:;" onclick="comment(this)">登陆</a>
      </div>

    <div class="b-box-textarea">
        <div class="b-box-content" onfocus="delete_hint(this)" contenteditable="true">请先登陆后发表评论</div>
        <ul class="b-emote-submit">
            <li class="b-emote">
                <i class="el el-reddit" onclick="getTuzki(this)"></i>
                <input style="height:30px;font-size:12px;margin-top:1px;" class="form-control b-email" name="email" placeholder="接收回复的email地址" type="text">
                <div class="b-tuzki">

                </div>
            </li>
            <li class="b-submit-button">
                <input value="评 论" aid="23" pid="0" onclick="comment(this)" type="button">
            </li>
            <li class="b-clear-float"></li>
        </ul>
    </div>


<!-- 新的评论 -->
    <div class="comment-area" id="Comment">
    <h4 class="index-title"><i class="el el-comment-alt"></i> 当前共有<span>0</span> 条评论
      <a href="#"><i class="el el-th-list"></i>浏览所有评论</a>
    </h4>
          <ul class="b-user-comment">
                      </ul>
      </div>
<!-- 通用评论结束 -->
<!--评论-->
