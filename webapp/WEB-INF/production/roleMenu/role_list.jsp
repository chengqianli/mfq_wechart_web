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
							<li>角色管理</li>
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
								角色列表 <small></small>
							</h2>
							<%-- <a href="${pageContext.request.contextPath}/mfq/role/addpage.do"><span class="label"><i class="icon icon-plus"></i></span></a> --%>
							<a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#CalenderModalNew" style="float: right; padding: 5px 10px; margin: 0;">添加 </a>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
                          <div class="table-responsive col-xs-12">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th width="5%">#</th>
										<th width="20%">角色名称</th>
										<th width="10%">描述</th>
										<th width="20%">关联用户数量</th>
										<th width="20%">序号</th>
										<th width="25%">操作</th>
									</tr>
								</thead>
								<tbody>
									<!-- 这应该加个判断 type  应该规定 0 1 2 3 4 表示菜单级别 -->
									<c:forEach var="role" items="${roleList}" varStatus="status">
										<tr>
											<th scope="row">${status.index + 1 }</th>
											<td style="text-align: center;">${role.name}</td>
											<td style="text-align: center;">${role.description}</td>
											<td style="text-align: center;">${role.userCount}</td>
											<td style="text-align: center;">${role.seq}</td>
											<td>
												<%-- <a href="mfq/role/editpage/${role.id}.do" style="cursor: pointer;">修改</a>
									<a href="mfq/role/delete/${role.id}.do" style="cursor: pointer;" onclick="return confirm('确认要删除此记录吗？');">删除</a>&nbsp;
									<a href="mfq/role/viewpage/${role.id}.do" style="cursor: pointer;">查看</a> --%> <a href="javascript:void(0);" rel="${role.id }" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 修改 </a> <a href="${pageContext.request.contextPath}/mfq/role/delete/${role.id}.do" class="btn btn-danger btn-xs" onclick="return confirm('确认要删除此记录吗？');"><i class="fa fa-trash-o"></i> 删除 </a> <%-- <a href="${pageContext.request.contextPath}/mfq/role/viewpage/${role.id}.do" class="btn btn-success btn-xs">查看 </a> --%>
											</td>
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

	<!--添加新角色弹框 -->
	<div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加新角色</h4>
				</div>
				<div class="modal-body">
					<div id="testmodal" style="padding: 5px 20px;">
						<form action="" method="post" id="addRoleFormId" class="form-horizontal calender" role="form">
							<input type="hidden" class="form-control" id="pid" name="pid">
							<div class="form-group">
								<label class="col-sm-3 control-label">角色名称：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="name" required="required" maxlength="45" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序号：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="seq" required="required" pattern="^[1-9]\d{0,8}$" title="请填写1到9位正整数值" maxlength="9" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描述:</label>
								<div class="col-sm-9">
									<textarea class="form-control" style="height: 55px; resize: none;" name="description" required="required" maxlength="45"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">角色权限：</label>
								<div class="col-sm-9">
									<label style="padding-top: 8px">编辑权限</label>
									<div>
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>选择</th>
													<th>序列</th>
													<th>权限名称</th>
													<th>权限描述</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="permission" items="${permissionList}" varStatus="status">
													<tr>
														<td style="text-align: center;"><input type="checkbox" name="permissionIdsNew" value="${permission.id}"></td>
														<td style="text-align: center;">${permission.seq}</td>
														<td style="text-align: center;"><input type="hidden" value="${permission.name}" id="name_${permission.id}">${permission.name}</td>
														<td style="text-align: center;">${permission.description}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" onclick="setPermissionIds('save');">选择</button>
										</div>
									</div>
									<input type="hidden" name="permissionIds" id="add_permissionIds">
									<!-- 展示选中的权限数据 -->
									<textarea class="form-control" style="height: 55px; resize: none;" readonly="readonly" id="add_permissionName"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center;">
					
					<button type="button" class="btn btn-success antosubmit" data-dismiss="modal" onclick="saveRoleVO('save', null);">保存</button>
					<button type="button" class="btn btn-primary antoclose" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改角色弹框 -->
	<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel2">修改角色</h4>
				</div>
				<div class="modal-body">
					<div id="testmodal2" style="padding: 5px 20px;">
						<form id="updateRoleFormId" class="form-horizontal calender" role="form">
							<input type="hidden" name="id" id="upd_id">
							<div class="form-group">
								<label class="col-sm-3 control-label">角色名称</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="name" id="upd_name" required="required" maxlength="200" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="seq" id="upd_seq" required="required" pattern="^[1-9]\d{0,8}$" title="请填写1到9位正整数值" maxlength="9" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述</label>
								<div class="col-sm-9">
									<textarea class="form-control" style="height: 55px; resize: none;" id="upd_description" name="description" rows="3" required="required" maxlength="200"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">关联权限</label>
								<div class="col-sm-9">
									<label style="padding-top: 8px;">编辑权限</label>
									<div>
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>选择</th>
													<th>序列</th>
													<th>权限名称</th>
													<th>权限描述</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="permission" items="${permissionList}" varStatus="status">
													<tr>
														<td style="text-align: center;"><input type="checkbox" name="permissionIdsUpdate" value="${permission.id}"></td>
														<td style="text-align: center;">${permission.seq}</td>
														<td style="text-align: center;"><input type="hidden" value="${permission.name}" id="updateName_${permission.id}">${permission.name}</td>
														<td style="text-align: center;">${permission.description}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" onclick="setPermissionIds('update');">选择</button>
										</div>
									</div>
									<input type="hidden" name="permissionIds" id="update_permissionIds" value="${role.permissionIds}">
									<!-- 展示选中的权限数据 -->
									<textarea class="form-control" style="height: 55px; resize: none;" readonly="readonly" id="update_permissionNames">${permissionNames}</textarea>

								</div>
							</div>

						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center;">
					
					<button type="button" class="btn btn-success antosubmit2" data-dismiss="modal" onclick="saveRoleVO('update', 'roleId');">保存</button>
					<button type="button" class="btn btn-primary antoclose2" data-dismiss="modal">取消</button>
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
   			/*$('.btn-primary').click(function() {
   				$('#fc_create').click();
   				var name = $(this).attr('rel');
   				$('#antoform .form-group:nth-child(4)').hide();
   				$('#pid').val(name);
   				// alert($('#pid').val() + "***");
   			})*/
   			
   			// edit buton
   			$('.btn-info').click(function() {
   				$('#fc_edit').click();
   				var roleId = $(this).attr('rel');
   				viewRoleVO(roleId); // 点击修改的时候查询后台，并把数据展示在修改弹窗中
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
   		// 添加和修改操作
   		function saveRoleVO(type, roleId) {
   			var url = ""; // 跳转到 action  
   			if ("save" == type) { // 用ajax请求添加 删除 修改
   				url = "${pageContext.request.contextPath}/mfq/role/saveRoleVO.do";
   				var roleVO = $('#addRoleFormId').serialize();  
   				console.log("表单序列化==============" + roleVO);  
   				$.ajax({
   					url : url,
   					data : roleVO,
   					type : 'post',
   					async : false,
   					dataType : 'json',
   					success : function(result) {
   						if (result.num == 1){
   							alert("添加成功！");
   						}
						location.reload(); // 刷新页面
   					},
   					error : function() {
   						location.reload(); // 刷新页面
   					}
   				});
   			} else if ("update" == type) {  // 修改操作
   				url = "${pageContext.request.contextPath}/mfq/role/update.do";
				var roleVO = $('#updateRoleFormId').serialize();  
				console.log("表单序列化==============" + roleVO);  
				$.ajax({
					url : url,
					data : roleVO,
					type : 'post',
					async : false,
					dataType : 'json',
					success : function(result) {
						if (result.num == 1){
							alert("修改成功！");
							location.reload(); // 刷新页面
						}
					},
					error : function() {
						location.reload(); // 刷新页面
					}
				});
   			}
   		}
   	// 修改时填充，员工信息
   		function viewRoleVO (roleId) {
   			var url = "${pageContext.request.contextPath}/mfq/role/editpage/" + roleId + ".do";
			$.ajax({
				url : url,
				data : {roleId : roleId},
				type : 'post',
				async : false,
				dataType : 'json',
				success : function(result) {
					var role = result.role; // 角色
					var permissionNames = result.permissionNames; // 角色对应的权限信息
					var permissionList = result.permissionList; // 权限的集合
					// 给修改狂赋值
					// 获取值之后 赋值到修改的弹框当中
					console.log(role.name+ "-----------------");
					$("#upd_id").val(role.id);
					$("#upd_name").val(role.name);
					$("#upd_seq").val(role.seq);
					$("#upd_description").val(role.description);
					$("#update_permissionIds").val(role.permissionIds);
					$("#update_permissionNames").val(permissionNames);
				},
				error : function() {
					alert("查询出错");
					// location.reload(); // 刷新页面
				}
			});
   		}
   		// 填充数据  选择完权限之后 点击选择按钮之后会把选择的东西赋值到下边的文本域当中
   		function setPermissionIds(type) {
			var ids = "";
			var names = "";
			if ('save' == type) {
				var idArray = document.getElementsByName("permissionIdsNew");
				for(var i = 0; i < idArray.length; i++) {
			        if(idArray[i].checked == true || idArray[i].checked == "checked" ) {
			            if(ids == "") {
			            	ids = idArray[i].value
			            	names = document.getElementById("name_"+idArray[i].value).value;
			            }else {
			            	ids = ids + "," + idArray[i].value
			            	names = names + "," + document.getElementById("name_"+idArray[i].value).value;
			            }
			        }
			    }
				document.getElementById("add_permissionIds").value = ids;
				document.getElementById("add_permissionName").value = names;
			} else if ('update' == type) {
				var idArray = document.getElementsByName("permissionIdsUpdate");
				for(var i = 0; i < idArray.length; i++) {
			        if(idArray[i].checked == true || idArray[i].checked == "checked" ) {
			            if(ids == "") {
			            	alert(document.getElementById("updateName_"+idArray[i].value).value)
			            	ids = idArray[i].value
			            	names = document.getElementById("updateName_"+idArray[i].value).value;
			            }else {
			            	ids = ids + "," + idArray[i].value
							alert(document.getElementById("updateName_"+idArray[i].value).value)
			            	names = names + "," + document.getElementById("updateName_"+idArray[i].value).value;
			            }
			        }
			    }
				document.getElementById("update_permissionIds").value = ids;
				document.getElementById("update_permissionNames").value = names;
			}
		}
    </script>
</body>
</html>