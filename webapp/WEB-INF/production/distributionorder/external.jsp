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
                        <li class="active"><a href="#">外派订单</a></li>
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

                                <!-- 负责人姓名 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="负责人姓名" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="searchTxt" name="searchTxt" placeholder="">
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback" style="margin-top:20px;">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" id="searchBtn4" class="btn btn-success" data-toggle="modal" data-target="#debit_modal">分配</button>
                                        <button type="button" id="searchBtn5" class="btn btn-success" onclick="editBack3()">收回</button>
                                    </div>
                                    
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" id="searchBtn2" class="btn btn-success" data-toggle="modal" data-target="#messageListModelId">设置协助</button>
                                        <button type="button" id="searchBtn3" class="btn btn-success" onclick="editBack5()">设置留案</button>
                                    </div>
                                    
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                        <button type="button" id="searchBtn1" class="btn btn-success">重置</button>
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
                                <th><input type="checkbox" class="checkall" id="checkF" onchange="quanXuan()"/></th>
                                <th>订单号</th>
                                <th>还款人姓名</th>
                                <th>还款日</th>
                                <th>账龄</th>
                                <th>负责人姓名</th>
                                <th>月还本息</th>
                                <th>当期还款状态</th>
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
                    <form id="antoform" class="form-horizontal calender" action="${pageContext.request.contextPath}/mfq/DHRepaymentAllot/Allot.do" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">组<span style="color:#fff;">你好</span>号</label>
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
                            <label class="col-sm-2 col-md-2 control-label">总案件量</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="4000" style="border:0;">
                            </div>
                        </div>
                        <table class="table table-striped table-bordered" style="table-layout: fixed;">
                            <thead>
                            <tr> 
                                <th><input type="checkbox"/></th>
                                <th>职位</th>
                                <th>姓名</th>
                                <th style="width:30%;">案件量</th>
                            </tr>
                            </thead>
                            <tbody id="messageListTbodyId">
								 <c:forEach items="${deptUser}" var="item">
								 	<tr>
							            <th><input type="checkbox" value="${item.id}"/></th>
							            <th>贷后主管</th>
							            <th>${item.realName}</th>
							            <th style="word-wrap: break-word;"><input type="text" name="numble" class="form-control"/>
								 	</tr>
						        </c:forEach>
                            </tbody>
                        </table>
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
<div id="fc_debit" data-toggle="modal" data-target="#debit_modal"></div>
<!-- /提前还款 or 用户退款 模态框 -->

<!-- 案件分配结果如下 -->
<div class="modal fade " tabindex="-1" id="payListModelId"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <!-- <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button> -->
                <h4 class="modal-title">案件分配结果如下</h4>
            </div>
            <div class="modal-body">
                <div style="padding: 5px 20px;">
                    <div class="form-group">
                        <table class="table table-striped table-bordered" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th>职位</th>
                                <th>姓名</th>
                                <th>案件量</th>
                            </tr>
                            </thead>
                            <tbody id="messageListTbodyId">
                               <th>贷后主管</th>
                               <th>张飞</th>
                               <th>10</th>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal" data-toggle="modal" data-target="#debit_modal">上一步</button>
            </div>
        </div>
    </div>
</div>


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
	
	
	// 分配失败
	function editBack1() {
		var cc=false;
		if(cc == true){
			 $.confirm({
		            title: '系统提示',
		            text: "分配案件数错误",
		            confirmButton: '确认',
		            cancelButton: false,
		        });
		}else{
			 $('#payListModelId').modal('show')
		}
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
		var zz=false;
		if(zz == true){
			 $.confirm({
		            title: '收回订单',
		            text: "请选择已经分配订单进行分配",
		            confirmButton: '确认',
		            cancelButton: false,
		        });
		}else{
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
            aLengthMenu: [[25, 50, 100, 10000], [25, 50, 100, 10000]],
            paginate: true,		// 翻页功能
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            aoColumnDefs: [{"bSortable": false, "aTargets": [8]}],
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/DHRepaymentAllot/allotList.do',
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
            	{"data": function (obj){
            		return "<input type='checkbox' id='"+obj.ID+"'/>"
            	  }
            	},
                {"data": "订单号","defaultContent": ""},
                {"data": "还款人姓名","defaultContent": ""},
                {"data": "还款日","defaultContent": ""},
                //{"data": "账龄","defaultContent": ""},
                { "data": function(obj) {
            		var overdueDay = parseInt(obj.账龄);
            		if (overdueDay >= 181) {
            			return 'M6+';
            		} else if (overdueDay >= 151) {
            			return 'M5';
            		} else if (overdueDay >= 121) {
            			return 'M4';
            		} else if (overdueDay >= 91) {
            			return 'M3';
            		} else if (overdueDay >= 61) {
            			return 'M2';
            		} else if (overdueDay >= 31) {
            			return 'M1';
            		} else if (overdueDay >= 1) {
            			return 'CD1';
            		} else {
            			return overdueDay;
            		}
            	}},
                {"data": "负责人姓名","defaultContent": ""},
                {"data": "月还金额","defaultContent": ""},
               // {"data": "当期还款状态","defaultContent": ""},
                {
                    "data": function (obj) {
                        var detialRepaymentStatus;
                        switch (obj.当期还款状态) {
                            case '01':
                                detialRepaymentStatus = '未还';
                                break;
                            case '02':
                                detialRepaymentStatus = '已还';
                                break;
                            case '06':
                                detialRepaymentStatus = '逾期未还';
                                break;
                            case '07':
                                detialRepaymentStatus = '逾期已还';
                                break;
                            case '09':
                                detialRepaymentStatus = '部分还款';
                                break;
                            case '10':
                                detialRepaymentStatus = '逾期部分还款';
                                break;
                            case '11':
                                detialRepaymentStatus = '提前还款';
                                break;
                            case '12':
                                detialRepaymentStatus = '退款';
                                break;
                        }
                        return detialRepaymentStatus;
                    }
                },
                //{"data": "分单状态","defaultContent": ""},
                {
                    "data": function (obj) {
                        var allotStatus;
                        switch (obj.分单状态) {
                            case '00':
                            	allotStatus = '待分配';
                                break;
                            case '01':
                            	allotStatus = '已分配';
                                break;
                            case '02':
                            	allotStatus = '已跟进';
                                break;
                            case '03':
                            	allotStatus = '申请协助';
                                break;
                            case '04':
                            	allotStatus = '待协助';
                                break;
                            case '05':
                            	allotStatus = '留案';
                                break;
                            case '06':
                            	allotStatus = '外催';
                                break;
                            case '07':
                            	allotStatus = '已完成';
                                break;
                        }
                        return allotStatus;
                    }
                },
             //   {"data": "分配日期","defaultContent": ""},
                {
                    "data": function (obj) {
                    	//分配日期
                        return new Date(parseInt(obj.分配日期)).format('yyyy-MM-dd');
                    },"defaultContent": ""
                },
            ]

        });

    })
    
    function quanXuan(){
    	var checkF = $("#checkF").is(":checked");
    	if(checkF){
    		$("#datatable_repayment_list").find('.checkchild').prop('checked',true);
    	}else{
    		$("#datatable_repayment_list").find('.checkchild').prop('checked',false);
    	}
    }
</script>
</body>
</html>