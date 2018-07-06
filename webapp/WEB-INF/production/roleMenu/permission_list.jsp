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
			<div class="page-title">
				<div class="row title_left" style="width: 100%;">
					<div class="span6">
						<ul class="breadcrumb">
							<li>通讯录</li>
							<li>权限管理</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2 style="font-size: 18px;">权限信息</h2>
							<a href="javascript:void(0);" class="btn btn-primary btn-xs" id="btn-primary" style="float: right; padding: 5px 10px; margin: 0;"> 添加权限 </a>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
                             <div class="table-responsive col-xs-12">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th width="5%">#</th>
										<th width="20%">权限名称</th>
										<th width="10%">权限描述</th>
										<th width="20%">序列</th>
										<th width="25%">操作</th>
									</tr>
								</thead>
								<tbody>
									<!-- 这应该加个判断 type  应该规定 0 1 2 3 4 表示菜单级别 -->
									<c:forEach var="permission" items="${permissionList}" varStatus="status">
										<tr>
											<th scope="row">${status.index + 1 }</th>
											<td style="text-align: center;">${permission.name}</td>
											<td style="text-align: center;">${permission.description}</td>
											<td style="text-align: center;">${permission.seq}</td>
											<td><a href="javascript:void(0);" rel="${company.id }" onclick="updateEvent('${permission.id}', '${permission.seq}', '${permission.name}', '${permission.description}');" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 修改 </a> <a href="${pageContext.request.contextPath}/mfq/permission/delete/${permission.id}.do" class="btn btn-danger btn-xs" onclick="return confirm('确认要删除此记录吗？');"><i class="fa fa-trash-o"></i> 删除 </a> <a href="javascript:void(0);" rel="${role.id }" class="btn btn-info btn-xs" onclick="ajaxGetMenuTree('${permission.id}');"><i class="fa fa-pencil"></i> 关联菜单 </a></td>
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

	<!-- 新增添加权限 -->
	<div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加权限</h4>
				</div>
				<div class="modal-body">
					<div id="testmodal" style="padding: 5px 20px;">
						<form action="${pageContext.request.contextPath}/mfq/permission/save.do" method="post" id="saveform" class="form-horizontal calender" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label" style="letter-spacing: 1px;">权限名称</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" required="required" name="name">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
								<div class="col-sm-9">
									<input class="form-control" type="text" name="seq" required="required" pattern="^[1-9]\d{0,8}$" title="请填写1到9位正整数值" maxlength="9" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述</label>
								<div class="col-sm-9">
									<textarea class="form-control" style="height: 55px; resize: none;" required="required" name="description"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					
					<button type="button" class="btn btn-success antosubmit" onclick="savePermissionVO('save');">保存</button>
					<button type="button" class="btn btn-primary antoclose" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改权限信息弹框 -->
	<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel2">修改权限信息</h4>
				</div>
				<div class="modal-body">

					<div id="testmodal2" style="padding: 5px 20px;">
						<form action="${pageContext.request.contextPath}/mfq/permission/update.do" method="post" id="updateform" class="form-horizontal calender" role="form">
							<input type="hidden" name="id" id="updateView_id" />
							<div class="form-group">
								<label class="col-sm-3 control-label" style="letter-spacing: 1px;">权限名称</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" required="required" id="updateView_name" name="name">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
								<div class="col-sm-9">
									<input class="form-control" type="text" name="seq" id="updateView_seq" required="required" pattern="^[1-9]\d{0,8}$" title="请填写1到9位正整数值" maxlength="9" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述</label>
								<div class="col-sm-9">
									<textarea class="form-control" style="height: 55px; resize: none;" required="required" id="updateView_description" name="description"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					
					<button type="button" class="btn btn-success antosubmit2" onclick="savePermissionVO('update');">保存</button>
					<button type="button" class="btn btn-primary antoclose2" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 关联菜单弹窗 -->
	<div id="menuPermission" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="gridSystemModalLabel">关联菜单</h4>
				</div>
				<div class="modal-body">

					<div id="testmodal2" style="padding: 5px 20px;">
						<form action="${pageContext.request.contextPath}/mfq/permission/editPermissionMenu.do" method="post" id="editPermissionMenuform" class="form-horizontal calender" role="form">
							<input type="hidden" name="id" id="menuView_id"> <input type="hidden" name="menuIds" id="menuView_menuIds">
							<div class="col-md-5 col-sm-5 col-xs-12 form-group">
								<div id="tree" style="width: 100%;"></div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					
					<button type="button" class="btn btn-success antosubmit2" onclick="savePermissionVO('editPermissionMenu');">保存</button>
					<button type="button" class="btn btn-primary antoclose2" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
	<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
	<div id="mp_menuPermission" data-toggle="modal" data-target="#menuPermission"></div>
	<!-- /calendar modal -->
	<!-- 测试关联菜单树 -->
	<!-- <div class="modal-body" style="max-height: 500px;">
		<div class="zTreeDemoBackground">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
	</div>
	<div class="modal-footer">
		<form action="/mfq/permission/editPermissionMenu.do" method="post">
			<input type="hidden" name="id" id="menuView_id" >
			<input type="hidden" name="menuIds" id="menuView_menuIds" >
			<button type="submit" class="btn btn-primary" onclick="return savePermissionMenuEvent();">保存</button>
		</form>
	</div> -->
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

	<!-- bootstrap-treeview -->
	<script src="${pageContext.request.contextPath}/vendors/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>

	<script type="text/javascript">
   		$(function() {
   			// add button 添加权限的保存按钮
   			$('#btn-primary').click(function() {
   				$('#fc_create').click();
   				var name = $(this).attr('rel');
   				$('#antoform .form-group:nth-child(4)').hide();
   				$('#pid').val(name);
   				// alert($('#pid').val() + "***");
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
   		function savePermissionVO(type) {
   			if ("save" == type) {
   				$("#saveform").submit(); // 添加权限信息提交
   			} else if ("update" == type) {
   				$("#updateform").submit(); // 修改权限信息提交
   			} else if ("editPermissionMenu" == type) {
   				var pp = $('#tree');
   				var div = $('#tree').treeview('getChecked', pp);
   				var ids=[];
   	   			var pids=[];
   				//alert("---menuView_id = " +$("#menuView_id").val());
   				// 获取菜单列表信息，并且获取那些是被选中的状态
   				$.each(div, function(i,item) {
   					ids.push(item.id);
   				});
   				console.log(ids)

   				// $("#editPermissionMenuform").submit(); // 关联菜单提交
   				/*var ids = "";//把所有选中的值放到ids中并且以逗号分割。*/
   				$("#menuView_menuIds").val(ids);
   				// 保存权限菜单关系事件
   				savePermissionMenuEvent();
   			}
   			
   		}
   		// 修改权限信息 弹框赋值
   		function updateEvent(id, seq, name, description) {
   			$('#fc_edit').click();
			$("#updateView_id").val(id);
			$("#updateView_seq").val(seq);
			$("#updateView_name").val(name);
			$("#updateView_description").val(description);
		}
   		// 关联菜单 ajax查看查询菜单树
		function ajaxGetMenuTree(permissionId) {
			$('#mp_menuPermission').click();
			if (permissionId == '') return;
			$("#menuView_id").val(permissionId);
			$.ajax({
				url : '${pageContext.request.contextPath}/mfq/menu/ajax/list/' + permissionId + ".do",// 跳转到 action  
				// url : "${pageContext.request.contextPath}/mfq/menu/ajax/list.do",// 跳转到 action  
				data : {
					permissionId : permissionId
				},
				type : 'post',
				async : false,
				dataType : 'json',
				success : function(result) {
					/* checked":true, "id":"1e4414da2495413fabf06f21ad2ba0bb", "level":1 "name":"美分期", "open":true, "pId":"0"*/
					// console.info(result);
					$('#tree').treeview({
						data : getTree(result),
						showBorder : false,
						showCheckbox : true
					});
				},
				error : function() {
					alert("查询 菜单异常！");
				}
			});
   		}
   		
   		// 封装数据
		function getTree(result) {
			var data = result;
			function handleItem(dataArray, result,parentId){
				var flg = true;
                dataArray.forEach((item) => {
                	flg = item.checked;
                    if(parentId == item.pId){
                        let child = {
                            text: "",
                            id: "",
                            state: {
                                checked: item.checked,
                            },
                            nodes:[]
                        }
                        handleItem(dataArray, child.nodes, item.id);
                        child.id = item.id;
                        child.text = item.name;
                        // child.state = item.checked;
                        result.push(child);
                    }
                });
            }
            var result = [];
            handleItem(data, result,0);
			return result;
		}
   		
		// 保存权限菜单关系事件savePermissionMenuEvent()
		function savePermissionMenuEvent() {
			// 获取复选框被选中的ids
			/* var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			var v = "";
			for(var i=0; i<nodes.length; i++) {
				if(i==0) {
					v += nodes[i].id;
				}else {
					v += "," + nodes[i].id;
				}
			}
			$("#menuView_menuIds").val(v); */
			// 到后台并进行修改保存
			var url = '${pageContext.request.contextPath}/mfq/permission/updatePermissionMenu.do';
			var permissionVO = $('#editPermissionMenuform').serialize();  
			console.log("表单序列化==============" + permissionVO);  
			$.ajax({
				url : url,
				data : permissionVO,
				type : 'post',
				async : false,
				dataType : 'json',
				success : function(result) {
					if (result.num == 1){
						alert(result.msg);
						location.reload(); // 刷新页面
					}
				},
				error : function() {
					location.reload(); // 刷新页面
				}
			});
		}
					
    </script>
</body>
</html>