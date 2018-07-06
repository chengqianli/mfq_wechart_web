<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/resource_jstl.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<style type="text/css">
.spinner {
  position: fixed;
  top: 300px;
  left: 0px;
  right: 0px;
  bottom: 0px;
  margin: auto;
  width: 150px;
  text-align: center;
  z-index: 1060;
}
 
.spinner > div {
  width: 30px;
  height: 30px;
  background-color: #67CF22;
 
  border-radius: 100%;
  display: inline-block;
  -webkit-animation: bouncedelay 1.4s infinite ease-in-out;
  animation: bouncedelay 1.4s infinite ease-in-out;
  /* Prevent first frame from flickering when animation starts */
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}
 
.spinner .bounce1 {
  -webkit-animation-delay: -0.32s;
  animation-delay: -0.32s;
}
 
.spinner .bounce2 {
  -webkit-animation-delay: -0.16s;
  animation-delay: -0.16s;
}
 
@-webkit-keyframes bouncedelay {
  0%, 80%, 100% { -webkit-transform: scale(0.0) }
  40% { -webkit-transform: scale(1.0) }
}
 
@keyframes bouncedelay {
  0%, 80%, 100% {
    transform: scale(0.0);
    -webkit-transform: scale(0.0);
  } 40% {
    transform: scale(1.0);
    -webkit-transform: scale(1.0);
  }
}
	</style>
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
    <script src="${pageContext.request.contextPath}/vendors/bigDecimal/bigDecimal.js"></script>
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
                        <input type="hidden" id="koudebitMoney"/>
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
						    <input type="hidden" id="rpId" value="${orderRepaymentVO.id }">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">借款总额</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderRepaymentVO.repaymentPrincipalSum }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">还款金额</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline">${orderRepaymentVO.repaymentPrincipalSum + orderRepaymentVO.repaymentInterestSum }</div>
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
                                    <div class="ln_solid list-detail-inline" id="rpMoney" >${orderRepaymentVO.repaymentMoney }</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">已还期数</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="ln_solid list-detail-inline" id="currentStage" >${orderRepaymentVO.currentStage }</div>
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
                                <%--<tbody>
                                <c:forEach var="item" items="${repaymentDetailList }" varStatus="status">
                                    <tr>
                                        <th scope="row">${item.repaymentStage }</th>
                                        <td><fmt:formatDate value="${item.repaymentDate}" pattern="yyyy-MM-dd"/></td>
                                        <td> ${item.repaymentMoney + item.overdueMoneySum + item.penaltyMoney }</td>
                                        <td> ${item.repaymentMoney } </td>
                                        <td> ${item.repaymentPrincipal } </td>
                                        <td> ${item.repaymentInterest } </td>
                                        <td> ${item.overdueDay }</td>
                                        <td> ${item.overdueMoneySum }</td>
                                        <td> ${item.penaltyMoney } </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${repaymentStatus eq 'ADV'}">
                                                    ${item.repaymentMoney + item.overdueMoneySum + item.penaltyMoney - item.actualMoney }
                                                </c:when>
                                                <c:otherwise>
                                                    0.00
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td> ${item.actualMoney } </td>
                                        <td> ${item.actualPrincipal } </td>
                                        <td> ${item.actualInterest } </td>
                                        <td> ${item.actualOverdueMoney } </td>
                                        <td> ${item.actualPenaltyMoney } </td>
                                        <td> ${item.advanceRepayOverdueMoney } </td>
                                        <td> ${item.derateMoney } </td>
                                        <td> ${item.overchargedMoney } </td>
                                        <td>
                                            <c:if test="${item.repaymentStatus eq '01' }">
                                                未还
                                            </c:if>
                                            <c:if test="${item.repaymentStatus eq '02' }">
                                                已还
                                            </c:if>
                                            <c:if test="${item.repaymentStatus eq '06' }">
                                                逾期未还
                                            </c:if>
                                            <c:if test="${item.repaymentStatus eq '07' }">
                                                逾期已还
                                            </c:if>
                                            <c:if test="${item.repaymentStatus eq '09' }">
                                                部分还款
                                            </c:if>
                                            <c:if test="${item.repaymentStatus eq '10' }">
                                                逾期部分还款
                                            </c:if>
                                        </td>
                                        <!-- <td>
                                            <div class="btn-group">
                                             <button data-toggle="dropdown"
                                                 class="btn btn-success dropdown-toggle btn-xs"
                                                 type="button">
                                                 操作 <span class="caret"></span>
                                             </button>
                                             <ul role="menu" class="dropdown-menu">
                                                 <li><a href="#"></a></li>
                                                 <li><a href="#">操作2</a></li>
                                                 <li><a href="#">操作3</a></li>
                                                 <li class="divider"></li>
                                                 <li><a href="#">操作4</a></li>
                                             </ul>
                                         </div>
                                     </td> -->
                                    </tr>
                                </c:forEach>
                                </tbody>--%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /还款周期列表 -->
        <!-- <div class="clearfix"></div> -->
        <!-- 沟通记录 -->
       <!--  <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">沟通记录列表</h2>
                        <input type="hidden" value="" id='calllogid'>
                        <ul class="nav navbar-right panel_toolbox">
                                    <li>
                                        <button type="button" class="btn btn-success btn-primary" data-toggle="modal"data-target="#payListModelIdwww">新增记录
                                        </button>
                                    </li>
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="table-responsive">
                            <table id="calllog_table_list" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>时间</th>
                                    <th>呼入呼出</th>
                                    <th>通话性质</th>
                                    <th>还款意向</th>
                                    <th>还款态度</th>
                                    <th>是否老赖</th>
                                    <th>备注</th>
                                    <th>负责人</th>
                                    <th>附件</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
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
                                                <c:if test="${userInfoDTO.base.education == '05' }">
                                                    中专
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.education == '06' }">
                                                    初中及以下
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
                                            ${userBaseInfoVO.creditNum}
                                            <c:if test="${userBaseInfoVO.creditNum == null }">
                                                     0张
                                            </c:if>
                                            
                                                <%-- <c:if test="${userInfoDTO.base.creditNum == null }">
                                                    （未知）
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.creditNum == '0' }">
                                                    0 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.creditNum == '1' }">
                                                    1 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.creditNum == '2' }">
                                                    2 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.creditNum == '3' }">
                                                    3 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.creditNum == '4' }">
                                                    4 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.creditNum == '5' }">
                                                    5 张
                                                </c:if>
                                                <c:if test="${userInfoDTO.base.creditNum == '6' }">
                                                    更多
                                                </c:if> --%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">信用卡最大额度</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="ln_solid list-detail-inline">
                                            ${userBaseInfoVO.creditMax}
                                            <c:if test="${userBaseInfoVO.creditMax == null }">
                                                     0
                                            </c:if>
                                                <%-- ${userInfoDTO.base.creditMax == null ? '（未知）': userInfoDTO.base.creditMax } --%>
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
                                    <%-- <td>${userContactsVO.contactRelation1 != null ? userContactsVO.contactRelation1 : '朋友' }</td> --%>
                                    <td>
                                    <c:if test="${userContactsVO.contactRelation1 == null }">未知</c:if>
                                    <c:if test="${userContactsVO.contactRelation1 == '1'}">父亲</c:if>
									<c:if test="${userContactsVO.contactRelation1 == '2'}">母亲</c:if>
									<c:if test="${userContactsVO.contactRelation1 == '3'}">子女</c:if>
									<c:if test="${userContactsVO.contactRelation1 == '4'}">兄弟姐妹</c:if>
									</td>
                                    <td>${userContactsVO.contactMobile1 }</td>
                                    <td><fmt:formatDate value="${orderVO.createTime }"
                                                        pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                    <td>${userInfoDTO.base.realName }</td>
                                </tr>
                                <tr>
                                        <%--<th scope="row">${userEmergency.length + 2}</th>--%>
                                    <th scope="row">${userEmergency == null? '1': userEmergency.size()+2 }</th>
                                    <td>${userContactsVO.contactName2 }</td>
                                    <%-- <td>${userContactsVO.contactRelation2 != null ? userContactsVO.contactRelation2 : '朋友' }</td> --%>
                                    <td>
                                    <c:if test="${userContactsVO.contactRelation2 == null }">未知</c:if>
                                    <c:if test="${userContactsVO.contactRelation2 == '1'}">父亲</c:if>
									<c:if test="${userContactsVO.contactRelation2 == '2'}">母亲</c:if>
									<c:if test="${userContactsVO.contactRelation2 == '3'}">子女</c:if>
									<c:if test="${userContactsVO.contactRelation2 == '4'}">兄弟姐妹</c:if>
									</td>
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
                                   <c:if test="${userJobVO.pageline == null }">
                                        （未知）
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '01' }">
              IT网络/计算机/通信
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '02' }">
                                     金融/银行/保险
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '03' }">
                                    文化/媒体
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '04' }">
              房地产/建筑
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '05' }">
                                        消费品
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '06' }">
                                        制造业
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '07' }">
                                        商业服务
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '08' }">
                                        交通/运输/物流
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '09' }">
                                        政府/非盈利机构
                                    </c:if>
                                    <c:if test="${userJobVO.pageline == '10' }">
                                        其他
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">单位性质</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="ln_solid list-detail-inline">
                                    <c:if test="${userJobVO.companyType == null }">
                                        （未知）
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '01' }">
                                        国企
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '02' }">
                                        民营
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '03' }">
                                        合资
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '04' }">
                                        外商独资
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '05' }">
                                        股份制企业
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '06' }">
                                        上市公司
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '07' }">
                                        国家单位
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '08' }">
                                        事业单位
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '09' }">
                                        其他
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '10' }">
                                        社会团体
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '11' }">
                                        三资企业
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '12' }">
                                        私营
                                    </c:if>
                                    <c:if test="${userJobVO.companyType == '13' }">
                                        个体
                                    </c:if>
                                    <%-- ${userInfoDTO.job.companyType == '13' } --%>
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
                                    <c:if test="${userInfoDTO.job.jobType == '04' }">
                                        实习、兼职
                                    </c:if>
                                    <c:if test="${userInfoDTO.job.jobType == '05' }">
                                        自主经营
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

        <div class="clearfix"></div>
        
        
        <!-- 保险信息 -->
							           <%--  <div class="col-md-12 col-sm-12 col-xs-12">
							                <div class="x_panel">
							                    <div class="x_title">
							                        <h2 style="font-size:18px;">保险信息</h2>
							                        <input type="hidden" value="${lenderId }" id='longLoan'>
							                        <div class="clearfix"></div>
							                    </div>
							                    <div class="x_content">
							                        <div class="table-responsive">
							                            <h4 style="font-size:16px;">受益人信息</h4>
							                            <table id="" class="table table-striped table-bordered">
							                                <thead>
							                                <tr>
							                                    <th>姓名</th>
							                                    <th>关系</th>
							                                    <th>身份证号</th>
							                                    <th>电话</th>
							                                </tr>
							                                </thead>
							                                <tbody>
							                                    <tr>
							                                    <th>张三</th>
							                                    <th>父亲</th>
							                                    <th>XXXXXXXXXXXXXXXXXX</th>
							                                    <th>XXX-XXXX-XXXX</th>
							                                </tr>
							                                </tbody>
							                            </table>
							                        </div>
							                        <div class="table-responsive">
							                            <h4 style="font-size:16px;">投保人/被保人</h4>
							                            <table id="" class="table table-striped table-bordered">
							                                <thead>
							                                <tr>
							                                    <th>姓名</th>
							                                    <th>身份证号</th>
							                                    <th>电话</th>
							                                </tr>
							                                </thead>
							                                <tbody>
							                                    <tr>
							                                    <th>张三</th>
							                                    <th>XXXXXXXXXXXXXXXXXX</th>
							                                    <th>XXX-XXXX-XXXX</th>
							                                </tr>
							                                </tbody>
							                            </table>
							                        </div>
							                    </div>
							                </div>
							            </div> --%>
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
                        <!-- paymentStage 扣款标题类型 生命周期：手动,三方,部分 -->
                        <input type="hidden" class="form-control" id="detailPaymentStage" name="detailPaymentStage" value=""/>
                        <!-- needMoney 剩余应还本息 生命周期：手动,三方,部分 -->
                        <input type="hidden" class="form-control" id="minMoney" name="minMoney" value=""/>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">三方已收</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="thirdMoney" name="thirdMoney" value="0.00"  maxlength="8"
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
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" onchang= maxlength="9" data-inputmask-regex="(^[1-9]([0-9]+)?(\.[0-9]{1,3})?$)|(^(0){1}$)|(^[0-9]\.[0-9][0-9]([0-9])?$)" placeholder="0.000" />
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
                        <table class="table table-striped table-bordered" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th width="90px">扣款时间</th>
                                <th>扣款金额</th>
                                <th>扣款状态</th>
                                <th>扣款源</th>
                                <th>扣款方式</th>
                                <th>执行类型</th>
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


