<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="row title_left" style="width: 100%;">
					<div class="span6">
						<ul class="breadcrumb">
							<li>通讯录</li>
							<li>菜单管理</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12">
					<div class="x_panel">
						<div class="x_title">
							<h2 style="font-size: 18px;">
								菜单列表 <small></small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">

							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th width="5%">#</th>
										<th width="20%">名称</th>
										<th width="10%">Icon</th>
										<th width="20%">Url</th>
										<th width="20%">序号</th>
										<th width="25%">操作</th>
									</tr>
								</thead>
								<tbody>
									<!-- 这应该加个判断 type  应该规定 0 1 2 3 4 表示菜单级别 -->
									<c:forEach var="item" items="${list}" varStatus="status">
										<c:if test="${item.type != '0' }">
											<tr>
												<%-- <th scope="row">${status.index + 1 }</th> --%>
												<th scope="row">${status.index }</th>
												<td><c:if test="${item.level==1}">
														<span style="padding-left: 0%;"></span>
													</c:if> <c:if test="${item.level==2}">
														<span style="padding-left: 30%;"></span>
													</c:if> <c:if test="${item.level==3}">
														<span style="padding-left: 20%;"></span>
													</c:if> <c:if test="${item.level==4}">
														<span style="padding-left: 30%;"></span>
													</c:if> <c:if test="${item.level==5}">
														<span style="padding-right: 0%;"></span>
													</c:if> ${item.label }</td>
												<td><i class="${item.icon }"></i></td>
												<td>${item.url }</td>
												<td>${item.seqNum }</td>
												<td>
													<a href="javascript:void(0);" rel="${item.id }" class="btn btn-primary btn-primary-sdfsfds btn-xs">
														<i class="fa fa-plus"></i> 添加 
													</a> 
													<a href="javascript:void(0);" rel="${item.id }" onclick="updateEvent('${item.id}', '${item.pid}', '${item.label}', '${item.icon}', '${item.url}', '${item.seqNum }', '${item.description }');" class="btn btn-info btn-xs">
														<i class="fa fa-pencil"></i> 修改 </a> 
													<%-- <a href="javascript:void(0);" rel="${item.id }" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 删除 </a> --%> 
													<a href="${pageContext.request.contextPath}/mfq/menu/delete/${item.id}.do" class="btn btn-danger btn-xs" onclick="return confirm('确认要删除此记录吗？');">
														<i class="fa fa-trash-o"></i> 删除 
													</a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->

	<!-- 新增菜单弹框 -->
	<div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">新增菜单</h4>
				</div>
				<div class="modal-body">
					<div id="testmodal" style="padding: 5px 20px;">
						<form action="${pageContext.request.contextPath}/mfq/menu/save.do" method="post" id="antoform" class="form-horizontal calender" role="form">
							<input type="hidden" class="form-control" id="pid" name="pid">
							<div class="form-group">
								<label class="col-sm-3 control-label">名称</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="label" name="label">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Icon</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="icon" name="icon"> <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"></label>
								<div class="col-sm-9">
									<div class="bs-icons">
										<ul class="bs-icons-list" id='icon-id'>
											<li><i class="fa fa-home"></i></li>
											<li><i class="fa fa-edit"></i></li>
											<li><i class="fa fa-desktop"></i></li>
											<li><i class="fa fa-table"></i></li>
											<li><i class="fa fa-bar-chart-o"></i></li>
											<li><i class="fa fa-clone"></i></li>
											<li><i class="fa fa-bug"></i></li>
											<li><i class="fa fa-windows"></i></li>
											<li><i class="fa fa-sitemap"></i></li>
											<li><i class="fa fa-laptop"></i></li>
											<li><i class="fa fa-pie-chart"></i></li>
											<li><i class="fa fa-line-chart"></i></li>
											<li><i class="fa fa-users"></i></li>
											<li><i class="fa fa-cog"></i></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Url</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="url" name="url">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序号</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="seqNum" name="seqNum">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描述</label>
								<div class="col-sm-9">
									<textarea class="form-control" style="height: 55px;" id="description" name="description"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-success antoclose" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary antosubmit" onclick="saveMenuVO('add');">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改菜单弹框 -->
	<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel2">修改菜单</h4>
				</div>
				<div class="modal-body">

					<div id="testmodal2" style="padding: 5px 20px;">
						<form action="${pageContext.request.contextPath}/mfq/menu/update.do" method="post" id="updateform" class="form-horizontal calender" role="form">
							<input type="hidden" name="id" id="updateView_id" /> <input type="hidden" name="pid" id="updateView_pid" />
							<div class="form-group">
								<label class="col-sm-3 control-label">菜单名称:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="updateView_label" name="label">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Icon</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="updateView_icon" name="icon" style="padding-left: 40px;"> <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"></label>
								<div class="col-sm-9">
									<div class="bs-icons">
										<ul class="bs-icons-list" id="icon-id-upd">
											<li><i class="fa fa-home"></i></li>
											<li><i class="fa fa-edit"></i></li>
											<li><i class="fa fa-desktop"></i></li>
											<li><i class="fa fa-table"></i></li>
											<li><i class="fa fa-bar-chart-o"></i></li>
											<li><i class="fa fa-clone"></i></li>
											<li><i class="fa fa-bug"></i></li>
											<li><i class="fa fa-windows"></i></li>
											<li><i class="fa fa-sitemap"></i></li>
											<li><i class="fa fa-laptop"></i></li>
											<li><i class="fa fa-pie-chart"></i></li>
											<li><i class="fa fa-line-chart"></i></li>
											<li><i class="fa fa-users"></i></li>
											<li><i class="fa fa-cog"></i></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">URL:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="updateView_url" name="url" maxlength="500" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序号:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="updateView_seqNum" name="seqNum" pattern="^[1-9]\d{0,8}$" title="请填写1到9位正整数值" maxlength="9" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描述:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="updateView_description" name="description" required="required" maxlength="500" />
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-success antoclose2" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary antosubmit2" onclick="saveMenuVO('update');">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
	<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
	<!-- /calendar modal -->

	<%-- footer --%>
	<%@ include file="/WEB-INF/common/footer.jsp"%>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
	<!-- validator -->
	<script src="${pageContext.request.contextPath}/vendors/validator/validator.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/vendors/validator/zh-CN.js"></script> --%>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>

	<script type="text/javascript">
   		$(function() {
   			// add button 添加菜单的保存按钮
   			$('.btn-primary-sdfsfds').click(function() {
   				$('#fc_create').click();
   				var name = $(this).attr('rel');
   				$('#antoform .form-group:nth-child(4)').hide();
   				$('#pid').val(name);
   			})
   			
   			// edit buton
   			$('.btn-info').click(function() {
   				$('#fc_edit').click();
   				var name = $(this).attr('rel');
   				$('#updateform .form-group:nth-child(5)').hide();
   				$('#pid2').val(name);
   			})
   			
   			// bs-icons-list li click
   			$('#icon-id li').bind('click', function() {
   				$('#icon').val($(this).find('i').attr('class'));
   				$('#icon').siblings('span').removeClass().addClass($(this).find('i').attr('class') + ' form-control-feedback left');
   				$('#antoform .form-group:nth-child(4)').hide();
   			})
   			
   			$('#icon').focus(function() {
   				$('#antoform .form-group:nth-child(4)').show();
   			})
   			
   			
   			 // bs-icons-list li click
   			$('#icon-id-upd li').bind('click', function() {
   				$('#updateView_icon').val($(this).find('i').attr('class'));
   				$('#updateView_icon').siblings('span').removeClass().addClass($(this).find('i').attr('class') + ' form-control-feedback left');
   				$('#updateform .form-group:nth-child(5)').hide();
   			})
   			
   			$('#updateView_icon').focus(function() {
   				$('#updateform .form-group:nth-child(5)').show();
   			}) 
   			
   		});
   		
   		function saveMenuVO(type) {
   			// alert($('#pid').val() + "-------------");
   			if ("add" == type) {
	   			$("#antoform").submit();
   			} else if ("update" == type) {
   				$("#updateform").submit();
   			}
   		}
   		// 点击修改的时候把值赋值到修改的弹出框中
   		function updateEvent(id, pid, label, icon, url, seqNum, description) {
   			// alert(id, pid, label, icon, url, seqNum, description);
			$("#updateView_id").val(id); // id
			$("#updateView_pid").val(pid); // 父级pid
			$("#updateView_label").val(label); // 菜单名
			$("#updateView_icon").val(icon); // 图标 暂时不修改
			$("#updateView_url").val(url); // url
			$("#updateView_seqNum").val(seqNum); // 序号
			$("#updateView_description").val(description); // 描述
		}
    	
    </script>
</body>
</html>