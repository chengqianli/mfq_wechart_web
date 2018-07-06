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
    <style type="text/css">
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
                        <li><a href="#">全部订单</a></li>
                        <li class="active"><a href="#">订单详情</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <h2>贷后重构</h2>
        <h4>提前还款</h4>  
        <form action="${pageContext.request.contextPath}/mfq/DHrepayment/repaymentFront.do">
        <input name="repaymentID" value="${dhRepaymentDetailList[0].repaymentId }">还款计划ID
        <input name="detailID" value="${dhRepaymentDetailList[2].repaymentDetailId }">实际还款详细表ID
        <input name="userID" value = "${userId }">用户ID<br>
        <input name="thirdMoney">三方已收
        <select  name="debitSource" >
          	<option value="">请选择</option>
          	<option value="1">宝付</option>
           	<option value="3">先锋</option>
        	<option value="4">连连</option>
            <option value="5">支付宝</option>
            <option value="6">微信</option>
          	<option value="7">对公转账 -- 招商一般户</option>
            <option value="8">对公转账 -- 法人卡转账</option>
         	<option value="2">其他</option>
            </select>
        <input name = "debitMoney">扣款金额<br>
        <button>确定</button>
        </form>
        <div class="clearfix"></div>
        <!-- 订单信息 and 还款信息 -->
        <div class="row">
            <!-- 基本信息 -->
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">订单信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal form-label-left">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">订单编号</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">
                                        ${orderVO.orderNo }
                                        <c:if test="${orderVO.splitNo != null && orderVO.splitNo !=''}">
                                            <font style='color: #e74c3c'>&nbsp;&nbsp;[${orderVO.splitNo}]</font>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">创建时间</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">
                                        <fmt:formatDate value="${orderVO.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">进件来源</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline fontawesome-ahead">
                                        <c:if test="${orderVO.orderSource == '01'}"><i
                                                class="fa fa-wechat"></i>微信公众号</c:if>
                                        <c:if test="${orderVO.orderSource == '02'}"><i
                                                class="fa fa-mobile"></i>手机APP</c:if>
                                        <c:if test="${orderVO.orderSource == '03'}"><i
                                                class="fa fa-windows"></i>网页</c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">基础授信额度</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">
                                        <c:if test="${orderVO.credit == null}">
                                            （未初始授信额度）
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">担保方</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">
                                        <c:if test="${orderVO.auditParty == 1 }">渠道担保</c:if>
                                        <c:if test="${orderVO.auditParty == 2 }">商户担保</c:if>
                                        <c:if test="${orderVO.auditParty == 9 }">无担保方</c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">担保金授信额度</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /基本信息 -->
            <!-- 还款信息 -->
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">还款信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal form-label-left">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">借款总额</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderRepaymentVO.repaymentPrincipalSum }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">还款金额</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderRepaymentVO.repaymentMoney }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">借款周期</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderRepaymentVO.repaymentStage }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">还款日</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderRepaymentVO.repaymentDay }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">月还金额</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderRepaymentVO.repaymentMoney / orderRepaymentVO.repaymentStage }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /还款信息 -->
        </div>
        <!-- /订单信息 and 还款信息-->
        <div class="clearfix"></div>
        <!-- 还款周期列表 -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">还款周期列表</h2>
                        <input type="hidden" value="${lenderId }" id='longLoan'>
                        <h2 style="font-size:16px; line-height: 18px; margin-left: 50px;">
                            在库金额:${orderRepaymentVO.repaymentMoney - orderRepaymentVO.actualMoneySum }</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <c:choose>
                                <c:when test="${lenderId == null || lenderId == '' }">
                                    <li>
                                        <button type="button" class="btn btn-success btn-primary" id="advance">提前还款
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" class="btn btn-danger btn-primary" id="cancel">用户退款
                                        </button>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="table-responsive">
                            <table id="datatable_repayment_detail" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th>序号</th>
                                    <th>还款日</th>
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
        </div>
        <!-- /还款周期列表 -->
        <div class="clearfix"></div>
        <!-- 基本信息 -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">基本信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal form-label-left">
                            <!-- 文本信息 -->
                            <div class="form-group col-md-8 col-sm-8 col-xs-12">
                                <!-- 第一列 -->
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">姓名</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline"> ${userInfoDTO.base.realName }</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">性别</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline"> ${userInfoDTO.base.sex == null ? '（未知）': userInfoDTO.base.sex }</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">年龄</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline"> ${userInfoDTO.base.age == null ? '（未知）': userInfoDTO.base.age }</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">电话</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline"> ${userInfoDTO.base.mobileNumber }</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">身份证</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">${userInfoDTO.base.idNumber }</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">学历</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                <c:if test="${userInfoDTO.base.education == null }">
                                                    （未知）
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.education == '01' }">
                                                    研究生或以上
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.education == '02' }">
                                                    大学
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.education == '03' }">
                                                    大专
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.education == '04' }">
                                                    高中
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.education == '04' }">
                                                    初中及一下
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /第一列 -->
                                <!-- 第二列 -->
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">婚姻状况</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                <c:if test="${userInfoDTO.base.isMarried == null }">
                                                    （未知）
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isMarried == '01' }">
                                                    已婚
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isMarried == '02' }">
                                                    未婚
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isMarried == '03' }">
                                                    离异
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isMarried == '04' }">
                                                    丧偶
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">子女状态</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                <c:if test="${userInfoDTO.base.isChild == null }">
                                                    （未知）
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isChild == '01' }">
                                                    有
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isChild == '02' }">
                                                    无
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">住宅属性</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                <c:if test="${userInfoDTO.base.homeType == null }">
                                                    （未知）
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.homeType == '01' }">
                                                    自用
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.homeType == '02' }">
                                                    租用
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.homeType == '03' }">
                                                    亲属楼宇
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.homeType == '04' }">
                                                    集体宿舍
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.homeType == '05' }">
                                                    其他
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">车辆属性</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                <c:if test="${userInfoDTO.base.isCar == null }">
                                                    （未知）
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isCar == '01' }">
                                                    有
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.isCar == '02' }">
                                                    无
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">持有信用卡张数</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                <c:if test="${userInfoDTO.bank.creditNum == null }">
                                                    （未知）
                                                </c:if>
                                                <c:if test="${userInfoDTO.bank.creditNum == '00' }">
                                                    0 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.bank.creditNum == '01' }">
                                                    1 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.bank.creditNum == '02' }">
                                                    2 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.bank.creditNum == '03' }">
                                                    3 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.bank.creditNum == '04' }">
                                                    4 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.bank.creditNum == '05' }">
                                                    5 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.bank.creditNum == '06' }">
                                                    更多
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">信用卡最大额度</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                ${userInfoDTO.bank.creditMax == null ? '（未知）': userInfoDTO.bank.creditMax }
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /第二列 -->
                                <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-2 col-sm-2 col-xs-12">居住地址</label>
                                        <div class="col-md-10 col-sm-10 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                                ${userInfoDTO.base.addressDetail == null ? '（未知）': userInfoDTO.base.addressDetail }
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /文本信息 -->
                            <!-- 头像信息 -->
                            <div class="form-group col-md-4 col-sm-4 col-xs-12">
                                <div class="col-md-12 col-sm-12 col-xs-12 profile_details">
                                    <div class="well profile_view">
                                        <div class="col-sm-12">
                                            <h4 class="brief"><i>客户资料</i></h4>
                                            <div class="left col-xs-7">
                                                <h2>${userInfoDTO.base.realName }</h2>
                                                <p><strong>性别: </strong>
                                                    ${userInfoDTO.base.sex == null ? '（未知）': userInfoDTO.base.sex }</p>
                                                <p><strong>年龄: </strong>
                                                    ${userInfoDTO.base.age == null ? '（未知）': userInfoDTO.base.age }</p>
                                                <p><strong>身份证: </strong> ${userInfoDTO.base.idNumber }</p>
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-phone"></i>电话: ${userInfoDTO.base.mobileNumber }
                                                    </li>
                                                    <li><i class="fa fa-building"></i>住址:
                                                        ${userInfoDTO.base.addressDetail == null ? '（未知）': userInfoDTO.base.addressDetail }
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="right col-xs-5 text-center">
                                                <img src="${pageContext.request.contextPath}/build/images/img.jpg"
                                                     alt="" class="img-circle img-responsive">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 bottom text-center">
                                            <div class="col-xs-8 col-sm-8 emphasis">
                                                <p class="ratings" style="margin: 0 0 0 10px;">
                                                    <a>3.5</a>
                                                    <a href="javascrip:void(0);"><span class="fa fa-star"></span></a>
                                                    <a href="javascrip:void(0);"><span class="fa fa-star"></span></a>
                                                    <a href="javascrip:void(0);"><span class="fa fa-star"></span></a>
                                                    <a href="javascrip:void(0);"><span class="fa fa-star-half-o"></span></a>
                                                    <a href="javascrip:void(0);"><span class="fa fa-star-o"></span></a>
                                                </p>
                                            </div>
                                            <div class="col-xs-4 col-sm-4 emphasis">
                                                <button type="button" id="baseinfo_update_btn"
                                                        class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /头像信息 -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /基本信息 -->
        <div class="clearfix"></div>
        <!-- 银行卡信息 -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">银行卡信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li>
                                <button type="button" class="btn btn-success btn-primary"
                                        data-toggle="modal" ${lenderId == null ||  lenderId == ''? '':'style="display: none;"'}
                                        data-target=".editBack">修改
                                </button>
                                <button type="button" class="btn btn-primary"> 更改记录</button>
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>


                        <div class="modal editBack" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title">修改还款银行卡</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div style="padding: 5px 20px;">
                                            <form id="editBack" class="form-horizontal calender"
                                                  role="form">
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">银行名称</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <select class="form-control"
                                                                name="bankName">
                                                            <c:forEach items="${banks}" var="bank">
                                                                <option value="${bank.name}" ${userInfoDTO.bank.bankNameDes == bank.name ? 'selected': '' }>${bank.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">银行卡号</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="number" class="form-control"
                                                               name="bankNo" value="${ userInfoDTO.bank.cardNumber }"
                                                               placeholder="请输入银行卡号">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">银行预留手机号</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="number" class="form-control" maxlength="11"
                                                               name="moable"
                                                               value="${ userInfoDTO.bank.bankPhone != null ? userInfoDTO.bank.bankPhone : '' }"
                                                               placeholder="请输入银行预留手机号">
                                                    </div>
                                                </div>
                                                <input type="hidden" name="orderId" value="${orderVO.id}"/>
                                                <input type="hidden" name="realName"
                                                       value="${userInfoDTO.base.realName}"/>
                                                <input type="hidden" name="userCode"
                                                       value="${userInfoDTO.base.idNumber}"/>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="">
                                        <button type="button" class="btn btn-success antoclose"
                                                data-dismiss="modal" onclick="editBack()">保存
                                        </button>
                                        <button type="button" class="btn btn-primary " data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content fontawesome-ahead">
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-4 col-sm-4 col-xs-12">
                                <i class="fa fa-institution"></i>还款银行</label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    ${ userInfoDTO.bank.bankNameDes }
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-4 col-sm-4 col-xs-12">
                                <i class="fa fa-credit-card"></i>银行卡号</label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    ${ userInfoDTO.bank.cardNumber }
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-4 col-sm-4 col-xs-12">
                                <i class="fa fa-phone"></i>预留手机号</label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    ${ userInfoDTO.bank.bankPhone != null ? userInfoDTO.bank.bankPhone : '（未知）' }
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /银行卡信息 -->
        <div class="clearfix"></div>
        <!--合同信息-->
        <div class="row">
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
                                <div class="form-group col-md-6 col-sm-6 col-xs-12" style="margin-bottom:20px;">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">放款机构</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid"
                                                 style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px;  margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
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
                                                    <a class="btn btn-primary" target="_blank" href="${i.viewUrl}"
                                                       style=" padding: 0;color:#26b99a;background:#ffffff;border:0;float: right;">查看</a>
                                                    <a class="btn btn-primary" id="download"
                                                       href="${i.downloanUrl}" download="cropped.png"
                                                       style="float: right; padding: 0;color:#26b99a;background:#ffffff;border:0;">下载</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${i.submitStatus=='FALSE'}">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px; margin-top: 0; color: red; font-size: 14px; margin-bottom: 10px;">
                                                        ${i.contractNo}
                                                    <button type="button" class="btn btn-primary"
                                                            style="padding: 0; float: right; background: #337ab7; border: 0;">
                                                        <div style="color: #FFFFFF;"
                                                             onclick="againLoan('${i.contractId}')">生成
                                                        </div>
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
                                                 style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px;  margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
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
                                                 style="border-bottom: 1px solid #e5e5e5; border-top: 0; height: 30px; line-height: 30px;  margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
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
        </div>
        <!--合同信息-->
        <div class="clearfix"></div>
        <!-- 紧急联系人信息 -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">紧急联系人</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <button class="btn btn-success" style="float: right" data-toggle="modal"
                                data-target=".bs-example-modal-lg">添加
                        </button>

                        <div class="modal fade bs-example-modal-lg" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title">添加紧急联系人</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div style="padding: 5px 20px;">
                                            <form id="saveUser" class="form-horizontal calender"
                                                  role="form">
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">姓名</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control"
                                                               name="userName" maxlength="11"
                                                               pattern="^1[34578]\d{9}$"
                                                               placeholder="请输入姓名">
                                                    </div>
                                                </div>

                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">关系</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control"
                                                               name="relation"
                                                               placeholder="请输入关系">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">电话</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="number" class="form-control" maxlength="11"
                                                               name="userPhone"
                                                               placeholder="请输入电话">
                                                    </div>
                                                </div>
                                                <input type="hidden" name="userId" value="${userInfoDTO.base.userId}"/>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="">
                                        <button type="button" class="btn btn-success antoclose"
                                                data-dismiss="modal" onclick="addEmergency()">保存
                                        </button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>姓名</th>
                                <th>关系</th>
                                <th>电话</th>
                                <th>录入时间</th>
                                <th>操作人</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${userEmergency}" var="userEmergency" varStatus="status">
                                <tr>
                                    <th scope="row">${status.index+1}</th>
                                    <td>${userEmergency.userName }</td>
                                    <td>${userEmergency.relation }</td>
                                    <td>${userEmergency.userPhone }</td>
                                    <td><fmt:formatDate value="${userEmergency.createTime}"
                                                        pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                    <td>${userEmergency.operator}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${userContactsVO != null }">
                                <tr>
                                        <%--<th scope="row">${userEmergency.length + 1}</th>--%>
                                    <th scope="row">${userEmergency == null? '1': userEmergency.size()+1 }</th>
                                    <td>${userContactsVO.contactName1 }</td>
                                    <td>${userContactsVO.contactRelation1 != null ? userContactsVO.contactRelation1 : '朋友' }</td>
                                    <td>${userContactsVO.contactMobile1 }</td>
                                    <td><fmt:formatDate value="${orderVO.createTime }"
                                                        pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                    <td>${userInfoDTO.base.realName }</td>
                                </tr>
                                <tr>
                                        <%--<th scope="row">${userEmergency.length + 2}</th>--%>
                                    <th scope="row">${userEmergency == null? '1': userEmergency.size()+2 }</th>
                                    <td>${userContactsVO.contactName2 }</td>
                                    <td>${userContactsVO.contactRelation2 != null ? userContactsVO.contactRelation2 : '朋友' }</td>
                                    <td>${userContactsVO.contactMobile2 }</td>
                                    <td><fmt:formatDate value="${orderVO.createTime }"
                                                        pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                    <td>${userInfoDTO.base.realName }</td>
                                </tr>
                                <c:if test="${userContactsVO.contactName3 !=null && userContactsVO.contactName3 !='' }">
                                    <tr>
                                            <%--<th scope="row">${userEmergency.length + 3}</th>--%>
                                        <th scope="row">${userEmergency == null? '1': userEmergency.size()+3 }</th>
                                        <td>${userContactsVO.contactName3 }</td>
                                        <td>${userContactsVO.contactRelation3 }</td>
                                        <td>${userContactsVO.contactMobile3 }</td>
                                        <td><fmt:formatDate value="${orderVO.createTime }"
                                                            pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                        <td>${userInfoDTO.base.realName }</td>
                                    </tr>
                                </c:if>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /紧急联系人信息 -->
        <div class="clearfix"></div>
        <!-- 商品信息 and 费率信息 -->
        <div class="row">
            <!-- 商品信息 -->
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">商品信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal form-label-left">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">商户名称</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderServices.storeName}</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">商户类型</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderServices.storeTypeName}</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">项目名称</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderServices.serviceName}</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">服务金额</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderServices.price}</div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /商品信息 -->
            <!-- 费率信息 -->
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">费率信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal form-label-left">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">使用费率</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderVO.lenderRate }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">用户费率</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderVO.userRate }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">商户费率</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderVO.storeRate }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">服务费承担方</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">
                                        <c:if test="${orderVO.bearType == '01' }">商户承担</c:if>
                                        <c:if test="${orderVO.bearType == '02' }">用户承担</c:if>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /费率信息 -->
        </div>
        <!-- /商品信息 and 费率信息-->
        <div class="clearfix"></div>
        <!-- 工作信息 -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">工作信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">公司名称</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">${userInfoDTO.job.companyName }</div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">单位行业</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    <c:if test="${userInfoDTO.base.industry == null }">
                                        （未知）
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '01' }">
                                        服务行业
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '02' }">
                                        批发零售/商业贸易/租赁
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '03' }">
                                        生成/加工/制造业
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '04' }">
                                        IT网络/计算机/通信
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '05' }">
                                        金融/银行/保险
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '06' }">
                                        工程建筑/装修/园林绿化
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '07' }">
                                        文化科教
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '08' }">
                                        旅游/饭店/娱乐
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '09' }">
                                        政府机关/事业单位/国企
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '10' }">
                                        广告
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '11' }">
                                        运输业
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.industry == '12' }">
                                        其他
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">单位性质</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    <c:if test="${userInfoDTO.job.companyType == null }">
                                        （未知）
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '01' }">
                                        国企
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '02' }">
                                        民营
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '03' }">
                                        合资
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '04' }">
                                        外商独资
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '05' }">
                                        股份制企业
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '06' }">
                                        上市公司
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '07' }">
                                        国家单位
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '08' }">
                                        事业单位
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '09' }">
                                        其他
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '10' }">
                                        社会团体
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '11' }">
                                        三资企业
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '12' }">
                                        私营
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.companyType == '13' }">
                                        个体
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">职业状态</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    <c:if test="${userInfoDTO.base.jobType == null }">
                                        （未知）
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.jobType == '01' }">
                                        在职
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.jobType == '02' }">
                                        自顾人士
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.jobType == '03' }">
                                        自由职业
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.jobType == '04' }">
                                        学生
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.jobType == '05' }">
                                        家庭主妇
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.jobType == '06' }">
                                        退休人士
                                    </c:if>
                                    <c:if test="${userInfoDTO.base.jobType == '07' }">
                                        失业人士
                                    </c:if>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">岗位级别</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    <c:if test="${userInfoDTO.job.jobType == null }">
                                        （未知）
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.jobType == '01' }">
                                        高层及以上
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.jobType == '02' }">
                                        中层管理
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.jobType == '03' }">
                                        基层员工
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">薪资收入</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    <c:if test="${userInfoDTO.job.incomeSum == '01' }">
                                        &lt;3000
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.incomeSum == '02' }">
                                        3000-5000
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.incomeSum == '03' }">
                                        5000-10000
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.incomeSum == '04' }">
                                        10000-30000
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.incomeSum == '05' }">
                                        &gt;30000
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">工作年限</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    <c:if test="${userInfoDTO.job.workAges == '01' }">
                                        &lt;=1
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.workAges == '02' }">
                                        2-5
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.workAges == '03' }">
                                        6-10
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.workAges == '04' }">
                                        &gt;10年
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">公司电话</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    ${userInfoDTO.job.companyPhone }
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">公司地址</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    ${userInfoDTO.job.companyAddress }
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /工作信息 -->
        <div class="clearfix"></div>
        <!-- 图片信息 -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">图片信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <ul class="my-gallery" id="jq22">
                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${userUrl}${userInfoDTO.userPic.cardFace}" alt="图片1"/>
                                    </div>

                                </div>
                            </li>

                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${userUrl}${userInfoDTO.userPic.cardBack}" alt="图片2"/>
                                    </div>

                                </div>
                            </li>

                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${userUrl}${userInfoDTO.userPic.moreCard}" alt="图片3"/>
                                    </div>

                                </div>
                            </li>

                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${userUrl}${userInfoDTO.userPic.bankCard}" alt="图片4"/>
                                    </div>

                                </div>
                            </li>

                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${orderUrl}${userInfoDTO.orderData.pic1}" alt="图片5"/>
                                    </div>

                                </div>
                            </li>

                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${orderUrl}${userInfoDTO.orderData.pic2}" alt="图片6"/>
                                    </div>

                                </div>
                            </li>

                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${orderUrl}${userInfoDTO.orderData.pic3}" alt="图片7"/>
                                    </div>

                                </div>
                            </li>

                            <li class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 150%; display: block;"
                                             src="${orderUrl}${userInfoDTO.orderData.pic4}" alt="图片8"/>
                                    </div>

                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /图片信息 -->
        <div class="clearfix"></div>
        <!--风险及信用分析-->

        <div class="col-md-6 col-sm-6 col-xs-12" style="padding-left:0;">
            <div class="x_panel">
                <div class="x_title">
                    <h2 style="line-height: 1; font-size: 18px;">风险及信用分析</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i
                                class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content" style="padding-bottom:5px;">
                    <div class="col-md-6 col-sm-6 col-xs-12" style="text-align: center;">
                        <canvas class="canvasDoughnut" height="110" width="110"></canvas>
                        <h3 class="name_title" style="font-size:16px;">芝麻信用--反欺诈信息：</h3>
                        <p style="font-size:50px;color:#438CB7;">${order.ivsScore== null ? '0':order.ivsScore}<small style="font-size:16px;color:#809396;">分
                            <c:if test="${order.ivsScore >= 70 &&  order.ivsScore <= 100}">(低风险)</c:if>
                            <c:if test="${order.ivsScore >= 40 &&  order.ivsScore <= 70}">(中风险)</c:if>
                            <c:if test="${order.ivsScore >= 0 &&  order.ivsScore <= 40}">(高风险)</c:if>
                            <c:if test="${order.ivsScore  == null}">(高风险)</c:if>
                        </small></p>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12" style="text-align: center;">
                        <canvas class="canvasDoughnut" height="110" width="110"></canvas>
                        <h3 class="name_title" style="font-size:16px;">芝麻信用--评分：</h3>
                        <p style="font-size:50px;color:#438CB7;">${zmScore == null ? '0':zmScore}<small style="font-size:16px;color:#809396;">分</small></p>
                    </div>
                </div>
            </div>
        </div>


        <!--第三方数据-->

        <div class="col-md-6 col-sm-6 col-xs-12" style="padding-right:0;">
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

                    <button class="btn btn-success source" style="padding: 6px 19px;border:0;"
                            onclick="showPengYuan('${orderVO.id}',2)">鹏元交易
                    </button>

                    <button class="btn btn-success source" style="padding: 6px 19px;border:0;"
                            onclick="showPengYuan('${orderVO.id}',4)">鹏元风险
                    </button>

                    <button class="btn btn-success source" style="padding: 6px 19px;border:0;"
                            onclick="window.open('${pageContext.request.contextPath}/mfq/report/reportPersonTongdun.do?orderId=${order.id}')">
                        同盾风险
                    </button>

                    <button class="btn btn-success source" style="padding: 6px 19px;border:0;"
                            onclick="window.open('${pageContext.request.contextPath}/mfq/report/getBlackList.do?orderId=${order.id}')">
                        数美逾期
                    </button>

                    <hr/>
                    <p>运营商报告</p>

                    <button class="btn btn-success source" style="background:#5bc0de;border:0;"
                            onclick="window.open('${pageContext.request.contextPath}/mfq/report/reportData.do?orderId=${orderVO.id}&mobile=${base.mobileNumber}')">
                        聚信立报告
                    </button>

                    <button class="btn btn-success source" style="background:#5bc0de;padding: 6px 19px;border:0;"
                            onclick="showMoXie('${orderVO.id}')">魔蝎报告
                    </button>

                    <button class="btn btn-success source" style="background:#5bc0de;padding: 6px 19px;border:0;"
                            onclick="window.open('${pageContext.request.contextPath}/mfq/report/tongDunReport.do?orderId=${orderVO.id}')">
                        同盾报告
                    </button>

                    <hr/>
                    <p>电商报告</p>

                    <button class="btn btn-default source"
                            style="background:#f0ad4e;color:#ffffff;padding: 6px 19px;border:0;"
                            onclick="window.open('${pageContext.request.contextPath}/mfq/report/getTaobaoReport.do?userId=${order.customerId}')">
                        淘宝报告
                    </button>

                    <button class="btn btn-default source" style="background:#f0ad4e;color:#ffffff;border:0;"
                            onclick="window.open('${pageContext.request.contextPath}/mfq/report/getAlipayReport.do?userId=${order.customerId}')">
                        支付宝报告
                    </button>

                    <hr/>
                </div>
            </div>
        </div>

        <!-- 第三方数据 -->
        <!-- <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                   <div class="x_panel">
                     <div class="x_title">
                           <h2 style="font-size:18px;">第三方数据</h2>
                           <ul class="nav navbar-right panel_toolbox">
                             <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                           </ul>
                           <div class="clearfix"></div>
                       </div>
                       <div class="x_content">
                           <div class="row tile_count">
                               <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                             <span class="count_top"><i class="fa fa-user"></i> Total Males</span>
                             <div class="count green">2,500</div>
                             <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                           </div>
                           <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                             <span class="count_top"><i class="fa fa-clock-o"></i> Average Time</span>
                             <div class="count">123.50</div>
                             <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
                           </div>
                           <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                             <span class="count_top"><i class="fa fa-user"></i> Total Males</span>
                             <div class="count green">2,500</div>
                             <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                           </div>
                         </div>
                       </div>
                   </div>
           </div>
       </div> -->
        <!-- 第三方数据 -->
        <div class="clearfix"></div>
        <!-- 备注信息 -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">备注信息</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>


                        <button class="btn btn-success" style="float: right" data-toggle="modal"
                                data-target=".bs-example-modal-lg1">添加
                        </button>

                        <div class="modal fade bs-example-modal-lg1" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title">添加备注信息</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div style="padding: 5px 20px;">
                                            <form id="addRemark" class="form-horizontal calender"
                                                  role="form">
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                                    <textarea class="form-control" style="height:100px;"
                                                                              name="remark"
                                                                              placeholder="请输入备注信息(150字以内)"></textarea>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="orderId" value="${orderVO.id}"/>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="">
                                        <button type="button" class="btn btn-success antoclose"
                                                data-dismiss="modal" onclick="addRemark()">保存
                                        </button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table class="table table-striped">
                            <thead>
                            <c:forEach items="${orderRemark}" var="orderRemark" varStatus="status">
                            <tr>
                                <td scope="row">${status.index +1}</td>
                                <td><fmt:formatDate value="${orderRemark.createTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${orderRemark.remark}</td>
                                <td>${orderRemark.operator}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /备注信息 -->
    </div>
