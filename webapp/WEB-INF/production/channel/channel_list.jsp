<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        .x_title {
            border-bottom: 2px dashed #E6E9ED;
        }

        h3 {
            text-align: center;
            line-height: 2;
        }

        .tile-stats .count {
            margin: 0;
            text-align: center;
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
            <div class="row title_left">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>商户管理</li>
                        <li>渠道管理</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="tile-stats">
                                <!--<div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>-->
                                <div class="count">${channelTotalCount}</div>
                                <h3>合作渠道总数</h3>
                            </div>
                        </div>
                        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="tile-stats">
                                <div class="count">${channelMonthCount}</div>
                                <h3>本月新增渠道</h3>
                            </div>
                        </div>
                        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="tile-stats">
                                <div class="count">${channelActive}</div>
                                <h3>本月活跃渠道</h3>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <input type="hidden" value="${store.type}" id="headType"/>
                        <!--字段筛选-->

                        <div class="col-md-12 col-sm-12 col-xs-12"
                             style="box-sizing: border-box;padding: 8px 0;padding-left: 0;">
                            <%--<form action="${pageContext.request.contextPath}/mfq/store/findStoreList.do" method="post">--%>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <%--<select name="timeType" id="timeTypeId" class="form-control"
                                        style="width: 26%;float: left;">
                                    <option value="0">录入时间</option>
                                    <option value="1">更新时间</option>
                                </select>--%>
                                <input type="hidden" name="timeType" value="0"/>
                                <input type="" name="seach" id="" value="签约时间" class="form-control" placeholder=""
                                       style="width:30%;float: left;background:#fff;" readonly/>

                                <div class="col-xs-9" style="padding: 0;width: 70%;">
                                    <div class="col-xs-12" style="padding: 0;">
                                        <form class="form-horizontal">
                                            <fieldset>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <div class="input-prepend input-group">
															<span class="add-on input-group-addon"
                                                                  style="border-radius: 0;"><i
                                                                    class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                            <input type="text" name="reservation"
                                                                   id="reservation_table" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select name="areaId" id="areaId" class="form-control"
                                        style="width: 100%;float: left;box-shadow: none;">
                                    <option value="">地域</option>
                                    <c:forEach items="${areas}" var="areas">
                                        <option value="${areas.id}">${areas.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select name="seachType" id="seachTypeId" class="form-control"
                                        style="width: 40%;float: left;">
                                    <option value="0">渠道名称</option>
                                    <option value="1">市场负责人姓名</option>
                                </select>
                                <input type="" name="seach" id="seachId" value="" class="form-control" placeholder="搜索"
                                       style="width:60%;float: left;"/>
                            </div>
                            <button type="button" id="query" class="btn btn-primary">查询</button>
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target=".newly_build2" style="cursor: pointer;">新建
                            </button>


                            <div class="modal fade newly_build2" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                ×
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">添加新渠道</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="testmodal" style="padding: 5px 20px;">
                                                <form id="antoform" class="form-horizontal calender" role="form">
                                                    <div class="form-group" style="margin-bottom: 20px;color: #CC0000;">
                                                        <div class="control-label col-md-4 col-sm-4 col-xs-12">
                                                            *所有内容全部为必填项
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道负责人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="principalUserIds" class="form-control">
                                                                <c:forEach items="${userList }" var="i">
                                                                    <option value="${i.id }">${i.realName }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道名称</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="channelName"
                                                                   placeholder="只支持英文、汉字、数字">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">合作方式</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control"
                                                                    name="workType">
                                                                <option value="01">
                                                                    无担保
                                                                </option>
                                                                <option value="02">
                                                                    联合担保
                                                                </option>
                                                                <option value="03">
                                                                    全额担保
                                                                </option>
                                                                <option value="">
                                                                    暂未选择
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control"
                                                                    name="creditLevel">
                                                                <option value="01">
                                                                    优秀
                                                                </option>
                                                                <option value="02">
                                                                    良好
                                                                </option>
                                                                <option value="03">
                                                                    一般
                                                                </option>
                                                                <option value="04">
                                                                    黑名单
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="contactPerson"
                                                                   placeholder="请输入联系人姓名">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人电话</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control"
                                                                   name="contactTelephone" placeholder="请输入联系人电话">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道地址</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="padding-left: 0;margin-bottom: 5px;">
                                                                <select onchange="initCity(this)"
                                                                        class="form-control"
                                                                        id="province">
                                                                    <option value="">请选择省份</option>
                                                                    <c:forEach items="${province}"
                                                                               var="i">
                                                                        <option value="${i.id}" ${provinceId eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="margin-bottom: 5px;">
                                                                <select id="city" class="form-control"
                                                                        onchange="initDistrict(this)">
                                                                    <c:forEach items="${city}" var="i">
                                                                        <option value="${i.id}" ${cityId eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="margin-bottom: 5px;">
                                                                <select class="form-control"
                                                                        id="district" name="areaId">
                                                                    <c:forEach items="${district}"
                                                                               var="i">
                                                                        <option value="${i.id}" ${list.areaId eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-12 col-sm-12 col-xs-12"
                                                                 style="margin-bottom: 5px;padding-left: 0;">
                                                                <input type="text" class="form-control"
                                                                       name="address"
                                                                       value="${list.address}"
                                                                       placeholder="请输入渠道详细地址">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">签约周期</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control"
                                                                    name="signCycle">
                                                                <option value="1">
                                                                    一年
                                                                </option>
                                                                <option value="2">
                                                                    二年
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">使用费率</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control"
                                                                    name="signRateType">
                                                                <option value="1">
                                                                    商户费率
                                                                </option>
                                                                <option value="2">
                                                                    渠道费率
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer" style="text-align: center;">
                                            <button type="button" class="btn btn-success antoclose" id="submit"
                                                    data-dismiss="modal">确定
                                            </button>
                                            <button type="button" class="btn btn-primary antosubmit"
                                                    data-dismiss="modal">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" onclick="exportStore()" class="btn btn-primary">导出</button>
                        </div>
                        <div class="col-xs-12 ln_solid"></div>

                        <table id="datatable_List" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>渠道名称</th>
                                <th>渠道类型</th>
                                <th>地域</th>
                                <th>签约服务费</th>
                                <th>市场负责人</th>
                                <th>签约时间</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>
<!-- ========================================================================================================================= -->

<script type="text/javascript">
    //
    $(function () {
        // 初始化DataTables
        var table = $('#datatable_List').dataTable({
            autoWidth: false,  	// 禁用自动调整列宽
            scrollX: '100%',
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            bPaginate: true,  //是否显示分页器
            aLengthMenu: [25, 50, 100],
            bSort: false, //是否启动各个字段的排序功能
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/channel/channelList.do',

            fnServerData: function (sSource, aoData, fnCallback) {
                var reservationCreateTime = null;
                var reservationUpdateTime = null;
                var seachUser = null;
                var seachName = null;
                var timeType = $("#timeTypeId").val();
                var reservation = $("#reservation_table").val();
                var seachType = $("#seachTypeId").val();
                var seach = $("#seachId").val();
                // 对不同的帅选添加 对不同的字段赋值
//                if (timeType == 0) {
                reservationCreateTime = reservation;
                /* }else {
                    reservationUpdateTime = reservation;
                }*/
                if (seachType == 0) {
                    seachName = seach;
                } else {
                    seachUser = seach;
                }
                var areaId = $("#areaId").val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "reservationCreateTime", "value": reservationCreateTime});
                aoData.push({"name": "reservationUpdateTime", "value": reservationUpdateTime});
                aoData.push({"name": "areaId", "value": areaId});
                aoData.push({"name": "seachUser", "value": seachUser});
                aoData.push({"name": "seachName", "value": seachName});
                $.ajax({
                    type: 'POST',
                    url: sSource,
                    data: aoData,
                    dataType: 'json',
                    success: function (rs) {
                        console.log(rs);
                        fnCallback(rs);
                    }
                });
            },
            columns: [
                {
                    "data": function (obj) {
                        return "<a style='color: #3396c7;' href='${pageContext.request.contextPath}/mfq/channel/findChannelDetail.do?id=" + obj.id + "' style='cursor: pointer; text-decoration: underline; target='_blank'>" + obj.channelName + "</a>";
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.channelTypeName == null) {
                            return "";
                        } else {
                            return obj.channelTypeName
                        }
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.areaName != null) {
                            return obj.areaName;
                        } else {
                            return "";
                        }
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.signRate == '01') {
                            return '固定费率';
                        } else {
                            return '阶梯费率';
                        }
                    }
                },
                {"data": "principalUserName"},
                {
                    "data": function (obj) {
                        if (obj.signTime != null) {
                            var substringedDate = obj.signTime;
                            (6); //substringedDate= 1291548407008)/
                            var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                            var date = new Date(parsedIntDate);  // parsedIntDate passed to date constructor
                            return timeStamp2String(date);
                        } else {
                            return '';
                        }
                    }
                }
            ]
        });
        $('#query').click(function () {
            table.fnReloadAjax();
        });
    });

    // 导出
    function exportStore() {
        var reservationCreateTime = "";
        var reservationUpdateTime = "";
        var seachUser = "";
        var seachName = "";
        var timeType = $("#timeTypeId").val();
        var reservation = $("#reservation_table").val();
        var seachType = $("#seachTypeId").val();
        var seach = $("#seachId").val();
        // 对不同的帅选添加 对不同的字段赋值
        if (timeType == 0) {
            reservationCreateTime = reservation;
        } else {
            reservationUpdateTime = reservation;
        }
        if (seachType == 0) {
            seachName = seach;
        } else {
            seachUser = seach;
        }
        var areaId = $("#areaId").val();
        var param = 'reservationCreateTime=' + reservationCreateTime + '&reservationUpdateTime=' + reservationUpdateTime
            + '&areaId=' + areaId + '&seachUser=' + seachUser + '&seachName=' + seachName;
        var url = '${pageContext.request.contextPath}/mfq/channel/exportStore.do?' + param;
        window.location.href = url;
    }

    // 时间格式化
    function timeStamp2String(time) {
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        return year + "-" + month + "-" + date
    }