<!-- 新增记录模态窗 -->
<div class="modal fade " tabindex="-1" id="payListModelIdwww"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">新增沟通记录</h4>
            </div>
            <div class="modal-body">
                <div style="padding: 5px 20px;">
                     <form id="updateBaseId" class="form-horizontal calender"role="form">
                         <div class="form-group" style="padding-bottom: 15px;border-bottom:1px solid #a29e9e;">
                             <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="callQuality"
                                                    checked
                                                    value="0" onclick="tonghua()"/>
                                      有效通话
                                     </label>
                                 </div>
                              <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="callQuality"
                                                    value="1" onclick="tonghua1()"/>
                                      无效通话
                                     </label>
                                 </div>
                         </div>
                         <div class="form-group" style="margin-bottom: 10px;margin-top:30px;display:none;" id="xuanzeqk">
                             <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom:20px;">
		                             <div class="col-md-1 col-sm-1 col-xs-12">
		                                     <label> <input type="radio"
		                                                    name="reason"
                                                            id="vl_00"
		                                                    checked
		                                                    value="0"/>
		                                         关机
		                                     </label>
		                                 </div>
                                 <div class="col-md-1 col-sm-1 col-xs-12">
                                     <label> <input type="radio"
                                                    name="reason"
                                                    id="vl_01"
                                                    value="1"/>
                                         停机
                                     </label>
                                 </div>
                                 <div class="col-md-1 col-sm-1 col-xs-12">
                                     <label> <input type="radio"
                                                    name="reason"
                                                    id="vl_02"
                                                    value="2"/>
                                         空号
                                     </label>
                                 </div>
                                 <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="reason"
                                                    id="vl_03"
                                                    value="3"/>
                                         号码不存在
                                     </label>
                                 </div>
                                 <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="reason"
                                                    id="vl_04"
                                                    value="4"/>
                                         不在服务区
                                     </label>
                                 </div>
                                 <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="reason"
                                                    id="vl_05"
                                                    value="5"/>
                                        无法接通
                                     </label>
                                 </div>
                                 <div class="col-md-1 col-sm-1 col-xs-12">
                                     <label> <input type="radio"
                                                    name="reason"
                                                    id="vl_06"
                                                    value="6"
                                     />
                                         占线
                                     </label>
                                 </div>
                                 <div class="col-md-1 col-sm-1 col-xs-12">
                                     <label> <input type="radio"
                                                    name="reason"
                                                    id="vl_07"
                                                    value="7"
                                     />
                                         其他
                                     </label>
                                 </div>
                             </div>
                         </div>
                         
                         <div class="form-group" style="margin-bottom: 15px;margin-top:20px;" id="xuanzeqk1">
                             <label class="control-label col-md-2 col-sm-2 col-xs-12" style="padding-top:0;">呼入呼出：
                             </label>
                             <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    checked
                                                    name="calType"
                                                    value="0"/>
                                     呼入
                                     </label>
                                 </div>
                              <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="calType"
                                                    value="1"/>
                                      呼出
                                     </label>
                                 </div>
                         </div>
                         
                         
                         
                         <div class="form-group" style="margin-bottom: 15px;" id="xuanzeqk2">
                             <div class="control-label col-md-2 col-sm-2 col-xs-12" style="padding-top:0;">
                                 <select class="form-control" id="willingness">
                                      <option value="1">有能力无意愿</option>
                                      <option value="2">有意愿无能力</option>
                                      <option value="3">有意愿有能力</option>
                                      <option value="4">无意愿无能力</option>
                                      <option value="5">其他</option>
                                  </select>
                             </div>
                             <div class="col-md-1 col-sm-1 col-xs-12">
                                     <label> <input type="radio"
                                                    checked
                                                    name="attitude"
                                                    value="0"/>
                                     正常
                                     </label>
                                 </div>
                              <div class="col-md-1 col-sm-1 col-xs-12">
                                     <label> <input type="radio"
                                                    name="attitude"
                                                    value="1"/>
                                     争议
                                     </label>
                                 </div>
                               <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="attitude"
                                                    value="2"/>
                                     态度敷衍
                                     </label>
                                 </div>
                               <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="attitude"
                                                    value="3"/>
                                     态度恶劣
                                     </label>
                                 </div>
                               <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="attitude"
                                                    value="4"/>
                                     承诺还款
                                     </label>
                                 </div>
                               <div class="col-md-1 col-sm-1 col-xs-12">
                                     <label> <input type="radio"
                                                    name="attitude"
                                                    value="5"/>
                                     其他
                                     </label>
                                 </div>
                         </div>
                         
                         <div class="form-group" style="margin-bottom: 15px;" id="xuanzeqk3">
                             <label class="control-label col-md-2 col-sm-2 col-xs-12" style="padding-top:0;">是否老赖：
                             </label>
                             <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    checked
                                                    name="debt"
                                                    value="0"/>
                                     是
                                     </label>
                                 </div>
                              <div class="col-md-2 col-sm-2 col-xs-12">
                                     <label> <input type="radio"
                                                    name="debt"
                                                    value="1"/>
                                      否
                                     </label>
                                 </div>
                         </div>
                         
                         
                         <div class="form-group" style="margin-bottom: 15px;" id="xuanzeqk4">
	                          <label class="control-label col-md-2 col-sm-2 col-xs-12" style="padding-top:0;">附件：</label>
	                          <input class="col-md-9 col-sm-9 col-xs-12" type="file" onchange="imgChange()" id="attachmentUrl2" value="选择文件上传" style="overflow: hidden;">
	                          <input type="hidden" id="attachmentUrl" value="">
	                     </div>
	                     
	                     
                         <div class="form-group" style="margin-bottom: 5px;">
                             <label class="control-label col-md-2 col-sm-2 col-xs-12" style="padding-top:0;">备注：
                             </label>
                             <div class="col-md-9 col-sm-9 col-xs-12">
                                 <textarea class="form-control" rows="5"
                                           name="remark"
                                           id="remark"
                                           placeholder=''></textarea>
                             </div>
                         </div>
                     </form>
                </div>
            </div>
            <div class="modal-footer" style="text-align:center;"> 
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitCallLog()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
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
                                <th width="90px" style="vertical-align:middle">发送时间</th>
                                <th width="53px">推送平台</th>
                                <th style="vertical-align:middle">发送内容</th>
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