</div>
<!-- /page content -->

<!-- 提前还款 or 用户退款 or 其他扣款 模态框 -->
<div id="debit_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">提前还款</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <!-- debitType 扣款标题类型 生命周期：all -->
                        <input type="hidden" class="form-control" id="debitType" name="debitType">
                        <!-- repaymentDetailId 生命周期：三方扣款、部分扣款、手动扣款-->
                        <input type="hidden" class="form-control" id="repaymentDetailId" name="repaymentDetailId">
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">三方已收</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="thirdMoney" name="thirdMoney" value="0.00"
                                       data-inputmask-regex="(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)"
                                       placeholder="0.00">
                            </div>
                            <label class="col-sm-2 col-md-2 control-label">扣款来源</label>
                            <div class="col-sm-4 col-md-4">
                                <select id="debitSource" name="debitSource" class="form-control" required>
                                    <option value="">请选择</option>
                                    <option value="1">宝付</option>
                                    <option value="3">先锋</option>
                                    <option value="4">连连</option>
                                    <option value="5">支付宝</option>
                                    <option value="6">微信</option>
                                    <option value="7">对公转账 -- 招商一般户</option>
                                    <option value="8">对公转账 -- 法人卡转账</option>
                                    <option value="2">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">扣款金额</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="0.00"
                                       data-inputmask-regex="(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)"
                                       placeholder="0.00">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary antosubmit">确认</button>
            </div>
        </div>
    </div>
