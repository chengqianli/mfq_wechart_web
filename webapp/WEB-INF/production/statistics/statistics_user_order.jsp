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

        <!--面包屑开始-->
        <div class="page-title">
            <div class="row title_left" style="width: 100%;">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">运营中心</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">用户订单</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <!--面包屑结束-->

        <div class="clearfix"></div>

        <!--核心内容区开始-->

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <input type="hidden" value="${handleType}" name="handleType" id="handleType">
                <input type="hidden" value="${startDate}" name="startDate" id="startDate">
                <input type="hidden" value="${endDate}" name="endDate" id="endDate">
                <div class="x_panel">
                    <div class="x_content">
                        <!--用户订单开始位置-->

                        <div class="col-md-4 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">

                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">用户订单</h2>
                                    <div class="clearfix"></div>
                                </div>

                                <!--内容区-->
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">

                                        <!--时间表-->
                                        <div class="form-group">
                                            <fieldset>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <div class="input-prepend input-group">
                                                            <span class="add-on input-group-addon"
                                                                  style="border-radius: 0;"><i
                                                                    class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                            <input type="text" name="reservation" id="userOrderDate1"
                                                                   class="form-control" value="2017/12/11~2017/12/20"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>


                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">新增订单</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="orderCount">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">审核通过 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="passCount">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">通过率 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="passPerent">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">申请金额 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="orderSum">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="orderSum">
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>

                                <!--内容区结束-->
                            </div>
                        </div>

                        <!--用户订单结束位置-->

                        <!--订单分析开始位置-->

                        <div class="col-md-8 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">

                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">访问次数分布</h2>


                                    <ul class="nav navbar-right panel_toolbox">
                                        <li style="line-height: 29px;">
                                        </li>
                                    </ul>


                                    <div class="clearfix"></div>
                                </div>


                                <!--内容区-->
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" style="height: 300px;">

                                        <!--时间表-->
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <div class="controls">
                                                            <div class="input-prepend input-group">
                                                                <span class="add-on input-group-addon"
                                                                      style="border-radius: 0;"><i
                                                                        class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                                <input type="text" name="reservation"
                                                                       id="" class="form-control userOrderDate2"
                                                                       value="2017/12/11~2017/12/20"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>

                                        <!--添加折线图-->
                                        <div class="form-group" id="userOrder1" style="height: 250px;">
                                            <%--直接在这个地方写折线图--%>
                                        </div>


                                    </form>

                                </div>


                            </div>
                        </div>

                        <!--订单分析结束位置-->

                        <!--订单分析图（圆饼）开始的位置-->

                        <div class="col-md-12 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">订单分析图（圆饼）</h2>
                                    <div class="clearfix"></div>
                                </div>


                                <!--内容区开始-->
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" style="height: 350px;">
                                        <!--时间表-->
                                        <div class="form-group">
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <div class="controls">
                                                            <div class="input-prepend input-group">
                                                                <span class="add-on input-group-addon"
                                                                      style="border-radius: 0;"><i
                                                                        class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                                <input type="text" name="reservation"
                                                                       id="userOrderDate2"
                                                                       class="form-control userOrderDate2"
                                                                       value="2017/12/11~2017/12/20"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <!--添加圆饼图-->
                                        <div class="form-group" id="userOrder2" style="height: 300px;">
                                            <%--直接在这个地方写圆饼图--%>
                                        </div>


                                    </form>
                                </div>

                                <!--内容区结束-->
                            </div>
                        </div>
                        <!--订单分析图（圆饼）结束的位置-->


                    </div>
                </div>
            </div>
        </div>


        <!--核心内容区结束-->
    </div>