<div class="spinner" style="display: none;">
  <div class="bounce1"></div>
  <div class="bounce2"></div>
  <div class="bounce3"></div>
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
	function isFa(){
		//已还期数
		var currentStage = '${orderRepaymentVO.currentStage }';
		//借款周期
    	var repaymentStage = '${orderRepaymentVO.repaymentStage }';
    	
    	  if(repaymentStage != 0){
    		  if(currentStage==repaymentStage){
      			$('#advance').attr('disabled','disabled');
      			$('#cancel').attr('disabled','disabled');
      		}else{
      			$('#advance').removeAttr('disabled');
      			$('#cancel').removeAttr('disabled');
      		}
    	  }else{
    		  $('#advance').attr('disabled','disabled');
    		  $('#cancel').attr('disabled','disabled');
    	  }
	}

    var table;
    
    
    function tonghua(){
    	$('#xuanzeqk').css('display','none')
    	$('#xuanzeqk3').css('display','block')
    	$('#xuanzeqk2').css('display','block')
    	$('#xuanzeqk1').css('display','block')
    	$('#xuanzeqk4').css('display','block')
    }
    
    
    function tonghua1(){
    	$('#xuanzeqk').css('display','block')
    	$('#xuanzeqk3').css('display','none')
    	$('#xuanzeqk2').css('display','none')
    	$('#xuanzeqk1').css('display','none')
    	$('#xuanzeqk4').css('display','none')
    }
 
    $(function () {
    	
    	//修改订单状态为已跟进
         var repaymentId = '${orderRepaymentVO.id}';
        var status = '02';//已跟进
        var url="${pageContext.request.contextPath}/mfq/distributionOrder/updateStatus.do";
        var req={
            repaymentId:repaymentId,
            status:status
        }
        $.ajax({
            url:url,
            data:req,
            dataType:"json",
            type:"get",
            success:function(data){}
        }); 
        
    	isFa();

        // 初始化 inputmask 金额格式校验
        $("#thirdMoney").inputmask("Regex");
        $("#debitMoney").inputmask("Regex");

        // advance button 提前还款
        $('#advance').click(function () {
        	advanceOrCancelMony('ADV');
        });

        // cancel button 用户退款
        $('#cancel').click(function () {
            advanceOrCancel('CANC');
        });

        // 手动扣款、三方扣款、部分扣款 按钮动态绑定
        $(document).on('click', ".btn-group > .dropdown-menu > li > a", function () {
            var debitType = $(this).attr('rel');
            var repaymentDetailId = $(this).attr('class');
            var thisStage = $(this).attr('thisStage');
			var needMoney = $(this).attr('needMoney');
            if (debitType != '') {
                initModalLabel(debitType, repaymentDetailId, thisStage, needMoney);
                $('#fc_debit').click();
                if(debitType != 'part'){
					$('#debitMoney').val(needMoney);
					$('#thirdMoney').val(needMoney);                	
                }
            }
        });

        // 点击「确定」执行扣款动作
        $('.modal-footer > .antosubmit').click(function () {
            var debitMoney = $('#debitMoney').val();
            var debitType = $('#debitType').val();
            var thirdMoney = $('#thirdMoney').val();
            var debitSource = $('#debitSource').val();
            var detailPaymentStage = $('#detailPaymentStage').val();
            var repaymentDetailId = $('#repaymentDetailId').val();
            
            $('#debit_modal').modal('hide');		// 先隐藏当前modal框
            var myModalLabel = $("#myModalLabel").text();
            var repaymentPrincipal = '${orderRepaymentVO.repaymentPrincipal}';   //月还本金
        	var currentStage = '${orderRepaymentVO.currentStage }';                //已还期数
        	var repaymentPrincipalSum = '${orderRepaymentVO.repaymentPrincipalSum }';  //总本金
        	var koudebitMoney = $("#koudebitMoney").val();  //扣款金额
        	var kkje = repaymentPrincipalSum-(repaymentPrincipal*currentStage);   //剩还本金
        	var debitMoneythirdMoney = (Number(debitMoney)+Number(thirdMoney)).toFixed(2);
        	if(myModalLabel == "提前还款"){
        		if(Number(debitMoneythirdMoney) < Number(koudebitMoney)){
            		$.confirm({
                        title: "系统提示",
                        text: '输入金额不能低于剩余应还本金:'+koudebitMoney,
                        confirmButton: '确认',
                        cancelButton: false,
                        confirm: function (button) {
                        	$('#debit_modal').modal('show');
                        }
                    });
            	}else{
            		// 表单校验
                    if(thirdMoney == ''){
                    	thirdMoney=0;
                    }else{
                    	thirdMoney = Number($('#thirdMoney').val());
                    }
                    checkModalForm(debitMoney, debitType, thirdMoney, debitSource, detailPaymentStage);
        			var opMoney = debitMoney;
        			if(debitType=="manual"){
        				opMoney = debitMoney;
        			}else if(debitType=="third"){
        			    opMoney = thirdMoney;
        			}else{
        			    opMoney =Number(debitMoney)+Number(thirdMoney);
        			}
                    $.confirm({
                        title: "确认扣款",
                        text: '您确定要执行本次扣款金额为' + opMoney + '扣款吗?',
                        confirmButton: '确认',
                        cancelButton: '取消',
                        confirm: function (button) {
                            debit(debitMoney, debitType, thirdMoney, debitSource, repaymentDetailId);
                        },
                        cancel: function (button) {
                            $('#debit_modal').modal('show');
                        }
                    });
            	}
        	}else{
        		// 表单校验
                if(thirdMoney == ''){
                	thirdMoney=0;
                }else{
                	thirdMoney = Number($('#thirdMoney').val());
                }
                checkModalForm(debitMoney, debitType, thirdMoney, debitSource, detailPaymentStage);
    			var opMoney = debitMoney;
    			if(debitType=="manual"){
    				opMoney = debitMoney;
    			}else if(debitType=="third"){
    			    opMoney = thirdMoney;
    			}else{
    			    opMoney =Number(debitMoney)+Number(thirdMoney);
    			}
                $.confirm({
                    title: "确认扣款",
                    text: '您确定要执行本次扣款金额为' + opMoney + '扣款吗?',
                    confirmButton: '确认',
                    cancelButton: '取消',
                    confirm: function (button) {
                        debit(debitMoney, debitType, thirdMoney, debitSource, repaymentDetailId);
                    },
                    cancel: function (button) {
                        $('#debit_modal').modal('show');
                    }
                });
        	}
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
            ajaxSource: '${pageContext.request.contextPath}/mfq/repayment/repaymentDetailList.do',
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
                        	//  console.log(obj.actualMoney+"实收金额");
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
                          "data": function (obj) {
                              var manualStr = '';
                              var thirdStr = '';
                              var partStr = '';
                              if (obj.status === '02' || obj.status === '07' || obj.status === '11'||obj.status === '12') {

                              } else {
                            	  //需还金额 = (应还本息 - 实收本金 - 实收利息)
                                  var rpMoney = new Decimal(obj.repaymentMoney);
                                  var apMoney =  new Decimal(obj.actualPrincipal);
                                  var aIMoney = new Decimal(obj.actualInterest);
                                  var needMoney = rpMoney.minus(apMoney).minus(aIMoney);
                                  var longLoan = $("#longLoan").val();
                                  if (longLoan != '' && longLoan != null) { // 证明是从民盛订单进来的详情
                                  } else {
                                     manualStr = '<li><a href="javascript:void(0);" needMoney="'+needMoney+'"  thisStage="'+ obj.repaymentStage +'" rel="manual" class="' + obj.id + '">手动扣款</a></li>';
                                      partStr = '<li><a href="javascript:void(0);" needMoney="'+needMoney+'"  thisStage="'+ obj.repaymentStage +'" rel="part" class="' + obj.id + '">部分扣款</a></li><li class="divider"></li>';
                                      // partStr = '<li class="divider"></li>';
                                  }
                                  thirdStr = '<li><a href="javascript:void(0);"  needMoney="'+needMoney+'" thisStage="'+ obj.repaymentStage +'" rel="third" class="' + obj.id + '">三方扣款</a></li>';

                              }

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

    })

    // 用户退款
    function advanceOrCancel(debitType) {
        // orderId
        var orderId = '${orderVO.id}';
        // repaymentId
        var repaymentId = '${orderRepaymentVO.id}';
        // first repaymentDate
        var firstRepaymentDate = '${repaymentDetailList[0].repaymentDate}';
        // 计算提前还款/退款需要支付的金额
        orderRepaymentDwr.getAdvanceOrCancelMony(orderId, repaymentId, debitType, new Date(firstRepaymentDate),
            {
                callback: function (data) {
                    initModalLabel(debitType, '', '', '');		// 提前还款「当前期」的 repaymentDetailId 为 空字符串，需要在后台获取
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
    } 
    
    //提前还款
    function advanceOrCancelMony(debitType) {
        // orderId
        var orderId = '${orderVO.id}';
        // repaymentId
        var repaymentId = '${orderRepaymentVO.id}';
        // first repaymentDate
        var firstRepaymentDate = '${repaymentDetailList[0].repaymentDate}';
        // 计算提前还款/退款需要支付的金额
        orderRepaymentDwr.getOrCancelMony(orderId, repaymentId, debitType, new Date(firstRepaymentDate),
            {
                callback: function (data) {
                    initModalLabel(debitType, '', '', '');		// 提前还款「当前期」的 repaymentDetailId 为 空字符串，需要在后台获取
                    $('#debitMoney').val(data);
                    $('#koudebitMoney').val(data);
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
    } 
    
    // update modal label and input hide 根据扣款操作类型动态显示/隐藏表单控件 和 初始化控件
      function initModalLabel(debitType, repaymentDetailId, thisStage, needMoney) {
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
                $('#detailPaymentStage').val(thisStage);
                $('#antoform > .form-group:eq(1)').hide();
                break;
            case 'manual':
                $('#myModalLabel').text('手动扣款');
                $('#detailPaymentStage').val(thisStage);
                $('#antoform > .form-group:eq(0)').hide();
                break;
            case 'part':
                $('#myModalLabel').text('部分扣款');
                $('#detailPaymentStage').val(thisStage);
                break;
            default:
                $('#myModalLabel').text('提前还款');
        }
        // 初始化控件默认值
        $('#debitType').val(debitType);
        $('#repaymentDetailId').val(repaymentDetailId);
        $('#debitMoney').val('0.00');
        $('#thirdMoney').val('0.00');
        $('#minMoney').val(needMoney);
        $('#debitSource').val('');
    }

    // ajax请求后台进行扣款
    function debit(debitMoney, debitType, thirdMoney, debitSource, repaymentDetailId) {
        $(".spinner").show();
        // orderId
        var orderId = '${orderVO.id}';
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
                    $(".spinner").hide();
                    var result = JSON.parse(data);
                    $.confirm({
                        title: "系统提示",
                        text: result.resp_msg,
                        confirmButton: '确认',
                        cancelButton: false,
                        confirm: function () {
                        	window.location.reload()
                        },
                    })
                    isFa();
					var rpId = $("#rpId").val();
					 $.ajax({
							url: "${pageContext.request.contextPath}/mfq/repayment/dhRepaymentDetailComplitCount.do",
							type: "post",
							data: {"repaymentId": rpId},
							success: function (currenStageObj) {
								var csObj = JSON.parse(currenStageObj);
								$("#currentStage").text(csObj.count);
							}
						});
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
    function checkModalForm(debitMoney, debitType, thirdMoney, debitSource, detailPaymentStage) {
    	var maxMoney = 50000;
        var message = '';
        if (debitType === 'ADV') {
            if (debitMoney <= 0 && thirdMoney <= 0) {
                message = '扣款金额格式有误！';
            }
            if (reg1.test(thirdMoney) && (debitSource == '' || debitSource == null)) {
                message = '请选择一个扣款来源！';
            }
            
        }
        if (debitType === 'CANC') {
            if (debitMoney < 0 && thirdMoney < 0) {
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
            var rpMoney = Number($("#minMoney").val());
            var thirdMoneyN = Number(thirdMoney);
            if (thirdMoneyN < rpMoney){
            	message = '三方已收金额不能低于当期剩余应还本息'+ rpMoney +'！';
            }
            if (thirdMoneyN > maxMoney){
            	message = '三方已收金额不能高于50000.00！';
            }
            if (reg1.test(thirdMoney) && (debitSource == '' || debitSource == null)) {
                message = '请选择一个扣款来源！';
            }
			var currentStage = Number($("#currentStage").text());
        	if ((currentStage+1)!=Number(detailPaymentStage)){
        		message = '请勿跨期操作！';
        	}
        }
        if (debitType === 'manual') {
            if (!reg1.test(debitMoney)) {
                message = '扣款金额格式有误！';
            }
            var rpMoney = Number($("#minMoney").val());
            var debitMoneyN = Number(debitMoney);
            if(debitMoneyN < rpMoney){
            	message = '扣款金额不能低于当期剩余应还本息'+ rpMoney +'！';
            }
            if(debitMoneyN > maxMoney){
            	message = '扣款金额不能高于50000.00！';
            }
        	var currentStage = Number($("#currentStage").text());
        	if ((currentStage+1)!=Number(detailPaymentStage)){
        		message = '请勿跨期操作！';
        	}
        }
        if (debitType === 'part') {
            if (debitMoney <= 0 && thirdMoney <= 0) {
                message = '扣款金额格式有误！';
            }
            if (reg1.test(thirdMoney) && (debitSource == '' || debitSource == null)) {
                message = '请选择一个扣款来源！';
            }
            var currentStage = Number($("#currentStage").text());
        	if ((currentStage+1)!=Number(detailPaymentStage)){
        		message = '请勿跨期操作！';
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
               // console.log(img.parent().parent().parent().parent().attr('data-size', realWidth + "x" + realHeight))

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

    function payList(repaymentId) {
    		 $(".spinner").show();
    		 $("#payListTbodyId").html("");
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
    	    	                    $(".spinner").hide();
    	    	                    var data = jQuery.parseJSON(res);
    	    	                    var payListTbody = '';
    	    	                    if(data.length == 0){
    	    	                       payListTbody = '<tr class="odd"><td valign="top" colspan="9" class="dataTables_empty">对不起，未查到记录！</td></tr>'
    	    	                    }else{
    	                        	        for (var i = 0; i < data.length; i++) {
		    	    	                        // 时间格式化
		    	    	                        var date = new Date(data[i].createTime);
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
		    	    	                        
		    	    	                        var chergeWay = data[i].chergeWay;    // 扣款方式
		    	    	                        if (chergeWay == "1") {
		    	    	                            chergeWay = '手动扣款';
		    	    	                        } else if(chergeWay == "2"){
		    	    	                            chergeWay = '退款';
		    	    	                        } else if(chergeWay == "3"){
		    	    	                            chergeWay = '提前还款';
		    	    	                        } else if(chergeWay == "4"){
		    	    	                            chergeWay = '三方扣款';
		    	    	                        } else if(chergeWay == "5"){
		    	    	                            chergeWay = '部分还款';
		    	    	                        } else if(chergeWay == "6"){
		    	    	                            chergeWay = '宝付定时任务';
		    	    	                        } else if(chergeWay == "7"){
		    	    	                            chergeWay = '先锋定时任务';
		    	    	                        }else{
		    	    	                            chergeWay = '-';
		    	    	                        }
		    	    	                        
		    	    	                        var handleType = data[i].handleType;    // 执行类型
		    	    	                        if (handleType == "1") {
		    	    	                            handleType = '定时任务';
		    	    	                        } else if(handleType == "2"){
		    	    	                            handleType = '系统代扣';
		    	    	                        } else if(handleType == "3"){
		    	    	                            handleType = '主动还款';
		    	    	                        } else{
		    	    	                            handleType = '-';
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
		    	    	                        payListTbody = payListTbody + '<tr style="font-size:11px;">'
		    	    	                            + '<th>' + formatDateTime(date) + '</th>'
		    	    	                            + '<th>' + parseFloat(moneyA + moneyB).toFixed(2) + '</th>'
		    	    	                            + '<th>' +  handleResult + '</th>'
		    	    	                            + '<th>' + handleSource + '</th>'
		    	    	                            + '<th>' + chergeWay + '</th>'
		    	    	                            + '<th>' + handleType + '</th>'
		    	    	                            + '<th style="word-wrap: break-word;">' + transSerialNo + '</th>'
		    	    	                            + '<th>' + data[i].userName + '</th>'
		    	    	                            + '<th>' + remarks + '</th>'
		    	    	                            + '</tr>';
		    	    	                    }
    	    	                    
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
        $(".spinner").show();
        $("#messageListTbodyId").html("");
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
                   // console.log(data)
                   $(".spinner").hide();
                    var messageListTbody = '';
                    if(data.length == 0){
    	    	        messageListTbody = '<tr class="odd"><td valign="top" colspan="3" class="dataTables_empty">对不起，未查到记录！</td></tr>'
    	    	    }else{
					  for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].sendtime);
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
                        messageListTbody = messageListTbody + '<tr style="font-size:11px;">'
                            + '<th>' + formatDateTime(date) + '</th>'
                            + '<th>' + type + '</th>'
                            + '<th>' + message + '</th>'
                            + '</tr>';
                       }
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
 
 
 
//获取验证码
    
    
    
/*     $("#btntime").click(function(){
        		$("#btntime").attr("disabled","disabled");
        		$("#btntime").attr("value","119s");
    			load($("#btntime"));
    		}); */
    
    
    function load(obj){
		var obj = $(obj);
		var time =119;
		var set=setInterval(function(){
		obj.val(--time + 's');
	}, 1000);
		
		setTimeout(function(){
			obj.attr("disabled",false).val("发送验证码");
			clearInterval(set);
		}, 119000)
		
	}


    // 添加沟通记录
    function submitCallLog() {
        var url = "${pageContext.request.contextPath}/mfq/distributionOrder/insertOrderCalllog.do";
        var callQuality = $("input[name='callQuality']:checked").val();
        var reason = $("input[name='reason']:checked").val();
        var calType = $("input[name='calType']:checked").val();
        var willingness = $("#willingness").val();
        var attitude = $("input[name='attitude']:checked").val();
        var debt = $("input[name='debt']:checked").val();
        var attachmentUrl = $("#attachmentUrl").val();
        var remark = $("#remark").val();
        var orderId = '${orderVO.id}';
        var repaymentId = '${orderRepaymentVO.id}';
        var req = {};
        if (callQuality == '1') {
            req = {
                callQuality: callQuality,
                reason: reason,
                remark: remark,
                orderId: orderId,
                repaymentId: repaymentId
            };
        } else {
            req = {
                callQuality: callQuality,
                reason: reason,
                calType: calType,
                willingness: willingness,
                attitude: attitude,
                debt: debt,
                attachmentUrl: attachmentUrl,
                remark: remark,
                orderId: orderId,
                repaymentId: repaymentId
            };
        }
        $.ajax({
            url: url,
            data: req,
            dataType: "json",
            type: "post",
            success: function (data) {
                if (data.code == 's') {
                    alert("新增记录成功");
                    location.reload(true);
                } else {
                    alert("新增记录失败:"+data.message);
                }
            }
        });
    }

    //文件上传
    function imgChange() {
        var formData = new FormData();
        formData.append('file', $('#attachmentUrl2')[0].files[0]);
        $.ajax({
            url: '${pageContext.request.contextPath}/mfq/distributionOrder/fileUpload.do',
            type: 'POST',
            cache: false,
            data: formData,
            processData: false,
            contentType: false
        }).done(function (res) {
            var data = jQuery.parseJSON(res);
            $("#attachmentUrl").val(data.path);
        }).fail(function (res) {
            $.confirm({
                title: '系统提示',
                text: "上传失败",
                confirmButton: '确认',
                cancelButton: false,
            });
        });
    }

	function formatDateTime(inputTime) {  
		    var date = new Date(inputTime);
		    var y = date.getFullYear();  
		    var m = date.getMonth() + 1;  
		    m = m < 10 ? ('0' + m) : m;  
		    var d = date.getDate();  
		    d = d < 10 ? ('0' + d) : d;  
		    var h = date.getHours();
		    h = h < 10 ? ('0' + h) : h;
		    var minute = date.getMinutes();
		    var second = date.getSeconds();
		    minute = minute < 10 ? ('0' + minute) : minute;  
		    second = second < 10 ? ('0' + second) : second; 
		    return y + '-' + m + '-' + d+'      '+h+':'+minute+':'+second;  
	};

 
</script>
</body>
</html>