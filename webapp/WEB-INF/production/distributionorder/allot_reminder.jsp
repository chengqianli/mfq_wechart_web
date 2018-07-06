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
                    <form id="searchFrom">
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">
                                
                                
                                <!--外催公司 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="companyId" name="companyId" class="form-control">
                                            <option value="">外催公司</option>
                                            <c:forEach var="item" items="${companyList}">
                                                  <option value="${item.id}">${item.companyName}</option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>

								<!--订单号 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="text" name="" value="订单号" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="orderNo" name="orderNo" placeholder="">
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
															<input type="text" name="repaymentDay" id="reservation_table" class="form-control" value=""/>
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
                                
                                <!-- 历史外催公司 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="htyCompanyId" name="htyCompanyId" class="form-control">
                                            <option value="">历史外催公司</option>
                                            <c:forEach var="item" items="${companyList}">
                                                  <option value="${item.id}">${item.companyName}</option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                
                                
                                <!-- 商户名称 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" value="商户名称" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="storeName" name="storeName" placeholder="">
                                    </div>
                                </div>	
                                
                                
                                <!-- 账龄 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12" style="padding-left:0;">
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
                                  <!--留案 -->
	                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
	                                    <div class="col-md-12 col-sm-12 col-xs-12">
	                                        <select id="reserveType" name="reserveType" class="form-control">
	                                            <option value="">留案状态</option>
	                                            <option value="1">是</option>
	                                            <option value="0">否</option>
	                                        </select>
	                                    </div>
	                                </div>
	                                
	                                
	                                
	                              <!-- 还款人姓名 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="text" name="" value="还款人姓名" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="userName" name="userName" placeholder="">
                                    </div>
                                </div>
                                
                                
                                <!--状态 -->
	                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
	                                    <div class="col-md-12 col-sm-12 col-xs-12" style="padding-left:0;">
	                                        <select id="status" name="status" class="form-control">
	                                            <option value="">分配状态</option>
	                                                  <option value="00">待分配</option>
	                                                  <!--  <option value="01">已分配</option>--> 
	                                                  <!--  <option value="02">已跟进</option>--> 
	                                                  <!--  <option value="03">申请协助</option>--> 
	                                                  <!--  <option value="04">待协助</option>--> 
	                                                  <option value="05">留案</option>
	                                                  <option value="06">外催</option>
	                                                  <!--  <option value="07">已完成</option>--> 
	                                        </select>
	                                    </div>
	                                </div>
                            
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback" style="margin-top:20px;">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" class="btn btn-success" onclick="reminderCompany()" >分配外催</button>
                                        <button type="button" class="btn btn-success" onclick="cancelReminderCompany()" >案件回收</button>
                                        <button type="button" class="btn btn-success" onclick="reserveUser()" >设置留案</button>
                                        <button type="button" class="btn btn-success" onclick="cancelReserveUser()" >取消留案</button>
                                    </div>
                                    
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-12">
<!--                                         <button type="button" id="searchBtn2" class="btn btn-success">导入</button> -->
                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#export_modal">导出</button>
                                    </div>
                                    
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                        <button type="reset" id="reset" class="btn btn-success">重置</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    </form>
                    
                    <a href="" id="dlink" style="display:none"></a>
                    
                    <div class="x_content">
                        <!-- 虚线 -->
                        <div class="divider-dashed "></div>
                        <table id="datatable_remind_list" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th><input type="checkbox"  class="checkall" id="checkF"/></th>
                                <th>订单号</th>
                                <th>还款人姓名</th>
								<th>商户名称</th>
                                <th>还款日</th>
                                <th>账龄</th>
                                <th>月还本息</th>
                                <th>历史外催公司</th>
                                <th>外催公司</th>
                                <th>外催负责人</th>
                                <th>留案负责人</th>
                                <th>状态</th>
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


<!-- 分配外催-->
<div id="debit_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">分配外催</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <input type="hidden" id="disSumItems" name="disSumItems" value="">
                        <div class="form-group">
                            <label class="col-sm-3 col-md-4 control-label">请择分配策略</label>
                            <div class="col-sm-4 col-md-4">
                                <select id="assignmentType" name="debitSource" class="form-control" required>
                                    <option value="1">默认平均分配</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="assignmentCompany()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 案件回收-->
<div id="cancel_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">案件回收</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                                                                                         是否回收当前选中案件
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" onclick = "canaelAssignmentCompany()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 设置留案-->
<div id="debit_modalss" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">设置留案</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 col-md-4 control-label">选择留案负责人</label>
                            <div class="col-sm-4 col-md-4">
                                <select id="reserveUserId" name="reserveUserId" class="form-control" required>
                                    <c:forEach var="item" items="${userList}">
                                            <option value="${item.userId}">${item.userName}</option>
									</c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="opReserveUser()" >确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 取消留案-->
