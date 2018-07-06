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
                        <li><a herf="#">案件分配</a></li>
                        <li class="active"><a href="#">订单操作</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">操作列表</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">

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
                                
                                <!--订单号 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="订单号" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="searchTxt" name="searchTxt" placeholder="">
                                    </div>
                                </div>
                                <!-- 还款日期 -->
                                <div class="col-md-4 col-sm-4 col-xs-12">
								    <input type="" name="" id="" value="还款日期" class="form-control"
										style="width: 30%; float: left;background:#fff;" readonly/>
									<div class="col-xs-9" style="width: 70%; padding: 0;">
										<form class="form-horizontal">
											<fieldset>
												<div class="control-group">
													<div class="controls">
														<div class="input-prepend input-group">
															<span class="add-on input-group-addon"
																style="border-radius: 0;"><i
																class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
															<input type="text" name="reservation"
																id="reservation_table" class="form-control" />
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">

                                <!-- 分配状态 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="repaymentType" name="repaymentType" class="form-control">
                                            <option value="">分配状态</option>
                                            <option value="">已分配</option>
                                            <option value="">待分配</option>
                                            <option value="">已跟进</option>
                                            <option value="">申请协助</option>
                                            <option value="">待协助</option>
                                            <option value="">留案</option>
                                            <option value="">外催</option>
                                            <option value="">已完成</option>
                                        </select>
                                    </div>
                                </div>
                                
                                
                                <!-- 还款人姓名 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="还款人姓名" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="searchTxt" name="searchTxt" placeholder="">
                                    </div>
                                </div>
                                
                                
                                <!-- 分配日期 -->
                                <div class="col-md-4 col-sm-4 col-xs-12">
								    <input type="" name="" id="" value="分配日期" class="form-control"
										style="width: 30%; float: left;background:#fff;" readonly/>
									<div class="col-xs-9" style="width: 70%; padding: 0;">
										<form class="form-horizontal">
											<fieldset>
												<div class="control-group">
													<div class="controls">
														<div class="input-prepend input-group">
															<span class="add-on input-group-addon"
																style="border-radius: 0;"><i
																class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
															<input type="text" name="reservation"
																id="reservation_table1" class="form-control" />
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>								
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                            
                            
                            
                                <!-- 账龄 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="overdueType" name="overdueType" class="form-control">
                                            <option value="">账龄</option>
                                            <option value="CD1">CD1</option>
                                            <option value="M1">M1</option>
                                            <option value="M2">M2</option>
                                            <option value="M3">M3</option>
                                            <option value="M4">M4</option>
                                            <option value="M5">M5</option>
                                            <option value="M6+">M6+</option>
                                        </select>
                                    </div>
                                </div>

                                
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback" style="margin-top:20px;">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <button type="button" id="searchBtn4" class="btn btn-success" onclick="editBack5()">设置留案</button>
                                        <button type="button" id="searchBtn5" class="btn btn-success" onclick="editBack3()">申请留案</button>
                                        <button type="button" id="searchBtn2" class="btn btn-success" data-toggle="modal" data-target="#messageListModelId">设置协助</button>
                                    </div>
                                    
                                    
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                        <button type="button" id="searchBtn1" class="btn btn-success">重置</button>
                                    </div>
                                    
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                    </div>
                                </div>

                            </div>
                        </div>
                        
                        
                        <div class="control-group">
                               <div class="controls">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback" style="margin-top:20px;">
                                                                                                                                                当前案件：40件 ，已分配：20件，已跟进：10件 ，协助：10件，留案：0件  
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
                                <th><input type="checkbox"></th>
                                <th>订单号</th>
                                <th>还款人姓名</th>
                                <th>身份证号</th>
                                <th>还款日</th>
                                <th>账龄</th>
                                <th>月还本息</th>
                                <th>当期还款状态</th>
                                <th>负责人姓名</th>
                                <th>分配状态</th>
                                <th>分配日期</th>
                                <!-- <th>当前还款状态</th>
                                <th>操作</th> -->
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

<!-- 申请案件-->
<div id="debit_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">申请案件</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">当前案件：</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="40件" style="border:0;background:#fff;" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">待分配案件：</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="40件" style="border:0;background:#fff;" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">申请案件：</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div id="fc_debit" data-toggle="modal" data-target="#debit_modal"></div>
<!-- /提前还款 or 用户退款 模态框 -->



<!-- 设置留案 -->
<div class="modal fade " tabindex="-1" id="payListModelIdsss"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">设置留案</h4>
            </div>
            <div class="modal-body">
                <div style="padding: 5px 20px;">
                    <div class="form-group">
                        <h>是否将案件设置为留案状态（设置完成后，不会进入外催）</h>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack4()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 设置协助 -->
<div class="modal fade " tabindex="-1" id="messageListModelId"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">设置协助</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">组<span style="color:#fff;">你好</span></label>
                            <div class="col-sm-4 col-md-4">
                                <select id="debitSource" name="debitSource" class="form-control" required>
                                    <option value="">请选择</option>
                                    <option value="1">宝付</option>
                                    <option value="3">先锋</option>
                                    <option value="4">连连</option>
                                    <option value="5">支付宝</option>
                                    <option value="6">微信</option>
                                    <option value="7">对公转账 -- 招商一般户</option>
                                    <option value="8">对公转账 -- 法人卡转账</option>
                                    <option value="2">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">协助人</label>
                            <div class="col-sm-4 col-md-4">
                                <select id="debitSource" name="debitSource" class="form-control" required>
                                    <option value="">请选择</option>
                                    <option value="1">宝付</option>
                                    <option value="3">先锋</option>
                                    <option value="4">连连</option>
                                    <option value="5">支付宝</option>
                                    <option value="6">微信</option>
                                    <option value="7">对公转账 -- 招商一般户</option>
                                    <option value="8">对公转账 -- 法人卡转账</option>
                                    <option value="2">其他</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack2()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">取消</button>
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


	
	//申请
	function editBack() {
			 $.confirm({
		            title: '申请案件',
		            text: "申请成功",
		            confirmButton: '确认',
		            cancelButton: false,
		        });
	} 
	
	// 设置协助
	function editBack2() {
			 $.confirm({
		            title: '设置协助',
		            text: "是否取消协助状态",
		            confirmButton: '确认',
		            cancelButton: '取消',
		        });
	}
	
	
	// 设置留案
	function editBack4() {
		$.confirm({
            title: '设置留案',
            text: "是否取消留案状态",
            confirmButton: '确认',
            cancelButton: '取消',
        });
	}
	
	
	// 设置留案判断
	function editBack5() {
		var bb=false;
		if(bb == true){
			$.confirm({
	            title: '设置留案',
	            text: "请选择相同订单状态进行批量操作",
	            confirmButton: '确认',
	            cancelButton: '取消',
	        });
		}else{
			 $('#payListModelIdsss').modal('show')
		}
	}
	
	//  收回
	function editBack3() {
		var zz=03;
		if(zz == 02){
			 $.confirm({
		            title: '收回订单',
		            text: "请选择已经分配订单进行分配",
		            confirmButton: '确认',
		            cancelButton: false,
		        });
		}else if(zz == 01){
			$.confirm({
	            title: '收回订单',
	            text: "是否将当前100个订单变成待分配状态",
	            confirmButton: '确认',
	            cancelButton: '取消',
	            confirm: function (button) {
	            	alert('回收成功')
	            },
	            cancel: function(button) {
	                // nothing to do
	            },
	        });
		}else{
			$('#debit_modal').modal('show')
		}
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