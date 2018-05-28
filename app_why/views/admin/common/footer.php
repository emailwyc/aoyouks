<div class="ace-settings-container" id="ace-settings-container">
    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
        <i class="icon-cog bigger-150"></i>
    </div>

    <div class="ace-settings-box" id="ace-settings-box">
        <div>
            <div class="pull-left">
                <select id="skin-colorpicker" class="hide">
                    <option data-skin="default" value="#438EB9">#438EB9</option>
                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                </select>
            </div>
            <span>&nbsp; 选择皮肤</span>
        </div>

        <div>
            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
            <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
        </div>

        <div>
            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
            <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
        </div>

        <div>
            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
            <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
        </div>

        <div>
            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
            <label class="lbl" for="ace-settings-rtl">切换到左边</label>
        </div>

        <div>
            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
            <label class="lbl" for="ace-settings-add-container">
                切换窄屏
                <b></b>
            </label>
        </div>
    </div>
</div><!-- /#ace-settings-container -->
</div><!-- /.main-container-inner -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="icon-double-angle-up icon-only bigger-110"></i>
</a>
</div><!-- /.main-container -->
<!-- basic scripts -->

<!--[if !IE]> -->
<!--<script src="/ui/admin/assets/js/jquery203.min.js"></script>-->
<!-- <![endif]-->

<!--[if IE]-->
<!--<script src="/ui/admin/assets/js/jquery112.min.js"></script>-->
<!--[endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='/ui/admin/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='/ui/admin/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='/ui/admin/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
</script>
<script src="/ui/admin/assets/js/bootstrap.min.js"></script>
<script src="/ui/admin/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="/ui/admin/assets/js/excanvas.min.js"></script>
<![endif]-->

<script src="/ui/admin/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/ui/admin/assets/js/jquery.ui.touch-punch.min.js"></script>
<!--new start-->
<script src="/ui/admin/assets/js/fuelux/fuelux.spinner.min.js"></script>
<script src="/ui/admin/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="/ui/admin/assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="/ui/admin/assets/js/date-time/moment.min.js"></script>
<script src="/ui/admin/assets/js/date-time/daterangepicker.min.js"></script>
<script src="/ui/admin/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="/ui/admin/assets/js/jquery.knob.min.js"></script>
<script src="/ui/admin/assets/js/jquery.autosize.min.js"></script>
<script src="/ui/admin/assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script src="/ui/admin/assets/js/jquery.maskedinput.min.js"></script>
<script src="/ui/admin/assets/js/bootstrap-tag.min.js"></script>
<script src="/ui/admin/assets/js/jquery.dataTables.min.js"></script>
<script src="/ui/admin/assets/js/jquery.dataTables.bootstrap.js"></script>

<script src="/ui/admin/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="/ui/admin/assets/js/jqGrid/i18n/grid.locale-en.js"></script>

<script type="text/javascript" src="/ui/system/js/tooltip.js"></script>
<!--new end-->
<script src="/ui/admin/assets/js/chosen.jquery.min.js"></script>
<script src="/ui/admin/assets/js/jquery.slimscroll.min.js"></script>
<script src="/ui/admin/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="/ui/admin/assets/js/jquery.sparkline.min.js"></script>
<script src="/ui/admin/assets/js/flot/jquery.flot.min.js"></script>
<script src="/ui/admin/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="/ui/admin/assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->
<script src="/ui/admin/assets/js/ace-elements.min.js"></script>
<script src="/ui/admin/assets/js/ace.min.js"></script>
<!-- inline scripts related to this page -->


<script type="text/javascript">

    jQuery(function($) {
        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
        });
        $('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('.tab-content')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }


        $('.dialogs,.comments').slimScroll({
            height: '300px'
        });


        //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
        //so disable dragging when clicking on label
        var agent = navigator.userAgent.toLowerCase();
        if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
            $('#tasks').on('touchstart', function(e){
                var li = $(e.target).closest('#tasks li');
                if(li.length == 0)return;
                var label = li.find('label.inline').get(0);
                if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
            });

        $('#tasks').sortable({
                opacity:0.8,
                revert:true,
                forceHelperSize:true,
                placeholder: 'draggable-placeholder',
                forcePlaceholderSize:true,
                tolerance:'pointer',
                stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
                    $(ui.item).css('z-index', 'auto');
                }
            }
        );
        $('#tasks').disableSelection();
        $('#tasks input:checkbox').removeAttr('checked').on('click', function(){
            if(this.checked) $(this).closest('li').addClass('selected');
            else $(this).closest('li').removeClass('selected');
        });


    })
</script>
<script type="text/javascript" src="/ui/system/js/layer.js"></script>
</body>
</html>

