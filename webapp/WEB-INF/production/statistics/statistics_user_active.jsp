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
                            <a href="#">用户活跃</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!--面包屑结束-->

        <div class="clearfix"></div>


        <!--核心内容区开始位置-->

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">

                        <!--左侧核心内容区开始-->

                        <div class="col-md-4 col-xs-12" style="margin-top: 10px;">

                            <!--用户活跃开始位置-->
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">用户活跃</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">今日活跃</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="todayActive">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">昨日活跃 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="yesterdayActive">
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
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"> </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"> </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"> </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
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
                            </div>
                        </div>
                        <!--左侧核心内容区结束-->

                        <!--活跃分析开始位置-->

                        <div class="col-md-8 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">

                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">活跃分析</h2>
                                    <div class="clearfix"></div>
                                </div>

                                <!--内容区开始-->
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" style="height: 350px;">

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
                                                                       id="userActiveDate1" class="form-control"
                                                                       value="2017/12/11~2017/12/20"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <!--添加折线图位置	-->
                                        <div class="form-group" id="userActive1" style="height: 300px">
                                            直接在这个地方写折线图
                                        </div>

                                    </form>
                                </div>

                                <!--内容区结束位置-->
                            </div>
                        </div>
                        <!--活跃分析结束位置-->

                    </div>
                </div>
            </div>
        </div>

        <!--核心内容区结束位置-->
    </div>
</div>
<!-- /page content -->
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<%--<script src="${pageContext.request.contextPath}/build/js/echarts.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/vendors/echarts/dist/echarts.js"></script>

<script>
    var userActive1 = echarts.init(document.getElementById("userActive1"));
    $(function () {
        $('#userActiveDate1').daterangepicker({
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
            $('#userActiveDate1 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
            getUserActive('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '1');
        });
        //用户活跃分析折线
        userActive1.setOption({
            title: {
                text: '活跃分析'
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
                data: ['今日活跃', '昨日活跃']
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel: {
                        rotate: 0,
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
        getUserActive('1', '', '', '');
    })

    function getUserActive(dateT, start, end, typeNum) {
        var params = {
            startDate: start,
            endDate: end,
            dateType: dateT,
            typeNum: typeNum
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getUserActive.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (data) {
                var json = data;
                if (json.code == '0') {
                    if (typeNum == '') {
                        $("#todayActive").html(json.todayActive);
                        $("#yesterdayActive").html(json.yesterdayActive);
                    }
                    if (typeNum == '' || typeNum == '1') {
                        $('#userActiveDate1 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
                        //折线图
                        var dayAll = new Array();
                        var todayUser = new Array();
                        var yesterdayUser = new Array();
                        $.each(json.todayList, function (index, item) {
                            var split = item.day.split("-");
                            if (split.length == 3) {
                                dayAll.push(item.day.split("-")[2]);
                            } else {
                                dayAll.push(item.day);
                            }
                            todayUser.push(item.newUser);
                        });
                        $.each(json.yesterdayList, function (index, item) {
                            yesterdayUser.push(item.newUser);
                        });
                        var legendDate = new Array();
                        var seriesDate = new Array();
                        if (dateT == '1') {
                            legendDate.push('今日活跃');
                            legendDate.push('昨日活跃');
                            var date1 = {name: "今日活跃", type: "line", data: todayUser};
                            var date2 = {name: "昨日活跃", type: "line", data: yesterdayUser};
                            seriesDate.push(date1);
                            seriesDate.push(date2);
                        } else if (dateT == '' || dateT == '2') {
                            legendDate.push('活跃用户');
                            var date1 = {name: "活跃用户", type: "line", data: todayUser};
                            seriesDate.push(date1);
                        }
                        userActive1.setOption({
                            legend: {
                                data: legendDate
                            },
                            xAxis: [{
                                data: dayAll,
                                axisLabel: {
                                    interval: 0
                                },
                            }],
                            series: seriesDate
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