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
<%@ include file="/WEB-INF/common/menu_profile.jsp" %>
<%@ include file="/WEB-INF/common/sidebar_menu.jsp" %>
<%@ include file="/WEB-INF/common/sidebar_footer.jsp" %>
<%@ include file="/WEB-INF/common/top_nav.jsp" %>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								查看角色 <small></small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<!-- 详情查询的页面内容 -->
							<div class="table-responsive col-xs-12">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th width="20%">角色名称</th>
										<th width="10%">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</th>
										<th width="20%">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述</th>
										<th width="20%">关联权限</th>
										<th width="25%">关联用户</th>
									</tr>
								</thead>
								<tbody>
									<!-- 这应该加个判断 type  应该规定 0 1 2 3 4 表示菜单级别 -->
									<tr>
										<td style="text-align: center;">${roleVO.name}</td>
										<td style="text-align: center;">${roleVO.seq}</td>
										<td style="text-align: center;">${roleVO.description}</td>
										<td style="text-align: center;">${permissionNames}</td>
										<td style="text-align: center;">${userNames}</td>
									</tr>
								</tbody>
							</table>
							</div>
							<a class="btn btn-primary" href="mfq/role/list.do">返回</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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

</body>
</html>