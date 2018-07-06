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
            <div class="title_left">
                <div class="span6">
                    <!-- 面包屑导航 -->
                    <ul class="breadcrumb">
                        <li><a herf="#">贷后管理</a></li>
                        <li><a herf="#">贷后订单</a></li>
                        <li class="active"><a href="#">全部订单</a></li>
                    </ul>
                </div>
            </div>
        </div>
<%--         <form action="${pageContext.request.contextPath }/mfq/DHrepayment/text.do" method="get"> --%>
<!--         	<input name = "id">id -->
<!--         	<button>确定</button> -->
<%--         	<a href="${pageContext.request.contextPath }/mfq/DHrepayment/DHrepaymentList.do">查询所有订单接口</a> --%>
<!--         </form> -->
        	<h2>重构贷后页面</h2>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">订单列表</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">
                                <!-- 还款状态 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="repaymentStatus" name="repaymentStatus" class="form-control">
                                            <option value="">还款状态</option>
                                            <option value="01">正常</option>
                                            <option value="06">逾期</option>
                                            <option value="02">已结清</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- 组合筛选 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <select id="searchType" name="searchType" class="form-control">
                                            <option value="01">订单号</option>
                                            <option value="02">姓名</option>
                                            <option value="03">商户姓名</option>
                                        </select>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="searchTxt" name="searchTxt" placeholder="">
                                    </div>
                                </div>
                                <!-- 当期还款状态 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="cRepaymentStatus" name="cRepaymentStatus" class="form-control">
                                            <option value="">当期还款状态</option>
                                            <option value="01">未还</option>
                                            <option value="02">已还</option>
                                            <option value="06">逾期未还</option>
                                            <option value="07">逾期已还</option>
                                            <option value="09">部分还款</option>
                                            <option value="10">逾期部分还款</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12 form-group has-feedback"></div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">

                                <!-- 还款方式 -->
                               <!--  <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="repaymentType" name="repaymentType" class="form-control">
                                            <option value="">还款方式</option>
                                            <option value="NORM">正常</option>
                                            <option value="ADV">提前还款</option>
                                            <option value="CANC">用户退款</option>
                                        </select>
                                    </div>
                                </div> -->
                                <!-- 还款时间 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="control-label col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="text" class="form-control"
                                               style="padding-right: 12px;background:#fff;" id="" name="" value="还款时间"
                                               readonly/></div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control has-feedback-left" id="repaymentDay"
                                               placeholder="" aria-describedby="inputSuccess2Status">
                                        <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"
                                              style="left:1px;"></span>
                                        <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="x_content">
                        <!-- 虚线 -->
                        <div class="divider-dashed "></div>
                        <table id="datatable_repayment_list" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>还款状态</th>
                                <!-- <th>账龄</th> -->
                                <th>订单编号</th>
                                <th>姓名</th>
                                <th>商户名称</th>
                                <th>当前期</th>
                                <th>已还款期数</th>
                                <th>逾期天数</th>
                                <th>还款日</th>
                                <th>月还</th>
                                <th>还款方式</th>
                                <th>当前还款状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
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

<script type="text/javascript">
    $(function () {

        // 初始化还款时间
        $('#repaymentDay').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_3",
            locale: {
                format: 'D'
            },
            autoUpdateInput: false,
        }, function (start, end, label) {
        });

        $('#searchBtn').click(function () {
            table.fnReloadAjax();
        })

        // 初始化DataTables
        var table = $('#datatable_repayment_list').dataTable({
            autoWidth: false,  	// 禁用自动调整列宽
            scrollX: '100%',
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            aLengthMenu: [[25, 50, 100, -1], [25, 50, 100, "全部"]],
            paginate: true,		// 翻页功能
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            aoColumnDefs: [{"bSortable": false, "aTargets": [11]}],
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/DHrepayment/dhRepaymentList.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                // 组合晒选类型
                var searchType = $('#searchType').val();
                var searchTxt = $('#searchTxt').val();
                var repaymentStatus = $('#repaymentStatus').val();
                console.log(repaymentStatus);
                var cRepaymentStatus = $('#cRepaymentStatus').val();
                var repaymentDay = $('#repaymentDay').val();
                var repaymentType = $('#repaymentType').val();
                var overdueType = $('#overdueType').val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "pageName", "value": "ALL" });
                aoData.push({"name": "searchType", "value": searchType});
                aoData.push({"name": "searchTxt", "value": searchTxt});
                aoData.push({"name": "repaymentStatus", "value": repaymentStatus});
                aoData.push({"name": "cRepaymentStatus", "value": cRepaymentStatus});
                aoData.push({"name": "repaymentDay", "value": repaymentDay});
                aoData.push({"name": "repaymentType", "value": repaymentType});
                aoData.push({"name": "overdueType", "value": overdueType});
                $.ajax({
                    type: 'POST',
                    url: sSource,
                    data: {"aoData": JSON.stringify(aoData)},
                    dataType: 'json',
                    success: function (rs) {
                        fnCallback(rs);
                    }
                });
            },
            columns: [
                {
                    "data": function (obj) {
                        var repaymentStatus;
                        switch (obj.repaymentStatus) {
                            case '01':
                            	repaymentStatus = '正常';
                                break;
                            case '02':
                            	repaymentStatus = '已结清';
                                break;
                            case '06':
                                repaymentStatus = '逾期';
                                break;
                        }
                        return repaymentStatus;
                    }
                },
                {
                    "data": function (obj) {
                        var objSplitNo = '';
                        if (obj.splitNo != null && obj.splitNo != '') {
                            objSplitNo = "<font style='color: #e74c3c;'>&nbsp;&nbsp;[" + obj.splitNo + "]</font>"
                        }
                        return obj.orderNo + objSplitNo;

                    },"defaultContent": ""
                },
                {"data": "realName","defaultContent": ""},
                {"data": "storeName","defaultContent": ""},
                {"data": "repaymentStage","defaultContent": ""},
                {"data": "currentStage","defaultContent": ""},
                {"data": "overdueDay","defaultContent": ""},
                {
                    "data": function (obj) {
                        return obj.repaymentDay;
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.repaymentPrincipal + obj.repaymentInterest).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        var type = '';
                        switch (obj.type) {
                            case 'NORM':
                                type = '正常';
                                break;
                            case 'CANC':
                                type = '用户退款';
                                break;
                            case 'ADV':
                                type = '提前还款';
                                break;
                        }
                        return type;
                    }
                },
                {
                    "data": function (obj) {
                        var detailStatus;
                        switch (obj.detailStatus) {
                            case '01':
                            	detailStatus = '未还';
                                break;
                            case '02':
                            	detailStatus = '已还';
                                break;
                            case '06':
                            	detailStatus = '逾期未还';
                                break;
                            case '07':
                            	detailStatus = '逾期已还';
                                break;
                            case '09':
                            	detailStatus = '部分还款';
                                break;
                            case '10':
                            	detailStatus = '逾期部分还款';
                                break;
                        }
                        return detailStatus;
                    }
                },
                {
                    "data": function (obj) {
                        return '<a href="${pageContext.request.contextPath}/mfq/DHrepayment/detail.do?id='
                        	+obj.id +'&orderNo='
                            + obj.orderNo + '&orderId='
                            + obj.orderId + '&userId='
                            + obj.userId + '&repaymentId='
                            + obj.repaymentId + '&repaymentDetailId='
                            + obj.repaymentDetailId + '&pageValue=00'
                            + '" class="btn btn-info btn-xs"><i class="fa fa-eye">详情</i></a>'
                    }
                }
            ]

        });

    })

</script>
</body>
</html>