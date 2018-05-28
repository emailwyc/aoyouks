<!--打赏-->
    <div class="hide_box"></div>
    <div class="shang_box">
    	<a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭"><img src="/ui/system/images/close.jpg" alt="取消"></a>
        <img class="shang_logo" src="/ui/system/images/logo3.gif" alt="SoonBaby">
    	<div class="shang_tit">
    		<p>感谢您的支持，我会继续努力的!</p>
    	</div>
    	<div class="shang_payimg">
    		<img src="/ui/system/images/zhifubaozhifu.png" alt="扫码查看" title="扫一扫">
    	</div>
    		<div class="pay_explain">扫码打赏，你说多少就多少</div>
    	<div class="shang_payselect">
     		<div class="pay_item checked" data-id="/ui/system/images/zhifubaozhifu.png">
	    		<span class="radiobox"></span>
	    		<span class="pay_logo"><img src="/ui/system/images/alipay.jpg" alt="支付宝"></span>
    		</div>
     		<div class="pay_item" data-id="/ui/system/images/weixinzhifu.png">
	    		<span class="radiobox"></span>
	    		<span class="pay_logo"><img src="/ui/system/images/wechat.jpg" alt="微信"></span>
    		</div>
    	</div>
    </div>

 <!-- 手机端 -->
 <div class="shang_box_wap">
   <a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭"><img src="/ui/system/images/close.jpg" alt="取消"></a>
   <div class="shang_tit">
     <p>感谢您的支持，我会继续努力的!</p>
   </div>
   <div class="shang_payimg">
     <img src="/ui/system/images/zhifubaozhifu.png" data-id="" alt="扫码查看" title="扫一扫">
   </div>
     <div class="pay_explain">长按二维码打赏，你说多少就多少</div>
   <div class="shang_payselect">
     <div class="pay_item checked" data-id="/ui/system/images/zhifubaozhifu.png">
       <span class="radiobox"></span>
       <span class="pay_logo"><img src="/ui/system/images/alipay.jpg" alt="支付宝"></span>
     </div>
     <div class="pay_item" data-id="/ui/system/images/weixinzhifu.png">
       <span class="radiobox"></span>
       <span class="pay_logo"><img src="/ui/system/images/wechat.jpg" alt="微信"></span>
     </div>
   </div>
 </div>
<!-- 手机端end -->
<!--打赏-->
<script type="text/javascript">
    $(function(){
    	$(".pay_item").click(function(){
    		$(this).addClass('checked').siblings('.pay_item').removeClass('checked');
    		var dataid=$(this).attr('data-id');
    		$(".shang_payimg img").attr("src",dataid);
    		$("#shang_pay_txt").text(dataid=="alipay"?"支付宝":"微信");
    	});
    });
    function dashangToggle(){
    	$(".hide_box").fadeToggle();
      var is_pc=IsPC();
      if(is_pc==true){
        $(".shang_box").fadeToggle();
      }else{
         $(".shang_box_wap").fadeToggle();
      }
    }
    // 判断是不是手机端
    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }
</script>
