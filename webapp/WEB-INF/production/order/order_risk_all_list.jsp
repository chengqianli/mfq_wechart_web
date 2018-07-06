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
							            <ul class="breadcrumb" style="padding-left:20px;">
							                <li>
							                                                         风控管理
							                </li>
							                 <li>
							                                                          订单审核
							                </li>
							                <li>全部订单</li>
							            </ul>
							        </div>
							    </div>
            </div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_content">

							<!--字段筛选-->

							<div class="col-md-12 col-sm-12 col-xs-12"
								style=" box-sizing: border-box; padding: 8px 0; padding-left: 0;">
								
							    <div class="col-md-3 col-sm-3 col-xs-12">
									<select id="status" class="form-control"
										style="width: 100%; float: left;">
										<option value="00">订单状态</option>
										<option value="01">审核中</option>
										<option value="304">审核拒绝</option>
										<option value="301">审核通过</option>
										<option value="309">测试订单</option>
										<option value="310">订单关闭</option>
										<option value="319">用户退款</option>
										<option value="312">提前还款</option>
										<option value="311">客户取消</option>
										<option value="313">替换订单</option>
									</select>
								</div>
								
								<div class="col-md-3 col-sm-3 col-xs-12">
									<select id="areaId" class="form-control"
										style="width: 100%; float: left;">
										<option value="00">地域</option>
										<c:forEach items="${area}" var="i">
											<option value="${i.id}">${i.name}</option>
										</c:forEach>
									</select>
								</div>
								
								
								<div class="col-md-4 col-sm-4 col-xs-12">
									<select id="realName" class="form-control"
										style="width: 30%; float: left;">
										<option value="01">订单号</option>
										<option value="02">姓名</option>
										<option value="03">商户名称</option>
									</select> <input type="" name="" id="inputText" value="" class="form-control"
										style="width: 70%; float: left;" />
								</div>
								
								<br />
								
								<%-- <div class="col-md-3 col-sm-3 col-xs-12" style="margin-top:10px">
									<select id="lendOrg" class="form-control"
										style="width: 100%; float: left;">
										<option value="00">放款机构</option>
										<c:forEach items="${lendOrg}" var="i">
											<option value="${i.id}">${i.shortName}</option>
										</c:forEach>
									</select>
								</div> --%>
								<div class="col-md-3 col-sm-3 col-xs-12" style="margin-top:10px">
									<select id="typeId" class="form-control"
										style="width: 100%; float: left;">
										<option value="00">商户类型</option>
										<c:forEach items="${storeType}" var="i">
											<option value="${i.id}">${i.name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-md-3 col-sm-3 col-xs-12" style="margin-top:10px">
									<select id="signStatus" class="form-control"
										style="width: 100%; float: left;">
										<option value="00">合同状态</option>
										<option value="1">已签署</option>
										<option value="4">未签署</option>
									</select>
								</div>
								
								<div class="col-md-4 col-sm-4 col-xs-12" style="margin-top:10px">
								    <input type="" name="" id="" value="下单时间" class="form-control"
										style="width: 30%; float: left;background:#fff;" readonly/>
									<!-- <span style="float: left; padding-top: 8px; width: 30%;">下单时间</span> -->
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
								<div class="col-md-1 col-sm-1 col-xs-12" style="margin-top:10px">
								<button type="button" class="btn btn-primary"
									style="margin-left: 20px;" id = "query">查询</button>
								</div>
								
								
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
										<th>订单状态</th>
										<th>合同状态</th>
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
	</div>

	<!-- /page content -->

	<%-- footer --%>
	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<%-- resource js --%>
	<%@ include file="/WEB-INF/common/resource_js.jsp"%>  
	<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>

	<script type="text/javascript">
			//
    		$(function() {
    			// 初始化DataTables
    			var table = $('#datatable_List').dataTable({
    				autoWidth: false,  	// 禁用自动调整列宽
    				/* scrollX: '100%', */
    	            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
    	            processing: false,  	// 隐藏加载提示,自行处理
    	            serverSide: true,  	// 启用服务器端分页
    	            searching: false,  	// 禁用原生搜索
    	            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
    	            orderMulti: false,   // 启用多列排序
    	            bPaginate : true,  //是否显示分页器 
    	            aLengthMenu: [25, 50, 100],
    	            bSort : true, //是否启动各个字段的排序功能 
    	            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
    	            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
    	            ajaxSource: '${pageContext.request.contextPath}/mfq/order/getList/all.do',
    	            fnServerData: function (sSource, aoData, fnCallback) {
    	            		var realName = $('#realName').val();
    	            		var inputText = $('#inputText').val();
    	            		var areaId = $('#areaId').val();
    	            		var typeId = $('#typeId').val();
    	            		var status = $('#status').val();
    	            		var reservation_table = $('#reservation_table').val();
    	            		var lendOrg = $('#lendOrg').val();
    	            		var signStatus = $('#signStatus').val();
    	            		// 往后台封装数据，json格式的字符串
    	            		aoData.push({ "name": "realName", "value": realName });
    	            		aoData.push({ "name": "inputText", "value": inputText });
    	            		aoData.push({ "name": "areaId", "value": areaId });
    	            		aoData.push({ "name": "typeId", "value": typeId });
    	            		aoData.push({ "name": "lendOrg", "value": lendOrg });
    	            		aoData.push({ "name": "status", "value": status });
    	            		aoData.push({ "name": "reservation_table", "value": reservation_table });
    	            		aoData.push({ "name": "signStatus", "value": signStatus });
    	            		$.ajax( {
    	            			type: 'POST',
    	            			url: sSource,
    	            			data: {"aoData": JSON.stringify(aoData)},
    	            			dataType: 'json',
    	            			success: function(rs) {
    	            				fnCallback(rs);
    	            			}
    	            		});
    	            },
    	            columns: [
						{
						    data: "orderNo",
						    render: function (data, type, row, meta) {
                                var rowsplitNo = '';
						        if(row.splitNo != null && row.splitNo != ''){
                                    rowsplitNo = "&nbsp;&nbsp;["+row.splitNo+"]";
								}
						    	return "<a style='color:#3396c7;' href='${pageContext.request.contextPath}/mfq/order/getOrderDetails/" + row.orderId + "/all.do' style='cursor: pointer; text-decoration: underline; target='_blank'>"+row.orderNo+"<font style='color: #e74c3c;'>"+rowsplitNo+"</font>"+"</a>";
						    }
					    },
    	                { "data": "createTime" ,"defaultContent": ""},
    	                { "data": "realName" ,"defaultContent": ""},
    	                { "data": "typeName" ,"defaultContent": ""},
    	                { "data": "storeName" ,"defaultContent": ""},
    	                { "data": "finallySum" ,"defaultContent": ""},
    	                { "data":  
    	                	function(obj) {
    	                	if(obj.status == 06 || obj.status == 07){
    	                		return "审核通过";
    	                	}else if(obj.status == 301){
    	                		return "审核通过";
    	                	}else if(obj.status == 04){
    	                		return "初审通过";
    	                	}else if(obj.status == 307){
    	                		return "合同生成中";
    	                	}else if(obj.checkStatus == 201){
    	                		return "补充资料中";
    	                	}else if(obj.checkStatus == 202){
    	                		return "补充资料完成";
    	                	}else if(obj.checkStatus == 203){
    	                		return "降额";
    	                	}else if(obj.checkStatus == 204){
    	                		return "用户同意降额";
    	                	}else if(obj.checkStatus == 205){
    	                		return "用户拒绝降额";
    	                	}else if(obj.checkStatus == 206){
    	                		return "补充报告中";
    	                	}else if(obj.checkStatus == 207){
    	                		return "补充报告失败";
    	                	}else if(obj.checkStatus == 208){
    	                		return "补充报告成功";
    	                	}else if(obj.status == 309){
    	                		return "测试订单";
    	                	}else if(obj.status == 310){
    	                		return "订单关闭";
    	                	}else if(obj.status == 311){
    	                		return "客户取消";
    	                	}else if(obj.status == 312){
    	                		return "提前还款";
    	                	}else if(obj.status == 313){
    	                		return "替换订单";
    	                	}else if(obj.status == 319){
    	                		return "用户退款";
    	                	}else if(obj.status == 304){
    	                		return "审核拒绝";
    	                	}else if(obj.status == 320){
    	                		return "已结清";
    	                	}else if(obj.status == 01){
    	                		return "审核中";
    	                	}
    	                },"defaultContent": ""
    	                },
    	                { "data": function(obj){
    	                	if(obj.signState == null || obj.signState == 4 || (obj.totalSum > obj.signSuccessSum)){
    	                		// 签署状态为空或者为待签署或者订单合同的总数大于签署成功的总数时都为未签署状态
    	                		return "未签署";
    	                	}else if(obj.signState == 1){
    	                		return "签署成功";
    	                	}else if(obj.signState == 5){
    	                		return "不能签署";
    	                	}else if(obj.signState == 2){
    	                		return "签署失败";
    	                	}
    	                } ,"defaultContent": ""},
    	                { "data":
    	                	function(obj){
    	                	if(obj.failSum > 0 || obj.totalSum == 0){
    	                		return "未分配";
    	                	}else{
    	                		return "已分配";
    	                	}
    	                }}
    	            ]
    			});
    			$('#query').click( function () {
    				table.fnReloadAjax();
    		    } );
    		});
    </script>

</body>
</html>