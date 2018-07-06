<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>美分期后台管理系统</title>
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
	
	<input type="hidden" id="deptId" name="deptId" value="${deptId }"/>
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="row title_left" style="width: 100%;">
					<div class="span6">
						<ul class="breadcrumb">
						    <li>贷后管理</li>
							<li>案件分配</li>
							<li>权限管理</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_content">
							<div class="erji-daohang-kuang" style="margin: 0 auto;">

								<div class="col-md-3 col-sm-3 col-xs-12" style="margin-top: 10px;">
									<div class="x_panel">
										<div class="x_title">
											<h2 style="line-height: 1; font-size: 18px;">贷后组织管理</h2>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<form class="form-horizontal form-label-left">
												<div class="form-group">
													<div id="tree" style=""></div>
												</div>
										</div>
										</form>
									</div>
								</div>
							</div>
							
				            <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 10px;">
				                <div class="x_panel">
				                    <div class="x_title">
				                        <h2 style="font-size:18px;">操作</h2>
				                        <div class="clearfix"></div>
				                    </div>
				                    <div class="x_content">
				                        <br/>
				                        <div class="control-group">
				                            <div class="controls">
				
				                                <!--姓名 -->
				                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
				                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;padding-left:0;">
				                                        <input type="" name="" id="" value="姓名" class="form-control" style="background:#fff;" readonly/>
				                                    </div>
				                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
				                                        <input type="text" class="form-control" style="padding-right: 12px;"
				                                               id="searchName" name="searchName" placeholder="">
				                                    </div>
				                                </div>
				                                <!--手机号 -->
				                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
				                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
				                                        <input type="" name="" id="" value="手机号" class="form-control" style="background:#fff;" readonly/>
				                                    </div>
				                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
				                                        <input type="text" class="form-control" style="padding-right: 12px;"
				                                               id="searchTel" name="searchTel" placeholder="">
				                                    </div>
				                                </div>
				                                
				                                <!-- 职位 -->
				                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
				                                    <div class="col-md-12 col-sm-12 col-xs-12">
				                                        <select id="searchPosition" name="searchPosition" class="form-control">
				                                            <option value="">职位</option>
				                                            <option value="10015">贷后总监</option>
				                                            <option value="10016">贷后主管</option>
				                                            <option value="10017">贷后专员</option>
				                                        </select>
				                                    </div>
				                                </div>
				                                <div class="control-group">
						                            <div class="controls">
						                                <div class="col-md-6 col-sm-6 col-xs-12"  style="margin-top:10px;">
						                                	<c:if test="${positionNo != '10018' }">
						                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target=".additionsss" style="cursor: pointer;">添加分组</button>
						                                	</c:if>
					                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target=".additions" style="cursor: pointer;">添加人员</button>
				                                        </div>
						                                <div class="col-md-6 col-sm-6 col-xs-12"  style="margin-top:10px;">
					                                        <button type="button" class="btn btn-success" onclick="query()">搜索</button>
					                                        <button type="button" class="btn btn-success" onclick="reset()">重置</button>
				                                        </div>
						                            </div>
						                        </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
							<div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 10px;float:right;">
								<div class="x_panel">
									<!-- <div class="x_title"> -->
										<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".additions" style="float:right;cursor: pointer;">添加人员</button> -->


										<div class="modal fade additions" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">添加新员工</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<!-- antoform -->
															<form id="addUserForm" class="form-horizontal calender" role="form">
																<input type="hidden" name="companyId" value="${select_company.id}"> <input type="hidden" name="currentPage" value="${currentPage}">
																<input type="hidden" name="deptCom" id= "deptCom" value="">
																<input type="hidden" name="upddeptNo" id="upddeptNo" value="">
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">真实姓名</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" id="realName" name="realName" required="required" maxlength="100" />
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">登录手机号</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" id="userName" name="userName" required="required" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')"/>
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">性别 </label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="sex" class="form-control">
																			<!-- <option value="">性别</option> -->
																			<option value="1">男</option>
																			<option value="0">女</option>
																		</select>
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">部门</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="deptLevel1" class="form-control" onchange="deptChangeEvent(this);">
																			<%-- <c:forEach var="o" items="${topDeptList}" varStatus="status">
																				<option value="${o.id}">${o.name}</option>
																			</c:forEach> --%>
																			<option value="${fenKongId }">风控部</option>
																		</select>

																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">分部</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="<c:if test="${positionNo == '10018' }">deptIds</c:if>" id="deptLevel4" class="form-control" onchange="deptChangeEvent('deptLevel4','1');">
																			<!-- <option value=" ">请选择...</option> -->
																			<c:if test="${positionNo != '10018' }">
																				<option value="${deptId }">贷后部</option>
																				<c:forEach var="o" items="${listExternalDept}" varStatus="status">
																					<option value="${o.id}">${o.name}</option>
																				</c:forEach> 
																			</c:if>
																			<c:if test="${positionNo == '10018' }">
																			 	<option value="${u.deptList[0].id }">${u.deptList[0].name}</option> 
																			</c:if>
																		</select>

																	</div>
																</div>
																<c:if test="${positionNo != '10018' }">
																	<div class="form-group" style="margin-bottom: 5px;" id="updTeamAdd">
																		<label class="control-label col-md-3 col-sm-3 col-xs-12">小组</label>
																		<div class="col-md-9 col-sm-9 col-xs-12">
																			<select name="deptIds" id="deptLevel3" class="form-control">
																				<c:forEach items="${listDept}" var="list">
																					<option value="${list.id }">${list.name }</option>
																				</c:forEach>
																			</select>
	
																		</div>
																	</div>
																</c:if>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">职位</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<c:if test="${positionNo != '10018' }">
																			<select name="positionNo" class="form-control">
																				<option value="10015">贷后总监</option>
																				<option value="10016">贷后主管</option>
																				<option value="10017">贷后专员</option>
																				<option value="10018">外催总监</option>
																				<option value="10019">外催专员</option>
																			</select>
																		</c:if>
																		<c:if test="${positionNo == '10018' }">
																			<select name="positionNo" class="form-control">
																				<!-- <option value="10018">外催总监</option> -->
																				<option value="10019">外催专员</option>
																			</select>
																		</c:if>

																	</div>
																</div>
																<%-- <div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">上级${fn:length(allUserListInCompany)}</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="superior" class="form-control" id="allUserListInCompanySave">
																			<c:forEach var="o" items="${allUserListInCompany}" varStatus="status" >
																				<option value="${o.id}">${o.realName}</option>
															              	</c:forEach>
																		</select>
																	</div>
																</div> --%>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">邮箱</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="companyEmail" maxlength="100">
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">固话</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="fixedPhone" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" maxlength="50" />
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="remark" maxlength="200" />
																	</div>
																</div>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<button type="button" class="btn btn-success antoclose" data-dismiss="modal" onclick="saveUserVO('save', null)">保存</button>
														<button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">取消</button>
													</div>
												</div>
											</div>
										</div>
										
										<!-- 添加分组 -->
										<div class="modal fade additionsss" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">添加分组</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<!-- antoform -->
															<form id="addTeamForm" class="form-horizontal calender" role="form">
																<input type="hidden" name="companyId" value="${select_company.id}"> <input type="hidden" name="currentPage" value="${currentPage}">
																<input type="hidden" id="roleIds" name="roleIds" value="">
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">部门</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="" required="required" maxlength="100" value="风控部" readonly="readonly"/>
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">分部</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="" required="required" maxlength="100" value="贷后部" readonly="readonly"/>
																	</div>
																</div>
																<c:if test="${positionNo != '10018' }">
																	<div class="form-group" style="margin-bottom: 5px;" id="deptTeam">
																		<label class="control-label col-md-3 col-sm-3 col-xs-12">小组</label>
																		<div class="col-md-9 col-sm-9 col-xs-12">
																			<select name="deptIds" id="team_deptLevel" class="form-control" onchange="deptOnchang()">
																				<c:forEach items="${listDept}" var="list">
																					<option value="${list.id }">${list.name }</option>
																				</c:forEach>
																			</select>
	
																		</div>
																	</div>
																</c:if>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">组长</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="groupLeader" id="deptLe" class="form-control" onchange="addPerson('1')">
																			<option value="">请选择...</option> 
																			<c:forEach items="${listUserAccount}" var="list">
																				<option value="${list.id }">${list.realName }</option>
																			</c:forEach>
																		</select>

																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<button type="button" class="btn btn-success antoclose" onclick="addPerson('0')">添加成员</button>
																</div>
																
																<table id="tab1" class="table table-striped table-bordered" style="margin-top:20px;">
										                        </table>
										                       
										                        <c:forEach items="${listDept}" var="list" varStatus="status">
																	<input type="hidden" id="dept${status.index+1 }" value="${list.principalUserId }"/>
																</c:forEach>
																<c:forEach items="${listUserAccount}" var="list">
																	<input type="hidden" id="${list.id }" value="${list.teamName }"/>
																</c:forEach>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<button type="button" class="btn btn-success antoclose" data-dismiss="modal" onclick="saveUserVO('saveTeam', null)">保存</button>
														<button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">取消</button>
													</div>
												</div>
											</div>
										</div>
										<!-- <div class="clearfix"></div>
									</div> -->
									<div class="x_content">
										<!-- 字符排序 -->
										<div class="col-md-12 col-sm-12 col-xs-12 text-center" style="display:none;">
											<ul class="pagination pagination-split">
												<li><a href="#">A</a></li>
												<li><a href="#">B</a></li>
												<li><a href="#">C</a></li>
												<li><a href="#">D</a></li>
												<li><a href="#">E</a></li>
												<li>...</li>
												<li><a href="#">W</a></li>
												<li><a href="#">X</a></li>
												<li><a href="#">Y</a></li>
												<li><a href="#">Z</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
										<div id="userInfoDivId"></div>
										<!-- 设置角色的弹框 -->
										<div class="modal fade setting_roles" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">设置角色</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<form id="roleFormId" class="form-horizontal calender" role="form">

																<div class="form-group" style="margin-bottom: 5px;">
																	<table id="datatable_shanghu_liebiao" class="table table-striped table-bordered">
																		<thead>
																			<tr>
																				<th>选择${roleList }*</th>
																				<th>角色编号</th>
																				<th>角色名称</th>
																				<th>角色描述</th>
																			</tr>
																		</thead>
																		<tbody id="roleTbody">
																			<%-- <c:forEach var="role" items="${roleList}" varStatus="status" >
																	<tr>
																		<td style="text-align: center;"><input type="checkbox" name="check_roleIds" id="id_${role.id}" value="${role.id}" ></td>
																		<td style="text-align: center;">${role.seq}</td>
																		<td style="text-align: center;"><input type="hidden" id="name_${role.id}" value="${role.name}">${role.name}</td>
																		<td style="text-align: center;">${role.description}</td>
																	</tr>
												              	</c:forEach> --%>
																		</tbody>
																	</table>
																</div>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<!-- <button type="button" class="btn btn-success antoclose" data-dismiss="modal">确定</button>
											<button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">取消</button> -->
														<form action="mfq/user/saveUserRole.do" method="post" class="form-horizontal" id="saveUserRoleFormId">
															<input type="hidden" name="id" id="roleView_userId">
															<!-- 要修改角色的用户的id -->
															<input type="hidden" name="roleIds" id="roleView_roleIds">
															<!-- 角色的id -->
															<button type="button" class="btn btn-success" onclick="return setRoleIds();">保存</button>
															<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
														</form>

													</div>
												</div>
											</div>
										</div>
										<!-- 休假设置-->
										<div class="modal fade wwsetting_roles" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">休假设置</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<form id="roleFormId" class="form-horizontal calender" role="form">

																<div class="form-group">
										                            <label class="col-sm-3 col-md-3 control-label">姓名：</label>
										                            <div class="col-sm-6 col-md-6">
										                                <input type="text" class="form-control" id="leaveName" name="leaveName" value="张三" readonly style="border:0;background:#fff;"/>
										                                <input type="hidden" id="leaveId" name="leaveId" value=""/>
										                            </div>
										                        </div>
										                        <div class="form-group">
										                            <label class="col-sm-3 col-md-3 control-label">休假时间：</label>
										                            <!-- <div class="col-sm-6 col-md-6" style="padding-left:0;">
											                                <input type="text" class="form-control has-feedback-left" id="repaymentDay" name="repaymentDay"
									                                               placeholder="" aria-describedby="inputSuccess2Status">
									                                        <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"
									                                              style="left:1px;"></span>
									                                        <span id="inputSuccess2Status" class="sr-only">(success)</span>
										                            </div> -->
										                            
										                            <div class="col-sm-4 col-md-4" style="text-align:left;">
										                               <button type="button" class="btn btn-success" onclick="appdenx()">添加</button>
										                            </div>
										                        </div>
										                        <div class="form-group appendKuang">
										                        </div>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<form action="mfq/user/saveUserRole.do" method="post" class="form-horizontal" id="saveUserRoleFormId">
															<button type="button" class="btn btn-success" data-dismiss="modal" onclick="leaveSuer()">确定</button>
															<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
														</form>

													</div>
												</div>
											</div>
										</div>

										<!-- 修改员工信息弹窗 action="mfq/user/update.do"-->
										<div class="modal fade edit" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<form id="updateUserForm" class="form-horizontal calender" role="form">
																<input type="hidden" name="id" id="edituser_id">
																<input type="hidden" name="upddeptCom" id="upddeptCom">
																<input type="hidden" name="upddeptNo" id="upddeptNo" value="">
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">真实姓名</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="realName" id="edituser_realName" required="required" maxlength="100">
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">登录手机号</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="userName" id="edituser_userName" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')"/>
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">性别 </label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="sex" class="form-control" id="edituser_sex">
																			<option value="1">男</option>
																			<option value="0">女</option>
																		</select>
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">部门</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="" class="form-control" id="deptLevel1_update" onchange="deptChangeEvent_update(this, '1', '');">
																			<%-- <c:forEach var="o" items="${topDeptList}" varStatus="status">
																				<option value="${o.id}">${o.name}</option>
																			</c:forEach> --%>
																			<option value="${fenKongId }">风控部</option>
																		</select>

																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">分部</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="<c:if test="${positionNo == '10018' }">deptIds</c:if>" id="deptLevel2_update" class="form-control" onchange="deptChangeEvent('deptLevel2_update','1');">
																			<!-- <option value=" ">请选择...</option> -->
																			<c:if test="${positionNo != '10018' }">
																				<option value="${deptId }">贷后部</option>
																				<c:forEach var="o" items="${listExternalDept}" varStatus="status">
																					<option value="${o.id}">${o.name}</option>
																				</c:forEach> 
																			</c:if>
																			<c:if test="${positionNo == '10018' }">
																			 	<option value="${u.deptList[0].id }">${u.deptList[0].name}</option> 
																			</c:if>
																		</select>

																	</div>
																</div>
																<c:if test="${positionNo != '10018' }">
																	<div class="form-group" id="updTeamUpdate" style="margin-bottom: 5px;">
																		<label class="control-label col-md-3 col-sm-3 col-xs-12">小组</label>
																		<div class="col-md-9 col-sm-9 col-xs-12">
																			<select name="deptIds" id="update_deptLevel4" class="form-control">
																				<c:forEach items="${listDept}" var="list">
																					<option value="${list.id }">${list.name }</option>
																				</c:forEach> 
																				
																			</select>
	
																		</div>
																	</div>
																</c:if>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">职位</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<c:if test="${positionNo != '10018' }">
																			<select name="positionNo" id="upd_positionNo" class="form-control">
																				<option value="10015">贷后总监</option>
																				<option value="10016">贷后主管</option>
																				<option value="10017">贷后专员</option>
																				<option value="10018">外催总监</option> 
																				<option value="10019">外催专员</option>
																			</select>
																		</c:if>
																		<c:if test="${positionNo == '10018' }">
																			<select name="positionNo" id="upd_positionNo" class="form-control">
 																				<!-- <option value="10018">外催总监</option>  -->
																				<option value="10019">外催专员</option>
																			</select>
																		</c:if>

																	</div>
																</div>
																<%-- <div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">上级</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<select name="superior" class="form-control" id="edituser_superior" required="required">
																			<c:forEach var="o" items="${allUserListInCompany}" varStatus="status" >
																	<option value="${o.id}">${o.realName}</option>
												              	</c:forEach>
																		</select>

																	</div>
																</div> --%>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">邮箱</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="companyEmail" required="required" id="edituser_companyEmail" maxlength="100" />
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">固话</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="fixedPhone" required="required" id="edituser_fixedPhone" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" maxlength="50" />
																	</div>
																</div>
																<div class="form-group" style="margin-bottom: 5px;">
																	<label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<input type="text" class="form-control" name="remark" id="edituser_remark" maxlength="200" />
																	</div>
																</div>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<button type="button" class="btn btn-success antoclose" data-dismiss="modal" onclick="updateUserVO();">保存</button>
														<button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">取消</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<form action="${pageContext.request.contextPath}/mfq/user/list.do" method="post" id="testform" class="form-horizontal calender" role="form"></form>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="pull-right">Copyright MFQ All Rights Reserved 美分期科技 版权所有 京ICP备15034902号-1</div>
		<div class="clearfix"></div>
	</footer>
	</div>
	</div>
	<%@ include file="/WEB-INF/common/footer.jsp"%>
   
	<%@ include file="/WEB-INF/common/resource_js.jsp"%>
	<script type="text/javascript">
	  
	$(function(){
		// 初始化还款时间
        $('#repaymentDay').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_3",
            locale: {
                format: 'YYYY-MM-DD'
            },
            autoUpdateInput: false,
        }, function (start, end, label) {
        });
	})
	
	/* 添加 */
	var n = 0;
	function appdenx (obj){
		console.log($('#appendx'))
		$('.appendKuang').append('<div class="form-group"><label class="col-sm-3 col-md-3 control-label"></label><div class="col-sm-6 col-md-6" style="padding-left:0;"><input type="text" class="form-control has-feedback-left" id="repaymentDay'+n+'" name="repaymentDay" placeholder="" aria-describedby="inputSuccess2Status"><span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true" style="left:1px;"></span><span id="inputSuccess2Status" class="sr-only">(success)</span></div><div class="col-sm-1 col-md-1" style="text-align:center;"><button type="button" class="btn btn-success" onclick="removex(this)">删除</button></div></div>')
		 $('#repaymentDay'+n).daterangepicker({
		         singleDatePicker: true,
		         singleClasses: "picker_3",
		          locale: {
		              format: 'YYYY-MM-DD'
		           },
		            autoUpdateInput: false,
		        }, function (start, end, label) {
		        });
			n++;
	}
	function appdenx1 (obj){
		console.log($('#appendx'))
		$('.appendKuang').empty();
		for(var i=0;i<obj.length;i++){
			 var oDate = new Date(obj[i].holidayTime);  
	            var oYear = oDate.getFullYear() ; 
	            var oMonth = oDate.getMonth()+1; 
	            var oDay = oDate.getDate();  
	           var date= oYear+"-"+oMonth+"-"+oDay
			$('.appendKuang').append('<div class="form-group"><label class="col-sm-3 col-md-3 control-label"></label><div class="col-sm-6 col-md-6" style="padding-left:0;"><input type="text" value="'+date+'" class="form-control has-feedback-left" id="repaymentDay'+n+'" name="repaymentDay" placeholder="" aria-describedby="inputSuccess2Status"><span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true" style="left:1px;"></span><span id="inputSuccess2Status" class="sr-only">(success)</span></div><div class="col-sm-1 col-md-1" style="text-align:center;"><button type="button" class="btn btn-success" onclick="removex(this)">删除</button></div></div>')
			 $('#repaymentDay'+n).daterangepicker({
		            singleDatePicker: true,
		            singleClasses: "picker_3",
		            locale: {
		                format: 'YYYY-MM-DD'
		            },
		            autoUpdateInput: false,
		        }, function (start, end, label) {
		        });
	           n++;
		}
	}
	
	
	function removex (aa){
		$(aa).parent().parent().remove()
	}
	
	/* $(document).ready(
		    function () {
		        var beginTimeStore = '';
		        var endTimeStore = '';
		        $('#reservation_table').daterangepicker(
		            {
		                "linkedCalendars": false,
		                "autoUpdateInput": false,
		                "locale": {
		                    format: 'YYYY-MM-DD',
		                    separator: ' ~ ',
		                    applyLabel: "应用",
		                    cancelLabel: "清除",
		                },
		            },
		            function (start, end, label) {
		                beginTimeStore = start;
		                endTimeStore = end;
		                console.log(this.startDate.format(this.locale.format));
		                console.log(this.endDate.format(this.locale.format));
		                if (!this.startDate) {
		                    this.element.val('');
		                } else {
		                    this.element.val(this.startDate
		                            .format(this.locale.format)
		                        + this.locale.separator
		                        + this.endDate.format(this.locale.format));
		                }
		            });

		    })
 */
	
	function getTree(result) {
		// var data = [{"id":"42141530e6fe4c83a0d9b02c7408b2e5","text":"美分期","nodes":[{"id":"45f49519e9aa4dd28dd5e28e6049d407","text":"风控部","nodes":[{"id":"a7671cdb00874ef9b5472f37c4206ba9","text":"审核部"},{"id":"4f0593c3e0d34e8f9a835b6ba4a54c76","text":"贷后部"},{"id":"6437cde0f9954ed1bc82c73f2a2ffd3b","text":"伟杰厕所去吗1"}]},{"id":"95b1abb883c94f3b89bf1c20c6aea11b","text":"财务部","nodes":[{"id":"04daeb1ee56240638fe13b056e03e27b","text":"总经办"},{"id":"e0a6642c7c6e4204b3ffaf256856d2fa","text":"技术部"},{"id":"07fd316498a04abcb9bbbd0f25349fd5","text":"销客部"},{"id":"cea7a16d707c4f518eed8ce10c8329f0","text":"测试李银涛2222"}]},{"id":"9fa06a80240e4396b4015aaa1157a247","text":"人事行政","nodes":[]},{"id":"a2c1e06faaf246969f6bb832bbb9960b","text":"运营部","nodes":[]},{"id":"6abc2036b649498dbd0d69303c23e815","text":"市场部","nodes":[{"id":"7a2cc45568d046178a551cfcc94a0963","text":"广州分部"},{"id":"223990b2aac94352b6aa08f140cde179","text":"北京分部"},{"id":"ca557f7edcbb49a7a33735af02b41790","text":"山东分部"}]},{"id":"cbc5d36e6b5f49198eade86115d07ac2","text":"上海分部","nodes":[]}]},{"id":"03dab6a20f484205acb8a466b679214b","text":"美美","nodes":[]},{"id":"336f827bade74450ab6f8ca2514d5b84","text":"测试公司","nodes":[]},{"id":"49336fe1091545eb8f0059c6874f7869","text":"2","nodes":[]},{"id":"40c9d4fea0584b199771d59c5c88accb","text":"3","nodes":[]},{"id":"f79fbb3efad742bab6e75e05edcd5cdd","text":"piaoliang","nodes":[]},{"id":"b50711771bed4a8b8e98ffb59fcfb0bf","text":"4","nodes":[]},{"id":"df8189e45ea5469bbf1d11a92a790fac","text":"5","nodes":[]},{"id":"222a68baf5494479ade9d006188ebc4b","text":"6","nodes":[]},{"id":"89bb06c3453c49759adb126e56f6051b","text":"李银涛","nodes":[]}];
		var data = result;
		return data;
	}
   		// 页面请求加载组织架构数据
   		function axjaDept () {
   			var deptId=$("#deptId").val();
   			$.ajax({
   				url : "${pageContext.request.contextPath}/mfq/dhjc/ajax/deptTreeList.do",// 跳转到 action  
   				data : "deptId="+deptId,
   				type : 'post',
   				async : false,
   				dataType : 'json',
   				success : function(result) {
   					/* console.info("组织架构--ajax查询部门信息列表:" + result.length);
   					console.info("组织架构--ajax查询部门信息列表:" + result);
   					console.info("组织架构--ajax查询部门信息列表:" + result[0].deptListParent[0].id); */
   					$('#tree').treeview({
   						data : getTree(result),
   						showBorder : false,
   						showCheckbox : false,
   						expandIcon:'fa fa-plus-circle',
   						collapseIcon:'fa fa-minus-circle',
   						onNodeSelected:function(event, data){
   							//alert(data.level+","+data.id);
   							if(data.level == "1"){
   								queryCompany(data.id);
   							}else if(data.level == "2"){
   								queryTeam(data.id);
   							}
   						}
   					});
   				},
   				error : function() {
   					alert("查询 菜单异常！");
   				}
   			});
   		}
   		
		$(function() {
			// 加载组织架构中的部门信息
			axjaDept();
			 $.each($('#tree li'), function(i,item) {
				/*  console.log(i+","+$(item).text())
   				if($(this).find('span').length==2){
   					// console.log($(this))
   					$(this).append('<span class="glyphicon glyphicon-plus" style="padding:0 3px;" onclick="addDeptEvent(this)"></span>')
   				}else{
   					// console.log($(this))
   					$(this).append('<span class="fa fa-pencil" style="padding:0 3px;" data-toggle="modal" data-target=".update_to" onclick="updateDeptEvent(this)"></span><span class="fa fa-trash" style="padding:0 3px; onclick="deleteDeptEvent(this)"></span>')
   				} */
   				
   			}); 
			var params = "1";
			var deptId=$("#deptId").val();
			var url = '${pageContext.request.contextPath}/mfq/dhjc/list/' + params +".do"; // 跳转到 action  
			$.ajax({
				url : url,
				data : {
					params : params,
					deptPid : deptId
				},
				type : 'post',
				async : false,
				dataType : 'json',
				success : function(result) {
					var userList = result.userList;
					var allUserListInCompany = result.allUserListInCompany;
					// console.info(userList[0].realName);
					// console.info("allUserListInCompany : " + result.allUserListInCompany[0].realName);
					// div id ='userInfoDivId';
					var str = "";
					for (var i = 0; i < userList.length; i++) {
						var sex = "";
						if (userList[i].sex == '1'){
							sex = "男";
						} else { 
							sex = "女"; 
						}
						
						var paramsDel = "'delete','"+userList[i].id+"'";
						var onclDel = "onclick=\"saveUserVO(" + paramsDel + ")\"";
						var bntDel= "<button type='button' class='btn btn-danger btn-xs' " + onclDel +">删除</button>";
						var bntHol="<button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-target='.wwsetting_roles' onclick=\"leave('"+userList[i].id+"','"+userList[i].realName+"')\" style='cursor: pointer;'>请假</button>";
						var paramsUpt = "'update','"+userList[i].id+"'";
						var onclUpt = "onclick=\"saveUserVO(" + paramsUpt + ")\"";
						var bntUpt= "<button type='button' class='btn btn-primary btn-xs' " + onclUpt +"data-toggle='modal' data-target='.edit' style='cursor: pointer;'>编辑</button>";
						
						var paramsRole = "'role','"+userList[i].id+"'";
						var onclRole = "onclick=\"saveUserVO(" + paramsRole + ")\"";
						var bntRole= "<button type='button' class='btn btn-success btn-xs' " + onclRole + "data-toggle='modal' data-target='.setting_roles' style='cursor: pointer;'>设置角色</button>";
						var useRole = "";
						if(userList[i].positionNo == "10019" || userList[i].positionNo == "10018"){
							useRole = bntUpt + bntDel;
						}else{
							useRole = bntHol+ bntRole + bntUpt + bntDel;
						}
						str += "<div class='form-group col-md-6 col-sm-6 col-xs-12 profile_details'><div class='well profile_view'><div class='col-sm-12'>"+
						"<h4 class='brief' style='font-size: 24px;'>"+ userList[i].realName +"</h4><div class='left col-xs-7' style=''>"+
						"<ul class='list-unstyled'><li style='margin: 4px 0;'><i class='glyphicon glyphicon-phone' style='font-size: 18px;padding-right: 5px;'></i>"+ userList[i].userName +
						"</li><li style='margin: 4px 0;'><i class='fa fa-users' style='font-size: 16px;padding-right: 5px;'></i>" + sex +
						"</li><li style='margin: 4px 0;'><i class='fa fa-envelope' style='font-size: 16px;padding-right: 5px;'></i>" + userList[i].companyEmail + 
						"</li><li style='margin: 4px 0;'><i class='glyphicon glyphicon-phone-alt' style='font-size: 16px;padding-right: 5px;'></i>" + userList[i].fixedPhone + 
						"</li><li style='margin: 4px 0;'><i class='fa fa-user' style='font-size: 18px;padding:0 5px 0 1px;'></i>" + userList[i].roleIds +
						"</li></ul></div><div class='right col-xs-5 text-center'><img src='${pageContext.request.contextPath}/build/images/timg.jpg' alt='' class='img-circle img-responsive'></div></div>" +
						"<div class='col-xs-12 bottom text-center'><div class='col-xs-12 col-sm-5 emphasis'><p class='ratings'>职位：" + userList[i].positionName +
						"</p></div><div class='col-xs-12 col-sm-7 emphasis'>" + useRole + "</div></div></div></div>";
					}
					$("#userInfoDivId").append(str);
					// 添加的时候填充数据  修改的时候填充数据
					for(var i = 0; i < allUserListInCompany.length; i++){
   						$('#allUserListInCompanySave').append("<option value=" + allUserListInCompany[i].id + ">" + allUserListInCompany[i].realName + "</option>");
   						$('#edituser_superior').append("<option value=" + allUserListInCompany[i].id + ">" + allUserListInCompany[i].realName + "</option>");
   					}
				},
				error : function() {
					alert("查询 菜单异常！");
				}
			});
			deptOnchang();
		});
		// 修改员工信息
   		function updateUserVO () {
   			var edituser_userName=$("#edituser_userName").val();
   			var edituser_realName=$("#edituser_realName").val();
   			if(edituser_realName.trim() == ""){
					alert("真实姓名不能为空！");
					return;
				}
				if(edituser_userName.trim() == ""){
					alert("登录手机号不能为空！");
					return;
				}
   			var url = '${pageContext.request.contextPath}/mfq/dhjc/update.do';
   			var deptText= $("#deptLevel2_update option:selected").text();
			var deptVal= $("#deptLevel2_update option:selected").val();
		//	alert(deptText+","+deptVal)
			if(deptText.indexOf("外催")>=0){
			//	var v=$("#deptLevel3").val();
				$("#upddeptCom").val(deptVal);
			}else if( deptText =="贷后部"){
					$("#upddeptNo").val(deptVal);
			}else{
				$("#upddeptCom").val("");
				$("#upddeptNo").val("");
			}
				var userVO = $('#updateUserForm').serialize();  
			//	alert(userVO)
				console.log("表单序列化=============="+userVO);  
				//$("#addUserForm").submit();
				  $.ajax({
					url : url,
					data : userVO,
					type : 'post',
					async : false,
					dataType : 'json',
					success : function(result) {
						if (result.num == 1){
							alert("修改成功！");
						}
						location.reload(); // 刷新页面
					},
					error : function() {
						location.reload(); // 刷新页面
					}
				});  
   		}
   		// 根据公司ID获得顶层部门
   		function getTopDept(companyId, selectId) {
   			if(companyId == '') return;
   			$.ajax({
   				url : '${pageContext.request.contextPath}/mfq/dept/ajax/getTopList/'+companyId+".do",// 跳转到 action  
   				data : {},
   				type : 'post',
   				async : true,
   				dataType : 'json',
   				success : function(data) {
   					var selectObj = document.getElementById(selectId);
   					selectObj.options.length=0;
   					selectObj.options.add(new Option("请选择...", " "));
   					for(i=0; i<data.length; i++) {
   						selectObj.options.add(new Option(data[i].name, data[i].id)); 
   					}
   				},
   				error : function() {
   					alert("查询下级机构异常！");
   				}
   			});
   		}
   		// 点击新增机构按钮事件 
   		function addDeptEvent(event) {
   			console.log($(event).parent().find('div').attr('id'))
   			console.log($(event).parent().text());
   			var companyId = $(event).parent().find('div').attr('id');//'42141530e6fe4c83a0d9b02c7408b2e5';
   			$("#deptNew_companyId").val(companyId); // 点击的时候 必须把公司id给我 -- 获取点击的那个id  我现在是写死的
   			getTopDept(companyId, "deptNew_pid");
   		}
   		// 点击修改机构按钮事件 
   		function updateDeptEvent(event) { // 这个userId 指的是部门的主键id userId, companyId
   			console.log($(event).parent().find('div').attr('id'))
   			console.log($(event).parent().text());
   			//var userId = '04daeb1ee56240638fe13b056e03e27b'; // 修改用测试数据
   			var userId = $(event).parent().find('div').attr('id'); // '6437cde0f9954ed1bc82c73f2a2ffd3b'; // 修改用测试数据
   			var companyId = '42141530e6fe4c83a0d9b02c7408b2e5';
   			if(userId=='') return;
   			//查询放款机构
   			getTopDept(companyId, "deptUpdate_pid");
   			$("#deptUpdate_id").val(userId);
   			$("#deptUpdate_companyId").val(companyId);
   			$("#deptUpdate_name").val("");
   			$("#deptUpdate_seq").val("");
   			$("#deptUpdate_principalUserId").val("");
   			$.ajax({
   				url : '${pageContext.request.contextPath}/mfq/dept/ajax/selectbyid/' + userId +".do",// 跳转到 action  
   				data : {id : userId},
   				type : 'post',
   				async : true,
   				dataType : 'json',
   				success : function(data) {
   					console.info("点击按钮获取部门修改的原始数据：" + data);
   					$("#deptUpdate_companyId").val(data.companyId);
   					$("#deptUpdate_name").val(data.name);
   					$("#deptUpdate_pid").val(data.pid);
   					$("#deptUpdate_seq").val(data.seq);
   					$("#deptUpdate_principalUserId").val(data.principalUserId);
   					
   					$("#deptUpdate_pid").trigger('change.select2');
   					
   					//setSelectValue("deptUpdate_pid", data.pid)
   				},
   				error : function() {
   					alert("查询修改用户异常！");
   				}
   			});
   		}
   		// 点击删除部门机构按钮事件
   		function deleteDeptEvent(event) { // id, name
   			console.log($(event).parent().find('div').attr('id'))
   			console.log($(event).parent().text());
   			var id = $(event).parent().find('div').attr('id');//'9845ed6106f54026872608a7c3763914';
   			var name = $(event).parent().text(); // '伟杰厕所去吗1';
			//$("#deleteDeptDialog_id").val(id)
			//$("#deleteDeptDialog_name").text(name)
			if(confirm("确定要删除该"+ name + "部门吗？")) { 
   					url = "${pageContext.request.contextPath}/mfq/dept/delete/" +id + ".do";
   	   				$.ajax({
   	   					url : url,
   	   					data :{id : id},
   	   					type : 'post',
   	   					async : false,
   	   					dataType : 'json',
   	   					success : function(result) {
   	   						if (result.num == 1){
   	   							alert("删除成功！");
   	   						}
   							location.reload(); // 刷新页面
   	   					},
   	   					error : function() {
   	   						location.reload(); // 刷新页面
   	   					}
   	   				});
   				}
		}
   		// 部门的添加 -- 修改 -- 删除
   		function saveDeptVO (type, deptId) {
   			var url = "";
   			if ("save" == type) {
   				url = '${pageContext.request.contextPath}/mfq/dept/save.do';
   				var deptVO =  $('#addDeptForm').serialize();
   				console.log("添加部门表单序列化--------------" + deptVO);
   				$.ajax({
   					url : url,
   					data : deptVO,
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
   			} if ('update' == type) { // 修改操作
   				url = '${pageContext.request.contextPath}/mfq/dept/update.do';
				var deptVO = $('#updateDeptForm').serialize();  
				console.log("表单序列化=============="+deptVO);  
				$.ajax({
					url : url,
					data : deptVO,
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
   		// 用户的添加-- 修改 -- 删除
   		function saveUserVO(type, userId) {
   			var url = ""; // 跳转到 action  
   			if ("save" == type) { // 用ajax请求添加 删除 修改
   				var realName=$("#realName").val();
   				var userName=$("#userName").val();
   				if(realName.trim() == ""){
   					alert("真实姓名不能为空！");
   					return;
   				}
   				if(userName.trim() == ""){
   					alert("登录手机号不能为空！");
   					return;
   				}
   				url = '${pageContext.request.contextPath}/mfq/dhjc/saveLoanUserVO.do';
   				var deptText= $("#deptLevel4 option:selected").text();
   				var deptVal= $("#deptLevel4 option:selected").val();
   				
   		//	alert(deptText + "," + deptVal);
   				if(deptText.indexOf("外催")>=0){
   				//	var v=$("#deptLevel3").val();upddeptNo
   					$("#deptCom").val(deptVal);
   				}else if( deptText =="贷后部"){
   					$("#upddeptNo").val(deptVal);
   				}else{
   					$("#deptCom").val("");
   					$("#upddeptNo").val("");
   				}
   				var userVO = $('#addUserForm').serialize();  
   				//alert(userVO)
   				console.log("表单序列化=============="+userVO);  
   				//$("#addUserForm").submit();
   				   $.ajax({
   					url : url,
   					data : userVO,
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
   			} else if("saveTeam" == type){
   				var checkText=$("#deptLe2").find("option:selected").text();  //获取小组选择的Text
   				var checkValue=$("#deptLe2").val();  //获取小组选择的Value
   				var name= $("#"+checkValue).val();		//获取小组Value值对应的组长id
   				var checkName1=$("#deptLe").find("option:selected").text();
   				var checkValue1=$("#deptLe").val(); 
   				var name1= $("#"+checkValue1).val();
   				//alert(name+","+name1)
   				//	var msg=checkName1+"已是组长，是否变更为"+checkText+"组长！";
   					var msg="是否变更"+checkName1+"为"+checkText+"组长！";
   					if ( (name == "" && name1 == "贷后部") || name==checkValue1 || confirm(msg)==true){
   					//	alert("00")
   						url = '${pageContext.request.contextPath}/mfq/dhjc/ajax/saveTeamInformation.do';
   		   				var chk_value =[]; 
   		   				$('input[name="rName"]:checked').each(function(){ 
   		   					chk_value.push($(this).val()); 
   		   				}); 
   		   		//		alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value); 
   		   				$("#roleIds").val(chk_value);
   		   				var userTeam = $('#addTeamForm').serialize();  
   		   			//	alert(userTeam)
   		   				console.log("表单序列化=============="+userTeam); 
   		   				   $.ajax({
   		   					url : url,
   		   					data : userTeam,
   		   					type : 'post',
   		   					async : false,
   		   					dataType : 'json',
   		   					success : function(result) {
   		   							alert(result.msg);
   		   						/* if (result.num == "00"){
   		   							alert(result.msg);
   		   						}else{
   		   						} */
   								location.reload(); // 刷新页面
   		   					},
   		   					error : function() {
   		   						location.reload(); // 刷新页面
   		   					}
   		   				});    
   					}
   				
   			}else if ("update" == type) {
   				// 修改操作
   				if (userId == '') return ;
   				$("#edituser_id").val("");
   				$("#edituser_realName").val("");
   				$("#edituser_userName").val("");
   				//$("#deptLevel2_update").val("");
   				$("#positionNo").val("");
   				$("#edituser_superior").val("");
   				$("#edituser_companyEmail").val("");
   				$("#deptLevel4").val("");
   				$("#edituser_fixedPhone").val("");
   				$("#edituser_remark").val("");
   				
   				url = '${pageContext.request.contextPath}/mfq/user/ajax/selectbyid/' + userId + ".do"; // 跳转到 action  
   				$.ajax({
   					url : url,
   					data :{userId : userId},
   					type : 'post',
   					async : false,
   					dataType : 'json',
   					success : function(data) {
   						$("#edituser_id").val(data.id);
   						$("#edituser_realName").val(data.realName);
   						$("#edituser_userName").val(data.userName);
   						$("#edituser_sex").val(data.sex);
   						
   						$("#upd_positionNo").val(data.positionNo);
   						
   						$("#edituser_superior").val(data.superior);
   						$("#edituser_companyEmail").val(data.companyEmail);
   						//$("#edituser_mobile").val(data.mobile);
   						$("#edituser_fixedPhone").val(data.fixedPhone);
   						$("#edituser_remark").val(data.remark);
   						$('#edituser_sex').trigger('change.select2');
   						$('#positionNo').trigger('change.select2');
   						$('#edituser_superior').trigger('change.select2');
   						var dept1 = data.ext4;
   						if (data.ext5 == '2') {
   							dept1 = data.ext3;
   						}
   						//$("#deptLevel4").val(data.ext4);
   						if(data.deptList.length > 0){
   							var dataObj=JSON.stringify(data.deptList)
	   						var jsonObj =  JSON.parse(dataObj);
   							if(jsonObj[0].name.indexOf("外催")>=0){
   								$("#deptLevel2_update").val(jsonObj[0].id);
   								$("#updTeamUpdate").attr("style","display:none");
   							}else{
   								$("#updTeamUpdate").attr("style","display:");
   								if(data.positionNo != "10015"){
	   								$("#deptLevel2_update").val(jsonObj[0].pid);
   								}else{
	   								$("#deptLevel2_update").val(jsonObj[0].id);
   								}
   								$("#update_deptLevel4").val(jsonObj[0].id);
   							}
   						}else{
   							$("#deptLevel4").val(data.ext4);
   						}
   					//	deptChangeEvent_update(document.getElementById("deptLevel1_update"), data.ext5, data.ext4);
   					},
   					error : function() {
   						location.reload(); // 刷新页面
   					}
   				});
   			} else if ("delete" == type && null != userId) {
   				if(confirm("确定要删除吗？")) { 
   					url = "${pageContext.request.contextPath}/mfq/dhjc/delete/" +userId + ".do";
   	   				$.ajax({
   	   					url : url,
   	   					data :{userId : userId},
   	   					type : 'post',
   	   					async : false,
   	   					dataType : 'json',
   	   					success : function(result) {
   	   						if (result.num == 1){
   	   							alert("删除成功！");
   	   						}
   							location.reload(); // 刷新页面
   	   					},
   	   					error : function() {
   	   						location.reload(); // 刷新页面
   	   					}
   	   				});
   				}
   			} else if ('role' == type) { // 设置角色	保存要关联角色的用户ID
   				setRoleAjax(userId);
   			}
   		}
   		// 保存要关联角色的用户ID
   		function setRoleAjax(id) {
   			$("#roleTbody").html('');
   			// alert(id);
   			$("#roleView_userId").val(id);
   			
   			// id = 'df10c2db125b40c4b4fa50c75d4d9e27';// 先写死在查询看效果
   			$.ajax({
   				url : '${pageContext.request.contextPath}/mfq/role/ajax/getRoleByUserId/' + id + ".do",// 跳转到 action  
   				data : {userId : id},
   				type : 'post',
   				async : true,
   				dataType : 'json',
   				success : function(result) {
   					console.log("根据用户id 查询用户关联的角色信息：" + result.roleList[0].id);
   					var roleListUserId = result.roleListUserId; // 这个集合是关联用户id对应的集合
   					var role = result.roleList;
   					var str = "";
   					for (i=0; i<role.length; i++) {
   						if (role[i].flg == "true") {
   							str += "<tr><td><input type='checkbox' name='check_roleIds' id='id_"+role[i].id+"' value='"+role[i].id+"'checked='checked'></td><td>"+role[i].seq+"</td>" + 
	  							"<td><input type='hidden' id='name_"+role[i].id+"' value='"+role[i].name+"'>"+role[i].name+"</td><td>"+role[i].description+"</td></tr>";
   						}else{
   							str += "<tr><td><input type='checkbox' name='check_roleIds' id='id_"+role[i].id+"' value='"+role[i].id+"'></td><td>"+role[i].seq+"</td>" + 
  							"<td><input type='hidden' id='name_"+role[i].id+"' value='"+role[i].name+"'>"+role[i].name+"</td><td>"+role[i].description+"</td></tr>";
  							
   						}
   					}
   					$("#roleTbody").append(str);
   					
   					// 以前拥有的 我要让他自动打上对号标记为已选择
   					
   				},
   				error : function() {
   				}
   			});
   		}
   		
   		// 保存用户角色关系
   		function setRoleIds() {
   			var ids = "";
   			var names = "";
   			var idArray = document.getElementsByName("check_roleIds");
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
   			
   			$("#roleView_roleIds").val(ids);
//   			return true;

			$.ajax({
				url : "${pageContext.request.contextPath}/mfq/user/saveUserRole.do", // 跳转到 action  
				data : $('#saveUserRoleFormId').serialize(),
				type : 'post',
				async : false,
				dataType : 'json',
				success : function(res) {
					if (res.num == 1){
						alert("设置角色成功！");
						location.reload(); // 刷新页面
					}
				},
				error : function() {
					location.reload(); // 刷新页面
				}
			});
   		}
   		
   		// 部门二级联动加载填充内容
   		function deptChangeEvent(obj,type) {
   			// alert(obj.value);updTeamUpdate
   			var checkText=$("#"+obj).find("option:selected").text(); //deptTeam
   			if(checkText.indexOf("外催")>=0){
   				if(obj == "deptLevel4"){
	   				$("#updTeamAdd").attr("style","display:none");
   				}
   				if(obj == "deptLevel2_update"){
	   				$("#updTeamUpdate").attr("style","display:none");
   				}
   			}else{
   				if(obj == "deptLevel4"){
	   				$("#updTeamAdd").attr("style","display:");
   				}
   				if(obj == "deptLevel2_update"){
	   				$("#updTeamUpdate").attr("style","display:");
   				}
   			}
   			if(obj.value =='' || obj.value == "") return; 
   			var url = "${pageContext.request.contextPath}/mfq/dept/ajax/getListByPid/"+obj.value+".do"; // 跳转到 action
   			$.ajax({
   				url : url,
   				data : {},
   				type : "post",
   				async : true,
   				dataType : "json",
   				success : function(data) {
   					console.info("查询部门信息：" + data)
   					if(type != "1"){
	   					$('#deptLevel2').empty(); // 清空 重新赋值
	   					$('#deptLevel3').empty();
   					}
   					for(var i = 0; i < data.length; i++){
   						if(type != "1"){
   							$('#deptLevel2').append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
   						}else{
   							$('#deptLevel3').append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
   						}
   					}
   				},
   				error : function() {
					location.reload(); // 刷新页面
				}
   			});
   		}
   		/* // 机构2级联动ajax请求--修改使用
   		function deptChangeEvent_update(obj, type, deptId) {
   			if(obj.value =='' || obj.value == "") return; 
   			var url = "${pageContext.request.contextPath}/mfq/dept/ajax/getListByPid/"+obj.value+".do"; // 跳转到 action
   			$.ajax({
   				url : url,
   				data : {},
   				type : "post",
   				async : true,
   				dataType : "json",
   				success : function(data) {
   					console.info("修改部门信息：" + data)
   					$('#deptLevel2').empty(); // 清空 重新赋值
   					for(var i = 0; i < data.length; i++){
   						$('#deptLevel2_update').append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
   					}
   					if (type=='2') {
   						$('#deptLevel2_update').val(deptId);
   					}
   				},
   				error : function() {
					location.reload(); // 刷新页面
				}
   			});
   		} */
   		
   		function addPerson(type){
   			var deptId=$("#deptId").val();
   			var deptLe= $("#deptLe option:selected").val();
   			if(deptLe == "" && type == "0"){
   				alert("请先选择组长！");
   				return;
   			}
   			var url = "${pageContext.request.contextPath}/mfq/dhjc/ajax/ajaxExhibitionPerson.do";
   			 $.ajax({
   				type : "post",
   				url : url,
   				data : "deptId="+deptId+"&deptLe="+deptLe,
   				async : true,
   				success : function(data) {
   					var dataObj=eval("("+data+")");
   					handlePerson(dataObj);
   				},
   				error : function() {
				//	location.reload(); // 刷新页面
				}
   			}); 
   		}
   		
   		function handlePerson(dataObj){
   			var thead = "<thead><tr> <th><input onclick='quanXuan()' type='checkbox'/></th><th>姓名</th><th>当前所在组</th></tr></thead>";
   		//	var tbody="<tbody id='messageListTbodyId'>";
   			var tr="";
   			for(var i=0;i<dataObj.length;i++){
   				tr+="<tr><th><input class='datainput' name='rName' type='checkbox' value='"+dataObj[i].id+"'/></th>"+
   					"<th>"+dataObj[i].realName+"</th>"+
   					"<th>"+dataObj[i].deptName+"</th></tr>";
   			}
   			var tab = thead+tr;
   		//	alert(tab);
   			$("#tab1").html(tab);
   		}
   		
   		
   		var flag = true;
   		
   		function quanXuan(){
   			if(flag){
   				$("#tab1").find('.datainput').prop('checked',true)
   				flag = false;
   			}else{
   				$("#tab1").find('.datainput').prop('checked',false)
   				flag = true;
   			}
   		}
   		
   		
   		function deptOnchang(){
   		//	var deptLe2= $("#deptLe2 option:selected").val();
   			var deptText2= $("#team_deptLevel option:selected").text();
   			 var index = 0;
   			if(deptText2.indexOf("一")>0) index=1;
   			if(deptText2.indexOf("二")>0) index=2;
   			if(deptText2.indexOf("三")>0) index=3;
   			if(deptText2.indexOf("四")>0) index=4;
   			if(deptText2.indexOf("五")>0) index=5;
   		//	var name= $("#dept"+deptLe2).val();
   			var name= $("#dept"+index).val();
   		//	alert(index+","+deptText2+","+name);
   			$("#deptLe").val(name); 
   		}
   		function reset(){
   			$("#searchName").val("");
   			$("#searchTel").val("");
   			$("#cRepaymentStatus").val("");
   		}
   		//条件查询
   		function query(){
   			var deptId=$("#deptId").val();
   			var searchName=$("#searchName").val();
   			var searchTel=$("#searchTel").val();
   			var searchPosition=$("#searchPosition").val();
   			var url = "${pageContext.request.contextPath}/mfq/dhjc/list/query.do"; // 跳转到 action
  			  $.ajax({
  				type : "post",
  				url : url,
  				data : "searchName="+searchName+"&searchTel="+searchTel+"&searchPosition="+searchPosition+"&deptPid="+deptId,
  				async : false,
				dataType : 'json',
  				success : function(result) {
  					hanledResult(result);
  				},
  				error : function() {
				
				}
  			}); 
   		}
   		//组织架构查询
   		function queryTeam(id){
   			var url = "${pageContext.request.contextPath}/mfq/dhjc/list/queryTeam.do"; // 跳转到 action
			  $.ajax({
				type : "post",
				url : url,
				data : "deptId="+id,
				async : false,
				dataType : 'json',
				success : function(result) {
					hanledResult(result);
				},
				error : function() {
				
				}
			}); 
   		}
   		//查询外催公司专员
   		function queryCompany(comId){
   			var deptId=$("#deptId").val();
   			var url = "${pageContext.request.contextPath}/mfq/dhjc/list/queryCompanyUser.do"; // 跳转到 action
			  $.ajax({
				type : "post",
				url : url,
				data : "comId="+comId+"&dId="+deptId,
				async : false,
				dataType : 'json',
				success : function(result) {
					hanledResult(result);
				},
				error : function() {
				
				}
			}); 
   		}
   		function leave(id,realName){
   			$("#leaveName").val(realName);
   			$("#leaveId").val(id);
   		  var url = "${pageContext.request.contextPath}/mfq/dhjc/echoHoliday.do";
   		  $.ajax({
				type : "post",
				url : url,
				data : "userId="+id,
				async : false,
				dataType : 'json',
				success : function(result) {
				//	alert(result[0].holidayTime)
					if(result.type == "0001"){
						alert(result.msg);
					}else{
	   					appdenx1(result);
					}
				},
			
			});   
   		}
   		function leaveSuer(){
   			var map=$("input[name=repaymentDay]").map(function(){return this.value;}).get().join(",");
   			var userId=$("#leaveId").val();
   			var realName=$("#leaveName").val();
   			
   			 var url = "${pageContext.request.contextPath}/mfq/dhjc/addHoliday.do"; // 跳转到 action
			  $.ajax({
				type : "post",
				url : url,
				data : "userId="+userId+"&date="+map+"&realName="+realName,
				async : false,
				dataType : 'json',
				success : function(result) {
					if(result !="" && result !="0"){
						alert("添加成功");
					}
				},
				error : function() {
				
				}
			});  
   		}
   		function hanledResult(result){
   			var userList = result.userList;
			var allUserListInCompany = result.allUserListInCompany;
			// console.info(userList[0].realName);
			// console.info("allUserListInCompany : " + result.allUserListInCompany[0].realName);
			// div id ='userInfoDivId';
			$('#userInfoDivId').empty();
			var str = "";
			for (var i = 0; i < userList.length; i++) {
				var sex = "";
				if (userList[i].sex == '1'){
					sex = "男";
				} else { 
					sex = "女"; 
				}
				
				var paramsDel = "'delete','"+userList[i].id+"'";
				var onclDel = "onclick=\"saveUserVO(" + paramsDel + ")\"";
				var bntDel= "<button type='button' class='btn btn-danger btn-xs' " + onclDel +">删除</button>";
				var bntHol="<button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-target='.wwsetting_roles' onclick=\"leave('"+userList[i].id+"','"+userList[i].realName+"')\" style='cursor: pointer;'>请假</button>";
				var paramsUpt = "'update','"+userList[i].id+"'";
				var onclUpt = "onclick=\"saveUserVO(" + paramsUpt + ")\"";
				var bntUpt= "<button type='button' class='btn btn-primary btn-xs' " + onclUpt +"data-toggle='modal' data-target='.edit' style='cursor: pointer;'>编辑</button>";
				
				var paramsRole = "'role','"+userList[i].id+"'";
				var onclRole = "onclick=\"saveUserVO(" + paramsRole + ")\"";
				var bntRole= "<button type='button' class='btn btn-success btn-xs' " + onclRole + "data-toggle='modal' data-target='.setting_roles' style='cursor: pointer;'>设置角色</button>";
				var useRole = "";
				if(userList[i].positionNo == "10019" || userList[i].positionNo == "10018"){
					useRole = bntUpt + bntDel;
				}else{
					useRole = bntHol+ bntRole + bntUpt + bntDel;
				}
				str += "<div class='form-group col-md-6 col-sm-6 col-xs-12 profile_details'><div class='well profile_view'><div class='col-sm-12'>"+
				"<h4 class='brief' style='font-size: 24px;'>"+ userList[i].realName +"</h4><div class='left col-xs-7' style=''>"+
				"<ul class='list-unstyled'><li style='margin: 4px 0;'><i class='glyphicon glyphicon-phone' style='font-size: 18px;padding-right: 5px;'></i>"+ userList[i].userName +
				"</li><li style='margin: 4px 0;'><i class='fa fa-users' style='font-size: 16px;padding-right: 5px;'></i>" + sex +
				"</li><li style='margin: 4px 0;'><i class='fa fa-envelope' style='font-size: 16px;padding-right: 5px;'></i>" + userList[i].companyEmail + 
				"</li><li style='margin: 4px 0;'><i class='glyphicon glyphicon-phone-alt' style='font-size: 16px;padding-right: 5px;'></i>" + userList[i].fixedPhone + 
				"</li><li style='margin: 4px 0;'><i class='fa fa-user' style='font-size: 18px;padding:0 5px 0 1px;'></i>" + userList[i].roleIds +
				"</li></ul></div><div class='right col-xs-5 text-center'><img src='${pageContext.request.contextPath}/build/images/timg.jpg' alt='' class='img-circle img-responsive'></div></div>" +
				"<div class='col-xs-12 bottom text-center'><div class='col-xs-12 col-sm-5 emphasis'><p class='ratings'>职位：" + userList[i].positionName +
				"</p></div><div class='col-xs-12 col-sm-7 emphasis'>" +useRole + "</div></div></div></div>";
			}
			$("#userInfoDivId").append(str);
			// 添加的时候填充数据  修改的时候填充数据
			for(var i = 0; i < allUserListInCompany.length; i++){
					$('#allUserListInCompanySave').append("<option value=" + allUserListInCompany[i].id + ">" + allUserListInCompany[i].realName + "</option>");
					$('#edituser_superior').append("<option value=" + allUserListInCompany[i].id + ">" + allUserListInCompany[i].realName + "</option>");
				}
   		}
    </script>
</body>
</html>