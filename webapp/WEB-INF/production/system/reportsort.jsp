<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ include file="/WEB-INF/common/resource_jstl.jsp" %>--%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>美分期后台管理系统</title>
    <!-- Boss Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/boss.css" rel="stylesheet">
    <%@ include file="/WEB-INF/common/resource_css.jsp" %>
    <style type="text/css">
        a:hover {
            text-decoration: underline;
        }

        .erji-daohang {
            list-style: none;
            float: left;
            display: block;
            width: 25%;
            text-align: center;
            line-height: 4;
            background: #29BB9C;
        }

        .kuangkuang {
            list-style: none;
            padding: 0;
        }

        .jibie {
            width: 70%;
            text-align: center;
            line-height: 40px;
            background: rgba(116, 135, 155, 1);
            margin: 10px auto 0;
            color: #FFFFFF;
            position: relative;
        }

        .dasanjiao .after {
            z-index: 10;
            content: "";
            position: absolute;
            top: 0;
            left: 100%;
            border: 0 solid #FFFFFF;
            border-width: 55.5px 0 55.5px 30px;
            border-bottom-color: #29BB9C;
            border-top-color: #29BB9C;
        }

        .after:after {
            content: "";
            position: absolute;
            top: -55.5px;
            left: -34px;
            border: 0 solid #29BB9C;
            border-width: 55.5px 0 55.5px 30px;
            border-bottom-color: transparent;
            border-top-color: transparent;
        }

        h2 {
            font-size: 26px;
            line-height: 2;
            text-align: right;
            padding-right: 10px;
        }

        .shijian {
            font-size: 20px;
            line-height: 1.471;
            text-align: right;
            padding-right: 10px;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        .form-group {
            margin-bottom: 0px;
        }

        label {
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        /*#wrap{
              width: 400px;
              height: 470px;
              margin: 50px auto;
              padding-top: 20px;
              border: 1px solid #ccc;
              overflow: auto;
              overflow-x: hidden;
              position: relative;
          }*/
        .between_lines_drag {
            margin-top: 10px;
            line-height: 40px;
            height: 40px;
            border: 1px solid #ccc;
            font: 14px/1.5 "微软雅黑";
            list-style: none;
            text-decoration: none;
            cursor: move;
        }

        .between_lines_drag:hover {
            background-color: #f6f6f6;
        }
    </style>
</head>

<body class="nav-md">
<%-- menu profile --%>
<%@ include file="/WEB-INF/common/menu_profile.jsp" %>
<%-- sidebar menu --%>
<%@ include file="/WEB-INF/common/sidebar_menu.jsp" %>
<%-- sidebar footer --%>
<%@ include file="/WEB-INF/common/sidebar_footer.jsp" %>
<%-- top navigation --%>
<%@ include file="/WEB-INF/common/top_nav.jsp" %>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="row title_left" style="width: 100%;">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>系统设置</li>
                        <li>运营商采集配置</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <div class="erji-daohang-kuang" style="margin: 0 auto;">

                            <!--运营商采集配置-->

                            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 10px;">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">运营商采集配置</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <form class="form-horizontal form-label-left">
                                            <div class="form-group" style="margin-bottom: 20px;">通过拖动重新设置运营商采集的优先顺序
                                            </div>


                                            <div class="form-group" id="wrap"
                                                 style="border: 1px solid #ccc;position:relative;padding: 3px;">
                                                <!--<div id="wrap">-->
                                                <ul style="margin: 0;padding: 0;">
                                                    <li class="between_lines_drag">
                                                        <div style="text-align: center; line-height: 40px;width: 33.33%;float: left;">
                                                            1
                                                        </div>
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;"
                                                             id="firstId">
                                                            <%--聚信立报告--%>
                                                        </div>
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;">
                                                            <i class="fa fa-arrows"></i></div>
                                                    </li>
                                                    <li class="between_lines_drag">
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;">
                                                            2
                                                        </div>
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;"
                                                             id="secondId">
                                                            <%--同盾报告--%>
                                                        </div>
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;">
                                                            <i class="fa fa-arrows"></i></div>
                                                    </li>
                                                    <li class="between_lines_drag">
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;">
                                                            3
                                                        </div>
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;"
                                                             id="thirdId">
                                                            <%--魔蝎报告--%>
                                                        </div>
                                                        <div style="text-align: center;line-height: 40px;width: 33.33%;float: left;">
                                                            <i class="fa fa-arrows"></i></div>
                                                    </li>
                                                </ul>
                                                <!--</div>-->
                                            </div>
                                            <div class="ln_solid" style="    border-top: 2px solid #e5e5e5;"></div>
                                            <button type="button" id="sure" class="btn btn-primary"
                                                    style="float: right;">确定
                                            </button>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script type="text/javascript">
    (function ($) {
        /**
         * Author: https://github.com/Barrior
         *
         * DDSort: drag and drop sorting.
         * @param {Object} options
         *        target[string]:        可选，jQuery事件委托选择器字符串，默认'li'
         *        cloneStyle[object]:    可选，设置占位符元素的样式
         *        floatStyle[object]:    可选，设置拖动元素的样式
         *        down[function]:        可选，鼠标按下时执行的函数
         *        move[function]:        可选，鼠标移动时执行的函数
         *        up[function]:        可选，鼠标抬起时执行的函数
         */
        $.fn.DDSort = function (options) {
            var $doc = $(document),
                fnEmpty = function () {
                },

                settings = $.extend(true, {

                    down: fnEmpty,
                    move: fnEmpty,
                    up: fnEmpty,

                    target: 'li',
                    cloneStyle: {
                        'background-color': '#eee'
                    },
                    floatStyle: {
                        //用固定定位可以防止定位父级不是Body的情况的兼容处理，表示不兼容IE6，无妨
                        'position': 'fixed',
                        'box-shadow': '10px 10px 20px 0 #eee',
                        /* 'webkitTransform': 'rotate(4deg)',
                        'mozTransform': 'rotate(4deg)',
                        'msTransform': 'rotate(4deg)',
                        'transform': 'rotate(4deg)' */
                    }

                }, options);

            return this.each(function () {

                var that = $(this),
                    height = 'height',
                    width = 'width';

                if (that.css('box-sizing') == 'border-box') {
                    height = 'outerHeight';
                    width = 'outerWidth';
                }

                that.on('mousedown.DDSort', settings.target, function (e) {
                    //只允许鼠标左键拖动
                    if (e.which != 1) {
                        return;
                    }

                    //防止表单元素失效
                    var tagName = e.target.tagName.toLowerCase();
                    if (tagName == 'input' || tagName == 'textarea' || tagName == 'select') {
                        return;
                    }

                    var THIS = this,
                        $this = $(THIS),
                        offset = $this.offset(),
                        disX = e.pageX - offset.left,
                        disY = e.pageY - offset.top,

                        clone = $this.clone()
                            .css(settings.cloneStyle)
                            .css('height', $this[height]())
                            .empty(),

                        hasClone = 1,

                        //缓存计算
                        thisOuterHeight = $this.outerHeight(),
                        thatOuterHeight = that.outerHeight(),

                        //滚动速度
                        upSpeed = thisOuterHeight,
                        downSpeed = thisOuterHeight,
                        maxSpeed = thisOuterHeight * 3;

                    settings.down.call(THIS);

                    $doc.on('mousemove.DDSort', function (e) {
                        if (hasClone) {
                            $this.before(clone)
                                .css('width', $this[width]())
                                .css(settings.floatStyle)
                                .appendTo($this.parent());

                            hasClone = 0;
                        }

                        var left = e.pageX - disX,
                            top = e.pageY - disY,

                            prev = clone.prev(),
                            next = clone.next().not($this);

                        $this.css({
                            left: left,
                            top: top
                        });

                        //向上排序
                        if (prev.length && top < prev.offset().top + prev.outerHeight() / 2) {

                            clone.after(prev);

                            //向下排序
                        } else if (next.length && top + thisOuterHeight > next.offset().top + next.outerHeight() / 2) {

                            clone.before(next);

                        }

                        /**
                         * 处理滚动条
                         * that是带着滚动条的元素，这里默认以为that元素是这样的元素（正常情况就是这样），如果使用者事件委托的元素不是这样的元素，那么需要提供接口出来
                         */
                        var thatScrollTop = that.scrollTop(),
                            thatOffsetTop = that.offset().top,
                            scrollVal;

                        //向上滚动
                        if (top < thatOffsetTop) {

                            downSpeed = thisOuterHeight;
                            upSpeed = ++upSpeed > maxSpeed ? maxSpeed : upSpeed;
                            scrollVal = thatScrollTop - upSpeed;

                            //向下滚动
                        } else if (top + thisOuterHeight - thatOffsetTop > thatOuterHeight) {

                            upSpeed = thisOuterHeight;
                            downSpeed = ++downSpeed > maxSpeed ? maxSpeed : downSpeed;
                            scrollVal = thatScrollTop + downSpeed;
                        }

                        that.scrollTop(scrollVal);

                        settings.move.call(THIS);

                    })
                        .on('mouseup.DDSort', function () {

                            $doc.off('mousemove.DDSort mouseup.DDSort');

                            //click的时候也会触发mouseup事件，加上判断阻止这种情况
                            if (!hasClone) {
                                clone.before($this.removeAttr('style')).remove();
                                settings.up.call(THIS);
                            }
                        });

                    return false;
                });
            });
        };

    })(jQuery);


    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/reportsort/findReportsortSort.do",
            type: "post",
            data: "",
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                var values = data.value.split(",");
                console.log(values);
                $("#thirdId").html(" ")
                $("#secondId").html(" ")
                $("#firstId").html(" ")
                $("#thirdId").html(values[2])
                $("#secondId").html(values[1])
                $("#firstId").html(values[0])
            },
            error: function (e) {
                console.log(e);
                location.reload();
            }
        });
    });


    $('#wrap').DDSort({
        target: 'li',
        floatStyle: {
            'border': '1px solid #ccc',
            'background-color': '#fff'
        }
    });

    $('#sure').click(function () {
//        console.log($('#wrap li:nth-child(1)'));
//        $('#wrap li:nth-child(1)').find('div:nth-child(1)').text(1);
//        $('#wrap li:nth-child(2)').find('div:nth-child(1)').text(2);
//        $('#wrap li:nth-child(3)').find('div:nth-child(1)').text(3);
        // 获取数据
        var first = $('#wrap li:nth-child(1)').find('div:nth-child(2)').html();
        var second = $('#wrap li:nth-child(2)').find('div:nth-child(2)').html();
        var third = $('#wrap li:nth-child(3)').find('div:nth-child(2)').html();
        var values = first + "," + second + "," + third;
        console.log(values);

        var params = {
            "value": values
        };
        console.log(params);
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/reportsort/updateReportsortSort.do",
            <%--url: "${pageContext.request.contextPath}/mfq/reportsort/updateReportsortSort.do?value="+values,--%>
            type: "post",
            data: params,
            success: function (obj) {
                if (obj.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "修改失败",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    location.reload();
                }
            },
            error: function (e) {
                console.log(e);
                location.reload();
            }
        });
    })

</script>
</body>
</html>