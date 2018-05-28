 //限制字数信息存储容器
var verifyLenInfo   = {defMaxLen: 158};
/**
 * 绑定字符长度检测
 * 
 * @param string contentDomId 输入区域ID
 * @param string showDomId 显示区域ID
 * @param int maxLen 最大长度 默认 158
 * @return void
 */
var bindLenVerify = function(contentDomId, showDomId, maxLen) {
    if(jQuery('#' + contentDomId).length < 1) {
        //showWarn('长度检测的内容DOM不存在！<br/>ID为：' + contentDomId);
        return false;
    }
    if(jQuery('#' + showDomId).length < 1) {
        //showWarn('剩余字数提示显示DOM不存在！<br/>ID为：' + showDomId);
        return false;
    }
    if(typeof maxLen == 'undefined') {
        maxLen  = verifyLenInfo.defMaxLen;
    }
    verifyLenInfo[contentDomId]  = {len: maxLen, show: showDomId};
    jQuery('#' + contentDomId).bind('change keyup mousemove', function() {
        XTools.checkValidWords(this.id, verifyLenInfo[this.id].show, verifyLenInfo[this.id].len);
    });
    jQuery('#' + contentDomId).change();
};

//隐藏表情
function hideFace(showid)
{
        jQuery('#' + showid + '_menu').css('display','none');
        //jQuery('#face_bg_' + showid).css('display','none');
}

 //显示表情菜单
function showFace(showid, target) 
{
        //jQuery('#face_bg').css('height',document.body.clientHeight);
        if(jQuery('#' + showid + '_menu').html() != null) 
        {
                jQuery('#' + showid+'_menu').css('display','');
        }
        else 
        {
                var parentdiv = '<div id="append_parent"></div>';
                var faceDivHtml = '<div id="' + showid + '_menu" class="facebox" style="position:absolute;"' + '><ul>';
                for(i=1; i<31; i++) {
                        faceDivHtml += '<li><img src="/ui/system/comment/images/face/'+i+'.gif" onclick="insertFace(\''+showid+'\','+i+', \''+ target +'\')" style="cursor:pointer; position:relative;" />    </li>';
                }
                faceDivHtml += '</ul></div>';
                var facebg = '<div id="face_bg_' + showid + '" onclick="hideFace(\'' + showid + '\');" style="height: 1566px; display: none;" class="back_model"></div>';
                jQuery('body').append(parentdiv);
                jQuery('#append_parent').append(faceDivHtml);
                jQuery('#append_parent').append(facebg);
		jQuery('body').bind('click', function(event) {
			var et = event.target;
			if (jQuery(et).attr('id') != showid)
				hideFace(showid);
		});
        }
        setMenuPosition(showid,0);
        jQuery('#face_bg_' + showid).css('opacity',0);
        jQuery('#face_bg_' + showid).css('height',jQuery('body').height());
        jQuery('#face_bg_' + showid).css('display','block');
}
//插入表情
function insertFace(showid, id, target) {
        var faceText = '[em:'+id+':]';
        if(jQuery('#' + target).html() != null) {
                //var text = jQuery('#' + target).val();
                insertContent(target, faceText);
                //jQuery('#' + target).val(text + faceText);
                //jQuery('#' + target).focus();
        }
	hideFace(showid);
        jQuery('#' + showid+'_menu').css('display','none');
        jQuery('#face_bg_' + showid).css('display','none');
}
 /*div位置*/
 function setMenuPosition(showid, offset) {
         var showobj = document.getElementById(showid);
         var menuobj = document.getElementById(showid + '_menu');
         if(isUndefined(offset)) offset = 0;
         if(showobj) {
                 showobj.pos = fetchOffset(showobj);
                 showobj.X = showobj.pos['left'];
                 showobj.Y = showobj.pos['top'];
                 showobj.w = showobj.offsetWidth;
                 showobj.h = showobj.offsetHeight;
                 menuobj.w = menuobj.offsetWidth;
                 menuobj.h = menuobj.offsetHeight;
                 var sTop = document.documentElement && document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
                 if(offset != -1) {
                         menuobj.style.left = (showobj.X + menuobj.w > document.body.clientWidth) && (showobj.X + showobj.w - menuobj.w >= 0) ? showobj.X + showobj.w - menuobj.w + 'px    ' : showobj.X + 'px';
                         menuobj.style.top = offset == 1 ? showobj.Y + 'px' : (offset == 2 || ((showobj.Y + showobj.h + menuobj.h > sTop + document.documentElement.clientHeight) && (showobj.Y - menuobj.h >= 0)) ? (showobj.Y - menuobj.h) + 'px' : showobj.Y + showobj.h + 'px');
                 } else if(offset == -1) {
                         menuobj.style.left = (document.body.clientWidth-menuobj.w)/2 + 'px';
                         var divtop = sTop + (document.documentElement.clientHeight-menuobj.h)/2;
                         if(divtop > 100) divtop = divtop - 100;
                         menuobj.style.top = divtop + 'px';
                 }
                 if(menuobj.style.clip && !is_opera) {
                         menuobj.style.clip = 'rect(auto, auto, auto, auto)';
                 }
         }
 }