</div>
<!-- /page content -->
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/build/js/echarts.min.js"></script>
<script>
    var userOrder1 = echarts.init(document.getElementById("userOrder1"));
    var userOrder2 = echarts.init(document.getElementById("userOrder2"));
    $(function () {
        $('#userOrderDate1').daterangepicker({
            format: 'YYYY-MM-DD', //控件中from和to 显示的日期格式
            separator: ' 至 ',
            locale: {
                applyLabel: '确定',
                cancelLabel: '取消',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月']
            }
        }, function (start, end, label) {//格式化日期显示框
            $('#userOrderDate1 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
            getUserOrder('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '1');
        });
        $('.userOrderDate2').daterangepicker({
            format: 'YYYY-MM-DD', //控件中from和to 显示的日期格式
            separator: ' 至 ',
            locale: {
                applyLabel: '确定',
                cancelLabel: '取消',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月']
            }
        }, function (start, end, label) {//格式化日期显示框
            $('.userOrderDate2 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
            getUserOrder('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '2');
        });
        //用户统计折线
        userOrder1.setOption({
            title: {
                text: '订单分析'
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
                bottom: '15%',
                containLabel: true
            },
            legend: {
                data: ['新增订单', '审核通过']
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
                    name: '',
                    min: 0,
                    minInterval: 1,
                    position: 'left',
                    axisLabel: {
                        formatter: '{value} 个'
                    }
                }
            ],
            series: []
        });
        //饼图
        //var colors2 = ['#5793f3', '#d14a61'];
        //设置饼图7种颜色
        var colors2 = ['#5793f3', '#d14a61', '#675bba', '#8fc31f', '#f35833', '#00ccff', '#ffcc00'];

        // 显示标题，图例和空的坐标轴
        userOrder2.setOption({
            color: colors2,
            title: {
                text: '',
                subtext: '',
                x: 'center'
            },
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
                left: '10%',
                data: ['订单关闭', '客户取消', '替换订单', '审核通过', '未通过']
            },
            series: [{
                name: '订单数量',
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
        getUserOrder('1', '', '', '');
    })

    function getUserOrder(dateT, start, end, typeNum) {
        var params = {
            startDate: start,
            endDate: end,
            dateType: dateT,
            typeNum: typeNum
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getUserOrder.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (data) {
                console.log(data);
                var json = data;
                if (json.code == '0') {
                    if (typeNum == '' || typeNum == '1') {
                        $('#userOrderDate1 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
                        $("#orderCount").html(json.orderCount);
                        $("#passCount").html(json.passCount);
                        $("#passPerent").html(json.passPerent + "%");
                        $("#orderSum").html(json.orderSum);
                    }
                    if (typeNum == '' || typeNum == '2') {
                        $('#userOrderDate2 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
                        //折线图
                        var dayAll = new Array();
                        var orderEvery = new Array();
                        var orderPass = new Array();
                        $.each(json.orderEveryList, function (index, item) {
                            dayAll.push(item.day);
                            orderEvery.push(item.newUser);
                        });
                        $.each(json.orderPassList, function (index, item) {
                            orderPass.push(item.newUser);
                        });
                        userOrder1.setOption({
                            xAxis: [{
                                data: dayAll,
                                axisLabel: {
                                    interval: 0
                                },
                            }],
                            series: [
                                {
                                    // 根据名字对应到相应的系列
                                    name: '新增订单',
                                    type: 'line',
                                    data: orderEvery
                                }, {
                                    name: '审核通过',
                                    type: 'line',
                                    data: orderPass
                                }
                            ]
                        });
                        //饼图
                        var typeSum = new Array();
                        var type1 = {value: json.passCount, name: "审核通过"};
                        var notPass = parseInt(json.orderCount) - parseInt(json.passCount);
                        var type2 = {value: json.orderTypeNotCount, name: "未通过"};
                        var type3 = {value: json.orderTypeCloseCount, name: "订单关闭"};
                        var type4 = {value: json.orderTypeCancelCount, name: "客户取消"};
                        var type5 = {value: json.orderTypeReplaceCount, name: "替换订单"};
                        typeSum.push(type1);
                        typeSum.push(type2);
                        typeSum.push(type3);
                        typeSum.push(type4);
                        typeSum.push(type5);
                        //typeSum.push(type3);
                        // 填入数据
                        userOrder2.setOption({
                            tooltip: {
                                formatter: function (params, ticket, callback) {
                                    var html = "<table><tr colspan='3'><th>本周统计</th></tr>";
                                    if (params.name == "审核通过") {
                                        $.each(json.orderTypePassList, function (index, item) {
                                            html = html + "<tr><td>" + item.name + "</td><td>" + item.sum + "单 </td><td>" + (item.sum / json.orderCount * 100).toFixed(2) + "%</td></tr>";
                                        });
                                    } else if (params.name == "未通过") {
                                        $.each(json.orderTypeNotList, function (index, item) {
                                            html = html + "<tr><td>" + item.name + "</td><td>" + item.sum + "单 </td><td>" + (item.sum / json.orderCount * 100).toFixed(2) + "%</td></tr>";
                                        });
                                    } else if (params.name == "订单关闭") {
                                        $.each(json.orderTypeCloseList, function (index, item) {
                                            html = html + "<tr><td>" + item.name + "</td><td>" + item.sum + "单 </td><td>" + (item.sum / json.orderCount * 100).toFixed(2) + "%</td></tr>";
                                        });
                                    } else if (params.name == "客户取消") {
                                        $.each(json.orderTypeCancelList, function (index, item) {
                                            html = html + "<tr><td>" + item.name + "</td><td>" + item.sum + "单 </td><td>" + (item.sum / json.orderCount * 100).toFixed(2) + "%</td></tr>";
                                        });
                                    } else if (params.name == "替换订单") {
                                        $.each(json.orderTypeReplaceList, function (index, item) {
                                            html = html + "<tr><td>" + item.name + "</td><td>" + item.sum + "单 </td><td>" + (item.sum / json.orderCount * 100).toFixed(2) + "%</td></tr>";
                                        });
                                    }
                                    html = html + "</table>";
                                    return html;
                                }
                            },
                            legend: {
                                formatter: function (name) {
                                    var num = parseInt(json.orderCount);
                                    for (var i = 0; i < typeSum.length; i++) {
                                        if (name == typeSum[i].name) {
                                            return name + '  ' + typeSum[i].value + '  ' + (typeSum[i].value / num * 100).toFixed(2) + '%';
                                        }
                                    }
                                }
                            },
                            series: [{
                                data: typeSum
                            }]
                        });
                    }
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
</script>
</body>
</html>