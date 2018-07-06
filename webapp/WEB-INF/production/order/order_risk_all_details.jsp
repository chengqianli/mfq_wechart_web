<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/resource_jstl.jsp"%>
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
a:hover {
	text-decoration: underline;
}

.erji-daohang {
	list-style: none;
	float: left;
	display: block;
	width: 24%;
	text-align: center;
	line-height: 4;
	background: #29BB9C;
}

.kuangkuang {
	list-style: none;
	padding: 0;
}

.jibie {
	width: 70%;
	text-align: center;
	line-height: 40px;
	background: rgba(116, 135, 155, 1);
	margin: 10px auto 0;
	color: #FFFFFF;
	position: relative;
}

h2 {
	font-size: 26px;
	line-height: 2;
	text-align: right;
	padding-right: 10px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.shijian {
	font-size: 20px;
	line-height: 1.471;
	text-align: right;
	padding-right: 10px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.form-group {
	margin-bottom: 0px;
}

label {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.profile_info h2 {
	text-align: left;
}

.actionBar {
	display: none;
}

.stepContainer {
	height: inherit !important;
}

.wizard_steps a {
	text-decoration: none
}

.wizard_steps {
	margin: 20px 1% 0 !important;
	padding: 20px 0;
	border: 1px solid #eeeeee;
	width: 98% !important;
}

hr {
	padding: 6px 0;
	border: 0;
	margin: 0;
}

li {
	list-style: none;
}
</style>

</head>
<body class="nav-md">
	<%-- menu profile --%>
	<%@ include file="/WEB-INF/common/menu_profile.jsp"%>
	<%-- sidebar menu --%>
	<%@ include file="/WEB-INF/common/sidebar_menu.jsp"%>
	<%-- sidebar footer --%>
	<%@ include file="/WEB-INF/common/sidebar_footer.jsp"%>
	<%-- top navigation --%>
	<%@ include file="/WEB-INF/common/top_nav.jsp"%>

	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="row title_left" style="width: 100%;">
					<div class="span6">
						<ul class="breadcrumb" style="padding-left: 20px;">
							<li>风控管理</li>
							<li>订单审核</li>
							<li>全部订单</li>
							<li>订单详情</li>
						</ul>
					</div>
				</div>
			</div>
			<form action="">
				<input type="hidden" value="${order.id}" name="orderId" id="orderId">
				<input type="hidden" value="${order.customerId}" name="customerId"
					id="customerId"> <input type="hidden" value=""
					name="orderStatus" id="orderStatus">
				<%
					String tokenName = String.valueOf(request.getAttribute("mfq.token.name"));
					String token = String.valueOf(request.getAttribute(tokenName));
				%>
				<input type="hidden" id="tokenNameId" name="<%=tokenName%>"
					value="<%=token%>" /> <input type="hidden" id="tokenId"
					name="mfq.token.name" value="<%=tokenName%>" />
			</form>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_content">
							<div id="wizard" class="form_wizard wizard_horizontal">
								<ul class="wizard_steps">
									<li><a href="#step-1" class="done" isdone="1"> <span
											class="step_no">1</span> <span class="step_descr"><span
												style="color: #ffffff;">审核中</span>进件<span
												style="color: #ffffff;">审核中</span><br /> <small>${order.ext1}</small>
										</span>
									</a></li>
									<c:choose>
										<c:when
											test="${order.status == '06' || order.status == '07' || order.status == '301' || order.status == '312' }">
											<li><a href="#step-1" class="done" isdone="1"> <span
													class="step_no">2</span> <span class="step_descr"> <span
														style="color: #ffffff;">审核</span>审核通过<span
														style="color: #ffffff;">审核</span><br /> <small><c:forEach
																items="${orderCheckLog}" var="i">
																<c:if test="${i.checkStatus=='301'}">
																${i.createTime}
															</c:if>
															</c:forEach></small>
												</span>
											</a></li>
										</c:when>
										<c:when test="${order.status == '304'}">
											<li><a href="#step-2" class="selected" isdone="1"> <span
													class="step_no">2</span> <span class="step_descr"> <span
														style="color: #ffffff;">审核</span>审核拒绝<span
														style="color: #ffffff;">审核</span><br /> <small><c:forEach
																items="${orderCheckLog}" var="i">
																<c:if test="${i.checkStatus=='304'}">
																${i.createTime}
															</c:if>
															</c:forEach></small>
												</span>
											</a></li>

										</c:when>
										<c:otherwise>
											<li><a href="#step-3" class="disabled" isdone="1"> <span
													class="step_no">2</span> <span class="step_descr"> <span
														style="color: #ffffff;">审核中</span>审核中<span
														style="color: #ffffff;">审核中</span><br /> <small>&#12288</small>
												</span>
											</a></li>

										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when
											test="${order.status == '06' || order.status == '07' || order.status == '320' || order.status == '312'}">
											<li><a href="#step-1" class="done" isdone="1"> <span
													class="step_no">3</span> <span class="step_descr"> <span
														style="color: #ffffff;">审</span>已分配放款机构<span
														style="color: #ffffff;">审</span><br /> <small><c:forEach
																items="${orderCheckLog}" var="i">
																<c:if
																	test="${i.checkStatus=='06' || i.checkStatus=='07'}">
																${i.createTime}
															</c:if>
															</c:forEach></small>
												</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#step-3" class="disabled" isdone="1"> <span
													class="step_no">3</span> <span class="step_descr"> <span
														style="color: #ffffff;">审</span>未分配放款机构<span
														style="color: #ffffff;">审</span><br /> <small>&#12288</small>
												</span>
											</a></li>

										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when
											test="${order.status == '06' || order.status == '07' || order.status == '320' || order.status == '312'}">
											<c:choose>
												<c:when
													test="${orderProgress.orderContractSignStatus == 'TRUE'}">
													<li><a href="#step-1" class="done"> <span
															class="step_no">4</span> <span class="step_descr">
																<span style="color: #ffffff;">审核中</span>已签署<span
																style="color: #ffffff;">审核中</span><br /> <small>${orderProgress.orderContractSignTime}</small>
														</span>
													</a></li>

												</c:when>
												<c:otherwise>
													<li><a href="#step-4" class="disabled"> <span
															class="step_no">4</span> <span class="step_descr">
																<span style="color: #ffffff;">审核中</span>未签署<span
																style="color: #ffffff;">审核中</span><br /> <small>
																	&#12288</small>
														</span>
													</a></li>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<li><a href="#step-4" class="disabled"> <span
													class="step_no">4</span> <span class="step_descr"> <span
														style="color: #ffffff;">审核中</span>未签署<span
														style="color: #ffffff;">审核中</span><br /> <small>
															&#12288</small>
												</span>
											</a></li>

										</c:otherwise>
									</c:choose>

								</ul>

								<div id="step" class="x_content">

									<!--订单信息-->

									<div class="col-md-6 col-xs-12" style="margin-top: 10px;">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">订单信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<form class="form-horizontal form-label-left">

													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">订单号</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.orderNo}
																<c:if
																	test="${order.splitNo != null && order.splitNo !=''}">
																	<font style='color: #e74c3c'>&nbsp;&nbsp;[${order.splitNo}]</font>
																</c:if>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">创建时间
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.ext1}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">进件来源
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${order.applicationForm=='01'}">用户进件</c:if>
																<c:if test="${order.applicationForm=='02'}">商户进件</c:if>
																<c:if test="${order.applicationForm=='03'}">渠道进件</c:if>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">基础授信额度
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${storeCredit.surplusCredit}(已用)/${storeCredit.credit}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">担保方
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:choose>
																	<c:when test="${order.applicationForm=='03'}">
																		<c:if test="${order.auditParty==1}">渠道担保</c:if>
																		<c:if test="${order.auditParty==2}">商户担保</c:if>
																	</c:when>
																	<c:otherwise>
																	商户担保
																</c:otherwise>
																</c:choose>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
										<!--还款信息-->
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">还款信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<form class="form-horizontal form-label-left">

													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">借款总额</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.finallySum}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">还款金额
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.ext3}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">借款周期
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.stageValue}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">还款日
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:choose>
																	<c:when
																		test="${orderRepayment == null || orderRepayment == ''}">
										                				尚无还款日
										                			</c:when>
																	<c:otherwise>
										                				${orderRepayment.repaymentDay}日
										                			</c:otherwise>
																</c:choose>
															</div>
														</div>
													</div>

													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">月还金额
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.fqTotalSum}</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>

									<!--商品信息-->

									<div class="col-md-6 col-xs-12" style="margin-top: 10px;">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">商品信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<form class="form-horizontal form-label-left">

													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">商户名称</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${orderServices.storeName}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">商户类型
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${orderServices.storeTypeName}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">项目名称
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${orderServices.serviceName}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">服务金额
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${orderServices.price}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 0; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;"></div>
														</div>
													</div>
												</form>
											</div>
										</div>
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">费率信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<!--费率信息-->
											<div class="x_content">
												<form class="form-horizontal form-label-left">

													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">使用费率</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if
																	test="${order.rateType == 0 || order.rateType == null}">
																	<c:choose>
																		<c:when test="${order.signRateType == 1}">商户费率</c:when>
																		<c:when test="${order.signRateType == 2}">渠道费率</c:when>
																		<c:otherwise>商户费率</c:otherwise>
																	</c:choose>
																</c:if>
																<c:if test="${order.rateType == 1}">商户费率</c:if>
																<c:if test="${order.rateType == 2}">渠道费率</c:if>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">用户费率
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.userRate}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">商户费率
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.storeRate}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">服务费承担方
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${order.ext2}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 0; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;"></div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>


									<!--银行卡信息-->
									<%-- <div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">银行卡信息</h2>
												<ul class="nav navbar-right panel_toolbox">


													<button type="button" class="btn btn-success btn-primary"
														data-toggle="modal" data-target=".editBack" onclick="">修改
													</button>
													<button type="button" class="btn btn-primary">更改记录</button>
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>

												</ul>

												<div class="modal editBack" tabindex="-1" role="dialog"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">

															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">×</button>
																<h4 class="modal-title">修改还款银行卡</h4>
															</div>
															<div class="modal-body">
																<div style="padding: 5px 20px;">
																	<form id="editBack" class="form-horizontal calender"
																		role="form">
																		<div class="form-group" style="margin-bottom: 5px;">
																			<label
																				class="control-label col-md-3 col-sm-3 col-xs-12">银行名称</label>
																			<div class="col-md-9 col-sm-9 col-xs-12">
																				<select class="form-control" name="bankName">
																					<c:forEach items="${banks}" var="banks">
																						<option value="${banks.name}"
																							${bank.bankNameDes == banks.name ? 'selected': '' }>${banks.name}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>

																		<div class="form-group" style="margin-bottom: 5px;">
																			<label
																				class="control-label col-md-3 col-sm-3 col-xs-12">银行卡号</label>
																			<div class="col-md-9 col-sm-9 col-xs-12">
																				<input type="number" class="form-control"
																					name="bankNo" value="${bank.cardNumber}"
																					placeholder="请输入银行卡号">
																			</div>
																		</div>
																		<div class="form-group" style="margin-bottom: 5px;">
																			<label
																				class="control-label col-md-3 col-sm-3 col-xs-12">银行预留手机号</label>
																			<div class="col-md-9 col-sm-9 col-xs-12">
																				<input type="number" class="form-control"
																					maxlength="11" name="moable"
																					value="${bank.bankPhone}" placeholder="请输入银行预留手机号">
																			</div>
																		</div>
																		<input type="hidden" name="orderId"
																			value="${order.id}" /> <input type="hidden"
																			name="realName" value="${base.realName}" /> <input
																			type="hidden" name="userCode"
																			value="${base.idNumber}" />
																	</form>
																</div>
															</div>
															<div class="modal-footer" style="">
																<button type="button" class="btn btn-success antoclose"
																	data-dismiss="modal" onclick="editBack()">保存</button>
																<button type="button" class="btn btn-primary "
																	data-dismiss="modal">取消</button>
															</div>
														</div>
													</div>
												</div>

												<!-- 修改 -->
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<form id="demo-form2" data-parsley-validate
													class="form-horizontal form-label-left">
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">还款银行</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${bank.bankNameDes}</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">银行卡号
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${bank.cardNumber}</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">预留手机号
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${bank.bankPhone}</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div> --%>



									<!--基本信息-->

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">基本信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<form id="demo-form2" data-parsley-validate
													class="form-horizontal form-label-left">
													<div class="form-group col-md-4 col-sm-4 col-xs-12">
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">姓名</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	${base.realName}</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">性别</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	${idCard.gender}</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">年龄</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	${idCard.age}</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">电话号码</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	${base.mobileNumber}</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">身份证</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	${base.idNumber}</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">学历
															</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	<c:if test="${base.education == '01'}">研究生或以上</c:if>
																	<c:if test="${base.education == '02'}">大学</c:if>
																	<c:if test="${base.education == '03'}">大专</c:if>
																	<c:if test="${base.education == '04'}">高中</c:if>
																	<c:if test="${base.education == '05'}">中专</c:if>
																	<c:if test="${base.education == '06'}">初中及以下</c:if>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group col-md-4 col-sm-4 col-xs-12">
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">婚姻状态</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	<c:if test="${base.isMarried== '01'}">已婚</c:if>
																	<c:if test="${base.isMarried== '02'}">未婚</c:if>
																	<c:if test="${base.isMarried== '03'}">离异</c:if>
																	<c:if test="${base.isMarried== '04'}">丧偶</c:if>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">子女状态
															</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: none; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	<c:if test="${base.isChild == '01'}">有</c:if>
																	<c:if test="${base.isChild == '02'}">无</c:if>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">住宅属性</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	<c:if test="${base.houseType == '01'}">自用</c:if>
																	<c:if test="${base.houseType == '02'}">租用</c:if>
																	<c:if test="${base.houseType == '03'}">亲属楼宇</c:if>
																	<c:if test="${base.houseType == '04'}">集体宿舍</c:if>
																	<c:if test="${base.houseType == '05'}">其他</c:if>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12">车辆属性
															</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	<c:if test="${base.isCar == '01'}">有</c:if>
																	<c:if test="${base.isCar == '02'}">无</c:if>
																</div>
															</div>
														</div>
															<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">持有信用卡张数</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px;  margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${base.creditNum}</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">信用卡最大额度
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px;  margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${base.creditMax}</div>
														</div>
													</div>
												</div>
													<div class="form-group col-md-4 col-sm-4 col-xs-12">
														<div class="form-group"
															style="height: 260px; width: 100%; display: table; text-align: center;">
															<img src="${base.headImg}"
																onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'
																style="height: 260px;" />
														</div>
													</div>
													<div class="form-group col-xs-12">
														<div class="form-group">
															<label class="control-label col-md-1 col-sm-3 col-xs-12">居住地址
															</label>
															<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																	style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																	${base.addressDetail}</div>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>

									<!--紧急联系人-->

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">紧急联系人</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<table id="datatable-xiangqing"
													class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>姓名</th>
															<th>关系</th>
															<th>电话</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${contacts.contactName1}</td>
															<td><c:if test="${contacts.contactRelation1 == '1'}">父亲</c:if>
																<c:if test="${contacts.contactRelation1 == '2'}">母亲</c:if>
																<c:if test="${contacts.contactRelation1 == '3'}">子女</c:if>
																<c:if test="${contacts.contactRelation1 == '4'}">兄弟姐妹</c:if>
															</td>
															<td>${contacts.contactMobile1}</td>
														</tr>
														<tr>
															<td>${contacts.contactName2}</td>
															<td>
															<c:if test="${contacts.contactRelation2 == '1'}">父亲</c:if>
															<c:if test="${contacts.contactRelation2 == '2'}">母亲</c:if>
															<c:if test="${contacts.contactRelation2 == '3'}">子女</c:if>
															<c:if test="${contacts.contactRelation2 == '4'}">兄弟姐妹</c:if>
															</td>
															<td>${contacts.contactMobile2}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<!--工作信息-->

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">工作信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<form id="demo-form2" data-parsley-validate
													class="form-horizontal form-label-left">
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">公司名称</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${job.companyName}</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">单位行业
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
																<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																
																<c:if test="${job.pageline == '01'}">IT网络/计算机/通信</c:if>
																<c:if test="${job.pageline == '02'}">金融/银行/保险</c:if>
																<c:if test="${job.pageline == '03'}">文化/媒体</c:if>
																<c:if test="${job.pageline == '04'}">房地产/建筑</c:if>
																<c:if test="${job.pageline == '05'}">消费品</c:if>
																<c:if test="${job.pageline == '06'}">制造业</c:if>
																<c:if test="${job.pageline == '07'}">商业服务</c:if>
																<c:if test="${job.pageline == '08'}">交通/运输/物流</c:if>
																<c:if test="${job.pageline == '09'}">政府/非盈利机构</c:if>
																<c:if test="${job.pageline == '10'}">其他</c:if>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">单位性质
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${job.companyType == '01'}">国企</c:if>
																<c:if test="${job.companyType == '02'}">民营</c:if>
																<c:if test="${job.companyType == '03'}">合资</c:if>
																<c:if test="${job.companyType == '04'}">外商独资</c:if>
																<c:if test="${job.companyType == '05'}">股份制企业</c:if>
																<c:if test="${job.companyType == '06'}">上市公司</c:if>
																<c:if test="${job.companyType == '07'}">国家单位</c:if>
																<c:if test="${job.companyType == '08'}">事业单位</c:if>
																<c:if test="${job.companyType == '09'}">其他</c:if>
																<c:if test="${job.companyType == '10'}">社会团体</c:if>
																<c:if test="${job.companyType == '11'}">三资企业</c:if>
																<c:if test="${job.companyType == '12'}">私营</c:if>
																<c:if test="${job.companyType == '13'}">个体</c:if>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">职业状态</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${base.jobType == '01'}">在职</c:if>
																<c:if test="${base.jobType == '02'}">自雇人士</c:if>
																<c:if test="${base.jobType == '03'}">自由职业</c:if>
																<c:if test="${base.jobType == '04'}">学生</c:if>
																<c:if test="${base.jobType == '05'}">家庭主妇</c:if>
																<c:if test="${base.jobType == '06'}">退休人士</c:if>
																<c:if test="${base.jobType == '07'}">失业人士</c:if>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">岗位级别
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${job.jobType=='01'}">高层及以上</c:if>
																<c:if test="${job.jobType=='02'}">中层管理</c:if>
																<c:if test="${job.jobType=='03'}">基层员工</c:if>
																<c:if test="${job.jobType=='04'}">实习、兼职</c:if>
																<c:if test="${job.jobType=='05'}">自主经营</c:if>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">薪资收入
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${job.incomeSum=='01'}">≤3000</c:if>
																<c:if test="${job.incomeSum=='02'}">3000-5000</c:if>
																<c:if test="${job.incomeSum=='03'}">5000-10000</c:if>
																<c:if test="${job.incomeSum=='04'}">10000-30000</c:if>
																<c:if test="${job.incomeSum=='05'}"> >30000</c:if>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">工作年限</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${job.workAges=='01'}">≤1年</c:if>
																<c:if test="${job.workAges=='02'}">2-5</c:if>
																<c:if test="${job.workAges=='03'}">6-10</c:if>
																<c:if test="${job.workAges=='04'}">>10</c:if>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">公司电话
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${job.companyPhone}</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-4 col-xs-12 form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">公司地址
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${job.companyAddress}</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>

									<!--图片信息-->

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">图片信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="col-md-4 col-sm-4 col-xs-12 form-group"
													style="float: right;">

													<c:choose>
														<c:when test="${buttonStatus.status == '201'}">
															<button type="button" class="btn btn-primary"
																style="float: right;">补充材料中</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn btn-primary"
																style="float: right;" id="material">补充材料</button>
														</c:otherwise>
													</c:choose>

													<label class="btn btn-primary btn-upload" for="inputImage"
														style="float: right;"> <input type="file"
														class="sr-only" id="inputImage" name="file"
														accept="image/*" onchange="imgChange()"> <span
														style="color: #ffffff;" id="picture"> 上传图片 </span>
													</label>
													<div class="modal fade bs-example-modal-lggggg"
														tabindex="-1" role="dialog" aria-hidden="true">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">

																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal" aria-hidden="true">×</button>
																	<h4 class="modal-title" id="myModalLabel">发送补充材料通知</h4>
																</div>
																<div class="modal-body">
																	<div id="testmodal" style="padding: 5px 20px;">
																		<form id="antoform" class="form-horizontal calender"
																			role="form">
																			<div class="form-group">
																				<div class="col-xs-12">
																					<textarea class="form-control"
																						style="height: 100px;" id="messageID" name="descr"></textarea>
																				</div>
																			</div>
																		</form>
																	</div>
																</div>
																<div class="modal-footer" style="text-align: center;">
																	<button type="button" class="btn btn-success antoclose"
																		data-dismiss="modal" onclick="updatePicModal();">发送</button>
																	<button type="button"
																		class="btn btn-primary antosubmit"
																		data-dismiss="modal" style="margin-top: 10px;">取消</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>

											<div class="x_content">
												<form action="mfq/order/updatePicModal.do" method="post"
													id="updatePicModalID">
													<input type="hidden" name="orderDataId"
														value="${orderData.id}" /> <input type="hidden"
														name="userDateId" value="${userData.id}" /> <input
														type="hidden" name="picTypes" value="" id="picTypesID" />
													<input type="hidden" name="orderId" value="${order.id}" />
													<input type="hidden" name="message" id="message_Id" />
													<div class="form-group" style="margin: auto;"
														id="picture_information">
														<ul class="my-gallery" id="jq22">
															<c:if test="${userData.cardFace != null}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img id="image_img"
																				style="width: 150%; display: block;"
																				src="${userUrl}${userData.cardFace}" alt="图片1" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="1" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">身份证正面 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if test="${userData.cardBack != null}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${userUrl}${userData.cardBack}" alt="图片2" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="2" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">身份证反面 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<%-- <c:if test="${userData.bankCard != null}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${userUrl}${userData.bankCard}" alt="图片3" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="3" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">银行卡 </span>
																		</div>
																	</div>
																</li>
															</c:if> --%>
															<c:if test="${userData.moreCard != null}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${userUrl}${userData.moreCard}" alt="图片4" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="4" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">手持身份证 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${userData.alipayCard != null && userData.alipayCard != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${userUrl}${userData.alipayCard}" alt="图片5" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="5" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">支付宝个人主页
																			</span>
																		</div>
																	</div>
																</li>
															</c:if>

															<c:if
																test="${orderData.pic1 != null && orderData.pic1 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${orderData.pic1}" alt="图片6" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="6" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">医院诊疗单 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${orderData.pic2 != null && orderData.pic2 != ''}">

																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${orderData.pic2}" alt="图片7" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="7" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">医院半身照 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<%-- <c:if test="${orderData.pic3 != null && orderData.pic3 != ''}">
													    <li class="col-md-55">
								                    		<div class="thumbnail">
								                    			<div class="image view view-first">
								                            		<img style="width: 150%; display: block;" src="${orderUrl}${orderData.pic3}" alt="图片7" />
								                          	    </div>
								                          	    <div class="caption" style="text-align: center;  display: none;"
																id="checkbox">
								                          		<input type="checkbox" name="picType" id="hobby1"
																	value="8" data-parsley-mincheck="2" required
																	class="flat" /> <span class="color">支付宝账号管理
																</span>
								                          	    </div>
								                        	</div>
								                		</li>
													</c:if> --%>

															<c:if
																test="${auxiliartData.auxiliaryPic1 != null && auxiliartData.auxiliaryPic1 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic1}"
																				alt="图片8" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="8" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片1 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic2 != null && auxiliartData.auxiliaryPic2 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic2}"
																				alt="图片9" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="9" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片2 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic3 != null && auxiliartData.auxiliaryPic3 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic3}"
																				alt="图片10" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="10" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片3 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic4 != null && auxiliartData.auxiliaryPic4 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic4}"
																				alt="图片11" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="11" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片4 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic5 != null && auxiliartData.auxiliaryPic5 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic5}"
																				alt="图片12" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="12" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片5 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic6 != null && auxiliartData.auxiliaryPic6 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic6}"
																				alt="图片13" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="13" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片6 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic7 != null && auxiliartData.auxiliaryPic7 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic7}"
																				alt="图片14" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="14" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片7 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic8 != null && auxiliartData.auxiliaryPic8 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic8}"
																				alt="图片15" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="15" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片8 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic9 != null && auxiliartData.auxiliaryPic9 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic9}"
																				alt="图片16" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="16" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片9 </span>
																		</div>
																	</div>
																</li>
															</c:if>
															<c:if
																test="${auxiliartData.auxiliaryPic10 != null && auxiliartData.auxiliaryPic10 != ''}">
																<li class="col-md-55">
																	<div class="thumbnail">
																		<div class="image view view-first">
																			<img style="width: 150%; display: block;"
																				src="${orderUrl}${auxiliartData.auxiliaryPic10}"
																				alt="图片17" />
																		</div>
																		<div class="caption"
																			style="text-align: center; display: none;"
																			id="checkbox">
																			<input type="checkbox" name="picType" id="hobby1"
																				value="17" data-parsley-mincheck="2" required
																				class="flat" /> <span class="color">辅助图片10 </span>
																		</div>
																	</div>
																</li>
															</c:if>

															<c:if test="${morePic != null && morePic != ''}">
																<c:forEach items="${morePic}" var="i">
																	<li class="col-md-55">
																		<div class="thumbnail">
																			<div class="image view view-first">
																				<img style="width: 150%; display: block;"
																					src="${orderUrl}${i}" alt="后台上传图片" />
																			</div>
																		</div>
																	</li>
																</c:forEach>
															</c:if>
														</ul>
													</div>
												</form>
											</div>
										</div>
									</div>


									<!--风险及信用分析-->

									<div class="col-md-6 col-sm-6 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">风险及信用分析</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content" style="padding-bottom: 5px;">
												<div class="col-md-6 col-sm-6 col-xs-12"
													style="text-align: center;">
													<canvas class="canvasDoughnut" height="110" width="110"></canvas>
													<h3 class="name_title" style="font-size: 16px;">芝麻信用--反欺诈信息：</h3>
													<p style="font-size: 50px; color: #438CB7;">${order.ivsScore== null ? '0':order.ivsScore}<small
															style="font-size: 16px; color: #809396;">分 <c:if
																test="${order.ivsScore >= 70 &&  order.ivsScore <= 100}">(低风险)</c:if>
															<c:if
																test="${order.ivsScore >= 40 &&  order.ivsScore <= 70}">(中风险)</c:if>
															<c:if
																test="${order.ivsScore >= 0 &&  order.ivsScore <= 40}">(高风险)</c:if>
															<c:if test="${order.ivsScore  == null}">(高风险)</c:if>
														</small>
													</p>
												</div>
												<div class="col-md-6 col-sm-6 col-xs-12"
													style="text-align: center;">
													<canvas class="canvasDoughnut" height="110" width="110"></canvas>
													<h3 class="name_title" style="font-size: 16px;">芝麻信用--评分：</h3>
													<p style="font-size: 50px; color: #438CB7;">${order.zmScore == null ? '0':order.zmScore}<small
															style="font-size: 16px; color: #809396;">分</small>
													</p>
												</div>
											</div>
										</div>
									</div>


									<!--第三方数据-->

									<div class="col-md-6 col-sm-6 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">第三方数据</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<p>个人风险报告</p>

												<button class="btn btn-success source"
													style="padding: 6px 19px; border: 0;"
													onclick="showPengYuan('${order.id}',2)">鹏元交易</button>

												<button class="btn btn-success source"
													style="padding: 6px 19px; border: 0;"
													onclick="showPengYuan('${order.id}',4)">鹏元风险</button>

												<button class="btn btn-success source"
													style="padding: 6px 19px; border: 0;"
													onclick="window.open('${pageContext.request.contextPath}/mfq/report/reportPersonTongdun.do?orderId=${order.id}')">同盾风险</button>

												<button class="btn btn-success source"
													style="padding: 6px 19px; border: 0;"
													onclick="window.open('${pageContext.request.contextPath}/mfq/report/getBlackList.do?orderId=${order.id}')">数美逾期</button>

												<hr />
												<p>运营商报告</p>

												<button class="btn btn-success source"
													style="background: #5bc0de; border: 0;"
													onclick="window.open('${pageContext.request.contextPath}/mfq/report/reportData.do?orderId=${order.id}&mobile=${base.mobileNumber}')">聚信立报告</button>

												<button class="btn btn-success source"
													style="background: #5bc0de; padding: 6px 19px; border: 0;"
													onclick="showMoXie('${order.id}')">魔蝎报告</button>

												<button class="btn btn-success source"
													style="background: #5bc0de; padding: 6px 19px; border: 0;"
													onclick="window.open('${pageContext.request.contextPath}/mfq/report/tongDunReport.do?orderId=${order.id}')">同盾报告</button>

												<hr />
												<p>电商报告</p>

												<button class="btn btn-default source"
													style="background: #f0ad4e; color: #ffffff; padding: 6px 19px; border: 0;"
													onclick="window.open('${pageContext.request.contextPath}/mfq/report/getTaobaoReport.do?userId=${order.customerId}')">淘宝报告</button>

												<button class="btn btn-default source"
													style="background: #f0ad4e; color: #ffffff; border: 0;"
													onclick="window.open('${pageContext.request.contextPath}/mfq/report/getAlipayReport.do?userId=${order.customerId}')">支付宝报告</button>

												<hr />
											</div>
										</div>
									</div>

									<!--合同信息-->
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">合同信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="col-md-4 col-sm-4 col-xs-12 form-group"
													style="float: right;"></div>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<form id="demo-form2" data-parsley-validate
													class="form-horizontal form-label-left">
													<c:forEach items="${orderContract}" var="i">
														<div class="form-group col-md-6 col-sm-6 col-xs-12"
															style="margin-bottom: 20px;">
															<div class="form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12">放款机构</label>
																<div class="col-md-9 col-sm-9 col-xs-12">
																	<div class="ln_solid"
																		style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																		${i.lenderName}</div>
																</div>
															</div>
															<div class="form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12">合同编号</label>
																<div class="col-md-9 col-sm-9 col-xs-12">
																	<c:if test="${i.submitStatus=='TRUE'}">
																		<div class="ln_solid"
																			style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																			${i.contractNo}
																			<!-- <button type="button" class="btn btn-primary"
																			style="float: right; padding: 0;color:#26b99a;background:#ffffff;border:0;"> -->
																			<a class="btn btn-primary" target="_blank"
																				href="${i.viewUrl}"
																				style="padding: 0; color: #26b99a; background: #ffffff; border: 0; float: right;">查看</a>
																			<a class="btn btn-primary" id="download"
																				href="${i.downloanUrl}" download="cropped.png"
																				style="float: right; padding: 0; color: #26b99a; background: #ffffff; border: 0;">下载</a>
																		</div>
																	</c:if>
																	<c:if test="${i.submitStatus=='FALSE'}">
																		<div class="ln_solid"
																			style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: red; font-size: 14px; margin-bottom: 10px;">
																			${i.contractNo}
																			<button type="button" class="btn btn-primary"
																				style="padding: 0; float: right; background: #337ab7; border: 0;">
																				<div style="color: #FFFFFF;"
																					onclick="againLoan('${i.contractId}')">生成</div>
																			</button>
																		</div>
																	</c:if>
																</div>
															</div>
															<div class="form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12">签署状态
																</label>
																<div class="col-md-9 col-sm-9 col-xs-12">
																	<div class="ln_solid"
																		style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																		<c:if test="${i.signStatus=='1'}">签署成功</c:if>
																		<c:if test="${i.signStatus=='2'}">签署失败</c:if>
																		<c:if test="${i.signStatus=='4'}">待签署</c:if>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12">签署时间
																</label>
																<div class="col-md-9 col-sm-9 col-xs-12">
																	<div class="ln_solid"
																		style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																		<c:if test="${i.signStatus=='1'}">${i.updateTime}</c:if>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</form>
											</div>
										</div>
									</div>
									<!--审核记录-->
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">审核记录</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<table id="datatable-zhenhe"
													class="table table-striped table-bordered">
													<thead>
														<tr>
															<th style="width: 25%;">操作人</th>
															<th style="width: 25%;">审核状态</th>
															<th style="width: 25%;">操作时间</th>
															<th style="width: 25%;">备注</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${orderCheckLog}" var="i">
															<tr>
																<td>${i.operator}</td>
																<td><c:if test="${i.checkStatus=='201'}">补充材料中</c:if>
																	<c:if test="${i.checkStatus=='202'}">补充材料完成</c:if> <c:if
																		test="${i.checkStatus=='203'}">降额中</c:if> <c:if
																		test="${i.checkStatus=='204'}">用户同意降额</c:if> <c:if
																		test="${i.checkStatus=='205'}">用户拒绝降额</c:if> <c:if
																		test="${i.checkStatus=='206'}">补充报告中</c:if> <c:if
																		test="${i.checkStatus=='207'}">补充报告失败</c:if> <c:if
																		test="${i.checkStatus=='208'}">补充报告成功</c:if> <c:if
																		test="${i.checkStatus=='307'}">生成合同</c:if> <c:if
																		test="${i.checkStatus=='301'}">审核通过</c:if> <c:if
																		test="${i.checkStatus=='06'}">已放款</c:if> <c:if
																		test="${i.checkStatus=='07'}">已放款</c:if> <c:if
																		test="${i.checkStatus=='309'}">测试订单</c:if> <c:if
																		test="${i.checkStatus=='310'}">订单关闭</c:if> <c:if
																		test="${i.checkStatus=='313'}">替换订单</c:if> <c:if
																		test="${i.checkStatus=='04'}">初审通过</c:if> <c:if
																		test="${i.checkStatus=='304'}">审核拒绝</c:if> <c:if
																		test="${i.checkStatus=='311'}">用户取消</c:if></td>
																<td>${i.createTime}</td>
																<td>${i.remark}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<!--备注信息-->

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_panel">
											<div class="x_title">
												<h2 style="line-height: 1; font-size: 18px;">备注信息</h2>
												<ul class="nav navbar-right panel_toolbox">
													<li><a class="collapse-link"><i
															class="fa fa-chevron-up"></i></a></li>
												</ul>
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target=".bs-example-modal-lg"
													style="float: right;">添加</button>

												<div class="modal fade bs-example-modal-lg" tabindex="-1"
													role="dialog" aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">

															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">×</button>
																<h4 class="modal-title" id="myModalLabel">备注</h4>
															</div>
															<div class="modal-body">
																<div id="testmodal" style="padding: 5px 20px;">
																	<form id="antoform" class="form-horizontal calender"
																		role="form">
																		<div class="form-group">
																			<div class="col-xs-12">
																				<textarea class="form-control"
																					style="height: 100px;" id="addRemarkDes"
																					name="descr"></textarea>
																			</div>
																		</div>
																	</form>
																</div>
															</div>
															<div class="modal-footer" style="text-align: center;">
																<button type="button" class="btn btn-success antoclose"
																	data-dismiss="modal" onclick="addRemark()">保存</button>
																<button type="button" class="btn btn-primary antosubmit"
																	data-dismiss="modal">取消</button>
															</div>
														</div>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="x_content">
												<table id="datatable-beizhu"
													class="table table-striped table-bordered">
													<thead>
														<tr>
															<th style="width: 33.33%;">时间</th>
															<th style="width: 33.33%;">信息</th>
															<th>添加人</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${orderRemark}" var="i">
															<tr>
																<td>${i.createTime}</td>
																<td>${i.remark}</td>
																<td>${i.operator}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>


									<!--订单按钮-->
									<div class="col-md-12 col-sm-12 col-xs-12"
										style="text-align: center;">
										<c:if test="${display == 'TRUE'}">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target=".bs-example-modal-lgg"
												id="clos">订单关闭</button>
										</c:if>
										<div class="modal fade bs-example-modal-lgg" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel"
															style="float: left;">订单关闭</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<form id="antoform" class="form-horizontal calender"
																role="form">
																<div class="form-group">
																	<div class="col-xs-12">
																		<textarea class="form-control" style="height: 100px;"
																			id="closDesc" name="descr"></textarea>
																	</div>
																</div>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<button type="button" class="btn btn-success antoclose"
															data-dismiss="modal" onclick="operatorOrder(1,'310')">确认</button>
														<button type="button" class="btn btn-primary antosubmit"
															data-dismiss="modal">取消</button>
													</div>
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target=".bs-example-modal-lggg"
											id="test">测试订单</button>

										<div class="modal fade bs-example-modal-lggg" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel"
															style="float: left;">测试订单</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<form id="antoform" class="form-horizontal calender"
																role="form">
																<div class="form-group">
																	<div class="col-xs-12">
																		<textarea class="form-control" style="height: 100px;"
																			id="testDesc" name="descr"></textarea>
																	</div>
																</div>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<button type="button" class="btn btn-success antoclose"
															data-dismiss="modal" onclick="operatorOrder(2,'309')">确认</button>
														<button type="button" class="btn btn-primary antosubmit"
															data-dismiss="modal">取消</button>
													</div>
												</div>
											</div>
										</div>
										<c:if test="${display == 'TRUE'}">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target=".bs-example-modal-lgggg"
												id="repc">替换订单</button>
										</c:if>
										<div class="modal fade bs-example-modal-lgggg" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel"
															style="float: left;">替换订单</h4>
													</div>
													<div class="modal-body">
														<div id="testmodal" style="padding: 5px 20px;">
															<form id="antoform" class="form-horizontal calender"
																role="form">
																<div class="form-group">
																	<div class="col-xs-12">
																		<textarea class="form-control" style="height: 100px;"
																			id="repcDesc" name="descr"></textarea>
																	</div>
																</div>
															</form>
														</div>
													</div>
													<div class="modal-footer" style="text-align: center;">
														<button type="button" class="btn btn-success antoclose"
															data-dismiss="modal" onclick="operatorOrder(3,'313')">确认</button>
														<button type="button" class="btn btn-primary antosubmit"
															data-dismiss="modal">取消</button>
													</div>
												</div>
											</div>
										</div>
										<!-- <button type="button" class="btn btn-primary" onclick="findLongloanStatus();">查询龙信借款状态</button>
										<button type="button" class="btn btn-primary" onclick="longloanCallBack();">回调接口测试</button>
										<button type="button" class="btn btn-primary" onclick="loanContract();">查看民盛合同</button> -->
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- footer --%>
	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<%-- photoswipeTemplate --%>
	<%@ include file="/WEB-INF/common/photoswipe_template.jsp"%>
	<%-- resource js --%>
	<%@ include file="/WEB-INF/common/resource_js.jsp"%>

	<script type="text/javascript">
		//修改风控银行卡
		function editBack() {

			var moable = $("#editBack input[name='moable']").val()
			if (!strCheck(moable) || moable.length != 11) {
				$.confirm({
					title : '系统提示',
					text : "电话输入格式错误",
					confirmButton : '确认',
					cancelButton : false,
					confirm : function(button) {
						location.reload(true);
					}
				});
				return;
			}
			var bankNo = $("#editBack input[name='bankNo']").val()
			if (!strCheck(bankNo)) {
				$.confirm({
					title : '系统提示',
					text : "银行卡号输入格式错误",
					confirmButton : '确认',
					cancelButton : false,
					confirm : function(button) {
						location.reload(true);
					}
				});
				return;
			}

			var form = new FormData(document.getElementById("editBack"));
			$
					.ajax({
						url : "${pageContext.request.contextPath}/mfq/order/editBackRiskManagement.do",
						type : "post",
						data : form,
						processData : false,
						contentType : false,
						success : function(obj) {
							var data = jQuery.parseJSON(obj);
							if (data.code == 0) {
								$.confirm({
									title : '系统提示',
									text : "添加失败!",
									confirmButton : '确认',
									cancelButton : false,
									confirm : function(button) {
										location.reload(true);
									}
								});
							} else if (data.code == -1) {
								$.confirm({
									title : '系统提示',
									text : "校验不匹配!",
									confirmButton : '确认',
									cancelButton : false,
									confirm : function(button) {
										location.reload(true);
									}
								});
							} else {
								$.confirm({
									title : '系统提示',
									text : "修改成功!",
									confirmButton : '确认',
									cancelButton : false,
									confirm : function(button) {
										location.reload(true);
									}
								});
							}

						},
						error : function(e) {
							location.reload();
						}
					});
		}

		// 测试回调接口
		function longloanCallBack() {
			//var orderId = "96718e49833e4d75a288062d094fb0ec1516778806753";
			var orderId = $("#orderId").val();
			var params;
			params = {
				transNo : "1",
				loanOrderId : "2",
				callbackType : "2",
				paymentTime : "3",
				dealStatus : "4",
				remark : "测试",
				ext : "保留",
			}
			// var url = "${pageContext.request.contextPath}/mfq/longloan/callback.do";
			var url = "http://www.mfq100.com/mfq-boss/mfq/longloan/callback.do"; // 新框架测试
			$.ajax({
				type : "POST",
				url : url,
				// data:params,
				data : JSON.stringify(params),
				dataType : "json",
				success : function(result) {
					if (result.code == '1') { // 借款成功
						$.confirm({
							title : '系统提示',
							text : "222",
							confirmButton : '确认',
							cancelButton : false,
							confirm : function(button) {
								window.location.href = document.referrer; // 返回到上一个页面
							}
						});
					}
				}
			});
		}

		// 跳转到民盛合同地址
		function loanContract() {
			var orderId = $("#orderId").val();
			//var orderId = "96718e49833e4d75a288062d094fb0ec1516778806753";
			var params;
			params = {
				orderId : orderId,
			}
			var url = "${pageContext.request.contextPath}/mfq/longloan/loanContract.do";
			$.ajax({
				type : "POST",
				url : url,
				data : params,
				dataType : "json",
				success : function(result) {
					// {"code":"0000","message":"成功响应","data":{"contracts":{"1000":"这块是URL字符串"}}}
					var json = JSON.parse(result); // JSON.stringify()
					// console.log(json.data.contracts['1000']);
					var msg = json.message;
					if (json.data == null || json.data == '') {
						alert(1);
						if (json.code == '9999') {
							$.confirm({
								title : '系统提示',
								text : msg,
								confirmButton : '确认',
								cancelButton : false,
								confirm : function(button) {
									window.location.href = document.referrer; // 返回到上一个页面
								}
							});
						}
					} else if (json.code == '0000') {
						var contracts = json.data.contracts;
						var longLoanUrl = contracts['1000'];
						if (longLoanUrl != '' || longLoanUrl != null) { // 借款成功
							window.location.href = longLoanUrl; // 跳转到民盛合同地址
							/* $.confirm({
								title : '系统提示',
								text : "成功获取，请点击确认",
								confirmButton : '确认',
								cancelButton : false,
								confirm: function(button) {
									window.location.href = longLoanUrl; // 跳转到民盛合同地址
								}
							}); */
						}
					}

				}
			});
		}
		// 查询龙信借款状态
		function findLongloanStatus() {
			var orderId = $("#orderId").val();
			//var orderId = "96718e49833e4d75a288062d094fb0ec1516778806753";
			var params;
			params = {
				orderId : orderId,
			}
			var url = "${pageContext.request.contextPath}/mfq/longloan/findLongloanStatus.do";
			$.ajax({
				type : "POST",
				url : url,
				data : params,
				dataType : "json",
				success : function(result) {
					var json = JSON.parse(result); // JSON.stringify()
					// 	console.log(json);//{"code":"1001","message":"借款已存在，请勿重复提交","data":null}
					var msg = json.message;
					if (json.code == '0000') { // 借款成功
						$.confirm({
							title : '系统提示',
							text : msg,
							confirmButton : '确认',
							cancelButton : false,
							confirm : function(button) {
								window.location.href = document.referrer; // 返回到上一个页面
							}
						});
					}
				}
			});
		}

		var clieckeds = 0;
		function againLoan(contractId) {

			var orderId = $("#orderId").val();
			var params;
			var url = "${pageContext.request.contextPath}/mfq/order/againLoan.do";

			clieckeds += 1;
			if (clieckeds > 1) {
				$.confirm({
					title : '系统提示',
					text : '请勿重复提交',
					confirmButton : '确认',
					cancelButton : false,
				});
				return false;
			}
			params = {
				orderId : orderId,
				contractId : contractId,
			}

			$.ajax({
				type : "POST",
				url : url,
				data : params,
				dataType : "json",
				success : function(data) {
					var json = data;
					var message = '';
					if (json.code == '0') {
						message = "合同生成成功";
						$.confirm({
							title : '系统提示',
							text : message,
							confirmButton : '确认',
							cancelButton : false,
							confirm : function(button) {
								location.reload(true);
							}
						});
					} else if (json.code == '1') {
						message = "请重新登录";
						$.confirm({
							title : '系统提示',
							text : message,
							confirmButton : '确认',
							cancelButton : false,
						});
					} else if (json.code == '2') {
						message = "法大大出错了";
						$.confirm({
							title : '系统提示',
							text : message,
							confirmButton : '确认',
							cancelButton : false,
						});
					} else {
						message = "操作失败";
						$.confirm({
							title : '系统提示',
							text : message,
							confirmButton : '确认',
							cancelButton : false,
						});
					}
				}
			});
		}

		function addRemark() {
			var orderId = $("#orderId").val();
			var params;
			var url = "${pageContext.request.contextPath}/mfq/order/addRemark.do";
			//通过 ，拒绝可担保，拒绝不可担保订单
			var ckRemark = $("#addRemarkDes").val();
			if (ckRemark == '' || $.trim(ckRemark) == '') {
				$.confirm({
					title : '系统提示',
					text : "请填写备注信息",
					confirmButton : '确认',
					cancelButton : false,
				});
				return false;
			}
			params = {
				orderId : orderId,
				ckRemark : ckRemark,
			}

			$.ajax({
				type : "POST",
				url : url,
				data : params,
				dataType : "json",
				success : function(data) {
					var json = data;
					if (json.code == '0') {
						$.confirm({
							title : '系统提示',
							text : "操作成功",
							confirmButton : '确认',
							cancelButton : false,
							confirm : function(button) {
								location.reload(true);
							}
						});
					} else if (json.code == '1') {
						$.confirm({
							title : '系统提示',
							text : "请重新登录",
							confirmButton : '确认',
							cancelButton : false,
						});
					} else {
						$.confirm({
							title : '系统提示',
							text : "操作失败",
							confirmButton : '确认',
							cancelButton : false,
						});
					}
				}
			});
		}

		var cliecked = 0;
		function operatorOrder(type, status) {
			var orderId = $("#orderId").val();
			var orderStatus = status;
			var params;
			//closDesc 关闭订单  testDesc 测试订单  repcDesc替换订单 
			var url = "${pageContext.request.contextPath}/mfq/order/orderCheck.do";
			//测试、关闭、替换订单
			var ckRemark;
			if (type == 1) {
				ckRemark = $("#closDesc").val();
			} else if (type == 2) {
				ckRemark = $("#testDesc").val();
			} else if (type == 3) {
				ckRemark = $("#repcDesc").val();
			}
			if (ckRemark == '' || $.trim(ckRemark) == '') {
				$.confirm({
					title : '系统提示',
					text : '请填审核意见',
					confirmButton : '确认',
					cancelButton : false,
				});
				return false;
			}
			cliecked += 1;
			if (cliecked > 1) {
				$.confirm({
					title : '系统提示',
					text : '请勿重复提交',
					confirmButton : '确认',
					cancelButton : false,
				});
				return false;
			}
			params = {
				orderId : orderId,
				status : orderStatus,
				ckRemark : ckRemark
			}

			$.ajax({
				type : "POST",
				url : url,
				data : params,
				dataType : "json",
				success : function(data) {
					var json = data;
					var message = '';
					if (json.code == '0') {
						$.confirm({
							title : '系统提示',
							text : "操作成功",
							confirmButton : '确认',
							cancelButton : false,
							confirm : function(button) {
								window.location.href = document.referrer;
							}
						});
					} else if (json.code == '1') {
						message = "请重新登录";
					} else {
						message = "操作失败";
					}
					$.confirm({
						title : '系统提示',
						text : message,
						confirmButton : '确认',
						cancelButton : false,
					});
				}
			});
		}

		// 查看魔蝎报告
		function showMoXie(i) {
			var path = "${pageContext.request.contextPath}/mfq/report/selectMessage.do";
			var popup = window.open('about:blank', '_blank');
			$
					.ajax({
						type : "POST",
						url : path,
						data : {
							"id" : i
						},
						success : function(data) {
							if (data != null && data != " ") {
								var url = "https://tenant.51datakey.com/carrier/report_data?data="
										+ data;
								popup.location.href = url;
							} else {
								$.confirm({
									title : '系统提示',
									text : "报告参数错误!",
									confirmButton : '确认',
									cancelButton : false,
								});
							}
						},
						error : function(res) {
							$.confirm({
								title : '系统提示',
								text : "报告获取失败!",
								confirmButton : '确认',
								cancelButton : false,
							});
						}
					});
		}
		// 鹏元报告
		function showPengYuan(orderId, refType) {
			var newTab = window.open("about:blank");
			var tokenNameId = $("#tokenNameId").attr("name");
			var tokenId = $("#tokenId").attr("name");
			var tokenName = $("#tokenNameId").val();
			var token = $("#tokenId").val();
			var params = {
				orderId : orderId,
				refType : refType
			}
			params["" + tokenNameId + ""] = tokenName;
			params["" + tokenId + ""] = token;
			$
					.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/mfq/report/reportPengYuan.do",
						data : params,
						success : function(data) {
							var json = jQuery.parseJSON(data);
							if (json.code == '1') {
								newTab.location.href = json.showPath;
							} else {
								$.confirm({
									title : '系统提示',
									text : json.errorMessage,
									confirmButton : '确认',
									cancelButton : false,
								});
							}
						}
					});
		}

		// 补充图片提交
		function updatePicModal() {
			var checked = $("input:checked");
			if (checked.length <= 0)
				return;
			// 去除空格
			var messageId = $("#messageID").val();
			var message = messageId.replace(/[\r\n\s]/g, "");
			$("#messageID").val(message);
			$("#message_Id").val(message);
			if ($("#messageID").val() == null
					|| $("#messageID").val().trim() == '') {
				alert("请填写补充图片子说明信息！");
				return;
			}
			var values = '';
			for (i = 0; i < checked.length; i++) {
				if (i < checked.length - 1) {
					values += checked[i].value + ',';
				} else {
					values += checked[i].value;
				}
			}
			$("#picTypesID").val(values);
			// 发送请求到后台
			$
					.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/mfq/order/updatePicModal.do",
						data : $("#updatePicModalID").serialize(),
						success : function(data) {
							if (data == 0) {
								$.confirm({
									title : '系统提示',
									text : "发送失败,请稍后重试!",
									confirmButton : '确认',
									cancelButton : false,
								});
							} else {
								$.confirm({
									title : '系统提示',
									text : data.msg,
									confirmButton : '确认',
									cancelButton : false,
								});
							}
							location.reload(true);
						},
						error : function(data) {
							$.confirm({
								title : '系统提示',
								text : "发送失败,请稍后重试!",
								confirmButton : '确认',
								cancelButton : false,
							});
							location.reload(true);
						}
					});
		}
		$(document)
				.ready(
						function() {
							// 图片点击事件
							$('#material')
									.click(
											function() {
												var change = $(this).text()
												if (change == '补充材料') {
													$(
															'#picture_information #checkbox')
															.css('display',
																	'block')
													$(
															'#picture_information #nopicture')
															.css('display',
																	'none')
													$(this).text('取消')
													$('#picture').text('确认')
													$('#inputImage')
															.attr(
																	{
																		'data-toggle' : "modal",
																		'data-target' : ".bs-example-modal-lggggg",
																		'type' : 'text'
																	})
												} else {
													$(
															'#picture_information #checkbox')
															.css('display',
																	'none')
													$(
															'#picture_information #nopicture')
															.css('display',
																	'block')
													$(this).text('补充材料')
													$('#picture').text('上传图片')
													$('#inputImage')
															.removeAttr(
																	'data-toggle')
													$('#inputImage')
															.removeAttr(
																	'data-target')
													$('#inputImage').attr(
															'type', 'file')
												}
											})

							// 上传图片弹框 补充材料图弹窗
							$('#picture')
									.click(
											function() {
												var changes = $(this).text()
												if (changes == '确认') {
													$('#inputImage')
															.attr(
																	{
																		'data-toggle' : "modal",
																		'data-target' : ".bs-example-modal-lggggg",
																		'type' : 'text'
																	})
												} else {
													$('#inputImage')
															.removeAttr(
																	'data-toggle')
													$('#inputImage')
															.removeAttr(
																	'data-target')
													$('#inputImage').attr(
															'type', 'file')
												}
											})
							// 二级弹出层事件
						});

		// 文件上传
		function imgChange() {
			var orderId = $("#orderId").val();
			var formData = new FormData();
			formData.append('file', $('#inputImage')[0].files[0]);
			formData.append('orderId', orderId);
			$
					.ajax(
							{
								url : '${pageContext.request.contextPath}/mfq/order/fileUpload.do',
								type : 'POST',
								cache : false,
								data : formData,
								processData : false,
								contentType : false
							}).done(function(res) {
						var data = jQuery.parseJSON(res);
						if (data.code == 0) {
							// 调用数据更新图片
							$.confirm({
								title : '系统提示',
								text : "上传成功",
								confirmButton : '确认',
								cancelButton : false,
								confirm : function(button) {
									location.reload(true);
								}
							});
						}
					}).fail(function(res) {
						$.confirm({
							title : '系统提示',
							text : "上传失败",
							confirmButton : '确认',
							cancelButton : false,
						});
					});
		}

		/* 获取图片的大小 */
		/*  $(document).ready(function(){
			$("#updatePicModalID img").each(function(i){
			    var img = $(this);
				var realWidth;
				var realHeight;
				$("<img/>").attr("src", $(img).attr("src")).load(function() {
				realWidth = this.width;
				realHeight = this.height;
				img.parent().parent().parent().parent().attr('data-size',realWidth+"x"+realHeight)
				console.log(img.parent().parent().parent().parent().attr('data-size',realWidth+"x"+realHeight))
				
		});
		});
		}); */

		$(document).ready(function() {
			var viewer = new Viewer(document.getElementById('jq22'), {
				url : 'data-original'
			});

		});
	</script>

</body>
</html>