function isUndefined(variable) 
{
        return typeof variable == 'undefined' ? true : false;
}
function fetchOffset(obj) {
        var left_offset = obj.offsetLeft;
        var top_offset = obj.offsetTop;
        while((obj = obj.offsetParent) != null) {
                left_offset += obj.offsetLeft;
                top_offset += obj.offsetTop;
        }
        return { 'left' : left_offset, 'top' : top_offset };
}
//处理文本
function insertContent(target, text) {
        var obj = document.getElementById(target);
        selection = document.selection;
        obj.focus();
        if(!isUndefined(obj.selectionStart)) {
                var opn = obj.selectionStart + 0;
                obj.value = obj.value.substr(0, obj.selectionStart) + text + obj.value.substr(obj.selectionEnd);
        } else if(selection && selection.createRange) {
                var sel = selection.createRange();
                sel.text = text;
                sel.moveStart('character', -strlen(text));
        } else {
                obj.value += text;
        }
        jQuery(obj).trigger('keyup');
}

// 把光标搁到最前面
function locatePoint(target){
        var tea = document.getElementById(target);

        if (!tea)
                return;
        if (tea.setSelectionRange) {
                //setTimeout(function() {
                                tea.setSelectionRange(0, 0); //将光标定位在textarea的开头，需要定位到其他位置的请自行修改
                                tea.focus();
                //              }, 0);
        }else if (tea.createTextRange) {
                var txt=tea.createTextRange();
                txt.moveEnd("character",0-txt.text.length);
                txt.select();
        }
}
 function strlen(str) { 
         return (is_ie && str.indexOf('\n') != -1) ? str.replace(/\r?\n/g, '_').length : str.length; 
 }
//点击回复触发该函数
function replay(tid){
                if (!tid)    
                        return;
		var div_comment = jQuery("#div_comment_"+tid);
		if(div_comment.attr("value")=="1" && div_comment.css('display') == 'none'){
			div_comment.slideToggle("fast");jQuery('#repcomcountfont_' + tid).html("收起");
			return;
		}
                if (div_comment.css('display') == 'block' && div_comment.attr('value')=="1") {
                        div_comment.slideUp('fast');
			jQuery('#repcomcountfont_' + tid).html("回复");
                        return;
                }   
		var html = '';
		//start
            	html += '<div class="album-final-pinglun-huifu">';
                html += '<textarea id="comment_message_rep_'+tid+'" name="message_rep_'+tid+'" rows="3" ></textarea>';
                html += '<div class="clearfix snsinfo_fabiao">';

                html += '<i class="el el-reddit" id="comment_face_rep_'+tid+'" onclick="showFace(this.id, \'comment_message_rep_'+tid+'\');return false;"></i>';
                html += '<input style="height:30px;width:30%;font-size:12px;margin-top:1px;" class="form-control b-email com-nickname-all" name="nickname_rep_'+tid+'" id="com_nickname_rep_'+tid+'" placeholder="昵称(必填)" type="text">';
                html += '<span> <input class="repcom-btn-sure" type="button" value="回复" id="com_repsub'+tid+'" onclick="sendcom('+tid+')"/> </span>';

                html += '</div>';
           	html += '</div> ';
		//end
		html +='<ul class="re-comment-huifu" id="reply_list_'+tid+'" style="clear:both;"></ul>';
		html +='<div class="page-min" id="reply_paginate_'+tid+'"></div>';
               	jQuery('#div_comment_' + tid).html(html).slideToggle('fast');
		jQuery('#repcomcountfont_' + tid).html("收起");
		var page = 1;
		var repcomcount = parseInt(jQuery("#repcomcount_"+tid).html());
		div_comment.attr({value:"1"});
		function reppageselectCallback(page_index,jq){
			getcomrepinfo(tid,page_index + 1);
		}
		var myOffsetrep = jQuery("#snsinfo_get_offset").val();
		jQuery('#reply_paginate_' + tid).pagination(repcomcount,{
			callback:reppageselectCallback,
			items_per_page:myOffsetrep,
			prev_text: '<<',
			next_text: '>>',
			
		},1);
		setNicknameByCookie('get',false);

}

