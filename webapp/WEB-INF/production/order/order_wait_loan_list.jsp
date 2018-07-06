<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%@ include file="/WEB-INF/common/resource_css.jsp"%>
<style type="text/css">
    	.col-sm-7{margin: 2% 0;}
    	a:hover{text-decoration:underline;}
    	#datatable_length{width: 100%;}
    	#datatable_length{float: right;}
    	.menu_section{margin-bottom: 0;}
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
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="row title_left">
					<div class="span6">
						<ul class="breadcrumb" style="padding-left:20px;">
							<li>风控管理</li>
							<li>订单审核</li>
							<li>未分配订单</li>
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
								style=" box-sizing: border-box; padding: 8px 0; padding-left: 0;">
								<div class="col-md-4 col-sm-4 col-xs-12">
									<input type="" name="" id="" value="下单时间" class="form-control"
										style="width: 30%; float: left;background:#fff;" readonly/>
									<div class="col-xs-9" style="width: 70%;padding:0;">
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
									<select id="areaId" class="form-control">
										<option value="00">地域</option>
										<c:forEach items="${area}" var="i">
											<option value="${i.id}">${i.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2 col-sm-2 col-xs-12">
									<select id="typeId" class="form-control">
										<option value="00">商户类型</option>
										<c:forEach items="${storeType}" var="i">
											<option value="${i.id}">${i.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-12">
									<select id="realName" class="form-control"
										style="width: 40%; float: left;">
										<option value="01">订单号</option>
										<option value="02">姓名</option>
										<option value="03">商户名称</option>
									</select> <input type="" name="" id="inputText" value="" class="form-control"
										style="width: 60%; float: left;" />
								</div>
								<button type="button" class="btn btn-primary"
									style="margin-left: 20px"  id = "query">查询</button>
							</div>
                            <div class="col-xs-12 ln_solid"></div>
                            <div class="table-responsive col-xs-12">
							<table id="datatable_List"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>订单号</th>
										<th>创建时间</th>
										<th>申请人</th>
										<th>商户类型</th>
										<th>商户名称</th>
										<th>订单金额</th>
									</tr>
								</thead>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- footer --%>
	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<%-- resource js --%>
	<%@ include file="/WEB-INF/common/resource_js.jsp"%>
	<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>
	<script type="text/javascript">
		//
		$(function() {
			// 初始化DataTables
			var table = $('#datatable_List')
					.dataTable(
							{
								autoWidth : false, // 禁用自动调整列宽
								/* scrollX : '100%', */
								stripeClasses : [ 'odd', 'even' ], // 为奇偶行加上样式，兼容不支持CSS伪类的场合
								processing : false, // 隐藏加载提示,自行处理
								serverSide : true, // 启用服务器端分页
								searching : false, // 禁用原生搜索
								deferRender : true, // 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
								orderMulti : false, // 启用多列排序
								aLengthMenu: [25, 50, 100],
								bPaginate : true, //是否显示分页器
								bSort : true, //是否启动各个字段的排序功能
								order : [], // 取消默认排序查询,否则复选框一列会出现小箭头
								renderer : 'bootstrap', // 渲染样式：Bootstrap和jquery-ui
								ajaxSource : '${pageContext.request.contextPath}/mfq/order/getList/loan.do',
								fnServerData : function(sSource, aoData,
										fnCallback) {
									var realName = $('#realName').val();
		    	            		var inputText = $('#inputText').val();
		    	            		var areaId = $('#areaId').val();
		    	            		var typeId = $('#typeId').val();
		    	            		var reservation_table = $('#reservation_table').val();
		    	            		// 往后台封装数据，json格式的字符串
		    	            		aoData.push({ "name": "realName", "value": realName });
		    	            		aoData.push({ "name": "inputText", "value": inputText });
		    	            		aoData.push({ "name": "areaId", "value": areaId });
		    	            		aoData.push({ "name": "typeId", "value": typeId });
		    	            		aoData.push({ "name": "reservation_table", "value": reservation_table });
									$.ajax({
										type : 'POST',
										url : sSource,
										data : {
											"aoData" : JSON.stringify(aoData)
										},
										dataType : 'json',
										success : function(rs) {
											fnCallback(rs);
										}
									});
								},
								columns : [
											{
											    data: "orderNo",
											    render: function (data, type, row, meta) {
                                                    var rowsplitNo = '';
                                                    if(row.splitNo != null && row.splitNo != ''){
                                                        rowsplitNo = "&nbsp;&nbsp;["+row.splitNo+"]";
                                                    }
											    	return "<a style='color:#3396c7;' href='${pageContext.request.contextPath}/mfq/order/getOrderDetails/" + row.orderId + "/loan.do' style='cursor: pointer; text-decoration: underline; target='_blank'>"+row.orderNo+"<font style='color: #e74c3c;'>"+rowsplitNo+"</font>"+"</a>";
											    },"defaultContent": ""
										    },
					    	                { "data": "createTime" ,"defaultContent": ""},
					    	                { "data": "realName" ,"defaultContent": ""},
					    	                { "data": "typeName" ,"defaultContent": ""},
					    	                { "data": "storeName" ,"defaultContent": ""},
					    	                { "data": "finallySum" ,"defaultContent": ""}
					    	            ]

							});
			$('#query').click(function() {
				table.fnReloadAjax();
			});
		});
	</script>
	<script type="text/javascript">
		$('#reservation').daterangepicker({
			locale : {
				format : 'YYYY-MM-DD'
			}
		})
	</script>

</body>
</html>