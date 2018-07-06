<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/resource_jstl.jsp" %>
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
    <%-- resource css --%>
    <%@ include file="/WEB-INF/common/resource_css.jsp" %>
    <style type="text/css">
        .col-sm-7 {
            margin: 2% 0;
        }

        a:hover {
            text-decoration: underline;
        }

        #datatable_length {
            width: 100%;
        }

        #datatable_length {
            float: right;
        }

        .menu_section {
            margin-bottom: 0;
        }

        .erji-daohang {
            list-style: none;
            float: left;
            display: block;
            width: 33.33%;
            text-align: center;
            line-height: 4;
            border: 1px solid #A7A7A7;
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
            content: "";
            position: absolute;
            top: 0;
            left: 100%;
            border: 0 solid #A7A7A7;
            border-width: 26px 0 26px 30px;
            border-bottom-color: #FFFFFF;
            border-top-color: #FFFFFF;
        }

        .after:after {
            content: "";
            position: absolute;
            top: -26px;
            left: -31px;
            border: 0 solid #FFFFFF;
            border-width: 26px 0 26px 30px;
            border-bottom-color: transparent;
            border-top-color: transparent;
        }

        .tab-yiji:after {
            content: "";
            position: absolute;
            top: 0;
            left: 100%;
            border: 0 solid #29ba9c;
            border-width: 20px 0 20px 10px;
            border-bottom-color: #FFFFFF;
            border-top-color: #FFFFFF;
        }

        .clickme {
            background-color: #2aabd2;
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
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="row title_left">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>商户管理</li>
                        <li>商户类型管理</li>
                        <li>二级分类</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <div class="erji-daohang-kuang" style="margin: 0 auto;width: 80%;">
                            <ul class="kuangkuang" style="height: 60px;">
                                <li class="erji-daohang dasanjiao" style=";border-right: 0;position: relative;">行业分类
                                    <div class="after"></div>
                                </li>
                                <li class="erji-daohang dasanjiao"
                                    style=";border-right: 0;border-left: 0;position: relative;">一级分类
                                    <div class="after"></div>
                                </li>
                                <li class="erji-daohang " style="border-left: 0;">二级分类</li>
                            </ul>
                            <ul class="kuangkuang">
                                <li class="tab-qiehuan" id="yiji" style="width: 33.33%;float: left;">
                                    <%--<div class="tab-yiji1 jibie" onclick="loadNext()">眼科13213213</div>--%>
                                    <div class="tab-yiji1 jibie"
                                         onclick="loadNext('35bda7ba170b4a269c84f558513386b4', 2)">眼科2131312
                                    </div>
                                    <div class="tab-yiji1 jibie">口腔</div>
                                    <div class="tab-yiji1 jibie">生活美容</div>
                                    <div class="tab-yiji1 jibie">植发</div>
                                    <div class=" tab-yiji1 jibie">整形</div>
                                </li>
                                <li class="tab-qiehuan2" id="erji" style="width: 33.33%;float: left;display: none;">
                                    <div class="tab-erji1 jibie">眼底疾病</div>
                                    <div class="tab-erji1 jibie">青光眼</div>
                                    <div class="tab-erji1 jibie">生活美容</div>
                                    <div class="tab-erji1 jibie">植发</div>
                                    <div class=" tab-erji1 jibie">整形</div>
                                </li>
                                <li class="tab-qiehuan3" id="sanji" style="width: 33.33%;float: left;display: none;">
                                    <%--<div class="tab-sanji jibie">眼科</div>
                                    <div class="tab-sanji jibie">口腔</div>
                                    <div class="tab-sanji jibie">生活美容</div>
                                    <div class="tab-sanji jibie">植发</div>
                                    <div class="tab-sanji jibie">整形</div>--%>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<%-- footer --%>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<!-- footer content -->
<!-- /footer content -->
</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".tab-yiji1").on('click', function () {
            $(this).css('background', '#29ba9c').siblings().css('background', 'rgba(116, 135, 155, 1)')
            $(this).addClass('tab-yiji').siblings().removeClass('tab-yiji')
            $('#erji').css('display', 'block')
        })

        $(".tab-erji1").on('click', function () {
            $(this).css('background', '#29ba9c').siblings().css('background', 'rgba(116, 135, 155, 1)')
            $(this).addClass('tab-yiji').siblings().removeClass('tab-yiji')
            $('#sanji').css('display', 'block')
        })
    })

    $(function () {
        loadNext(null, 1);
    })

    function loadNext(pid, tier) {
//        $("#" + thisId).css('background', '#29ba9c').siblings().css('background', 'rgba(116, 135, 155, 1)');
//        $(".tab-yiji1").css('background', '#29ba9c').siblings().css('background', 'rgba(116, 135, 155, 1)');
        var url = '${pageContext.request.contextPath}/mfq/store/findStoreType.do';
        var param = {};
        if (pid != null) {
            param["pid"] = pid;
            if (tier != 4) {
                $("#" + pid).css('background', '#29ba9c').siblings().css('background', 'rgba(116, 135, 155, 1)');
                $("#" + pid).addClass('tab-yiji').siblings().removeClass('tab-yiji')
            }
        }
        $.ajax({
            type: "POST",
            url: url,
            data: param,
            dataType: "json",
            success: function (data) {
                console.log(data);
                var id;
                if (tier == 1) {
                    id = 'yiji';
                } else if (tier == 2) {
                    id = 'erji';
                } else if (tier == 3) {
                    id = 'sanji';
                }

                tier = tier + 1;
                var html = '';
                $("#" + id).html(html);
                $("#" + id).show();
                for (var i = 0; i < data.length; i++) {
                    console.log(data.name);
                    html = html + '<div class="tab-yiji1 jibie" id="' + data[i].id + '" onclick="loadNext(\'' + data[i].id + '\',' + tier + ')">' + data[i].name + '</div>'
                }
                console.log(html);
                $("#" + id).html(html);
            }
        });
    }
</script>

</body>
</html>