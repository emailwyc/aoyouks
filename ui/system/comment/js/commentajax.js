$(document).ready(function() {
    	bindLenVerify('comment_message', 'wrap_letter_leninfo_id');
		//变量定义
    	var arcid = jQuery.trim(jQuery('#snsinfo_arcid').val());
		//随机更新头像
	reloadMyAvatar('comment_avatar',false);

});

/*AJAX刷新评论*/ 
function refreshComment(arcid, type, page, countall)
{
        jQuery.getJSON('/comment/getcomment?callback=?',{aid:arcid,com_type:type,page:page, r:Math.random()},function(data){
		if(data != "0")
		{
			var html='';
			var louceng = jQuery("#snsinfo_get_louceng").val();
			var louceng_offset = jQuery("#snsinfo_get_offset").val();
			var louceng_start = 0;
			if(louceng=="true"){
				louceng_start = (Math.ceil(countall/louceng_offset)-page)*louceng_offset+(countall%louceng_offset);
			}
			if(data.clist != null || data.clist != ""){
				var cct = data.rcount;
				jQuery.each(data.clist, function(i, item) {
					if(item.nickname==""){
						item.nickname = "匿名"+item.id;
					}
					html +='<li class="bg-color" style="border-bottom:none;" id="com_list_li_'+item.id+'">'
					if(louceng=="true"){
						html +='<span class="louceng">'+louceng_start+'楼</span>';
						louceng_start-=1;
					}
					html +='<div class="comment-ava"><a href="javascript:void(0)" id="Comment-'+item.id+'" rel="nofollow" title="' +item.nickname+ '"><img class="img-circle" onerror="this.onerror=null;this.src=\'/ui/system/images/default_avatar/118.jpg\'" title="' +item.nickname+ '" src="'+item.avatar+'" alt="' +item.nickname+ '"></a></div>';
					//start comment
					html +='<div class="comment-info" style="width:85%">';
					html +='<div class="comment-line ">';
					//start
					html +='<ul><li style="float:left;border-bottom:none;"><a>';
					if(item.nickname=="管理员"){
                        html +=	'<i class="el-twitter"></i>';
					}else{
                        html +=	'<i class="el-user"></i>';
					}
					html +=''+item.nickname+ '</a></li><li style="float:left;border-bottom:none;"><span title="发表于' +item.createtime+ '"><i class="el-time"></i>' +item.createtime+ '</a></span></li><li style="float:left;border-bottom:none;"><a title="'+item.nickname+' 位于："><i class="el-map-marker"></i>'+item.address+'</a></li>';
					html+='<li style="float:right;border-bottom:none;">';
					html+='<a href="javascript:void(0);" aid="'+item.aid+'" pid="'+item.id+'" username="' +item.nickname+ '" onclick="replay(\''+item.id+'\')"><span id="repcomcountfont_'+item.id+'">回复</span>';
					if(eval("cct['"+item.id+"']")==null || eval("cct['"+item.id+"']")=='undefine'){
						html +='(<em id="repcomcount_'+item.id+'">0</em>)';
					}else{
						html +='(<em id ="repcomcount_'+item.id+'" style=color:red>'+eval("cct['"+item.id+"']")+'</em>)';
					}
					html+='</a>';
					html+='</li></ul>';
					//end
					html+='</div>';
					html +='<div class="comment-content">' +item.content+ '</div>';
					html +='<div id="div_comment_'+item.id+'" class="commentsList repclearfix" style="display:none" value="0"></div>';
					html +='</div>';
					//end comment



					html +='</li>';

				});

			}else{
				html = "<div id='nowebfriendcomment' class='comment-area'> <h4 class='index-title'><i class='el-comment-alt'></i> 亲，沙发正空着，还不快来抢？ </h4> </div>";
			}
			jQuery('#comments').html('');
			jQuery('#comments').html(html);
		}
        });
}

/*得到评论总数*/
function getCommentCount(arcid, type,myOffset)
{
	jQuery.getJSON('/comment/getcommentcount?callback=?',{arcid:arcid, com_type:type, r:Math.random()},function(data){
		if(data != '0')
		{
			function pageselectCallback(page_index,jq){
				refreshComment(arcid,type,page_index + 1,data);
			}
			jQuery('#replys').html(data);
			jQuery('#paginate').html('');
			jQuery('#paginate').pagination(data,{
				callback:pageselectCallback,
				items_per_page:myOffset
			});
		}else
			jQuery('#comments').html('<div id="nowebfriendcomment" class="comment-area"> <h4 class="index-title"><i class="el-comment-alt"></i> 亲，沙发正空着，还不快来抢？ </h4> </div>');
	});
}

//初始化评论
$(document).ready(function(){
    	var arcid = jQuery.trim(jQuery('#snsinfo_aid').val());
    	var type = jQuery("#snsinfo_type").val();
    	var myOffset = jQuery("#snsinfo_get_offset").val();
        getCommentCount(arcid,type,myOffset);
		setNicknameByCookie('get',false);
});