<div id="cancel_debit_modalss" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">案件回收</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                              是否取消当前留案的订单？
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" onclick = "opCancelReserveUser()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 导出数据-->
<div id="export_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   	<form id="exportForm" action="${pageContext.request.contextPath}/mfq/distributionOrder/exportExternalExcel.do" method="post">
   	<input type="hidden" id="aoData" name="aoData" value=""/>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">数据导出</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                                                                                         确认导出目前条件的数据至excel文件中？
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnExport" class="btn btn-primary antoclose">确认</button>
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
	//分配
    function reminderCompany(){
        $("#disSum").val("");
        $("#disSumItems").val("");
        var zz = false;
        var items = new Array;
        var len=$(".checkchild:checked").length;
        // 循环选中的值
        if (len > 0) {
            $("input[name='checkchild']:checkbox:checked").each(function () {
                var obj = $(this).parent().parent().find("td")[11];
                if ($(obj).html() != '待分配') {
                    zz = true;
                    items.slice(0,items.length);
                    return false;
                }
                var item = $(this).val();
                items.push(item);
            });
        }else{
            zz = true;
        }
        if (zz == true) {
            $.confirm({
                title: '分配外催',
                text: "请选择 待分配 状态的订单进行分配",
                confirmButton: '确认',
                cancelButton: false,
            });
        } else {
            $("#disSum").val(len);
            $("#disSumItems").val(items+"");
            $('#debit_modal').modal('show');
        }
    }
	
	
	// 分配外催
    function assignmentCompany() {
        var Ids =  $("#disSumItems").val();
        var type = $("#assignmentType").val();
        var params = {
            assignmentIds : Ids,
            assignmentType : type
        }
        $.ajax({
                type : "POST",
                url : '${pageContext.request.contextPath}/mfq/distributionOrder/assignmentCompany.do',
                data : params,
                success : function(data) {
                    var result = jQuery.parseJSON(data);
					if (result.data.result == 'true') {
					    $.confirm({
						title : '系统提示',
						text : result.data.message,
						confirmButton : '确认',
						cancelButton : false,
						confirm: function (button) {
                			location.reload(true);
           				 }
					    });
					} else {
					    $.confirm({
						   title : '系统提示',
						   text : result.data.message,
						   confirmButton : '确认',
						   cancelButton : false,
					    });
					}
                },
                complete :function(){
                	$("#searchBtn").click();
                }
            });
        
    }
	
	//回收
    function cancelReminderCompany(){
        $("#disSum").val("");
        $("#disSumItems").val("");
        var zz = false;
        var items = new Array;
        var len=$(".checkchild:checked").length;
        // 循环选中的值
        if (len > 0) {
            $("input[name='checkchild']:checkbox:checked").each(function () {
                var obj = $(this).parent().parent().find("td")[11];
                if ($(obj).html() != '外催') {
                    zz = true;
                    items.slice(0,items.length);
                    return false;
                }
                var item = $(this).val();
                items.push(item);
            });
        }else{
            zz = true;
        }
        if (zz == true) {
            $.confirm({
                title: '案件回收',
                text: "请选择 外催 状态的订单进行回收",
                confirmButton: '确认',
                cancelButton: false,
            });
        } else {
            $("#disSum").val(len);
            $("#disSumItems").val(items+"");
            $('#cancel_modal').modal('show');
        }
    }
	
	
	// 回收订单
    function canaelAssignmentCompany() {
        $('#cancel_modal').modal('hide');
        var Ids =  $("#disSumItems").val();
        var params = {
            assignmentIds : Ids
        }
        $.ajax({
                type : "POST",
                url : '${pageContext.request.contextPath}/mfq/distributionOrder/cancelExternal.do',
                data : params,
                success : function(data) {
                    var result = jQuery.parseJSON(data);
					if (result.result == 'true') {
					    $.confirm({
						title : '系统提示',
						text : result.message,
						confirmButton : '确认',
						cancelButton : false,
						confirm: function (button) {
                			location.reload(true);
           				 }
					    });
					} else {
					    $.confirm({
						   title : '系统提示',
						   text : result.message,
						   confirmButton : '确认',
						   cancelButton : false,
					    });
					}
                },
                complete :function(){
                	$("#searchBtn").click();
                }
            });
        
    }
	
	//设置留案
    function reserveUser(){
        $("#disSum").val("");
        $("#disSumItems").val("");
        var zz = false;
        var items = new Array;
        var len=$(".checkchild:checked").length;
        // 循环选中的值
        if (len > 0) {
            $("input[name='checkchild']:checkbox:checked").each(function () {
                var obj = $(this).parent().parent().find("td")[11];
                if ($(obj).html() == '外催' || $(obj).html() == '留案' || $(obj).html() == '已完成') {
                    zz = true;
                    items.slice(0,items.length);
                    return false;
                }
                var item = $(this).val();
                items.push(item);
            });
        }else{
            zz = true;
        }
        if (zz == true) {
            $.confirm({
                title: '设置留案',
                text: "请选择 待分配 状态的订单进行留案操作",
                confirmButton: '确认',
                cancelButton: false,
            });
        } else {
            $("#disSum").val(len);
            $("#disSumItems").val(items+"");
            $('#debit_modalss').modal('show');
        }
    }
	
	// 留案操作
    function opReserveUser() {
        $('#debit_modalss').modal('hide');
        var Ids =  $("#disSumItems").val();
        var userId =  $("#reserveUserId").val();
        var params = {
            assignmentIds : Ids,
            userId : userId
        }
        $.ajax({
                type : "POST",
                url : '${pageContext.request.contextPath}/mfq/distributionOrder/markExternal.do',
                data : params,
                success : function(data) {
                    var result = jQuery.parseJSON(data);
					if (result.result == 'true') {
					    $.confirm({
						title : '系统提示',
						text : result.data.message,
						confirmButton : '确认',
						cancelButton : false
					    });
					} else {
					    $.confirm({
						   title : '系统提示',
						   text : result.data.message,
						   confirmButton : '确认',
						   cancelButton : false,
					    });
					}
                },
                complete :function(){
                	$("#searchBtn").click();
                }
            });
        
    }
	
	//取消设置留案
    function cancelReserveUser(){
        $("#disSum").val("");
        $("#disSumItems").val("");
        var zz = false;
        var items = new Array;
        var len=$(".checkchild:checked").length;
        // 循环选中的值
        if (len > 0) {
            $("input[name='checkchild']:checkbox:checked").each(function () {
                var obj = $(this).parent().parent().find("td")[10];
                if ($(obj).html() == '-暂无-') {
                    zz = true;
                    items.slice(0,items.length);
                    return false;
                }
                var item = $(this).val();
                items.push(item);
            });
        }else{
            zz = true;
        }
        if (zz == true) {
            $.confirm({
                title: '取消留案',
                text: "请选择 已分配留案负责人的订单进行操作",
                confirmButton: '确认',
                cancelButton: false,
            });
        } else {
            $("#disSum").val(len);
            $("#disSumItems").val(items+"");
            $('#cancel_debit_modalss').modal('show');
        }
    }
	
	// 取消留案操作
    function opCancelReserveUser() {
        $('#cancel_debit_modalss').modal('hide');
        var Ids =  $("#disSumItems").val();
        var params = {
            assignmentIds : Ids
        }
        $.ajax({
                type : "POST",
                url : '${pageContext.request.contextPath}/mfq/distributionOrder/cancelMarkExternal.do',
                data : params,
                success : function(data) {
                    var result = jQuery.parseJSON(data);
					if (result.result == 'true') {
					    $.confirm({
						title : '系统提示',
						text : result.data.message,
						confirmButton : '确认',
						cancelButton : false,
					    });
					} else {
					    $.confirm({
						   title : '系统提示',
						   text : result.data.message,
						   confirmButton : '确认',
						   cancelButton : false,
					    });
					}
                },
                complete :function(){
                	$("#searchBtn").click();
                }
            });
        
    }
	
	
	//导出数据
	$("#btnExport").click(function(){
        var orderNo =  $('#orderNo').val(); //订单号
        var userName =  $('#userName').val(); //还款人姓名
        var repaymentDay = $('#reservation_table').val().trim(); //还款日期
        var htyCompanyId =  $('#htyCompanyId').val(); //历史外催公司
        var overdueType =  $('#overdueType').val(); //账龄
        var storeName =  $('#storeName').val(); //商户名称
        var companyId =  $('#companyId').val(); //外催公司Id
        var status =  $('#status').val(); //状态
        var reserveType = $('#reserveType').val(); //留案状态
        
        var aoData = [];
        
        // 往后台封装数据，json格式的字符串
        aoData.push({"name": "pageName", "value": "ALL" });
        aoData.push({"name": "orderNo", "value": orderNo});
        aoData.push({"name": "userName", "value": userName});
        aoData.push({"name": "repaymentDay", "value": repaymentDay});
        aoData.push({"name": "htyCompanyId", "value": htyCompanyId});
        aoData.push({"name": "overdueType", "value": overdueType});
        aoData.push({"name": "storeName", "value": storeName});
        aoData.push({"name": "companyId", "value": companyId});
        aoData.push({"name": "status", "value": status});
        aoData.push({"name": "reserveType", "value": reserveType});
        
        $("#aoData").val(JSON.stringify(aoData));
        
        var url = '${pageContext.request.contextPath}/mfq/distributionOrder/exportExternalExcel.do';
        $("#aoData").val(JSON.stringify(aoData));
        $("#export_modal").attr("action",url)
        $("#exportForm").submit();
        $("#export_modal").modal('hide');
	});
	
    $(function () {

        //全选
        $(".checkall").click(function () {
            var check = $(this).prop("checked");
            $(".checkchild").prop("checked", check);
        });

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
        var table = $('#datatable_remind_list').dataTable({
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
            aoColumnDefs: [{"bSortable": false, "aTargets": [11]}],
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/distributionOrder/externalList.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                // 组合晒选类型

                var orderNo =  $('#orderNo').val(); //订单号
                var userName =  $('#userName').val(); //还款人姓名
                var repaymentDay = $('#reservation_table').val().trim(); //还款日期
                var htyCompanyId =  $('#htyCompanyId').val(); //历史外催公司
                var overdueType =  $('#overdueType').val(); //账龄
                var storeName =  $('#storeName').val(); //商户名称
                var companyId =  $('#companyId').val(); //外催公司Id
                var status =  $('#status').val(); //状态
                var reserveType = $('#reserveType').val(); //留案状态
                
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "pageName", "value": "ALL" });
                aoData.push({"name": "orderNo", "value": orderNo});
                aoData.push({"name": "userName", "value": userName});
                aoData.push({"name": "repaymentDay", "value": repaymentDay});
                aoData.push({"name": "htyCompanyId", "value": htyCompanyId});
                aoData.push({"name": "overdueType", "value": overdueType});
                aoData.push({"name": "storeName", "value": storeName});
                aoData.push({"name": "companyId", "value": companyId});
                aoData.push({"name": "status", "value": status});
                aoData.push({"name": "reserveType", "value": reserveType});
                 
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
                    "sClass": "text-center",
                    "data": "distributionOrderId",
                    "render": function (obj) {
                        return '<input type="checkbox"  class="checkchild" name="checkchild"  value="' + obj + '" />';
                    },
                    "bSortable": false
                },
                {"data": "orderNo","defaultContent": "-暂无-"},
                {"data": "repaymentUserName","defaultContent": "-暂无-"},
                {"data": "storeName","defaultContent": "-暂无-"},
                {
                 "data": function (obj) {
                    //还款日
                    return new Date(parseInt(obj.repaymentDay)).format('yyyy-MM-dd');
                   },"defaultContent": "-暂无-"
                },
                {"data": "orderLevel","defaultContent": "-暂无-"},
                {"data": "repaymentMoney","defaultContent": "-暂无-"},
                {
                	"data": function (obj) {
                        if(obj.histroyHastenCompanyName!= ""){
	                        return obj.histroyHastenCompanyName;
                        }else{
                        	return "-暂无-";
                        }
                       },"defaultContent": "-暂无-"
                },
                {
                	"data": function (obj) {
                        if(obj.hastenCompanyName!= ""){
	                        return obj.hastenCompanyName;
                        }else{
                        	return "-暂无-";
                        }
                       },"defaultContent": "-暂无-"
                },
                {
                	"data": function (obj) {
                        if(obj.hastenName!= ""){
	                        return obj.hastenName;
                        }else{
                        	return "-暂无-";
                        }
                       },"defaultContent": "-暂无-"
                },
                {
                	"data": function (obj) {
                        if(obj.reserveName!= ""){
	                        return obj.reserveName;
                        }else{
                        	return "-暂无-";
                        }
                       },"defaultContent": "-暂无-"
                },
                {
                          "data": function (obj) {
                              var statusStr;
                              switch (obj.status) {
                                  case '00':
                                      statusStr = '待分配';
                                      break;
                                  case '01':
                                      statusStr = '已分配';
                                      break;
                                  case '02':
                                      statusStr = '已跟进';
                                      break;
                                  case '03':
                                      statusStr = '申请协助';
                                      break;
                                  case '04':
                                      statusStr = '待协助';
                                      break;
                                  case '05':
                                      statusStr = '留案';
                                      break;
                                  case '06':
                                      statusStr = '外催';
                                      break;
                                  case '07':
                                      statusStr = '已完成';
                                      break;
                              }
                              return statusStr;
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