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
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">展示操作</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">
                               <div class="col-md-3 col-sm-3 col-xs-12 form-group">
		                            <label class="col-sm-6 col-md-6 control-label">姓名：张三</label>
		                            <label class="col-sm-6 col-md-6 control-label">职位：贷后总监</label>
	                           </div>
                               <table class="table table-striped table-bordered">
		                            <thead>
		                            <tr>
		                                <th>今日订单量</th>
		                                <th>待分配CD1</th>
		                                <th>待分配M1</th>
		                                <th>待分配M2</th>
		                                <th>今日自动分配订单</th>
		                                <th>历史总订单量</th>
		                            </tr>
		                            </thead>
		                            <tbody>
		                                <th>110</th>
		                                <th>110</th>
		                                <th>110</th>
		                                <th>110</th>
		                                <th>110</th>
		                                <th>110</th>
		                            </tbody>
		                        </table>
                            
                            </div>
                        </div>
                        <br/>
                        <div class="control-group">
                            <div class="controls">
                               <div class="col-md-2 col-sm-2 col-xs-12" style="margin-bottom:10px;">
		                            <div class="col-sm-6 col-md-6 col-xs-12" style="margin-top:8px;">分配设置</div>
		                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#debit_modal">分配设置</button>
	                           </div>
                               <table class="table table-striped table-bordered">
		                            <thead>
		                            <tr>
		                                <th>申请单数上限</th>
		                                <th>申请分配标准</th>
		                                <th>CD1案件标准</th>
		                                <th>M1案件标准</th>
		                                <th>M2案件标准</th>
		                                <th>操作人</th>
		                                <th>最后更新时间</th>
		                            </tr>
		                            </thead>
		                            <tbody>
		                                <th>5件/人</th>
		                                <th>5件</th>
		                                <th>10件</th>
		                                <th>5件</th>
		                                <th>10件</th>
		                                <th>张三</th>
		                                <th>2018/05/22</th>
		                            </tbody>
		                        </table>
                            
                            </div>
                        </div>
                    </div>
                    <div class="x_content">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">单量列表</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">

                                <!--姓名 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="姓名" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="searchTxt" name="searchTxt" placeholder="">
                                    </div>
                                </div>
                                
                                <!-- 职位 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="cRepaymentStatus" name="cRepaymentStatus" class="form-control">
                                            <option value="">贷后主管</option>
                                            <option value="01">贷后专员</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <!-- 小组 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="cRepaymentStatus" name="cRepaymentStatus" class="form-control">
                                            <option value="">小组</option>
                                            <option value="01">第一组</option>
                                            <option value="02">第二组</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                        <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                        <button type="button" id="searchBtn1" class="btn btn-success">重置</button>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:20px;">
                                                                                                      当前案件总量：114件
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
                                <th>姓名</th>
                                <th>职位</th>
                                <th>小组</th>
                                <th>分配案件量</th>
                                <th>三天内完成订单数</th>
                                <th>已完成案件量</th>
                                <th>未完成案件量</th>
                                <th>已跟进案件量</th>
                                <th>未跟进订单数</th>
                                <th>留案案件量</th>
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


<!-- 分配模态框-->
<div id="debit_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">分配</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">申请单数上限</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="" placeholder="每天最多申请的订单数">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">申请分配标准</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="" placeholder="3天内完成案件大于该标准才能申请">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">CD1案件标准</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="" placeholder="低于该标准会自动补齐">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">M1案件标准</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="" placeholder="低于该标准会自动补齐">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">M2案件标准</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="" placeholder="低于该标准会自动补齐">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack1()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- /page content -->

<%-- footer --%>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>

<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>

<script type="text/javascript">


// 成功分配
	function editBack() {
	        $.confirm({
	            title: '系统提示',
	            text: "分配成功",
	            confirmButton: '确认',
	            cancelButton: false,
	            confirm: function (button) {
	                location.reload(true);
	            }
	        });
	}
	
	
	
	
	
	
	
	
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
                        return '<a href="${pageContext.request.contextPath}/mfq/repayment/detail.do?&orderNo='
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