function getcomrepinfo(tid,page){
	var com_type = jQuery("#snsinfo_type").val();
       jQuery.getJSON('/comment/getRepCom?callback=?', {tid: tid, com_type:com_type, page:page, r: Math.random()}, function(data) {
		if (data != 0) {
			var html='';
            var isadmin=false;
			jQuery.each(data.replist, function(i, item) {
                isadmin=false;
				if(item.nickname==""){
					item.nickname = "匿名"+item.id;
				}
                if(item.nickname=="管理员"){
                    isadmin=true;
                }

                html +='<li class="rep-com-row" id="r_row_' + item.id + '">';
                    html +='<div class="admin-ava"><img onerror="this.onerror=null;this.src=\'/ui/system/images/default_avatar/118.jpg\'" src="'+item.avatar+'" alt="'+item.nickname+'" title="'+item.nickname+'" class="img-circle"></div>';
                    html +='<div class="re-info">';
                        html +='<span>';
                            html +='<dd style="float:left;"><a href="javascript:void(0);" id="t_reply_name_'+item.id+'" title="'+item.nickname+'">';
                            if(isadmin) {
                                html += '<i class="el-twitter"></i>管理员';
                            }else{
                                html += '<i class="el-user"></i>' + item.nickname + '';
							}
							html +=	'</a> &nbsp;&nbsp;<time><i class="el-time"></i>'+item.createtime+'</time></dd>';
                            html +='<dd style="float:right;"><a href="javascript:void(0);" username="'+item.nickname+'" onclick="comment.rep_msg_change(' + tid + ', ' + item.id + ')">回复</a></dd>';
                        html +='</span>';
                        html +='<div class=" re-content">'+item.content+'</div>';
                    html +='</div>';
                html +='</li>';
			});

		} else {
		}
		//html +='<li class="rep-com-row"></li>';
		jQuery("#reply_list_"+tid).html(html);
		jQuery('#comment_message_rep_' + tid).focus();
	});
}
function setNicknameByCookie(value,nickname){
	if(value=='set'){
		setCookie('com-nickname',nickname,false);
	}
	if(value=='get'){
		var nickn = getCookie('com-nickname');
		if(nickn!=null && nickn!=""){
			jQuery('.com-nickname-all').val(nickn);
		}
	}
	
}