</script>

<!-- 各个表的初始化-->
<script src="${pageContext.request.contextPath}/vendors/chushi.js"></script>
<script type="text/javascript">
    $('#reservation').daterangepicker({
        locale: {
            format: 'YYYY-MM-DD'
        }
    })


    function initCity(i) {
        if (i != null && $.trim(i).length != 0) {
            $("#district").prev().find("span").html("");
            $("#city").prev().find("span").html("");
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mfq/store/findProvince.do",
                data: {
                    "pid": $(i).val()
                },
                success: function (data) {
                    var json = jQuery.parseJSON(data);
                    $("#city").empty();
                    $("#district").empty();
                    $("#city").append($("<option value=''>请选择城市</option>"));
                    for (var int = 0; int < json.length; int++) {
                        $("#city").append($("<option value=" + json[int].id + ">" + json[int].name + "</option>"));
                    }
                }
            });
        }
    };

    // 加载区
    function initDistrict(i) {
        if (i != null && $.trim(i).length != 0) {
            $("#district").prev().find("span").html("");
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mfq/store/findProvince.do",
                data: {
                    "pid": $(i).val()
                },
                success: function (data) {
                    var json = jQuery.parseJSON(data);
                    $("#district").empty();
                    $("#district").append($("<option value=''>请选择区</option>"));
                    for (var int = 0; int < json.length; int++) {
                        $("#district").append($("<option value=" + json[int].id + ">" + json[int].name + "</option>"));
                    }
                }
            });
        }
    }

    $("#submit").click(function () {

        var address = $("#antoform input[name='address']").val();
        if (!strCheck(address)) {
            $.confirm({
                title: '系统提示',
                text: "地址输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactTelephone = $("#antoform input[name='contactTelephone']").val();
        if (!strCheck(contactTelephone)) {
            $.confirm({
                title: '系统提示',
                text: "联系人电话输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactPerson = $("#antoform input[name='contactPerson']").val();
        if (!strCheck(contactPerson)) {
            $.confirm({
                title: '系统提示',
                text: "联系人输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var channelName = $("#antoform input[name='channelName']").val();
        if (!strCheck(channelName)) {
            $.confirm({
                title: '系统提示',
                text: "名称输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("antoform"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/channel/saveChannel.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
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
    });
</script>

</body>
</html>