</div>
<div id="fc_debit" data-toggle="modal" data-target="#debit_modal"></div>
<!-- /提前还款 or 用户退款 模态框 -->

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
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>扣款时间</th>
                                <th>实际扣款金额</th>
                                <th>扣款状态</th>
                                <th>扣款源</th>
                                <th>扣款方式</th>
                                <th>商户订单号</th>
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
<%-- footer --%>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<%-- photoswipeTemplate --%>
<%@ include file="/WEB-INF/common/photoswipe_template.jsp" %>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>

<script src="${pageContext.request.contextPath}/dwr/interface/orderRepaymentDwr.js"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/debitDwr.js"></script>
<script type="text/javascript">

    var table;
    $(function () {
        // 初始化 inputmask 金额格式校验
        $("#thirdMoney").inputmask("Regex");
        $("#debitMoney").inputmask("Regex");

        // advance button 提前还款
        $('#advance').click(function () {
            advanceOrCancel('ADV');
        });

        // cancel button 用户退款
        $('#cancel').click(function () {
            advanceOrCancel('CANC');
        });

        // 手动扣款、三方扣款、部分扣款 按钮动态绑定
        $(document).on('click', ".btn-group > .dropdown-menu > li > a", function () {
            var debitType = $(this).attr('rel');
            var repaymentDetailId = $(this).attr('class');
            if (debitType != '') {
                initModalLabel(debitType, repaymentDetailId);
                $('#fc_debit').click();
            }
        });

        // 点击「确定」执行扣款动作
        $('.modal-footer > .antosubmit').click(function () {
            var debitMoney = $('#debitMoney').val();
            var debitType = $('#debitType').val();
            var thirdMoney = $('#thirdMoney').val();
            var debitSource = $('#debitSource').val();
            var repaymentDetailId = $('#repaymentDetailId').val();
            $('#debit_modal').modal('hide');		// 先隐藏当前modal框
            // 表单校验
            checkModalForm(debitMoney, debitType, thirdMoney, debitSource);
            $.confirm({
                title: "确认扣款",
                text: '您确定要执行本次金额为' + debitMoney + '扣款吗?',
                confirmButton: '确认',
                cancelButton: '取消',
                confirm: function (button) {
                    debit(debitMoney, debitType, thirdMoney, debitSource, repaymentDetailId);
                },
                cancel: function (button) {
                    $('#debit_modal').modal('show');
                }
            });
        });

        $('.emphasis').click(function () {
            $.confirm({
                title: '系统提示',
                text: '暂不支持修改功能！',
                confirmButton: '确认',
                cancelButton: false,
            });
        });

        // 初始化DataTables
        table = $('#datatable_repayment_detail').dataTable({
            autoWidth: false,  	// 禁用自动调整列宽
            scrollX: '100%',
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            paginate: false,		// 翻页功能
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            aoColumnDefs: [{"bSortable": false, "aTargets": [19]}],
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/DHrepayment/dhrepaymentDetailList.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                // 组合晒选类型
                var repaymentId = '${orderRepaymentVO.id}';
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "repaymentId", "value": repaymentId});
                $.ajax({
                    type: 'GET',
                    url: sSource,
                    data: {"aoData": JSON.stringify(aoData)},
                    dataType: 'json',
                    success: function (rs) {
//                         var orderRepaymentVO = rs.orderRepaymentVO;
//                         var libraryMoney = parseFloat(orderRepaymentVO.repaymentMoney - orderRepaymentVO.actualMoneySum).toFixed(2);
//                         if (libraryMoney > 0) {
//                             $('#libraryMoney').html(libraryMoney);
//                         } else {
//                             $('#libraryMoney').html('0.00');
//                         }
                        fnCallback(rs);
                    }
                });
            },
            columns: [
            	 {
                     "data": function (obj) {
                         return obj.repaymentStage;
                     },"defaultContent": ""
                 },
                {
                    "data": function (obj) {
                        return new Date(parseInt(obj.repaymentDate)).format('yyyy-MM-dd');
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.repaymentMoney + obj.overdueMoneySum + obj.penaltyMoney).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.repaymentMoney).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.repaymentPrincipal).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.repaymentInterest).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return obj.overdueDay;
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.overdueMoneySum).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
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
                        // 尚欠金额
                        var moneySum = parseFloat(obj.repaymentMoney + obj.overdueMoneySum + obj.penaltyMoney - obj.actualMoney - obj.derateMoney).toFixed(2);
                        if (moneySum > 0) {
                            return moneySum;
                        } else {
                            return '0.00';
                        }
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.actualMoney).toFixed(2);
                    }
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.actualPrincipal).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.actualInterest).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.actualOverdueMoney).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.actualPenaltyMoney).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.breachMoney).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.derateMoney).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return parseFloat(obj.overchargedMoney).toFixed(2);
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        var status;
                        switch (obj.status) {
                            case '01':
                            	status = '未还';
                                break;
                            case '02':
                            	status = '已还';
                                break;
                            case '06':
                            	status = '逾期未还';
                                break;
                            case '07':
                            	status = '逾期已还';
                                break;
                            case '09':
                            	status = '部分还款';
                                break;
                            case '10':
                            	status = '逾期部分还款';
                                break;
                        }
                        return status;
                    }
                },
                {
                    "data": function (obj) {
                        var manualStr = '';
                        var thirdStr = '';
                        var partStr = '';
                        if (obj.repaymentStatus === '02' || obj.repaymentStatus === '07') {

                        } else {
                            var longLoan = $("#longLoan").val();
                            if (longLoan != '' && longLoan != null) { // 证明是从民盛订单进来的详情
                            } else {
                                manualStr = '<li><a href="javascript:void(0);" rel="manual" class="' + obj.repaymentDetailId + '">手动扣款</a></li>';
                                partStr = '<li><a href="javascript:void(0);" rel="part" class="' + obj.repaymentDetailId + '">部分扣款</a></li><li class="divider"></li>';
                                // partStr = '<li class="divider"></li>';
                            }
                            thirdStr = '<li><a href="javascript:void(0);" rel="third" class="' + obj.repaymentDetailId + '">三方扣款</a></li>';

                        }

                        var str = '<div class="btn-group">'
                            + '<button data-toggle="dropdown" class="btn btn-success dropdown-toggle btn-xs" type="button">'
                            + '操作 <span class="caret"></span></button>'
                            + '<ul role="menu" class="dropdown-menu">'
                            + manualStr
                            + thirdStr
                            + partStr
                            + '<li><a href="javascript:payList(\'' + obj.repaymentDetailId + '\');" rel="">扣款记录</a></li>'
                            + '<li><a href="javascript:messageList(\'' + obj.repaymentDetailId + '\');" rel="">通知详情</a></li>'
                            + '</ul></div>';

                        return str;

                    }
                }
            ]

        });

    })

    /* // 提前还款 或 用户退款
    function advanceOrCancel(debitType) {
    	console.log(debitType+"		debitType");
        // orderId
        var orderId = '${orderVO.id}';
        console.log("orderId"+orderId);
        // repaymentId
        var repaymentId = '${orderRepaymentVO.id}';
        console.log("repaymentId的值"+repaymentId);
        // first repaymentDate
        var firstRepaymentDate = '${repaymentDetailList[0].repaymentDate}';
        console.log("firstRepaymentDate"+firstRepaymentDate);
        // 计算提前还款/退款需要支付的金额
        orderRepaymentDwr.getAdvanceOrCancelMony(orderId, repaymentId, debitType, new Date(firstRepaymentDate),
            {
                callback: function (data) {
                    initModalLabel(debitType, '');		// 提前还款「当前期」的 repaymentDetailId 为 空字符串，需要在后台获取
                    $('#debitMoney').val(data);
                    $('#fc_debit').click();
                },
                errorHandler: function (message) {
                    $.confirm({
                        title: "系统提示",
                        text: message,
                        confirmButton: '关闭',
                        cancelButton: false
                    });
                }
            }
        );
    } */

    // update modal label and input hide 根据扣款操作类型动态显示/隐藏表单控件 和 初始化控件
    function initModalLabel(debitType, repaymentDetailId) {
        $('#antoform > .form-group').show();		// 每次调用，默认先显示所有表单控件, 然后根据类型再隐藏
        switch (debitType) {
            case 'ADV':
                $('#myModalLabel').text('提前还款');
                break;
            case 'CANC':
                $('#myModalLabel').text('用户退款');
                break;
            case 'third': 		// 三方扣款
                $('#myModalLabel').text('三方扣款');
                $('#antoform > .form-group:eq(1)').hide();
                break;
            case 'manual':
                $('#myModalLabel').text('手动扣款');
                $('#antoform > .form-group:eq(0)').hide();
                break;
            case 'part':
                $('#myModalLabel').text('部分扣款');
                break;
            default:
                $('#myModalLabel').text('提前还款');
        }
        // 初始化控件默认值
        $('#debitType').val(debitType);
        $('#repaymentDetailId').val(repaymentDetailId);
        $('#debitMoney').val('0.00');
        $('#thirdMoney').val('0.00');
        $('#debitSource').val('');
    }

    // ajax请求后台进行扣款
    function debit(debitMoney, debitType, thirdMoney, debitSource, repaymentDetailId) {
        // orderId
        var orderId = '${orderVO.id}';
        //alert('${dhRepaymentDetailList}');
        // userId
        var userId = '${userInfoDTO.base.userId}';
        // repaymentId
        var repaymentId = '${orderRepaymentVO.id}';
        // operator
        var UserAccountVo = new Object();
        UserAccountVo.id = '${user.userAccount.id}';
        UserAccountVo.realName = '${user.userAccount.realName}';
        var DebitDTO = new Object();
        DebitDTO.orderId = '${orderVO.id}';
        DebitDTO.userId = '${userInfoDTO.base.userId}';
        DebitDTO.repaymentId = repaymentId;
        DebitDTO.repaymentDetailId = repaymentDetailId;
        DebitDTO.debitMoney = debitMoney;
        DebitDTO.debitType = debitType;
        DebitDTO.thirdMoney = thirdMoney;
        DebitDTO.debitSource = debitSource;
        DebitDTO.operator = UserAccountVo;
        debitDwr.debit(DebitDTO,
            {
                callback: function (data) {
                    console.log(data);
                    //var result = eval('(' + data + ')');
                    var result = JSON.parse(data);
                    $.confirm({
                        title: "系统提示",
                        text: result.resp_msg,
                        confirmButton: '确认',
                        cancelButton: false,
                    })
                    table.fnReloadAjax();
                },
                errorHandler: function (message) {
                    $.confirm({
                        title: "系统提示",
                        text: message,
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                },
                timeout: 30000
            }
        )
    }

    // 扣款前表单校验
    function checkModalForm(debitMoney, debitType, thirdMoney, debitSource) {
        var message = ''
        if (debitType === 'ADV' || debitType === 'CANC') {
            if (debitMoney <= 0 && thirdMoney <= 0) {
                message = '扣款金额格式有误！';
            }
            if (reg1.test(thirdMoney) && (debitSource == '' || debitSource == null)) {
                message = '请选择一个扣款来源！';
            }
        }
        if (debitType === 'third') {
            if (!reg1.test(thirdMoney)) {
                message = '三方已收金额格式有误！';
            }
            if (reg1.test(thirdMoney) && (debitSource == '' || debitSource == null)) {
                message = '请选择一个扣款来源！';
            }
        }
        if (debitType === 'manual') {
            if (!reg1.test(debitMoney)) {
                message = '扣款金额格式有误！';
            }
        }
        if (debitType === 'part') {
            if (debitMoney <= 0 && thirdMoney <= 0) {
                message = '扣款金额格式有误！';
            }
            if (reg1.test(thirdMoney) && (debitSource == '' || debitSource == null)) {
                message = '请选择一个扣款来源！';
            }
        }

        if (message != '') {
            $.confirm({
                title: '系统提示',
                text: message,
                confirmButton: '确认',
                cancelButton: false,
                confirm: function (button) {
                    $('#debit_modal').modal('show');
                }
            });
            return;
        }
    }

    /* 获取图片的大小 */
    $(document).ready(function () {
        $(".my-gallery img").each(function (i) {
            var img = $(this);
            var realWidth;
            var realHeight;
            $("<img/>").attr("src", $(img).attr("src")).load(function () {
                realWidth = this.width;
                realHeight = this.height;
                img.parent().parent().parent().parent().attr('data-size', realWidth + "x" + realHeight)
                console.log(img.parent().parent().parent().parent().attr('data-size', realWidth + "x" + realHeight))

            });
        });
    });

    // 添加紧急联系人
    function addEmergency() {

        var userName = $("#saveUser input[name='userName']").val()
        if (!strCheck(userName)) {
            $.confirm({
                title: '系统提示',
                text: "用户名输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        } else if (userName.length > 5 || userName.length < 2) {
            $.confirm({
                title: '系统提示',
                text: "用户名输入过长, 请确认在2~4个汉字之间",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var relation = $("#saveUser input[name='relation']").val()
        if (!strCheck(relation)) {
            $.confirm({
                title: '系统提示',
                text: "关系输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var userPhone = $("#saveUser input[name='userPhone']").val()
        if (!strCheck(userPhone) || userPhone.length != 11) {
            $.confirm({
                title: '系统提示',
                text: "电话输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("saveUser"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/repayment/saveUserEmergency.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "添加成功!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                }
                location.reload();
            },
            error: function (e) {
                location.reload();
            }
        });
    }

    // 添加备注信息
    function addRemark() {
        var remark = $("#addRemark textarea[name='remark']").val()
        if (!strCheck(remark)) {
            $.confirm({
                title: '系统提示',
                text: "备注信息输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        } else if (remark.length > 150) {
            $.confirm({
                title: '系统提示',
                text: "备注信息字数超长,请确认在150字以内",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var form = new FormData(document.getElementById("addRemark"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/repayment/saveOrderRemark.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "添加成功!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                }
                location.reload();
            },
            error: function (e) {
                location.reload();
            }
        });
    }


    $(document).ready(function () {
        var viewer = new Viewer(document.getElementById('jq22'), {
            url: 'data-original'
        });
    });

    // 修改还款银行卡
    function editBack() {

        var moable = $("#editBack input[name='moable']").val()
        if (!strCheck(moable) || moable.length != 11) {
            $.confirm({
                title: '系统提示',
                text: "电话输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var bankNo = $("#editBack input[name='bankNo']").val()
        if (!strCheck(bankNo)) {
            $.confirm({
                title: '系统提示',
                text: "银行卡号输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("editBack"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/repayment/editBack.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else if (data.code == -1) {
                    $.confirm({
                        title: '系统提示',
                        text: "校验不匹配!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "修改成功!",
                        confirmButton: '确认',
                        cancelButton: false,
                        confirm: function (button) {
                            location.reload(true);
                        }
                    });
                }

            },
            error: function (e) {
                location.reload();
            }
        });
    }


    // 扣款详情
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
                    var data = jQuery.parseJSON(res);
                    var payListTbody = '';
                    for (var i = 0; i < data.length; i++) {
                        // 时间格式化
                        var date = new Date(data[i].debitDateTime);
                        Y = date.getFullYear() + '-';
                        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                        D = date.getDate() + ' ';
                        h = date.getHours() + ':';
                        m = date.getMinutes() + ':';
                        s = date.getSeconds();
                        var handleResult = data[i].handleResult; // 扣款状态 1 成功 2 失败 3 等待
                        if (handleResult == 1) {
                            handleResult = "成功";
                        } else if (handleResult == 2) {
                            handleResult = "失败";
                        } else if (handleResult == 3) {
                            handleResult = "等待";
                        }
                        var handleSource = data[i].handleSource; // 扣款源
                        if (handleSource === 1) {
                            handleSource = '宝付';
                        } else if (handleSource === 2) {
                            handleSource = '其他';
                        } else if (handleSource === 3) {
                            handleSource = '先锋';
                        } else if (handleSource === 4) {
                            handleSource = '连连';
                        } else if (handleSource === 5) {
                            handleSource = '支付宝';
                        } else if (handleSource === 6) {
                            handleSource = '微信';
                        } else if (handleSource === 7) {
                            handleSource = '对公转账 -- 招商一般户';
                        } else if (handleSource === 8) {
                            handleSource = '对公转账 -- 法人卡转账';
                        }
                        var handleType = data[i].handleType;    // 扣款方式
                        if (handleType === 2) {
                            handleType = '手动';
                        } else {
                            handleType = '自动';
                        }
                        var transSerialNo = data[i].transSerialNo; // 交易流水号
                        if (transSerialNo == null) {
                            transSerialNo = "";
                        }
                        payListTbody = payListTbody + '<tr>'
                            + '<th>' + Y + M + D + h + m + s + '</th>'
                            + '<th>' + data[i].sumMoney + '</th>'
                            + '<th>' + handleResult + '</th>'
                            + '<th>' + handleSource + '</th>'
                            + '<th>' + handleType + '</th>'
                            + '<th>' + transSerialNo + '</th>'
                            + '<th>' + data[i].handleName + '</th>'
                            + '<th>' + data[i].respMsg + '</th>'
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
            }
        );
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
    // 出示鹏元报告
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
 
	// 提前还款 或 用户退款
    function advanceOrCancel(debitType) {
    	console.log(debitType+"		debitType");
        // orderId
        var orderId = '${orderVO.id}';
        console.log("orderId"+orderId);
        // repaymentId
        var repaymentId = '${orderRepaymentVO.id}';
        console.log("repaymentId的值"+repaymentId);
        // first repaymentDate
        var firstRepaymentDate = '${repaymentDetailList[0].repaymentDate}';
        console.log("firstRepaymentDate"+firstRepaymentDate);
        // 计算提前还款/退款需要支付的金额
        $.ajax({
					type:post,
					url:"${pageContext.request.contextPath }/mfq/DHrepayment/getCancelMony.do",
					data:{
						orderid:orderid,
						repaymentId:repaymentId,
						firstRepaymentDate:date,
						debitType:debitType
					},
					dataType: "json",
					success:function(data){
						var obj = jQuery.parseJSON(data);
						if(obj.code==0){
							 $.confirm({
		                        title: "系统提示",
		                        text: message,
		                        confirmButton: '关闭',
		                        cancelButton: false
		                    });
						}else{
							initModalLabel(debitType, '');		// 提前还款「当前期」的 repaymentDetailId 为 空字符串，需要在后台获取
					           $('#debitMoney').val(data);
					           $('#fc_debit').click();
						}
				}
			})
    }
 
</script>
</body>
</html>