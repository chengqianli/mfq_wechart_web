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
                            <a href="#">商户订单</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--面包屑结束位置-->
        <div class="clearfix"></div>
        <!--核心内容开始-->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <!--商户订单开始-->
                        <div class="col-md-4 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">商户订单</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <!--form表单-->
                                    <form class="form-horizontal form-label-left">
                                        <!--日期表-->
                                        <div class="form-group">
                                            <fieldset>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <div class="input-prepend input-group">
                                                            <span class="add-on input-group-addon"
                                                                  style="border-radius: 0;"><i
                                                                    class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                            <input type="text" name="reservation" id="storeOrderDate1"
                                                                   class="form-control" value="2017/12/11~2017/12/20"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <!--内容区域-->
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">进件订单</label>
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
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">放款金额 </label>
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
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!--商户订单结束位置-->
                        <!--订单分析开始-->
                        <div class="col-md-8 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <div class="x_title">
                                    <!-- 小标题-->
                                    <h2 style="line-height: 1;font-size: 18px;">订单服务内容分析</h2>
                                    <!--右侧时间显示-->
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li style="line-height: 29px;">
                                            2018-01-11~2018-01-11
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <!--form表单内容区-->
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" style="height: 304px;">
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
                                                                       id="storeOrderDate3" class="form-control"
                                                                       value="2017/12/11~2017/12/20"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <!--添加折线图位置	-->
                                        <div class="form-group" id="storeOrder2" style="height: 254px">
                                            <!-- 直接在这个地方写折线图 -->
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--订单分析结束位置-->
                        <!--订单分析图开始-->
                        <div class="col-md-12 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <!--小表头-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">订单分析</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <!--form表单内容区-->
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" style="height: 650px;">
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
                                                                       id="storeOrderDate2" class="form-control"
                                                                       value="2017/12/11~2017/12/20"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <!--添加折线图位置-->
                                        <div class="form-group" id="storeOrder1" style="height: 600px">
                                            <!-- 直接在这个地方写折线图 -->
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
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/build/js/echarts.min.js"></script>
<script>


    $('#storeOrderDate1').daterangepicker({
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
        $('#storeOrderDate1 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
        getStoreOrder('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '1');
    });
    $('#storeOrderDate2').daterangepicker({
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
        $('#storeOrderDate2 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
        getStoreOrder('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '2');
    });
    $('#storeOrderDate3').daterangepicker({
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
        $('#storeOrderDate3 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
        getStoreOrder('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '3');
    });


    var storeOrder1 = echarts.init(document.getElementById("storeOrder1"));
    var storeOrder2 = echarts.init(document.getElementById("storeOrder2"));
    $(function () {
        //商户统计1折线
        // 显示标题，图例和空的坐标轴
        storeOrder1.setOption({
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
                data: ['进件数', '审核通过数']
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
                    position: 'left',
                    axisLabel: {
                        formatter: '{value} 个'
                    }
                }
            ],
            series: []
        });

        //柱状图2
        storeOrder2.setOption({
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: []
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '10%',
                containLabel: true,
                borderWidth: 0,
                y2: 120
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
        getStoreOrder('3', '', '', '');
    })

    function getStoreOrder(dateT, start, end, typeNum) {
        var params = {
            startDate: start,
            endDate: end,
            dateType: dateT,
            typeNum: typeNum
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getStoreOrder.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            success: function (data) {
                console.log(data);
                var json = JSON.parse(data);
                console.log(json.item);
                console.log(json);
                if (json.codeNum == '0') {
                    if (typeNum == '' || typeNum == '1') {
                        $('#storeOrderDate1 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
                        $("#orderCount").html(json.orderCount);
                        $("#passCount").html(json.passCount);
                        $("#passPerent").html(json.passPerent + "%");
                        $("#orderSum").html(json.orderSum);
                    }
                    if (typeNum == '' || typeNum == '2') { //折线图
                        $('#storeOrderDate2 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
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
                        console.log(dayAll)
                        console.log(orderEvery)
                        console.log(orderPass)
                        storeOrder1.setOption({
                            xAxis: [{
                                data: dayAll,
                                axisLabel: {
                                    interval: 0
                                },
                            }],
                            series: [
                                {
                                    // 根据名字对应到相应的系列
                                    name: '进件数',
                                    type: 'line',
                                    data: orderEvery
                                }, {
                                    name: '审核通过数',
                                    type: 'line',
                                    data: orderPass
                                }
                            ]
                        });
                    }
                    if (typeNum == '' || typeNum == '3') { //柱状图
                        $('#storeOrderDate3 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
                        var dayAll = new Array();
                        var typeName = new Array();
                        var orderArray = new Array();
                        $.each(json.everyType, function (key, value) {
                            typeName.push(key);
                            var nowSum = new Array();
                            $.each(value, function (index, item) {
                                nowSum.push(item.sum);
                            });
                            var nowOrder = {name: key, type: "bar", data: nowSum};
                            orderArray.push(nowOrder);
                        });
                        $.each(json.time, function (index, item) {
                            dayAll.push(item);
                        });
                        // 填入数据
                        console.log(dayAll)
                        console.log(typeName)
                        console.log(orderArray)
                        storeOrder2.setOption({
                            legend: {
                                data: typeName
                            },
                            xAxis: [{
                                data: dayAll
                            }],
                            series: orderArray
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