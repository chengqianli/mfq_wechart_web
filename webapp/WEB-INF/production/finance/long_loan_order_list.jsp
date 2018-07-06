<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%@ include file="/WEB-INF/common/resource_css.jsp"%>
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

.details-control {
	text-align: center;
}
</style>
</head>
<body class="nav-md">
	<%-- menu profile --%>
	<%@ include file="/WEB-INF/common/menu_profile.jsp"%>
	<%-- sidebar menu --%>
	<%@ include file="/WEB-INF/common/sidebar_menu.jsp"%>
	<%-- sidebar footer --%>
	<%@ include file="/WEB-INF/common/sidebar_footer.jsp"%>
	<%-- top navigation --%>
	<%@ include file="/WEB-INF/common/top_nav.jsp"%>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="row title_left">
					<div class="span6">
						<ul class="breadcrumb">
							<li>财务管理</li>
							<li>放款订单</li>
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
								style=" box-sizing: border-box; padding: 8px 0; padding-left: 0;position:relative;">
								
								
								<div class="col-md-4 col-sm-4 col-xs-12">
										<div class=" col-md-3 col-sm-3 col-xs-12" style="padding:0;">
		                                      <input type="" name="" id="" value="下单时间" class="form-control"
		                                   style=" float: left;background:#fff;" readonly/>
		                                   </div>
									<div class=" col-md-9 col-sm-9 col-xs-12" style="padding:0;">
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
																value="" />
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
								
								<div class="col-md-2 col-sm-2 col-xs-12">
									<select name="loanType" id="loanType" class="form-control">
										<option value="">放款状态</option>
										<option value="0">未放款</option>
										<option value="1">已放款</option>
										<option value="2">等待中</option>
									</select>
								</div>
								
								<div class="col-md-4 col-sm-4 col-xs-12">
									<select name="seachType" id="seachType"  class="form-control"
										style="width: 30%; float: left;">
										<option value="01">订单号</option>
										<option value="02">姓名</option>
										<option value="03">商户名称</option>
									</select> 
									<input type="" name="" id="seach" value="" class="form-control"
										style="width: 70%; float: left;" />
								</div>
								
								
								<button type="button" class="btn btn-primary"
									style="margin-left: 20px;" id="query">查询</button>
								
							</div>
							<div class="col-xs-12 ln_solid"></div>
							<button type="button" id="myButton" class="btn btn-primary" style="position:absolute;top:8%;right:0;z-index:10;">确定放款</button>
							<table id="datatable_List"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th><input type="checkbox" id="all"  onclick="chk()" /></th>
										<th>订单号</th>
										<th>创建时间</th>
										<th>申请人</th>
										<th>商户类型</th>
										<th>放款状态</th>
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
	<%@ include file="/WEB-INF/common/resource_js.jsp"%>
	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>
	<script>
	
	function chk(){
        var all = document.getElementById("all");
        var mychk = document.getElementsByName("mychk");
        if(all.checked==true){
            if(mychk.length){
                for(var i=0;i<mychk.length;i++){
                    mychk[i].checked = true;
                }
            
            }
            mychk.checked=true;
        }else{
            if(mychk.length){
                for(var i=0;i<mychk.length;i++){
                    mychk[i].checked = false;
                }
            
            }
        }
        
    } 
	
	$('#myButton').on('click', function () {
		    // 执行方法
			 var repayIdArray = new Array();
			$('input[name="mychk"]:checked').each(function(){
				if($(this).val() != '' && $(this).val() != null && $(this).val() != 'on' ){
	 			repayIdArray.push($(this).val());
				}
			})
			if(repayIdArray.length == 0){
				$.confirm({
					title : '系统提示',
					text : '请选择一个需要结算的数据！',
					confirmButton : '确认',
					cancelButton : false,
				});
				return false;
			}
			var r=confirm("确认放款吗?");
			if (r!=true){
			  $.confirm({
					title : '系统提示',
					text : '你取消了放款!',
					confirmButton : '确认',
					cancelButton : false,
				});
			  return;
			 }
			
			$.ajax({
			url : '${pageContext.request.contextPath}/mfq/longloan/longLoanRepayment.do', //后台处理程序
			type : 'post', //数据发送方式
			dataType : 'json', //接受数据格式
			data : {repayIdArray : repayIdArray}, //要传递的数据
			success : function(result) {
				if (result.code == '0') {
					$.confirm({
						title : '系统提示',
						text : '操作成功',
						confirmButton : '确认',
						cancelButton : false,
                        confirm: function(button) {
                            location.reload(true);
                        }
					});
				} else {
					$.confirm({
						title : '系统提示',
						text : '操作失败',
						confirmButton : '确认',
						cancelButton : false,
					});
				}
			}
		});
	  })
	
	
		$(function() {
			// 初始化DataTables
			var table = $('#datatable_List')
					.dataTable(
							{
								autoWidth : false, // 禁用自动调整列宽
								scrollX : '100%',
								stripeClasses : [ 'odd', 'even' ], // 为奇偶行加上样式，兼容不支持CSS伪类的场合
								processing : false, // 隐藏加载提示,自行处理
								serverSide : true, // 启用服务器端分页
								searching : false, // 禁用原生搜索
								deferRender : true, // 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
								orderMulti : false, // 启用多列排序
								bPaginate : true, //是否显示分页器
								aLengthMenu : [ 25, 50, 100 ],
								bSort : false, //是否启动各个字段的排序功能
								order : [], // 取消默认排序查询,否则复选框一列会出现小箭头
								renderer : 'bootstrap', // 渲染样式：Bootstrap和jquery-ui
								ajaxSource : '${pageContext.request.contextPath}/mfq/finance/findLoanOrder.do',
								fnServerData : function(sSource, aoData,
										fnCallback) {
									var reservation = $("#reservation_table").val();
									var loanType = $("#loanType").val();
									var seachType = $("#seachType").val();
									var seach = $("#seach").val();
									// 往后台封装数据，json格式的字符串
									aoData.push({
										"name" : "reservation",
										"value" : reservation
									});
									aoData.push({
										"name" : "loanType",
										"value" : loanType
									});
									aoData.push({
										"name" : "seachType",
										"value" : seachType
									});
									aoData.push({
										"name" : "seach",
										"value" : seach
									});
									aoData.push({
										"name" : "longLoanRepayment",
										"value" : "longLoanRepayment"
									});
									$.ajax({
										type : 'POST',
										url : sSource,
										data : {"aoData": JSON.stringify(aoData)},
										dataType : 'json',
										success : function(rs) {
											console.log(rs);
											fnCallback(rs);
										}
									});
								},
								columns : [
										{
											"data" : function(obj) {
												
												if(obj.loanType == 0){
													return "<input  name='mychk' type='checkbox' value='"+obj.id+"' />";
												}else{
													return "<input type='checkbox'  disabled='disabled' />";
												}
											}
										},
										/* {
											"data" : function (obj) {
                                                var objSplitNo = '';
                                                if (obj.splitNo != null && obj.splitNo != '') {
                                                    objSplitNo = "<font style='color: #e74c3c;'>&nbsp;&nbsp;[" + obj.splitNo + "]</font>"
                                                }
							                    return "<a style='color:#3396c7;' href='${pageContext.request.contextPath}/mfq/finance/findLoanOrderDetail.do?orderId=" + obj.id + "' style='cursor: pointer; text-decoration: underline; target='_blank'>" + obj.orderNo + objSplitNo+"</a>";
							                }
										}, */
										{
											"data" : "orderNo","defaultContent": ""
										},
										{
											"data" : "createTime","defaultContent": ""
										},
										{
											"data" : "realName","defaultContent": ""
										},
										{
											"data" : "typeName","defaultContent": ""
										}, {
											"data" : function(obj) {
												if(obj.loanType == 0){
													return "未放款";
												} else if (obj.loanType == 2){
													return "等待中";
												} else {
													return "已放款";
												}
											}
										} ]
							});
			$('#query').click(function() {
				table.fnReloadAjax();
			});
		});
		
		
		
	</script>
</body>
</html>