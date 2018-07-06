<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <%-- resource css --%>
    <%@ include file="/WEB-INF/common/resource_css.jsp" %>
 
    <style>
        .tile_count .tile_stats_count:before {
            margin-top: 0px;
        }

        .tile_count .tile_stats_count {
            margin: 0;
        }

        .tile_count .tile_stats_count .count {
            font-size: 48px;
            color: #1ABB9C;
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
                		<!-- 设备登录提醒 -->
                    <!-- <div class="alert alert-success alert-dismissible fade in" role="alert">
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                      </button>
                      <i class="fa fa-desktop"></i><span style="padding: 0 5px 0 15px;">PC</span>后台已登录
                    </div> -->
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">首页</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <div class="row tile_count">

                            <!--显示量数-->
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-align-left"></i> 上月进件总数</span>
                                <div class="count" style="color:#73879c;">${lastNewOrderCount}<span style="font-size:13px;">个</span></div>
                                <%--<span class="count_bottom"><i class="green">4% </i> From last Week</span>--%>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-align-left"></i> 本月进件总数</span>
                                <div class="count">${nowNewOrderCount}<span style="font-size:13px;">个</span></div>
                                <%--<span class="count_bottom"><i class="green"><i
                                        class="fa fa-sort-asc"></i>3% </i> From last Week</span>--%>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-align-center"></i> 上月通过总数</span>
                                <div class="count" style="color:#73879c;">${lastPassOrderCount}<span style="font-size:13px;">个</span></div>
                                <%--<span class="count_bottom"><i class="green"><i
                                        class="fa fa-sort-asc"></i>34% </i> From last Week</span>--%>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-align-center"></i> 本月通过总数</span>
                                <div class="count">${nowPassOrderCount}<span style="font-size:13px;">个</span></div>
                                <%--<span class="count_bottom"><i class="red"><i
                                        class="fa fa-sort-desc"></i>12% </i> From last Week</span>--%>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-jpy"></i> 上月放款总数</span>
                                <div class="count" style="color:#73879c;"><fmt:formatNumber maxFractionDigits="0" pattern="0" type="number" value="${lastLoanOrderSum / 10000}"  /><span style="font-size:13px;">万</span></div>
                                <%--<span class="count_bottom"><i class="green"><i
                                        class="fa fa-sort-asc"></i>34% </i> From last Week</span>--%>
                            </div>

                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-jpy"></i> 本月放款总数</span>
                                <div class="count"><fmt:formatNumber maxFractionDigits="0" pattern="0" type="number" value="${nowLoanOrderSum / 10000}" /><span style="font-size:13px;">万</span></div>
                                <span class="count_bottom">
                                    <%--<i class="green">--%>
                                        <%--<i class="fa fa-sort-asc"></i>--%>
                                        <%--34%--%>
                                    <%--</i> From last Week--%>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="x_title">
                                                    <h2 style="text-align: left;width: 100%;font-size:18px;">
                                                        进件总量与审核通过总量</h2>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <div class="demo-container" style="height:400px">
                                                            <div id="lineImgId" style="height: 100%"
                                                                 class="demo-placeholder"></div>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
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
<!-- /page content -->

<%-- footer --%>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>

<script src="${pageContext.request.contextPath}/build/js/echarts.min.js"></script>

<script type="text/javascript">

    
	$(function() {
		// 折线统计图
		fnEchartsMap();
		// 登录提醒
		fnPNotify('登录提醒', 'success', '${user.userAccount.realName}，欢迎使用美分期后台管理系统！', 15000, 'green' );
	});
	
	// 折线统计图
	function fnEchartsMap() {
		var passOrderList = ${passOrderList};
		var newOrderList = ${newOrderList};
		var days = ${days};
		var line = echarts.init(document.getElementById('lineImgId'));
		var option = {
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '进件总量', '审核通过' ]
			},
			toolbox : {
				show : true,
				feature : {
					dataZoom : {
						yAxisIndex : 'none'
					},
					dataView : {
						readOnly : false
					},
					magicType : {
						type : [ 'line', 'bar' ]
					},
					restore : {},
					saveAsImage : {}
				}
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : days
			},
			yAxis : {
				type : 'value',
				axisLabel : {
					formatter : '{value}'
				}
			},
			series : [ {
				name : '进件总量',
				type : 'line',
				data : newOrderList,

			}, {
				name : '审核通过',
				type : 'line',
				data : passOrderList,

			}]
		};
		line.setOption(option);
	}
</script>
</body>
</html>