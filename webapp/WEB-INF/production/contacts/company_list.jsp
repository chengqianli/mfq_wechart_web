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
							<li>公司管理</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2 style="font-size: 18px;">
								公司信息 <small></small>
							</h2>
							<a href="javascript:void(0);" class="btn btn-primary btn-xs" style="float: right; padding: 5px 10px; margin: 0;"> 添加 </a>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
                           <div class="table-responsive col-xs-12">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th width="5%">#</th>
										<th width="20%">公司名称</th>
										<th width="10%">负责人</th>
										<th width="20%">员工数量</th>
										<th width="20%">序列</th>
										<th width="25%">操作</th>
									</tr>
								</thead>
								<tbody>
									<!-- 这应该加个判断 type  应该规定 0 1 2 3 4 表示菜单级别 -->
									<c:forEach var="company" items="${companyList}" varStatus="status">
										<tr>
											<th scope="row">${status.index + 1 }</th>
											<td style="text-align: center;">${company.name}</td>
											<td style="text-align: center;">${company.principalRealName}</td>
											<td style="text-align: center;">${company.staffCount}</td>
											<td style="text-align: center;">${company.seq}</td>
											<td><a href="javascript:void(0);" rel="${company.id }" onclick="updateEvent('${company.id}', '${company.seq}', '${company.name}', '${company.principalUserId}');" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 修改 </a> <a href="${pageContext.request.contextPath}/mfq/company/delete/${company.id}.do" class="btn btn-danger btn-xs" onclick="return confirm('确认要删除此记录吗？');"><i class="fa fa-trash-o"></i> 删除 </a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                          </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->

	<!-- 新增添加分公司 -->
	<div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加分公司</h4>
				</div>
				<div class="modal-body">
					<div id="testmodal" style="padding: 5px 20px;">
						<form action="${pageContext.request.contextPath}/mfq/company/save.do" method="post" id="saveform" class="form-horizontal calender" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label">分&nbsp;公&nbsp;司&nbsp;名&nbsp;称 </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="label" name="name">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">分公司负责人 </label>
								<div class="col-sm-9">
									<select name="principalUserId" class="form-control">
										<c:forEach var="o" items="${userList}" varStatus="status">
											<option value="${o.id}">${o.realName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
								<div class="col-sm-9">
									<input class="form-control" type="text" name="seq" required="required" pattern="^[1-9]\d{0,8}$" title="请填写1到9位正整数值" maxlength="9" />
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-primary antosubmit" onclick="saveCompanyVO('save');">保存</button>
					<button type="button" class="btn btn-success antoclose" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改分公司弹框 -->
	<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel2">修改分公司</h4>
				</div>
				<div class="modal-body">

					<div id="testmodal2" style="padding: 5px 20px;">
						<form action="${pageContext.request.contextPath}/mfq/company/update.do" method="post" id="updateform" class="form-horizontal calender" role="form">
							<input type="hidden" name="id" id="updateView_id" />
							<div class="form-group">
								<label class="col-sm-3 control-label" style="letter-spacing: 2px;">分公司名称</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="updateView_name" name="label">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">分公司负责人 </label>
								<div class="col-sm-9">
									<select id="updateView_principalUserId" name="principalUserId" class="form-control">
										<c:forEach var="o" items="${userList}" varStatus="status">
											<option value="${o.id}">${o.realName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
								<div class="col-sm-9">
									<input class="form-control" type="text" name="seq" id="updateView_seq" required="required" pattern="^[1-9]\d{0,8}$" title="请填写1到9位正整数值" maxlength="9" />
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-primary antosubmit2" onclick="saveCompanyVO('update');">保存</button>
					<button type="button" class="btn btn-success antoclose2" data-dismiss="modal">取消</button>
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
   			$('.btn-primary').click(function() {
   				$('#fc_create').click();
   				var name = $(this).attr('rel');
   				$('#antoform .form-group:nth-child(4)').hide();
   				$('#pid').val(name);
   				// alert($('#pid').val() + "***");
   			})
   			
   			// edit buton
   			$('.btn-info').click(function() {
   				$('#fc_edit').click();
   				var name = $(this).attr('rel');
   				$('#pid2').val(name);
   			})
   			
   			// bs-icons-list li click
   			$('.bs-icons-list li').bind('click', function() {
   				$('#icon').val($(this).find('i').attr('class'));
   				$('#icon').siblings('span').removeClass().addClass($(this).find('i').attr('class') + ' form-control-feedback left');
   				$('#antoform .form-group:nth-child(4)').hide();
   			})
   			
   			$('#icon').focus(function() {
   				$('#antoform .form-group:nth-child(4)').show();
   			})
   			
   		});
   		
   		function saveCompanyVO(type) {
   			if ("save" == type) {
   				$("#saveform").submit();
   			} else if ("update" == type) {
   				$("#updateform").submit();
   			}
   			
   		}
   		function updateEvent(id, seq, name, principalUserId) {
			$("#updateView_id").val(id);
			$("#updateView_seq").val(seq);
			$("#updateView_name").val(name);
			$("#updateView_principalUserId").val(principalUserId);
			$('#updateView_principalUserId').trigger('change.select2'); // 触发 input 元素的 select 事件：
		}
    	
    </script>
</body>
</html>