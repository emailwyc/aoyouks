//当前连接高亮
$(document).ready(function() {
    var curUrl = String(window.location);
    var curUrlSt = false;

    $('.nav-list li a').each(function () {
        if (curUrl.indexOf($($(this))[0].href) != -1) {
            curUrlSt = true;
            $(this).parent("li").addClass('active');
            if ($(this).attr("menu-two") == "true") {
                $(this).parents(".menu-two").addClass('active open');
            }
        }
    });
    if (curUrlSt == false) {
        $('.nav-default').addClass('active');
    }
});


//处理图片

function getCheckBoxVal(name){
    var box = document.getElementsByName(name);
    var objArray = box.length;
    var chestr  = new Array();
    for(var i=0;i<objArray;i++){
        if(box[i].checked == true){
            chestr.push(box[i].value);
        }
    }
    return chestr;
}
function updateimgone(w,h,tp,thumb) {
    $(document).on("change", ".jzr-form .img-add-photo input[type=file]", function () {
        $(this).parent(".img-add-photo").addClass("zhuan11");
        var f = $(this);
        if (f.val() == "") {
            layer.msg("请上传图片");
            f.parent(".img-add-photo").removeClass("zhuan11");
            return false;
        } else {
            if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG|JPEG)$/.test(f.val())) {
                layer.msg("图片类型必须是.gif,jpeg,jpg,png中的一种");
                f.parent(".img-add-photo").removeClass("zhuan11");
                return false;
            }
        }
        var canvas = document.createElement("canvas");
        var img = new Image();
        img.onload = function () {
            var width = w;
            var height = h;

            var target_w = width;
            var target_h = height;

            canvas.width = target_w;
            canvas.height = target_h;
            canvas.getContext("2d").drawImage(img, 0, 0, target_w, target_h);
            var imgData = canvas.toDataURL();
            imgData = imgData.replace('data:image/png;base64,', '')
            var imagedata = encodeURIComponent(imgData);
            if(thumb!="") {
                var img_data = {"img_info": imagedata, "img_type": "png", "tp": tp, "thumb": thumb}
            }else{
                var img_data = {"img_info": imagedata, "img_type": "png","tp":tp,"thumb":""}
            }
            $.ajax({
                type: "post",
                url: "/admin/json/uploadImg",
                async: false,
                data: img_data,
                dataType: "json",
                beforeSend: function () {

                },
                success: function (data) {
                    if (data.code == 1) {
                        var img = data.msg;
                        var thumb = img.replace('.png', '.png');
                        var img2 = new Image();
                        img2.onload = function () {
                            f.parent(".img-add-photo").removeClass("zhuan11");
                            var html = "";
                            html+="<img data-action=\"zoom\" src=\"" + img2.src + "\" alt=\"\" /><input name=\""+tp+"\" type=\"hidden\" value=\"" + img + "\" />"
                            $(".jzr-form .img-show").empty().append(html);
                        }
                        img2.src = thumb;
                    } else {
                        layer.msg(data.msg);
                    }
                }
            })
        }
        if(typeof FileReader != 'undefined'){
            var reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload=function(e){
                img.src=this.result;
            };
        }else{
            if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
                this.select();
                img.src=document.selection.createRange().text;
            }
        }
    })
}

function albumaddimg(w,h,tp,cid,thumb) {
    $(document).on("change", ".jzr-form .img-add input[type=file]", function () {
        $(this).parent(".img-add").addClass("zhuan11");
        var f = $(this);
        if (f.val() == "") {
            layer.msg("请上传图片");
            f.parent(".img-add").removeClass("zhuan11");
            return false;
        } else {
            if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG|JPEG)$/.test(f.val())) {
                layer.msg("图片类型必须是.gif,jpeg,jpg,png中的一种");
                f.parent(".img-add").removeClass("zhuan11");
                return false;
            }
        }
        var canvas = document.createElement("canvas");
        var img = new Image();
        img.onload = function () {
            var width=w;
            var height=h;
            var bor = img.width > img.height ? 1 : 0;
            if(bor){
                if(img.width > width){
                    var target_w = width;
                    var target_h = parseInt(width/img.width*img.height);
                }else{
                    var target_w = img.width;
                    var target_h = img.height;
                }
            }else{
                if(img.height > height){
                    var target_w = parseInt(height/img.height*img.width);
                    var target_h = height;
                }else{
                    var target_w = img.width;
                    var target_h = img.height;
                }
            }
            canvas.width = target_w;
            canvas.height = target_h;
            canvas.getContext("2d").drawImage(img,0,0,target_w,target_h);
            var imgData = canvas.toDataURL();
            imgData = imgData.replace('data:image/png;base64,','')
            var imagedata = encodeURIComponent(imgData);
            if(thumb!="") {
                var img_data = {"img_info": imagedata, "img_type": "png", "tp": tp,"cid":cid, "thumb": thumb}
            }else{
                var img_data = {"img_info": imagedata, "img_type": "png","tp":tp,"cid":cid,"thumb":""}
            }
            $.ajax({
                type: "post",
                url: "/admin/album/photo_add",
                async: false,
                data: img_data,
                dataType: "json",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data.code == 1) {
                        var img = data.msg;
                        var thumb = img.replace('.png', '.png');
                        var img2 = new Image();
                        img2.onload = function () {
                            f.parent(".img-add").removeClass("zhuan11");
                            var html = "";
                            html += '<li class="delMark'+data.aid+'">';
                            html += '<img src="'+img+'" data-action="zoom" data-scale="'+data.data.scale+'" />';
                            html += ' <div class="tools tools-bottom">';
                             html+=  '<a href="javascript:void(0)" onclick="del_func('+data.aid+')"><i class="icon-remove red"></i></a>';
                            html+='</div>';
                            html+='</li>';
                            $(".jzr-form .img-show").prepend(html);
                            var count = parseInt($(".allcount").html())+1;
                            $(".allcount").html(count);
                        }
                        img2.src = thumb;
                    } else {
                        layer.msg(data.msg);
                    }
                }
            })
        }
        if(typeof FileReader != 'undefined'){
            var reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload=function(e){
                img.src=this.result;
            };
        }else{
            if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
                this.select();
                img.src=document.selection.createRange().text;
            }
        }
    })
}

