function login(){
    $('#b-modal-login').modal('show');
    setCookie('this_url',window.location.href);
}

function logout(){
    $.post(logoutUrl);
    setTimeout(function(){location.replace(location)},500);
}
function setCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }else{
        var expires = "";
    }
    document.cookie = name+"="+value+expires+"; path=/";
}

function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
function deleteCookie(name) {
    setCookie(name,"",-1);
}
function recordId(category,id){
    setCookie('cid',0); setCookie('tid',0); setCookie('search_word',0);
    if (category!='index' && category!='/') { setCookie(category,id); }
    return true;
}
function getRandom(min, max){
	var r = Math.random() * (max - min);
	var re = Math.round(r + min);
	re = Math.max(Math.min(re, max), min)
	return re;
}

function reloadMyAvatar(obj,auto){
	var avatarKey = "client_random_avatar";
	var avaUrl = getCookie(avatarKey);
	if(avaUrl==null || avaUrl=="" || auto){
		var rand = getRandom(0,120);
		avaUrl = "/ui/system/images/default_avatar/"+rand+".jpg";
	}
	setCookie(avatarKey,avaUrl,100);
	$('#'+obj).attr('src',avaUrl);
	return true;	
}
function checkKeyWord(){
	var keyword = document.getElementById("soone_keyword");
	if(trim(keyword.value)==null || trim(keyword.value)==""){
		layer.msg("请输入关键词.");
		keyword.focus();
		return false;
	}
	return true;
}
function trim(str){ return str.replace(/(^\s*)|(\s*$)/g, ""); }
function subscribe(){
	layer.msg('该功能暂不开放，敬请期待！');
	return false;	
	var email = document.getElementById("soone_subscribe");
	if(trim(email.value)==null || trim(email.value)==""){
		layer.msg("订阅失败，邮箱为空.");
		email.focus();
	}else{
		email = trim(email.value);
		var reg=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	    if(!reg.test(email) ){
			layer.msg('邮箱格式错误喔');
	    }else{
			layer.msg('该功能暂不开放，敬请期待！');
		}
	}
}
