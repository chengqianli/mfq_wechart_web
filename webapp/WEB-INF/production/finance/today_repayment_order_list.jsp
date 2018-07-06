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
                        <li>财务管理</li>
                        <li>今日扣款订单</li>
                        <!--<li class="active"><a href="#">待放款订单</a> <span class="divider"></span></li>-->
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">

                        <!--字段筛选-->

                        <div class="col-md-12 col-sm-12 col-xs-12"
                             style="box-sizing: border-box;padding: 8px 0;padding-left: 0;">
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="" name="" id="" value="还款日期"  class="form-control"
                                       style="width: 30%;float: left;background:#fff;" readonly/>
                                <div class="col-xs-10" style="width:70%;padding:0;">
                                    <form class="form-horizontal">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <div class="input-prepend input-group">
                                                                <span class="add-on input-group-addon"
                                                                      style="border-radius: 0;"><i
                                                                        class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                        <input type="text" name="reservation"
                                                               id="reservation_table" class="form-control"
                                                               value="${dataStr} ~ ${dataStr}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select name="repaymentStatus" id="repaymentStatus" class="form-control">
                                    <option value="">当期还款状态</option>
                                    <option value="01">未还</option>
                                    <option value="02">已还</option>
                                    <option value="06">逾期未还</option>
                                    <option value="07">逾期已还</option>
                                    <option value="09">部分还款</option>
                                    <option value="10">逾期部分还款</option>
                                </select>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select name="lenderId" id="lenderId" class="form-control">
                                    <option value="">放款机构</option>
                                    <c:forEach items="${listSearchLend}" var="listSearchLend">
                                        <option value="${listSearchLend.id}">${listSearchLend.shortName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select name="seachType" id="seachType" class="form-control" style="width: 40%;float: left;">
                                    <option value="1">订单号</option>
                                    <option value="2">姓名</option>
                                    <option value="3">商户名称</option>
                                </select>
                                <input type="" name="seach" id="seach"  class="form-control"
                                       style="width: 60%;float: left;"/>
                            </div>
                            <button type="button" id="query" class="btn btn-primary" style="margin-left: 20px;">查询</button>
                        </div>
                        <div class="col-xs-12 ln_solid"></div>
                        <table id="datatable_List" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>还款日</th>
                                <th>申请人</th>
                                <th>商户类型</th>
                                <th>商户名称</th>
                                <th>订单金额</th>
                                <th>服务费</th>
                                <th>当期还款状态</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>
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
            ajaxSource: '${pageContext.request.contextPath}/mfq/finance/findToDayRepayment.do',

            fnServerData: function (sSource, aoData, fnCallback) {
                var reservation = $("#reservation_table").val();
                var lenderId = $("#lenderId").val();
                var repaymentStatus = $("#repaymentStatus").val();
                var seachType = $("#seachType").val();
                var seach = $("#seach").val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "reservation", "value": reservation});
                aoData.push({"name": "lenderId", "value": lenderId});
                aoData.push({"name": "repaymentStatus", "value": repaymentStatus});
                aoData.push({"name": "seachType", "value": seachType});
                aoData.push({"name": "seach", "value": seach});
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
                {"data": function (obj) {
                    var objSplitNo = '';
                    if (obj.splitNo != null && obj.splitNo != '') {
                        objSplitNo = "<font style='color: #e74c3c;'>&nbsp;&nbsp;[" + obj.splitNo + "]</font>"
                    }
                    //return "<a style='color:#3396c7;' href='${pageContext.request.contextPath}/mfq/finance/findOrderDetail.do?orderId=" + obj.id + "' style='cursor: pointer; text-decoration: underline; target='_blank'>" + obj.orderNo + objSplitNo+"</a>";//旧方法
                    
                    return "<a style='color:#3396c7;' href='${pageContext.request.contextPath}/mfq/finance/findLoanOrderDetail.do?type=00&orderId=" + obj.id + "' style='cursor: pointer; text-decoration: underline; target='_blank'>" + obj.orderNo + objSplitNo+"</a>";

                }},
                {"data":function (obj) {
                    if (obj.repaymentDate != null){
                       return timeStamp2String(obj.repaymentDate)
                    }else{
                        return '132';
                    }
                }},
                {"data": "realName","defaultContent": ""},
                {"data": "stypeName","defaultContent": ""},
                {"data":"storeName","defaultContent": ""},
                {"data":"finallySum","defaultContent": ""},
                {"data":"userRateSum","defaultContent": ""},
                {"data":"statusName","defaultContent": ""}

            ]
        });
        $('#query').click(function () {
            table.fnReloadAjax();
        });
    });
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
</body>
</html>