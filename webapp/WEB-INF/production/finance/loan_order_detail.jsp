<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ include file="/WEB-INF/common/resource_jstl.jsp" %>--%>
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
	width: 25%;
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

.dasanjiao .after {
	z-index: 10;
	content: "";
	position: absolute;
	top: 0;
	left: 100%;
	border: 0 solid #FFFFFF;
	border-width: 55.5px 0 55.5px 30px;
	border-bottom-color: #29BB9C;
	border-top-color: #29BB9C;
}

.after:after {
	content: "";
	position: absolute;
	top: -55.5px;
	left: -34px;
	border: 0 solid #29BB9C;
	border-width: 55.5px 0 55.5px 30px;
	border-bottom-color: transparent;
	border-top-color: transparent;
}

h2 {
	font-size: 26px;
	line-height: 2;
	padding-right: 10px;
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

.dropdown-menu {
	min-width: 80px;
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
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="row title_left" style="width: 100%;">
					<div class="span6">
						<ul class="breadcrumb">
							<li>财务管理</li>
							<c:choose>
								<c:when test="${type == 00 }"><li>今日扣款订单</li></c:when>
								<c:otherwise><li>放款订单</li></c:otherwise>
							</c:choose>
							
							<li>订单详情</li>
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
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${order.orderNo}
																<c:if test="${order.splitNo != null && order.splitNo !=''}">
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
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${order.ext1}
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">进件来源
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
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
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${credit.surplusCredit == null ? 0:credit.surplusCredit}(已用)/${credit.credit == null ? 0:credit.credit}
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">担保方
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
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
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">担保金授信额度
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															 ${guarautee.surplusGuarauteeCredit == null? 0:guarautee.surplusGuarauteeCredit}（已用）/${guarautee.guarauteeCredit == null? 0:guarautee.guarauteeCredit}
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!--还款信息-->
								<div class="col-md-6 col-xs-12" style="margin-top: 10px;">
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
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															<c:choose>
                                                            <c:when test="${orderRepayment == null || orderRepayment == ''}">
                                                                ${order.finallySum}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${orderRepayment.repaymentPrincipal}
                                                            </c:otherwise>
                                                        </c:choose>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">还款金额
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															<c:choose>
                                                            <c:when test="${orderRepayment == null || orderRepayment == ''}">
                                                                ${order.ext3}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${orderRepayment.repaymentMoney}
                                                            </c:otherwise>
                                                        </c:choose>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">借款周期
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															<c:choose>
                                                            <c:when test="${orderRepayment == null || orderRepayment == ''}">
                                                                ${order.stageValue}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${orderRepayment.repaymentStage}
                                                            </c:otherwise>
                                                        </c:choose>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">还款日
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															<c:choose>
                                                            <c:when test="${orderRepaymentVO == null || orderRepaymentVO == ''}">
                                                                	尚无还款日
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${orderRepaymentVO.repaymentDay}日
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
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															<c:choose>
                                                            <c:when test="${orderRepayment == null || orderRepayment == ''}">
                                                                ${order.fqTotalSum}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${orderRepayment.repaymentInterestSum}
                                                            </c:otherwise>
                                                        </c:choose>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;"></div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>


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
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${base.realName}
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">性别</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																 ${idCard.gender}
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">年龄</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																 ${idCard.age}
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">电话号码</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${base.mobileNumber}
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">身份证</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${base.idNumber}
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">学历
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
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
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${base.isMarried== '01'}">已婚</c:if>
                                                            	<c:if test="${base.isMarried== '02'}">未婚</c:if>
                                                            	<%-- <c:if test="${base.isMarried== '03'}">离异</c:if>
                                                            	<c:if test="${base.isMarried== '04'}">丧偶</c:if>  --%>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">子女状态
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${base.isChild == '01'}">有</c:if>
                                                            	<c:if test="${base.isChild == '02'}">无</c:if>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">住宅属性</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
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
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																<c:if test="${base.isCar == '01'}">有</c:if>
                                                            	<c:if test="${base.isCar == '02'}">无</c:if>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">持有信用卡张数</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${bank.creditNum}
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3 col-sm-3 col-xs-12">信用卡最大额度
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${bank.creditMax}
															</div>
														</div>
													</div>
												</div>
												<div class="form-group col-md-4 col-sm-4 col-xs-12">
													<div class="form-group"
														style="height: 260px; width: 70%; border: 1px solid #EEEEEE; margin: auto;">
														<img
															src="${base.headImg}"
                                                         	onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'
															style="height: 260px; width: 100%;" />
													</div>
												</div>
												<div class="form-group col-xs-12">
													<div class="form-group">
														<label class="control-label col-md-1 col-sm-3 col-xs-12">居住地址
														</label>
														<div class="col-md-9 col-sm-9 col-xs-12">
															<div class="ln_solid"
																style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
																${base.addressDetail}
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>


								<!--还款周期列表-->

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="x_panel">
										<div class="x_title">
											<h2 style="line-height: 1; font-size: 18px;">还款周期列表</h2>
											<div class="form-group col-md-2 col-sm-2 col-xs-12"
												style="margin-top: 6px; margin-left: 10px;">
												<label class="control-label col-md-4 col-sm-4 col-xs-12"
													style="padding: 0;">在库金额 </label>
												<div class="col-md-7 col-sm-7 col-xs-12" style="padding: 0;">
													<div class="ln_solid"
														style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 20px; line-height: 20px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 0;" id="libraryMoney">
														
													</div>
												</div>
											</div>
											<ul class="nav navbar-right panel_toolbox">
												<li><a class="collapse-link"><i
														class="fa fa-chevron-up"></i></a></li>
											</ul>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<div class=" col-md-12 col-sm-12 col-xs-12">
												<table id="datatable_List"
													class="table table-striped table-bordered">
													<thead>
														<tr>
															 	<th>序号</th>
							                                    <th>还款日</th>
							                                    <th>在库金额</th>
							                                    <th>应收金额</th>
							                                    <th>月还金额</th>
							                                    <th>月还本金</th>
							                                    <th>月还利息</th>
							                                    <th>逾期天数</th>
							                                    <th>逾期罚息</th>
							                                    <th>违约金</th>
							                                    <th>尚欠金额</th>
							                                    <th>实收金额</th>
							                                    <th>实收本金</th>
							                                    <th>实收利息</th>
							                                    <th>实收罚息</th>
							                                    <th>实收违约金</th>
							                                    <th>提前还款/退款违约金</th>
							                                    <th>减免</th>
							                                    <th>多收</th>
							                                    <th>还款状态</th>
							                                    <th>操作</th>
														</tr>
													</thead>
													
												</table>
											</div>
										</div>
									</div>
								</div>

								<!-- 扣款记录模态窗 -->
								<div class="modal fade " tabindex="-1" id="payListModelId"
								     role="dialog" aria-hidden="true">
								    <div class="modal-dialog modal-lg">
								        <div class="modal-content">
								
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal"
								                        aria-hidden="true">×
								                </button>
								                <h4 class="modal-title">扣款记录</h4>
								            </div>
								            <div class="modal-body">
								                <div style="padding: 5px 20px;">
								                    <div class="form-group">
								                        <table class="table table-striped table-bordered" style="table-layout: fixed;">
								                            <thead>
								                            <tr>
								                                <th>扣款时间</th>
								                                <th>实际扣款金额</th>
								                                <th>扣款状态</th>
								                                <th>扣款源</th>
								                                <th>扣款方式</th>
								                                <th style="width:24%;">商户订单号</th>
								                                <th>操作人</th>
								                                <th>扣款信息</th>
								                            </tr>
								                            </thead>
								                            <tbody id="payListTbodyId"></tbody>
								                        </table>
								                    </div>
								                </div>
								            </div>
								        </div>
								    </div>
								</div>


								<!-- 消息模态框 -->
								<div class="modal fade " tabindex="-1" id="messageListModelId"
								     role="dialog" aria-hidden="true">
								    <div class="modal-dialog modal-lg">
								        <div class="modal-content">
								
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal"
								                        aria-hidden="true">×
								                </button>
								                <h4 class="modal-title">消息记录</h4>
								            </div>
								            <div class="modal-body">
								                <div style="padding: 5px 20px;">
								                    <div class="form-group">
								                        <table class="table table-striped table-bordered">
								                            <thead>
								                            <tr>
								                                <th>发送时间</th>
								                                <th>推送平台</th>
								                                <th>发送内容</th>
								                            </tr>
								                            </thead>
								                            <tbody id="messageListTbodyId"></tbody>
								                        </table>
								                    </div>
								                </div>
								            </div>
								        </div>
								    </div>
								</div>
								<!--放款机构-->

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="x_panel">
										<div class="x_title">
											<h2 style="line-height: 1; font-size: 18px;">放款机构</h2>
											<ul class="nav navbar-right panel_toolbox">
												<li><a class="collapse-link"><i
														class="fa fa-chevron-up"></i></a></li>
											</ul>
											<div class="clearfix"></div>
										</div>
										<c:forEach items="${orderContract}" var="i">
                                    <div class="col-md-6 col-sm-6 col-xs-12" style="/*border: 1px solid;border-radius: 15px;box-sizing: border-box;*/margin: 20px 0px;">
                                        <form  data-parsley-validate class="form-horizontal form-label-left">
                                            <div class=" form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">终审时间</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid" style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;text-align: center;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${orderStatus301}</div>
                                                </div>
                                            </div>
                                            <div class=" form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">分配资金方时间 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid" style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;text-align: center;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${orderStatus07}</div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">放款机构 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid" style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;text-align: center;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${i.lenderName}</div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">服务费率 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid" style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;text-align: center;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        
                                                        <c:if test="${i.profitType == '01'}">
                                                            ${i.flatRate}%
                                                        </c:if>
                                                        <c:if test="${i.profitType == '02'}">
                                                            <c:if test="${order.stageValue == 3}">
                                                                ${i.threePeriodRate}%
                                                            </c:if>
                                                            <c:if test="${order.stageValue == 6}">
                                                                ${i.sixPeriodRate}%
                                                            </c:if>
                                                            <c:if test="${order.stageValue == 9}">
                                                                ${i.ninePeriodRate}%
                                                            </c:if>
                                                            <c:if test="${order.stageValue == 12}">
                                                                ${i.twelvePeriodRate}%
                                                            </c:if>
                                                            <c:if test="${order.stageValue == 15}">
                                                                ${i.fifteenRate}%
                                                            </c:if>
                                                            <c:if test="${order.stageValue == 18}">
                                                                ${i.eighteenRate}%
                                                            </c:if>
                                                            <c:if test="${order.stageValue == 21}">
                                                                ${i.twentyOneRate}%
                                                            </c:if>
                                                            <c:if test="${order.stageValue == 24}">
                                                                ${i.twentyFourRate}%
                                                            </c:if>
                                                        </c:if>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    </c:forEach>
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
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${orderServices.storeName}
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">商户类型
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${orderServices.storeTypeName}
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">项目名称
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${orderServices.serviceName}
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">服务金额
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${orderServices.price}
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>

								<!--费率信息-->

								<div class="col-md-6 col-xs-12" style="margin-top: 10px;">
									<div class="x_panel">
										<div class="x_title">
											<h2 style="line-height: 1; font-size: 18px;">费率信息</h2>
											<ul class="nav navbar-right panel_toolbox">
												<li><a class="collapse-link"><i
														class="fa fa-chevron-up"></i></a></li>
											</ul>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<form class="form-horizontal form-label-left">

												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">使用费率</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															<c:choose>
                                                            <c:when test="${order.signRateType == 1}">
                                                                	商户费率
                                                            </c:when>
                                                            <c:when test="${order.signRateType == 2}">
                                                                	渠道费率
                                                            </c:when>
                                                            <c:otherwise>
                                                               	 商户费率
                                                            </c:otherwise>
                                                        </c:choose>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">用户费率
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${order.userRate}
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">商户费率
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${order.storeRate}
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">服务费承担方
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; text-align: center; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															${order.ext2}
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->
	<%-- resource js --%>
	<%@ include file="/WEB-INF/common/resource_js.jsp"%>
	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/dwr/interface/orderRepaymentDwr.js"></script>
	<script src="${pageContext.request.contextPath}/dwr/interface/debitDwr.js"></script>
	<script>
	// 初始化DataTables
    table = $('#datatable_List').dataTable({
		    autoWidth: false,  	// 禁用自动调整列宽
            scrollX: '100%',
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            paginate: false,		// 翻页功能
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            aoColumnDefs: [{"bSortable": false, "aTargets": [20]}],
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/repayment/repaymentDetailList.do',
        fnServerData: function (sSource, aoData, fnCallback) {
            // 组合晒选类型
            var repaymentId = '${repaymentId}';
            console.log(repaymentId+"==========================");
            // 往后台封装数据，json格式的字符串
            aoData.push({"name": "repaymentId", "value": repaymentId});
            $.ajax({
                type: 'GET',
                url: sSource,
                data: {"aoData": JSON.stringify(aoData)},
                dataType: 'json',
                success: function (rs) {
                	var orderRepaymentVO = rs.orderRepaymentVO;
    				var libraryMoney = orderRepaymentVO.repaymentMoney - orderRepaymentVO.actualMoneySum;
    				if (libraryMoney > 0) {
    					$('#libraryMoney').html(libraryMoney);
    				} else {
    					$('#libraryMoney').html('0.00');
    				} 
                    fnCallback(rs);
                }
            });
        },
        columns: [
            {
                "data": function (obj) {
                	//序号
                    return obj.repaymentStage;
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//还款日
                    return new Date(parseInt(obj.repaymentDate)).format('yyyy-MM-dd');
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//在库金额
              	  return parseFloat(obj.coffersMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//应收金额
                    return parseFloat(obj.repaymentMoney + obj.overdueMoney + obj.penaltyMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//月还金额
                    return parseFloat(obj.repaymentMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//月还本金
                    return parseFloat(obj.repaymentPrincipal).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//月还利息
                    return parseFloat(obj.repaymentInterest).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//逾期天数
                    return obj.overdueNo;
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//逾期罚息
                    return parseFloat(obj.overdueMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//违约金
                    return parseFloat(obj.penaltyMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                    if (obj.repaymentDetailType === 'ADV' || obj.repaymentDetailType === 'CANC') {
                        $('#advance').addClass('disabled').prop('disabled', true);
                        $('#cancel').addClass('disabled').prop('disabled', true);
                        return '0.00';
                    }
                    // 尚欠金额 = 应收金额 - 实收金额
                    var moneySum = parseFloat(obj.repaymentMoney + obj.overdueMoney + obj.penaltyMoney - obj.actualMoney).toFixed(2);
                    if (moneySum < 0) {
                        return '0.00';
                    } else {
                        return moneySum;
                    }
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
              	  console.log(obj.actualMoney+"实收金额");
                	//实收金额
                    return parseFloat(obj.actualMoney).toFixed(2);
                }
            },
            {
                "data": function (obj) {
                	//实收本金
                    return parseFloat(obj.actualPrincipal).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//实收利息
                    return parseFloat(obj.actualInterest).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//实收罚息
                    return parseFloat(obj.actualOverdueMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//实收违约金
                    return parseFloat(obj.actualPenaltyMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//提前还款/退款违约金
                    return parseFloat(obj.breachMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//减免
                    return parseFloat(obj.derateMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
                	//多收
                    return parseFloat(obj.overchargedMoney).toFixed(2);
                },"defaultContent": ""
            },
            {
                "data": function (obj) {
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
                        case '11':
                            detialRepaymentStatus = '提前还款';
                            break;
                        case '12':
                            detialRepaymentStatus = '用户退款';
                            break;
                    }
                    return detialRepaymentStatus;
                }
            },
            {
//                 "data": function (obj) {
//                     if (obj.repaymentStatus === '02') {
//                     }
//                     var str = '<div class="btn-group">'
//                         + '<button data-toggle="dropdown" class="btn btn-success dropdown-toggle btn-xs" type="button">'
//                         + '操作 <span class="caret"></span></button>'
//                         + '<ul role="menu" class="dropdown-menu">'
//                         + '<li><a href="javascript:void(0);" rel="">扣款记录</a></li>'
//                         + '<li><a href="javascript:void(0);" rel="">通知详情</a></li>'
//                         + '</ul></div>';
//                     return str;
                    
                    "data": function (obj) {
                        var manualStr = '';
                        var thirdStr = '';
                        var partStr = '';

                        var str = '<div class="btn-group">'
                            + '<button data-toggle="dropdown" class="btn btn-success dropdown-toggle btn-xs" type="button">'
                            + '操作 <span class="caret"></span></button>'
                            + '<ul role="menu" class="dropdown-menu">'
                            + manualStr
                            + thirdStr
                            + partStr
                            + '<li><a href="javascript:payList(\'' + obj.id + '\');" rel="">扣款记录</a></li>'
                            + '<li><a href="javascript:messageList(\'' + obj.id + '\');" rel="">通知详情</a></li>'
                            + '</ul></div>';
                        return str;
                }
            }
        ]
    });
    function payList(repaymentId) {
		 if (repaymentId == null || repaymentId == '') {
	            $.confirm({
	                title: '系统提示',
	                text: "信息有误,请刷新重试!",
	                confirmButton: '确认',
	                cancelButton: false,
	            });
	            return;
	        }
			  orderRepaymentDwr.findPayList(repaymentId,
	    	            {
	    	                callback: function (res) {
	    	                	console.log(res)
	    	                    var data = jQuery.parseJSON(res);
	    	                    var payListTbody = '';
	    	                    for (var i = 0; i < data.length; i++) {
	    	                        // 时间格式化
	    	                        var date = new Date(data[i].createTime);
	    	                        Y = date.getFullYear() + '-';
	    	                        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
	    	                        D = date.getDate() + ' ';
	    	                        h = date.getHours() + ':';
	    	                        m = date.getMinutes() + ':';
	    	                        s = date.getSeconds();
	    	                        var handleResult = data[i].chergeStatus; // 扣款状态 1 成功 2 失败 3 等待
	    	                        if (handleResult == "1") {
	    	                            handleResult = "成功";
	    	                        } else if (handleResult == "2") {
	    	                            handleResult = "失败";
	    	                        } else if (handleResult == "3") {
	    	                            handleResult = "等待";
	    	                        }
	    	                        var handleSource = data[i].chergeSource; // 扣款源
	    	                        if (handleSource == "1") {
	    	                            handleSource = '宝付';
	    	                        } else if (handleSource == "2") {
	    	                            handleSource = '其他';
	    	                        } else if (handleSource == "3") {
	    	                            handleSource = '先锋';
	    	                        } else if (handleSource == "4") {
	    	                            handleSource = '连连';
	    	                        } else if (handleSource == "5") {
	    	                            handleSource = '支付宝';
	    	                        } else if (handleSource == "6") {
	    	                            handleSource = '微信';
	    	                        } else if (handleSource == "7") {
	    	                            handleSource = '对公转账 -- 招商一般户';
	    	                        } else if (handleSource === "8") {
	    	                            handleSource = '对公转账 -- 法人卡转账';
	    	                        }
	    	                        var handleType = data[i].chergeWay;    // 扣款方式
	    	                        if (handleType == "1") {
	    	                            handleType = '手动扣款';
	    	                        } else if(handleType == "2"){
	    	                            handleType = '退款';
	    	                        } else if(handleType == "3"){
	    	                            handleType = '提前还款';
	    	                        } else if(handleType == "4"){
	    	                            handleType = '三方扣款';
	    	                        } else if(handleType == "5"){
	    	                            handleType = '部分还款';
	    	                        } else if(handleType == "6"){
	    	                            handleType = '宝付定时任务';
	    	                        } else if(handleType == "7"){
	    	                            handleType = '先锋定时任务';
	    	                        }
	    	                        var transSerialNo = data[i].thirdOrderNumber; // 交易流水号
	    	                        if (transSerialNo == null) {
	    	                            transSerialNo = "-";
	    	                        }                        
	    	                        var remarks = data[i].remarks; //备注
	    	                        if (remarks == null) {
	    	                        	remarks = "-";
	    	                        }
	    	                        var moneyA = data[i].actualMoney;
	    	                        if(moneyA==null){
	    	                        	moneyA = 0.00;
	    	                        }
	    	                        var moneyB = data[i].thirdpartyMoney;
	    	                        if(moneyB==null){
	    	                        	moneyB = 0.00;
	    	                        }
	    	                        //
	    	                        payListTbody = payListTbody + '<tr>'
	    	                            + '<th>' + Y + M + D + h + m + s + '</th>'
	    	                            + '<th>' + parseFloat(moneyA + moneyB).toFixed(2) + '</th>'
	    	                            + '<th>' +  handleResult + '</th>'
	    	                            + '<th>' + handleSource + '</th>'
	    	                            + '<th>' + handleType + '</th>'
	    	                            + '<th style="word-wrap: break-word;">' + transSerialNo + '</th>'
	    	                            + '<th>' + data[i].userName + '</th>'
	    	                            + '<th>' + remarks + '</th>'
	    	                            + '</tr>';
	    	                    }
	    	                    $("#payListTbodyId").html(payListTbody);
	    	                },
	    	                errorHandler: function (message) {
	    	                    $.confirm({
	    	                        title: "系统提示",
	    	                        text: "系统异常请稍后重试!",
	    	                        confirmButton: '关闭',
	    	                        cancelButton: false
	    	                    });
	    	                } 
	    	            })
	    	$("#payListModelId").modal("show");
		}
 // 消息详情
    function messageList(repaymentId) {
        if (repaymentId == null || repaymentId == '') {
            $.confirm({
                title: '系统提示',
                text: "信息有误,请刷新重试!",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        orderRepaymentDwr.findMessage(repaymentId,
            {
                callback: function (res) {
                    var data = jQuery.parseJSON(res);
                    console.log(data)
                    var messageListTbody = '';
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].sendtime);
                        Y = date.getFullYear() + '-';
                        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                        D = date.getDate() + ' ';
                        h = date.getHours() + ':';
                        m = date.getMinutes() + ':';
                        s = date.getSeconds();
                        var type = data[i].type;
                        var message = data[i].details;
                        if (type === 'app') {
                            type = "APP"
                        } else if (type === 'note') {
                            type = "短信"
                        } else if (type === 'wechat') {
                            type = "微信"
                            message = data[i].content;
                            ;
                        }
                        messageListTbody = messageListTbody + '<tr>'
                            + '<th>' + Y + M + D + h + m + s + '</th>'
                            + '<th>' + type + '</th>'
                            + '<th>' + message + '</th>'
                            + '</tr>';
                    }
                    $("#messageListTbodyId").html(messageListTbody);
                },
                errorHandler: function (message) {
                    $.confirm({
                        title: "系统提示",
                        text: "系统异常请稍后重试!",
                        confirmButton: '关闭',
                        cancelButton: false
                    });
                }
            }
        );
        $("#messageListModelId").modal("show");
    }
	</script>
</body>
</html>