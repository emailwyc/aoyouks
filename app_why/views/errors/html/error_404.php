<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>404页面-SooneBaby博客</title>
<style>
    #box{
        margin: 250px auto;
        width: 540px;
        height: 540px;
    }
    p{
        margin-bottom: 60px;
        width: 540px;
        height: 20px;
        text-align: center;
        line-height: 20px;
    }
    #mes{
        font-size: 30px;
        color: red;
    }
    .hint{
        color: #999;
    }
    a{
        color: #259AEA;
    }
</style>
<script>
    var i = 5;
    var intervalid;
    intervalid = setInterval("fun()", 1000);
    function fun() {
        if (i == 0) {
            window.location.href = "/";
            clearInterval(intervalid);
        }
        document.getElementById("mes").innerHTML = i;
        i--;
    }
</script>
</head>
<body>
<div id="box">
    <img src="/ui/system/images/404.jpg" alt="">
    <p>将在 <span id="mes"></span> 秒钟后返回<a href="/">SoonBaby博客</a>首页</p>
    <p class="hint">亲，不好意思！ 您可能输入了错误的网址，或者该网页已删除或移动</p>
</div>


</body></html>
