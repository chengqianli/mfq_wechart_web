<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <!--面包屑开始位置-->
        <div class="page-title">
            <div class="row title_left" style="width: 100%;">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">运营中心</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">用户概况</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!--面包屑结束位置-->

        <div class="clearfix"></div>

        <!--核心内容区域开始位置-->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <input type="hidden" value="${handleType}" name="handleType" id="handleType">
                        <input type="hidden" value="${startDate}" name="startDate" id="startDate">
                        <input type="hidden" value="${endDate}" name="endDate" id="endDate">
                        <!--左侧核心内容区开始位置-->
                        <div class="col-md-6 col-xs-12" style="margin-top: 10px;">
                            <!--用户概况开始位置-->
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">用户概况</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">用户累计</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${allUser}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月新增 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${monthUser}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月活跃 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${activeUser}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月微信关注 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${wxUser}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!--订单分析开始位置-->
                            <div class="x_panel ">
                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">订单分析</h2>

                                    <!--右侧时间-->
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li style="line-height: 29px;">
                                            ${startDate} ~ ${endDate}
                                        </li>
                                    </ul>


                                    <div class="clearfix"></div>
                                </div>

                                <!--内容区开始位置	-->
                                <div class="x_content">

                                    <!--form表单位置-->
                                    <form class="form-horizontal form-label-left" id="orderTypeList">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">新增</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="newOrder">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!--内容区结束位置	-->
                            </div>

                        </div>
                        <!--右侧核心内容区开始位置-->
                        <div class="col-md-6 col-xs-12" style="margin-top: 10px;">

                            <!--右侧中部区域开始位置-->
                            <!--商户概况开始位置-->
                            <div class="x_panel">
                                <!--小标题		-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">商户概况</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <!--内容区开始位置-->
                                <div class="x_content">

                                    <form class="form-horizontal form-label-left">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">商户累计</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${allStore}
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月新增 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${monethStore}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月活跃 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${activeStore}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月新增订单 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${monthOrder}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月审核通过 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${monthCkOrder}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"> </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                            </div>
                                        </div>

                                    </form>
                                </div>

                                <!--内容区结束位置-->


                            </div>
                            <!--商户分析开始位置-->
                            <div class="x_panel">

                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">商户分析</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li style="line-height: 29px;">
                                            ${startDate} ~ ${endDate}
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>

                                <!--内容区	-->
                                <div class="x_content">

                                    <form class="form-horizontal form-label-left" id="storeTypeList">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">新增</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="newStore">
                                                    34，320
                                                </div>
                                            </div>
                                        </div>
                                        <%--
                                                                                        <div class="form-group">
                                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">整形 </label>
                                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                                <div class="ln_solid"
                                                                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                                                                    12<span style="float: right;">月上升100%</span></div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="form-group">
                                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">眼科 </label>
                                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                                <div class="ln_solid"
                                                                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                                                                    12日<span style="float: right;">月上升100%</span></div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="form-group">
                                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">口腔 </label>
                                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                                <div class="ln_solid"
                                                                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                                                                    2017年12月12日<span style="float: right;">月上升100%</span></div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="form-group">
                                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">生活美容 </label>
                                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                                <div class="ln_solid"
                                                                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                                                                    2860<span style="float: right;">月上升100%</span></div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="form-group">
                                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">植发 </label>
                                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                                <div class="ln_solid"
                                                                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                                                                    2860<span style="float: right;">月上升100%</span></div>
                                                                                            </div>
                                                                                        </div>--%>

                                    </form>

                                </div>


                            </div>


                        </div>

                    </div>
                    <!--右侧核心内容区结束位置-->
                    <!--右侧中部区结束开位置-->
                    <!--新增、活跃、订单数对比图开始位置-->
                    <div class="x_panel">
                        <!--小标题-->
                        <div class="x_title">
                            <h2 style="line-height: 1;font-size: 18px;">新增、活跃、订单数对比图</h2>

                            <!--右侧时间-->
                            <ul class="nav navbar-right panel_toolbox">
                                <li style="line-height: 29px;">
                                    ${startDate} ~ ${endDate}
                                </li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>


                        <div class="x_content">

                            <form class="form-horizontal form-label-left" style="height: 455px;">
                                <!--添加折线图位置-->
                                <div class="form-group" id="userCharts" style="height: 440px;">
                                    直接在这个地方写折线图
                                </div>


                            </form>

                        </div>

                    </div>
                    <!--新增商户圆饼图开始位置-->
                    <div class="x_panel">

                        <!--小标题-->
                        <div class="x_title">
                            <h2 style="line-height: 1;font-size: 18px;">新增商户圆饼图</h2>
                            <div class="clearfix"></div>
                        </div>
                        <!--内容区-->
                        <div class="x_content">
                            <form class="form-horizontal form-label-left" style="height: 300px;">
                                <!--添加圆饼图位置	-->
                                <div class="form-group" id="storeCharts" style="height: 300px;">
                                    直接在这个地方写圆饼图
                                </div>

                            </form>

                        </div>

                    </div>

                    <!--订单分析图开始位置-->
                    <div class="x_panel">
                        <!--小标题位置-->
                        <div class="x_title">
                            <h2 style="line-height: 1;font-size: 18px;">订单分析图</h2>
                            <div class="clearfix"></div>
                        </div>

                        <!--内容区-->
                        <div class="x_content">

                            <form class="form-horizontal form-label-left" style="height: 450px;">
                                <!--添加条形图位置	-->
                                <div class="form-group" id="orderCharts" style="height: 400px;">
                                    <%--直接在这个地方写条形图--%>
                                </div>

                            </form>

                        </div>


                    </div>
                    <!--订单分析图结束位置-->
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- /page content -->
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/build/js/echarts.min.js"></script>
<script language=javascript type=text/javascript>
    $(function () {
        //用户统计
        var userCharts = echarts.init(document.getElementById("userCharts"));
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        // 显示标题，图例和空的坐标轴
        userCharts.setOption({
            title: {
                text: ''
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            grid: {
                left: '3%',
                right: '3%',
                bottom: '9%',
                containLabel: true
            },
            legend: {
                data: ['用户新增', '用户活跃', '用户订单数']
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel: {
                        rotate: 45,
                        interval: 0
                    },
                    data: []
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '人数',
                    min: 0,
                    position: 'left',
                    axisLine: {
                        lineStyle: {
                            color: colors[0]
                        }
                    },
                    axisLabel: {
                        formatter: '{value} 个'
                    }
                },
                {
                    type: 'value',
                    name: '百分比',
                    min: 0,
                    max: 100,
                    position: 'right',
                    axisLine: {
                        lineStyle: {
                            color: colors[0]
                        }
                    },
                    axisLabel: {
                        formatter: '{value} %'
                    }
                }
            ],
            series: []
        });
        getUserChartData($("#startDate").val(), $("#endDate").val());

        function getUserChartData(startDate, endDate) {
            var params = {
                startDate: startDate,
                endDate: endDate
            }
            var url = "${pageContext.request.contextPath}/mfq/statistics/getUserChartData/01.do";
            $.ajax({
                type: "POST",
                url: url,
                data: params,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var json = data;
                    var dayAll = new Array();
                    var newUser = new Array();
                    var activeUser = new Array();
                    var everyOrder = new Array();
                    if (json.code == '0') {
                        $.each(json.dayNewUser, function (index, item) {
                            var day = item.day;
                            var user = item.newUser;
                            dayAll.push(day);
                            newUser.push(user);
                        });
                        $.each(json.dayActiveUser, function (index, item) {
                            var user = item.newUser;
                            activeUser.push(user);
                        });
                        $.each(json.dayEveryOrder, function (index, item) {
                            var order = item.newUser;
                            everyOrder.push(order);
                        });
                        // 填入数据
                        userCharts.setOption({
                            xAxis: {
                                data: dayAll
                            },
                            series: [
                                {
                                    // 根据名字对应到相应的系列
                                    name: '用户新增',
                                    type: 'line',
                                    data: newUser
                                }, {
                                    // 根据名字对应到相应的系列
                                    name: '用户活跃',
                                    type: 'line',
                                    data: activeUser
                                }, {
                                    // 根据名字对应到相应的系列
                                    name: '用户订单数',
                                    type: 'line',
                                    data: everyOrder
                                }
                            ]
                        });
                    } else {
                        $.confirm({
                            title: '系统提示',
                            text: "操作失败",
                            confirmButton: '确认',
                            cancelButton: false,
                        });
                    }
                }
            });
        }

        //商户图形
        var storeCharts = echarts.init(document.getElementById("storeCharts"));
        var colors2 = ['#5793f3', '#d14a61', '#675bba', '#8fc31f', '#f35833', '#00ccff', '#ffcc00'];
        var backgroundColor = 'rgb(255,255,255)';
        // 显示标题，图例和空的坐标轴
        storeCharts.setOption({
            color: colors2,
            backgroundColor: backgroundColor,
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            legend: {
                orient: 'vertical',
                top: '15%',
                right: '15%',
                data: []
            },
            series: [{
                name: '新增商户地域分布',
                type: 'pie',
                radius: '50%',
                center: ['40%', '50%'],
                data: [],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },
                itemStyle: {
                    normal: {
                        label: {
                            show: true,
                            formatter: '{b} : {c} ({d}%)'
                        }
                    },
                    labelLine: {show: true}
                }
            }]
        });
        getStoreChartData($("#startDate").val(), $("#endDate").val());

        function getStoreChartData(startDate, endDate) {
            var params = {
                startDate: startDate,
                endDate: endDate
            }
            var url = "${pageContext.request.contextPath}/mfq/statistics/getStoreChartData/01.do";
            $.ajax({
                type: "POST",
                url: url,
                data: params,
                dataType: "json",
                success: function (data) {
                    var json = data;
                    console.log(json.storeTypeList)
                    if (json.code == '0') {
                        var newStore = json.newStore; //新增数量
                        $("#newStore").html(newStore)
                        $.each(json.storeTypeList, function (index, item) {
                            var name = item.name; //分类名称
                            var sum = item.sum; //分类数量
                            var level = item.level; //1=上升 2=下降 0=2个时段内数据相等 -1=两个时间段内都没有此分类数据
                            var levelT = "相等";
                            if (level == 1) {
                                levelT = "上升";
                            } else if (level == 2) {
                                levelT = "下降";
                            }
                            var percent = item.percent; //上升下降百分比
                            var html = '<div class="form-group">' +
                                '<label class="control-label col-md-3 col-sm-3 col-xs-12">' + name + '</label>' +
                                '<div class="col-md-9 col-sm-9 col-xs-12"><div class="ln_solid" ' +
                                'style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px;' +
                                ' line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;" id="zx">' +
                                sum +
                                '<span style="float: right;">' + levelT + percent + '%</span></div>' +
                                '</div></div>';
                            $("#storeTypeList").append(html);
                        });
                        //图形
                        var areaName = new Array();
                        var areaSum = new Array();
                        $.each(json.areaStoreSum, function (key, value) {
                            areaName.push(key);
                            var person = {value: value, name: "" + key + ""};
                            areaSum.push(person);
                        });
                        // 填入数据
                        storeCharts.setOption({
                            legend: {
                                data: areaName,
                                formatter: function (name) {
                                    var num = 0;
                                    for (var i = 0; i < areaSum.length; i++) {
                                        num = num + parseInt(areaSum[i].value);
                                    }
                                    for (var i = 0; i < areaSum.length; i++) {
                                        if (name == areaSum[i].name) {
                                            return name + '  ' + areaSum[i].value + '  ' + (areaSum[i].value / num * 100).toFixed(2) + '%';
                                        }
                                    }
                                }
                            },
                            series: [{
                                data: areaSum
                            }]
                        });
                    } else {
                        $.confirm({
                            title: '系统提示',
                            text: "操作失败",
                            confirmButton: '确认',
                            cancelButton: false,
                        });
                    }
                }
            });
        }

        //订单统计图
        var orderCharts = echarts.init(document.getElementById("orderCharts"));
        // 显示标题，图例和空的坐标轴
        orderCharts.setOption({
            title: {
                'subtext': '本月   vs 前月'
            },
            'tooltip': {
                'trigger': 'axis',
                'axisPointer': {
                    'type': 'shadow'
                },
            },
            'grid': {
                'borderWidth': 0,
                'y2': 120
            },
            legend: {
                data: ['本月', '减少', '增加', '前月', '减少', '增加']
            },
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            xAxis: [
                {
                    type: 'category',
                    data: []
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    axisLabel: {formatter: '{value} 个'}
                }
            ],
            series: []
        });
        getOrderChartData($("#startDate").val(), $("#endDate").val());

        function getOrderChartData(startDate, endDate) {
            var params = {
                startDate: startDate,
                endDate: endDate
            }
            var url = "${pageContext.request.contextPath}/mfq/statistics/getOrderChartData/01.do";
            $.ajax({
                type: "POST",
                url: url,
                data: params,
                dataType: "json",
                success: function (data) {
                    var json = data;
                    console.log(json.orderTypeList)
                    console.log(json.newOrder)
                    if (json.code == '0') {
                        $("#newOrder").html(json.newOrder)
                        var orderArray = new Array();
                        var nowSum = new Array();
                        var addSum = new Array();
                        var subSum = new Array();
                        var typeDate = new Array();
                        $.each(json.orderTypeList, function (index, item) {
                            var html = '';
                            var name = item.name; //分类名称
                            var sum = item.sum; //分类数量
                            var level = item.level; //1=上升 2=下降 0=2个时段内数据相等 -1=两个时间都没有次类型
                            var levelT = "月相等";
                            if (level == 1) {
                                levelT = "月上升 ";
                            } else if (level == 2) {
                                levelT = "月下降";
                            }
                            var percent = item.percent; //上升下降百分比
                            var html = html + '<div class="form-group">' +
                                '<label class="control-label col-md-3 col-sm-3 col-xs-12">' + name + '</label>' +
                                '<div class="col-md-9 col-sm-9 col-xs-12"><div class="ln_solid" ' +
                                'style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px;' +
                                ' line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;" id="zx">' +
                                sum +
                                '<span style="float: right;">' + levelT + percent + '%</span></div>' +
                                '</div></div>'
                            $("#orderTypeList").append(html);
                        });
                        var nowOrder = {name: "本月", type: "bar", barMaxWidth: 50, stack: "本月", data: nowSum};
                        var subOrder = {
                            name: "减少",
                            type: "bar",
                            stack: "本月",
                            data: subSum,
                            itemStyle: {
                                normal: {
                                    label: {
                                        formatter: function (p) {
                                            return p.value > 0 ? ('▼' + p.value + '') : 0;
                                        }
                                    }
                                }
                            }
                        };
                        var addOrder = {
                            name: "增加",
                            type: "bar",
                            stack: "本月",
                            data: addSum,
                            itemStyle: {
                                normal: {
                                    label: {
                                        formatter: function (p) {
                                            return p.value > 0 ? ('▲' + p.value + '') : 0;
                                        }
                                    }
                                }
                            }
                        };
                        orderArray.push(nowOrder);
                        orderArray.push(subOrder);
                        orderArray.push(addOrder);
                        //前个月图片数据
                        var nowSum2 = new Array();
                        var addSum2 = new Array();
                        var subSum2 = new Array();
                        $.each(json.orderTypeList2, function (index, item) {
                            nowSum2.push(item.sum);
                            addSum2.push(item.addSum);
                            subSum2.push(item.subSum);
                        });
                        var nowOrder2 = {
                            name: "前月",
                            type: "bar",
                            barMaxWidth: 50,
                            barGap: "10%",
                            stack: "前月",
                            data: nowSum2
                        };
                        var subOrder2 = {
                            name: "减少",
                            type: "bar",
                            stack: "前月",
                            data: subSum2,
                            itemStyle: {
                                normal: {
                                    label: {
                                        formatter: function (p) {
                                            return p.value > 0 ? ('▼' + p.value + '') : 0;
                                        }
                                    }
                                }
                            }
                        };
                        var addOrder2 = {
                            name: "增加",
                            type: "bar",
                            stack: "前月",
                            data: addSum2,
                            itemStyle: {
                                normal: {
                                    label: {
                                        formatter: function (p) {
                                            return p.value > 0 ? ('▲' + p.value + '') : 0;
                                        }
                                    }
                                }
                            }
                        };
                        orderArray.push(nowOrder2);
                        orderArray.push(subOrder2);
                        orderArray.push(addOrder2);
                        // 填入数据
                        orderCharts.setOption({
                            xAxis: {
                                data: typeDate
                            },
                            series: orderArray
                        });
                    } else {
                        $.confirm({
                            title: '系统提示',
                            text: "操作失败",
                            confirmButton: '确认',
                            cancelButton: false,
                        });
                    }
                }
            });
        }
    });
</script>
</body>
</html>