function sendcom(comid){
	//发送等待提示(完成)，昵称保存(完成)，php关键字过滤和校验(完成)
	var message;
	var pid;
	var nickname,email;
	if(comid === 0){
		message = jQuery('#comment_message').val();pid = 0;
		nickname = jQuery.trim(jQuery('#com_nickname').val());
		email = jQuery('#com_email').val();
	}else{
		message = jQuery('#comment_message_rep_'+comid+"").val();pid = comid;
		message = comment.recovery_href(message);
		nickname =  jQuery.trim(jQuery('#com_nickname_rep_'+comid+"").val());
		email = "";
	}
	var nicknameLeng = XTools.strlen(nickname);
	var emailLeng = XTools.mb_strlen(email,'utf-8');
	if(nickname==""){ layer.alert("官人，昵称不可为空!");return ;}
	if(nicknameLeng>18){ layer.alert("官人，昵称太长!");return ;}
	if(emailLeng>50){ layer.alert("官人，email太长啦!");return ;}
	var sloading = layer.load(2, { shade: [0.6,'#ccc'] });
	message = jQuery.trim(message);
	var photourl = jQuery("#comment_avatar").attr('src');
	var type = jQuery("#snsinfo_type").val();
	var arcid = jQuery.trim(jQuery('#snsinfo_aid').val());
	message     = XTools.verifyStringLen(message);
	if(message === false){
		layer.close(sloading);
	    layer.alert('评论' + XTools.error);
	    if(comid === 0) jQuery('#comment_message').focus();
	    else jQuery("#comment_message_rep_"+comid).focus();
	    return false;
	}
	jQuery.getJSON('/comment/send?callback=?',{content:message,nickname:nickname,avatar:photourl,aid:arcid,pid:pid,com_type:type,email:email},function(data){
		if(data == "0") layer.alert("评论失败,请联系管理员!");
		else if(data == "3") layer.alert("评论字数有误,请修正!");
		else{
			setNicknameByCookie('set',nickname);
			var html = '';
			var climit = parseInt(jQuery("#snsinfo_get_offset").val());
			if(comid === 0) {
                if (data.nickname == "") {
                    data.nickname = "匿名" + data.id;
                }
                html += '<li class="bg-color" style="display:none;border-bottom:none;" id="com_list_li_' + data.id + '">';
                html += '<span class="louceng">(我)</span>';
                html += '<div class="comment-ava"><a href="javascript:void(0)" id="Comment-' + data.id + '" rel="nofollow" title="' + data.nickname + '"><img class="img-circle" onerror="this.onerror=null;this.src=\'/ui/system/images/default_avatar/118.jpg\'" title="' + data.nickname + '" src="' + data.avatar + '" alt="' + data.nickname + '"></a></div>';
                //start comment
                html += '<div class="comment-info" style="width:85%">';
                html += '<div class="comment-line ">';
                //start
                html += '<ul><li style="float:left;border-bottom:none;"><a>';
                if (data.nickname == "管理员") {
                    html += '<i class="el-twitter"></i>';
                } else {
                	html += '<i class="el-user"></i>';
				}
				html+= ''+data.nickname+ '</a></li><li style="float:left;border-bottom:none;"><span title="发表于' +data.createtime+ '"><i class="el-time"></i>' +data.createtime+ '</a></span></li><li style="float:left;border-bottom:none;"><a title="'+data.nickname+' 位于："><i class="el-map-marker">'+data.address+'</i></a></li>';
				html+='<li style="float:right;border-bottom:none;">';
				html+='<a href="javascript:void(0);" aid="'+data.aid+'" pid="'+data.id+'" username="' +data.nickname+ '" onclick="replay(\''+data.id+'\')"><span id="repcomcountfont_'+data.id+'">回复</span>';
				html +='(<em id="repcomcount_'+data.id+'">0</em>)';
				html+='</a>';
				html+='</li></ul>';
				//end
				html+='</div>';
				html +='<div class="comment-content">' +data.content+ '</div>';
				html +='<div id="div_comment_'+data.id+'" class="commentsList repclearfix" style="display:none" value="0"></div>';
				html +='</div>';
				//end comment
				html +='</li>';
				
				var newli=jQuery('#comments');
				newli.prepend(html);
				var replycount = parseInt(jQuery('#replys').html())+1;
				if(replycount == 1) jQuery("#nowebfriendcomment").slideUp();
				jQuery('#replys').html(replycount);
				var oneid = document.getElementById("comments").childNodes.item(0).id;
				if(replycount > climit){
					 var eightid = document.getElementById("comments").childNodes.item(climit).id;
					jQuery("#"+eightid+"").slideUp();
				}	
				jQuery("#"+oneid+"").slideDown();	
				jQuery('#comment_message').val("");
				//分页
			}else{
				var repcomcount = '#repcomcount_'+comid;
				var replycount = parseInt(jQuery(repcomcount).html())+1;
				if(replycount == 1 ) jQuery(repcomcount).attr({style:"color:red;"});
				jQuery(repcomcount).html(replycount);
				var newli = jQuery('#reply_list_'+comid);
                html +='<li class="rep-com-row" style="display:none;" id="r_row_' + data.id + '">';
                    html +='<div class="admin-ava"><img onerror="this.onerror=null;this.src=\'/ui/system/images/default_avatar/118.jpg\'" src="'+data.avatar+'" alt="'+data.nickname+'" title="'+data.nickname+'" class="img-circle"></div>';
                    html +='<div class="re-info">';
                        html +='<span>';
                            html +='<dd style="float:left;"><a href="javascript:void(0);" id="t_reply_name_'+data.id+'" title="'+data.nickname+'">';
							if(data.nickname=="管理员"){
                                html+='<i class="el-twitter"></i>'+data.nickname+'';
							}else {
                                html += '<i class="el-user"></i>' + data.nickname + '';
                            }
				 			html += '</a> &nbsp;&nbsp;<time><i class="el-time"></i>'+data.createtime+'</time></dd>';
                            html +='<dd style="float:right;"><a href="javascript:void(0);" username="'+data.nickname+'" onclick="comment.rep_msg_change(' + comid + ', ' + data.id + ')">回复</a></dd>';
                        html +='</span>';
                        html +='<div class=" re-content">'+data.content+'</div>';
                    html +='</div>';
                html +='</li>';

				newli.prepend(html);
				var oneid = document.getElementById('reply_list_'+comid).childNodes.item(0).id;
				jQuery("#"+oneid+"").slideDown();
				jQuery("#comment_message_rep_"+comid).val("");
				if(replycount > climit){
					 jQuery("#reply_list_"+comid+" li:eq("+climit+")").slideUp();
					//分页
					function reppageselectCallback1(page_index,jq){
						getcomrepinfo(comid,page_index + 1);
					}
					jQuery('#reply_paginate_' + comid).pagination(replycount,{
						callback:reppageselectCallback1,
						items_per_page:climit,
						prev_text: '<<',
						next_text: '>>',
			
					},1);
				}	

				
			}
		}
		layer.close(sloading);
	}
	);
}

