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
        <form action="">
            <input type="hidden" value="${handleType}" name="handleType" id="handleType">
            <input type="hidden" value="${startDate}" name="startDate" id="startDate">
            <input type="hidden" value="${endDate}" name="endDate" id="endDate">
        </form>
        <!-- 面包屑开始位置-->
        <div class="page-title">
            <div class="row title_left" style="width: 100%;">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">运营中心</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">商户分析</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--面包屑结束位置-->
        <div class="clearfix"></div>
        <div class="row">
            <!--核心内容区开始-->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <!--右侧核心内容区开始位置-->
                        <div class="col-md-4 col-xs-12" style="margin-top: 10px;">
                            <!--商户数据开始位置-->
                            <div class="x_panel">
                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">商户数据</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <!--内容区开始-->
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">商户总数</label>
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
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">本月进件商户 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                    ${activeStore}
                                                </div>
                                            </div>
                                        </div>
                                        <!--下面这个结构不放内容	-->
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"> </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!--内容区结束位置-->
                            </div>
                        </div>
                        <!--右侧核心内容区开始位置-->
                        <div class="col-md-8 col-xs-12" style="margin-top: 10px;">
                            <!--商户分析开始位置-->
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">商户分析</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" style="height: 400px;">
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
                                                                       id="storeDate1" class="form-control"
                                                                       value="2017/12/11~2017/12/20"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <select name="" class="form-control" id="storeProvince1"
                                                        onchange="getStoreChart1('','','',this.value)">
                                                    <option value="0" selected="selected">全国</option>
                                                    <c:forEach items="${provinces}" var="p">
                                                        <option value="${p.id}">${p.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group" id="storeCharts1" style="height: 350px;">
                                            直接在这个地方写折线图
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--商户类型对比开始位置-->
                        <div class="x_panel">
                            <!--小标题-->
                            <div class="x_title">
                                <h2 style="line-height: 1;font-size: 18px;">商户类型对比</h2>
                                <div class="clearfix"></div>
                            </div>
                            <!--内容区开始位置-->
                            <div class="x_content">
                                <form class="form-horizontal form-label-left">
                                    <!--时间表-->
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <div class="input-prepend input-group">
                                                            <span class="add-on input-group-addon"
                                                                  style="border-radius: 0;"><i
                                                                    class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                        <input type="text" name="reservation" id="storeDate2"
                                                               class="form-control" value="2017/12/11~2017/12/20"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <!-- 三个按钮区-->
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" class="btn btn-primary "
                                                onclick="getStoreChart2('','','','1')">
                                            总计
                                        </button>
                                        <button type="button" class="btn btn-primary "
                                                onclick="getStoreChart2('','','','2')">
                                            新增
                                        </button>
                                        <button type="button" class="btn btn-primary "
                                                onclick="getStoreChart2('','','','3')">
                                            开单商户
                                        </button>
                                    </div>

                                </form>
                                <!--添加圆饼图开始位置-->
                                <div class="form-group" style="height: 400px;" id="storeCharts2">
                                    <%--直接在这个地方写圆饼图--%>
                                </div>
                                <!--添加圆饼图结束位置-->
                            </div>
                            <!--内容区结束位置-->
                        </div>
                        <!--全国开单热力图开始-->
                        <%--<div class="x_panel">
                            <div class="x_title">
                                <!--小标题-->
                                <h2 style="line-height: 1;font-size: 18px;">全国开单热力图</h2>
                                <div class="clearfix"></div>
                            </div>
                            <!--主要内容区开始位置-->
                            <div class="x_content">
                                <form class="form-horizontal form-label-left" style="height: 650px;">
                                    <!--添加全国地图示意图位置开始	-->
                                    <div class="form-group" id="storeCharts3" style="height: 600px">
                                        &lt;%&ndash;直接在这个地方写全国地图示意图&ndash;%&gt;
                                    </div>
                                    <!--添加全国地图示意图位置结束	-->
                                </form>
                            </div>
                            <!--主要内容区结束位置-->
                        </div>--%>
                        <%--<div class="form-group" id="storeCharts4" style="height: 600px">--%>
                        <%--直接在这个地方写全国地图示意图--%>
                        <%--</div>--%>

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
<script src="${pageContext.request.contextPath}/build/js/bootstrap-year-calendar.min.js"></script>
<script>
    var storeCharts1 = echarts.init(document.getElementById("storeCharts1"));
    var storeCharts2 = echarts.init(document.getElementById("storeCharts2"));
    //    var storeCharts3 = echarts.init(document.getElementById("storeCharts3"));
    $(function () {
        $('#storeDate1').daterangepicker({
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
            $('#storeDate1 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
            getStoreChart1(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '', '');
        });
        $('#storeDate2').daterangepicker({
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
            $('#storeDate2 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
            getStoreChart2(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '', '');
        });
        //商户统计1折线
        storeCharts1.setOption({
            title: {
                text: '商户分析'
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
                data: ['新增商户', '进件商户']
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
        //商户图形2饼图
        var colors2 = ['#5793f3', '#d14a61', '#675bba', '#8fc31f', '#f35833', '#00ccff', '#ffcc00'];
        // 显示标题，图例和空的坐标轴
        storeCharts2.setOption({
            color: colors2,
            title: {
                text: '商户类型对比',
                subtext: '各类商户的占比情况'
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
                right: '15%',
                data: []
            },
            series: [{
                name: '各类商户数量',
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
        //全国热力图
        /*storeCharts3.setOption({
            title: {
                text: '全国开单热力图',
                subtext: '订单量',
                x: 'center'
            },
            tooltip: {
                trigger: 'item'
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                left: '10%',
                data: ['订单量']
            },
            dataRange: {
                x: 'left',
                y: 'bottom',
                left: '10%',
                splitList: [
                    {start: 300},
                    {start: 251, end: 300},
                    {start: 201, end: 250},
                    {start: 151, end: 200},
                    {start: 101, end: 150},
                    {start: 51, end: 100},
                    {start: 11, end: 50},
                    {start: 6, end: 10},
                    {end: 5}
                ],
                color: ['#E0022B', '#E09107', '#A3E00B']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            series: [{
                name: '订单量',
                type: 'map',
                mapType: 'china',
                roam: false,
                itemStyle: {
                    normal: {label: {show: true}},
                    emphasis: {label: {show: true}}
                },
                data: []
            }]
        });*/
        getStoreChart1('', '', '1', '');
        getStoreChart2('', '', '1', '1');
        getStoreChart3('', '', '1');
        getStoreChart4();
    })

    var startDate = '';
    var endDate = '';
    var province = '';

    function getStoreChart1(start, end, dateT, prov) {
        if (start != '') {
            startDate = start;
        }
        if (end != '') {
            endDate = end;
        }
        if (prov != '') {
            province = prov;
        }
        var params = {
            startDate: startDate,
            endDate: endDate,
            dateType: dateT,
            province: province,
            changeType: 0,
            typeNum: 1
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getStoreChart1.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (data) {
                console.log(data);
                var json = data;
                if (json.code == '0') {
                    // 填入数据商户图形1折线
                    startDate = json.startDate.substring(0, 10);
                    endDate = json.endDate.substring(0, 10);
                    var dayAll = new Array();
                    var newStore = new Array();
                    var activeStore = new Array();
                    console.log(JSON.stringify(json.newStoreList))
                    console.log(JSON.stringify(json.activeStoreList))
                    $.each(json.newStoreList, function (index, item) {
                        dayAll.push(item.day);
                        newStore.push(item.newUser);
                    });
                    $.each(json.activeStoreList, function (index, item) {
                        activeStore.push(item.newUser);
                    });
                    storeCharts1.setOption({
                        xAxis: [{
                            data: dayAll,
                            axisLabel: {
                                interval: 0
                            },
                        }],
                        series: [
                            {
                                // 根据名字对应到相应的系列
                                name: '新增商户',
                                type: 'line',
                                data: newStore
                            }, {
                                // 根据名字对应到相应的系列
                                name: '进件商户',
                                type: 'line',
                                data: activeStore
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

    var startDate2 = '';
    var endDate2 = '';
    var changeType = '';

    function getStoreChart2(start, end, dateT, ct) {
        if (start != '') {
            startDate2 = start;
        }
        if (end != '') {
            endDate2 = end;
        }
        if (ct != '') {
            changeType = ct;
        }
        var params = {
            startDate: startDate2,
            endDate: endDate2,
            dateType: dateT,
            province: 0,
            changeType: changeType,
            typeNum: 2
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getStoreChart1.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (data) {
                var json = data;
                if (json.code == '0') {
                    startDate2 = json.startDate.substring(0, 10);
                    endDate2 = json.endDate.substring(0, 10);
                    var typeName = new Array();
                    var typeSum = new Array();
                    $.each(json.typeStoreList, function (index, item) {
                        typeName.push(item.name);
                        var type = {value: item.sum, name: "" + item.name + ""};
                        typeSum.push(type);
                    });
                    // 填入数据
                    storeCharts2.setOption({
                        legend: {
                            data: typeName,
                            formatter: function (name) {
                                var num = 0;
                                for (var i = 0; i < typeSum.length; i++) {
                                    num = num + parseInt(typeSum[i].value);
                                }
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

    var startDate3 = '';
    var endDate3 = '';

    function getStoreChart3(start, end, dateT) {
        if (start != '') {
            startDate2 = start;
        }
        if (end != '') {
            endDate2 = end;
        }
        var params = {
            startDate: startDate3,
            endDate: endDate3,
            dateType: dateT,
            province: 0,
            changeType: 0,
            typeNum: 3
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getStoreChart1.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (data) {
                var json = data;
                if (json.code == '0') {
                    startDate3 = json.startDate.substring(0, 10);
                    endDate3 = json.endDate.substring(0, 10);
                    var areaSum = new Array();
                    $.each(json.areaOrderSum, function (key, value) {
                        var oneArea = {name: "" + key + "", value: value};
                        areaSum.push(oneArea);
                    });

                    // 填入数据
                    /*storeCharts3.setOption({
                        series: [{
                            data: areaSum
                        }]
                    });*/
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

    //开单日历
    function getStoreChart4() {
        var params = {
            startDate: '',
            endDate: '',
            dateType: '',
            province: '',
            changeType: 0,
            typeNum: 4
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getStoreChart1.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (data) {
                var orderDayNum = new Array();
                var json = data;
                if (json.code == '0') {
                    $.each(json.orderDayList, function (index, item) {
                        var day = {
                            id: index,
                            name: "" + item.sum + "",
                            location: '',
                            startDate: new Date(item.createTime.replace(/-/g, "/")),
                            endDate: new Date(item.createTime.replace(/-/g, "/"))
                        };
                        orderDayNum.push(day);
                    });
                    $('#calendar').calendar({
                        enableContextMenu: true,
                        enableRangeSelection: true,
                        /*mouseOnDay: function(e) {
                            if(e.events.length > 0) {
                                var content = '';
                                for(var i in e.events) {
                                    content += '<span style="color:' + e.events[i].color + '">' + e.events[i].name + '</span>';
                                }
                                $(e.element).popover({
                                    trigger: 'manual',
                                    container: 'body',
                                    html:true,
                                    content: content
                                });
                                $(e.element).popover('show');
                            }
                        },
                        mouseOutDay: function(e) {
                            if(e.events.length > 0) {
                                $(e.element).popover('hide');
                            }
                        },*/
                        dataSource: orderDayNum
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


</script>
</body>
</html>