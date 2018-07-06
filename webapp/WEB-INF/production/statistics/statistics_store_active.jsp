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

        <!--面包屑-->
        <div class="page-title">
            <div class="row title_left" style="width: 100%;">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">运营中心</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">商户活跃</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="clearfix"></div>


        <!--核心内容区-->
        <div class="row">
            <input type="hidden" value="${handleType}" name="handleType" id="handleType">
            <input type="hidden" value="${startDate}" name="startDate" id="startDate">
            <input type="hidden" value="${endDate}" name="endDate" id="endDate">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <!--商户活跃开始位置-->

                        <div class="col-md-4 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">商户活跃</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <fieldset>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <div class="input-prepend input-group">
                                                                <span class="add-on input-group-addon"
                                                                      style="border-radius: 0;"><i
                                                                        class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                            <input type="text" name="reservation"
                                                                   id="storeActive1" class="form-control"
                                                                   value="2017/12/11~2017/12/20"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">活跃商户数</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="activeStore">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">总计次数 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="orderCount">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">平均访问次数 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"
                                                     id="avgCount">
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
                            </div>
                        </div>

                        <!--商户活跃结束位置-->

                        <!--访问次数分布开始位置-->

                        <div class="col-md-8 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">

                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">访问次数分布</h2>
                                    <!--右侧时间-->
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li style="line-height: 29px;">
                                        </li>
                                    </ul>

                                    <div class="clearfix"></div>
                                </div>


                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" style="height: 250px;">

                                        <!--table表格开始-->
                                        <div class="form-group">
                                            <table id="visitList" class="table table-striped table-bordered">
                                            </table>
                                        </div>

                                        <!--table表格结束位置-->
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!--访问次数分布结束位置-->

                        <!--活跃商户地域分布开始位置-->

                        <div class="col-md-12 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">

                                <!--小标题-->
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">活跃商户地域分布</h2>
                                    <div class="clearfix"></div>
                                </div>


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
                                                                       id="storeActive2" class="form-control"
                                                                       value="2017/12/11~2017/12/20"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>

                                        <!--添加圆饼图-->
                                        <div class="form-group" id="storeActiveChart" style="height: 300px;">
                                            直接在这个地方写圆饼图
                                        </div>

                                    </form>

                                </div>


                            </div>

                        </div>

                        <!--活跃商户地域分布结束位置-->


                    </div>
                </div>
            </div>
        </div>
        <!--核心内容区结束位置-->
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
    var storeActiveChart = echarts.init(document.getElementById("storeActiveChart"));
    $(function () {
        $('#storeActive1').daterangepicker({
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
            $('#storeActive1 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
            getStoreActive('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '1');
        });
        $('#storeActive2').daterangepicker({
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
            $('#storeActive2 span').html(start.format('YYYY-MM-DD') + ' 至 ' + end.format('YYYY-MM-DD'));
            getStoreActive('', start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'), '2');
        });
        //商户图形2饼图
        var colors2 = ['#5793f3', '#d14a61', '#675bba', '#8fc31f', '#f35833', '#00ccff', '#ffcc00'];
        var backgroundColor = 'rgb(255,255,255)';
        // 显示标题，图例和空的坐标轴
        storeActiveChart.setOption({
            color: colors2,
            backgroundColor: backgroundColor,
            title: {
                text: '',
                subtext: '统计平台活跃商户，各类商户地域分布情况',
                x: 'top'
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
                name: '各地域商户数量',
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
        getStoreActive('1', '', '', '');
    })

    function getStoreActive(dateT, start, end, typeNum) {
        var params = {
            startDate: start,
            endDate: end,
            dateType: dateT,
            typeNum: typeNum
        }
        var url = "${pageContext.request.contextPath}/mfq/statistics/getStoreActive.do";
        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (data) {
                var json = data;
                $('#storeActive1 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
                $('#storeActive2 span').html(json.startDate.substring(0, 11) + ' 至 ' + json.endDate.substring(0, 11));
                if (json.code == '0') {
                    if (typeNum == '' || typeNum == '1') {
                        $("#activeStore").html(json.activeStore);
                        $("#orderCount").html(json.orderCount);
                        $("#avgCount").html(json.avgCount);
                        var storeVal = "<tr><th>访问次数</th><th>商家数</th><th>占比</th></tr>";
                        $.each(json.storeList, function (index, item) {
                            var num = item.num; //次数
                            var storeNum = item.storeNum; //商户数量
                            var percent = item.percent; //百分比
                            if (num == 4) {
                                num = "4-5";
                            } else if (num == 5) {
                                num = "6-10";
                            }
                            if (num == 6) {
                                num = "10次以上";
                                storeVal = storeVal + "<tr><td>" + num + "</td><td>" + storeNum + "</td><td>" + percent + "%</td></tr>";
                            } else {
                                storeVal = storeVal + "<tr><td>" + num + "次</td><td>" + storeNum + "</td><td>" + percent + "%</td></tr>";
                            }
                        });
                        $("#visitList").html("");
                        $("#visitList").append(storeVal);
                    }
                    if (typeNum == '' || typeNum == '2') {
                        // 填入数据商户图形2饼图
                        var typeName = new Array();
                        var typeSum = new Array();
                        $.each(json.areaStoreSum, function (key, value) {
                            typeName.push(key);
                            var person = {value: value, name: "" + key + ""};
                            typeSum.push(person);
                        });
                        // 填入数据
                        storeActiveChart.setOption({
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