//获取指定名称的cookie的值
function getCookie(objName){	
	var arrStr = document.cookie.split("; ");
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == objName) return unescape(temp[1]);
	} 
}

/*评论系统对象*/
var comment={
	uids:{},
	recovery_href: function(str) {
		var item, tmp_reg, tmp_obj;
		if (!str)
			return '';

		str = str.replace(/</g, "&lt;").replace(/>/g, "&gt;");
		for (item in comment.uids) {
			tmp_obj = comment.uids[item];
			tmp_reg = new RegExp("@" + tmp_obj[1], "g");
			str = str.replace(tmp_reg, '<a href="/' + tmp_obj[0] + '">@' + tmp_obj[1] + '</a>');
		} 
		return str;
	},
	clean_href: function(str) {
		var row, uid;
		var reg1 = new RegExp("<a.*?\\.com\\?(\\d+).*?>@?([^@]+?)<\/a>", "ig");
		var reg2 = new RegExp("<[^>]*>", "g");
		comment.uids = {};
		while ((row = reg1.exec(str)) != null) {
			uid = row[1];
			if (!comment.uids[uid]) {
				comment.uids[uid] = [uid, row[2]];
			}
		}
		return str.replace(reg2, '');
	},
	rep_msg_change: function(cid, rid) {
		jQuery('#comment_message_rep_' + cid).val('');
		insertContent('comment_message_rep_' + cid, '回复@' + comment.clean_href(jQuery('#t_reply_name_' + rid).html().replace(/\&amp;/g,'&'))+"：  ");

	},
}
