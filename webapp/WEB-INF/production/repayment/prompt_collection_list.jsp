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
    						<!-- 面包屑导航 -->
 						<ul class="breadcrumb">
 							<li><a herf="#">贷后管理</a></li>
 						 	<li><a herf="#">贷后订单</a></li>
 						 	<li class="active"><a href="#">催收订单</a></li>
 						</ul>
    					</div>
    				</div>
    			</div>
    			<div class="clearfix"></div>
    			<div class="row">
              	<div class="col-md-12 col-sm-12 col-xs-12">
                		<div class="x_panel">
                  		<div class="x_title">
                    			<h2 style="font-size:18px;">订单列表</h2>
                    			<div class="clearfix"></div>
                    		</div>
	                    	<div class="x_content">
	                    		<br />
	                    		<div class="control-group">
                            		<div class="controls">
                            			
			                    		<!-- 还款日 -->
			                    		<div class="col-md-2 col-sm-2 col-xs-12 form-group has-feedback">
			                    			<div class="col-md-12 col-sm-12 col-xs-12">
			                    				<select id="repaymentDay" name="repaymentDay" class="form-control">
			                    					<option value="">全部</option>
												<c:forEach var="dayNo" begin="1" end="31"> 
													<option>${dayNo }</option>
												</c:forEach>
			                    				</select>
			                    			</div>
			                    		</div>
			                    		<!-- 当期还款状态 -->
			                    		<div class="col-md-2 col-sm-2 col-xs-12 form-group has-feedback">
			                    			<div class="col-md-12 col-sm-12 col-xs-12">
			                    				<select id="cRepaymentStatus" name="cRepaymentStatus" class="form-control">
			                    					<option value="">当期还款状态</option>
												<!-- <option value="01">未还</option> -->
								        			<!-- <option value="02">已还</option> -->
								        			<option value="06">逾期未还</option>
								        			<!-- <option value="07">逾期已还</option> -->
								        			<!-- <option value="09">部分还款</option> -->
								        			<option value="10">逾期部分还款</option>
			                    				</select>
			                    			</div>
			                    		</div>
			                    		<!-- 账龄 -->
                        				<div class="col-md-2 col-sm-2 col-xs-12 form-group has-feedback">
                        					<div class="col-md-12 col-sm-12 col-xs-12">
			                    				<select id="overdueType" name="overdueNo" class="form-control">
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
			                    				<input type="text" class="form-control" style="padding-right: 12px;" id="searchTxt" name="searchTxt" placeholder="">
			                    			</div>
			                    		</div> 
			                    		<div class="col-md-2 col-sm-2 col-xs-12 form-group has-feedback">
			                    			<button type="button" id="searchBtn" class="btn btn-success">查询</button>
			                    		</div>
	                    			</div>
	                    		</div>
	                    	</div>
	                    	<div class="x_content">
	                    		<!-- 虚线 -->
	                    		<div class="divider-dashed"></div>
	                    		<table id="datatable_repayment_list" class="table table-striped table-bordered">
				        			<thead>
				                 	<tr>
				                      	<th>还款状态</th>
									  	<th>账龄</th>
									  	<th>订单编号</th>
									  	<th>姓名</th>
									  	<th>商户名称</th>
									  	<th>当前期</th>
									  	<th>已还款期数</th>
							          	<th>逾期天数</th>
							          	<th>还款日</th>
							          	<th>月还</th>
							          	<!--<th>还款方式</th> -->
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
	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<%-- resource js --%>
	<%@ include file="/WEB-INF/common/resource_js.jsp"%> 
	
	<script type="text/javascript">
		$(function() {
			
			$('#searchBtn').click(function(){
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
	            aoColumnDefs: [ { "bSortable": false, "aTargets": [ 8 ] }],  
	            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
	            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
	            stateSave: true,
	            ajaxSource: '${pageContext.request.contextPath}/mfq/repayment/repaymentList.do',
	            fnServerData: function (sSource, aoData, fnCallback) {
	            		// 组合晒选类型
	            		var searchType = $('#searchType').val();
	            		var searchTxt = $('#searchTxt').val();
	            		var repaymentStatus = $('#repaymentStatus').val();
	            		var cRepaymentStatus = $('#cRepaymentStatus').val();
	            		var repaymentDay = $('#repaymentDay').val();
	            		var repaymentType = $('#repaymentType').val();
	            		var overdueType = $('#overdueType').val();
	            		// 往后台封装数据，json格式的字符串
	            		aoData.push({ "name": "pageName", "value": "PROMPT" });
	            		aoData.push({ "name": "searchType", "value": searchType });
	            		aoData.push({ "name": "searchTxt", "value": searchTxt });
	            		aoData.push({ "name": "repaymentStatus", "value": repaymentStatus });
	            		aoData.push({ "name": "cRepaymentStatus", "value": cRepaymentStatus });
	            		aoData.push({ "name": "repaymentDay", "value": repaymentDay });
	            		aoData.push({ "name": "repaymentType", "value": repaymentType });
	            		aoData.push({ "name": "overdueNo", "value": overdueType });
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
	                { "data": function(obj) { 
	                	
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
	                },"defaultContent": ""},
	                { "data": function(obj) {
	                		var overdueDay = parseInt(obj.overdueNo);
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
		                /* { "data": function(obj) {
	                		return obj.overdueNo;
	                	},"defaultContent": ""}, */
                    {
                        "data": function (obj) {
                            var objSplitNo = '';
                            if (obj.splitNo != null && obj.splitNo != '') {
                                objSplitNo = "<font style='color: #e74c3c;'>&nbsp;&nbsp;[" + obj.splitNo + "]</font>"
                            }
                            return obj.orderNo + objSplitNo;

                        },"defaultContent": ""
                    },
	                { "data": "realName","defaultContent": ""},
	                { "data": "storeName","defaultContent": ""},
	                { "data": "repaymentStage","defaultContent": "" },
	               { "data": "currentStage" ,"defaultContent": ""},
	               { "data": "overdueNo","defaultContent": "","defaultContent": "" },
	                { "data": function(obj) {
	                		return new Date(parseInt(obj.repaymentDate)).format('yyyy-MM-dd');
	                },"defaultContent": ""},
	                
	                { "data": function(obj) {
                		return obj.repaymentMoney;
                },"defaultContent": ""},
	                /*{ "data": function(obj) {
	                		var type;
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
	                },"defaultContent": ""},*/
	                { "data": function(obj) {
	                		var detialRepaymentStatus;
	                		switch (obj.status) {
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
	                		}
	                		return detialRepaymentStatus;
	                },"defaultContent": ""},
	                { "data": function(obj) {
	                		return '<a href="${pageContext.request.contextPath}/mfq/repayment/detail.do?orderNo=' 
	                				+ obj.orderNo + '&orderId=' 
	                				+ obj.orderId + '&userId='
	                				+ obj.userId + '&repaymentId=' 
	                				+ obj.repaymentId + '&repaymentDetailId=' 
	                				+ obj.repaymentDetailId + '&pageValue=03'
	                				+ '" class="btn btn-info btn-xs"><i class="fa fa-eye">详情</i></a>'
	                }}
	            ]
	            
			});
			
		})
		
	</script>	
</body>
</html>