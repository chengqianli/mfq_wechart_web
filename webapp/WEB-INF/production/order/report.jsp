<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE>
<html>
<head>
<%-- resource css --%>
	<%@ include file="/WEB-INF/common/resource_css.jsp" %>

<title>互联网咨信报告</title>
 <style type="text/css">
     .table td{text-align: left;}
    .report-hn{
        background-color: #659ee5;
        padding:8px 0;
        font-weight: bold;
    }
    .hidden{
        overflow: hidden;
    }
    .head{
        width: 100%;
        /* height: 100px; */
    }
    .head p{
        height: 40px;
        text-align: center;
        margin-top: 40px;
    }
    .head p span{
        font-size: 36px;
        font-weight: bold;
        line-height:40px;
    }
    .head p a{
        background-color:#659ee5;
        margin-top: -20px;
        border-radius:5px;
    }
    .user_info{
        overflow: hidden;
    }
    .user_info p{
        width: 50%;
        float: left;
    }
    .time{
        text-align: right;
    }
    .application{
        /* height: 400px; */
        /* border:1px solid red; */
        overflow: hidden;
    }
    .application p{
        color:white;
        height: 40px;
        /* background-color:#71aee1;  */
        background-color:#0f7fdc; 
        font-size: 14px;
        font-weight: bold;
        line-height: 40px;
        text-align: center;
        border-radius:5px 5px 0 0;
        margin-bottom: 25px;
    }
    .app_point{
        width: 8%;
        height: 40px;
        text-align: right;
        float: left;
        /* background-color: #CDCDCD; */
        background-color:#e3e3e3;
        line-height: 40px;
        font-size: 15px;
        
    }
    .app_value{
        width: 92%;
        float: left;
       /*  height: 40px; */
        font-size: 15px;
    }
    .app_value label{
        line-height: 40px;
        width: 50%;
        float: right;
    }
    .control-group{
        border-bottom:1px solid #CDCDCD;
    }
    .top_table{
        padding: 8px 10px;
        border-radius: 5px 5px 0 0;
        border: 1px solid #cdcdcd;
        /* background-color: #cdcdcd; */
        background-color:#e3e3e3;
        color: #009cdd;
        margin-top: 10px;
    }
    .boom{
        height:40px;
        margin-top: -20px;
        line-height: 40px;
        background-color: #d4a9bd;
    }
    .img_pro{
        margin-right: 5px;
    }
    .container-fluid{
    	background-color: #ffffff;
    	}
 </style>
</head>
<body>
    <div id="content" style="width:90%;padding:0px;margin:0px;margin:auto;">
        <c:choose>
            <c:when test="${report=='1'}">
                <div class="container-fluid"><div class="row-fluid" style="text-align: center; margin-top: 120px;"><h2>获取报告中，请稍后查看</h2></div></div>
            </c:when>
            <c:otherwise>
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="head">
                            <p>
                                <span>互联网资信报告</span>
                                <!-- <a type="button" style="cursor: pointer;" class="btn btn-success">打印</a> -->
                            </p>
                        </div>
                        <div class="user_info">
                            <p>编号：${report.report.rpt_id }</p>
                            <p class="time">
                                报告时间：
                                <%--  ${report.report.update_time }  --%>
                                <c:out value="${fn:substring(report.report.update_time,0,10)}"/>
                                <c:out value="${fn:substring(report.report.update_time,11,19)}"/>
                            </p>
                        </div>
                        
                        <!-- y用户申请表检测 -->
                        <div class="application">
                            <p>用户申请表检测</p>
                            <!-- 姓名 -->
                            <c:forEach items="${report.application_check }" var="applicationCheck">
                                <c:if test="${applicationCheck.app_point=='user_name'}">
                                     <div class="control-group" style="width: 100%;float: left;">
                                         <div class="input-append">
                                                <label for="inputEmail3" class="app_point control-label">姓名:&nbsp</label>
                                                <div class="controls app_value">
                                                  <label for="inputEmail3" style="float: left;" class="col-sm-9 control-label">&nbsp&nbsp${applicationCheck.check_points.key_value }</label>
                                                </div>
                                         </div>
                                     </div>
                                </c:if>
                                <!-- 身份证 -->
                                <c:if test="${applicationCheck.app_point=='id_card'}">
                                     <div class="control-group" style="width: 100%;float: left;">
                                         <div class="input-append">
                                                <label for="inputEmail3" class="app_point control-label">身份证:&nbsp</label>
                                                <div class="controls app_value">
                                                  
                                                   <label>&nbsp&nbsp
                                                    ${applicationCheck.check_points.gender }|${applicationCheck.check_points.age }|${applicationCheck.check_points.province }
                                                    ${applicationCheck.check_points.city }
                                                    ${applicationCheck.check_points.region }
                                                  </label> 
                                                  <label for="inputEmail3" class="col-sm-9 control-label">&nbsp&nbsp${applicationCheck.check_points.key_value }
                                                  
                                                    <c:if test="${applicationCheck.check_points.court_blacklist.arised=='true'}">
                                                        <a type="button" style="cursor: pointer;margin-top: 4px;background-color: #df3011" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/money.png">在法院黑名单里</a>
                                                    </c:if>
                                                    <c:if test="${applicationCheck.check_points.court_blacklist.arised!='true'}">
                                                        <a type="button" style="cursor: pointer;margin-top: 4px;" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/money.png">不在法院黑名单里</a>
                                                    </c:if>
                                                    
                                                    <c:if test="${applicationCheck.check_points.financial_blacklist.arised=='true'}">
                                                        <a type="button" style="cursor: pointer;margin-top: 4px;background-color: #df3011" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/money.png">在金融机构黑名单里</a>
                                                    </c:if>
                                                    <c:if test="${applicationCheck.check_points.financial_blacklist.arised!='true'}">
                                                        <a type="button" style="cursor: pointer;margin-top: 4px;" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/money.png">不在金融机构黑名单里</a>
                                                    </c:if>
                                                  </label>
                                                </div>
                                         </div>
                                     </div>
                                </c:if>
                               <!-- 电话 -->
                                <c:if test="${applicationCheck.app_point=='cell_phone'}">
                                     <div class="control-group" style="width: 100%;float: left;">
                                         <div class="input-append">
                                                <label for="inputEmail3" class="app_point control-label">手机号:&nbsp</label>
                                                <div class="controls app_value" style="height:;">
                                                  <label for="inputEmail3" class="col-sm-9 control-label">&nbsp&nbsp${applicationCheck.check_points.key_value }
                                                        <c:if test="${applicationCheck.check_points.financial_blacklist.arised=='true'}">
                                                            <a type="button" style="cursor: pointer;margin-top: 4px;background-color: #df3011" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/money.png">在金融机构黑名单里</a>
                                                        </c:if>
                                                        <c:if test="${applicationCheck.check_points.financial_blacklist.arised!='true'}">
                                                            <a type="button" style="cursor: pointer;margin-top: 4px;" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/money.png">不在金融机构黑名单里</a>
                                                        </c:if>
                                                  </label>
                                                  
                                                   <label>&nbsp&nbsp${applicationCheck.check_points.website }&nbsp|
                                                    
                                                   <c:if test="${applicationCheck.check_points.reliability=='实名认证'}">
                                                        <a type="button" style="cursor: pointer;margin-top: 4px;" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/man.png">实名认证</a>
                                                   </c:if>
                                                   <c:if test="${applicationCheck.check_points.reliability!='实名认证'}">
                                                        <a type="button" style="cursor: pointer;margin-top: 4px; background-color: #df3011" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/man.png">未实名认证</a>
                                                   </c:if>
                                                    注册时间：${applicationCheck.check_points.reg_time }
                                                  </label> 
                                                  
                                                  <!-- <label style="width:100%;color:#5bb75b;">
                                                    &nbsp&nbsp${applicationCheck.check_points.check_name }&nbsp<img alt="" src="/mfq/plugins/img/jinggao2.png">
                                                  </label>  -->
                                                  <!-- 用户名与运营商提供的姓名匹配情况 -->
                                                  <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(applicationCheck.check_points.check_name,'匹配成功') }">
                                                            <label style="width:100%; color:#5bb75b;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_name }&nbsp<img alt="" src="/mfq/plugins/img/jinggao2.png">
                                                            </label> 
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label style="width:100% ;color:#8f6d12;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_name }&nbsp<img alt="" src="/mfq/plugins/img/jinggao.png">
                                                            </label> 
                                                        </c:otherwise>
                                                  </c:choose>
                                                  <!-- 运营商提供的身份证号是否匹配成功 -->
                                                  <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(applicationCheck.check_points.check_idcard,'匹配成功') }">
                                                            <label style="width:100%; color:#5bb75b;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_idcard }&nbsp<img alt="" src="/mfq/plugins/img/jinggao2.png">
                                                            </label> 
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label style="width:100% ;color:#8f6d12;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_idcard }&nbsp<img alt="" src="/mfq/plugins/img/jinggao.png">
                                                            </label> 
                                                        </c:otherwise>
                                                  </c:choose>
                                                  
                                                  <%-- <c:if test="${fn:containsIgnoreCase(applicationCheck.check_points.check_idcard,'') }">
                                                         <label style="width:100% ;color:#8f6d12;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_idcard }&nbsp<img alt="" src="/mfq/plugins/img/jinggao.png">
                                                         </label> 
                                                  </c:if>
                                                  <c:if test="${applicationCheck.check_points.check_idcard!='运营商未提供身份证号码' }">
                                                         <label style="width:100%; color:#5bb75b;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_idcard }&nbsp<img alt="" src="/mfq/plugins/img/jinggao2.png">
                                                         </label> 
                                                  </c:if> --%>
                                                  <!-- <label style="width:100%">
                                                    &nbsp&nbsp${applicationCheck.check_points.check_idcard }
                                                  </label>  -->
                                                  <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(applicationCheck.check_points.check_ebusiness,'匹配成功') }">
                                                            <label style="width:100%; color:#5bb75b;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_ebusiness }&nbsp<img alt="" src="/mfq/plugins/img/jinggao2.png">
                                                            </label> 
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label style="width:100% ;color:#8f6d12;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_ebusiness }&nbsp<img alt="" src="/mfq/plugins/img/jinggao.png">
                                                            </label> 
                                                        </c:otherwise>
                                                  </c:choose>
                                                  <%-- <c:if test="${applicationCheck.check_points.check_ebusiness=='无法判断该号码的电商使用情况(无电商数据)' }">
                                                         <label style="width:100%; color:#8f6d12;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_ebusiness }&nbsp<img alt="" src="/mfq/plugins/img/jinggao.png">
                                                         </label> 
                                                  </c:if>
                                                  <c:if test="${applicationCheck.check_points.check_ebusiness!='无法判断该号码的电商使用情况(无电商数据)' }">
                                                         <label style="width:100%; color:#5bb75b;">
                                                                &nbsp&nbsp${applicationCheck.check_points.check_ebusiness }&nbsp<img alt="" src="/mfq/plugins/img/jinggao2.png">
                                                         </label> 
                                                  </c:if> --%>
                                                  <!-- <label style="width:100%">
                                                    &nbsp&nbsp${applicationCheck.check_points.check_ebusiness }
                                                  </label>  -->
                                                </div>
                                         </div>
                                     </div>
                                </c:if>
                                <!-- 居住地址 -->
                                <c:if test="${applicationCheck.app_point=='home_addr'}">
                                     <div class="control-group" style="width: 100%;float: left;">
                                         <div class="input-append">
                                                <label for="inputEmail3" class="app_point control-label">居住地址:&nbsp</label>
                                                <div class="controls app_value">
                                                   <label style="float: left;">&nbsp
                                                    ${applicationCheck.check_points.key_value }
                                                  </label> 
                                                  <label for="inputEmail3" class="col-sm-9 control-label" style="float: left;">
                                                   &nbsp    ${applicationCheck.check_points.check_ebusiness }
                                                  </label>
                                                </div>
                                         </div>
                                     </div>
                                </c:if>
                                <!-- 联系人 -->
                                <c:if test="${applicationCheck.app_point=='contact'}">
                                    <div class="control-group" style="width: 100%;float: left;">
                                         <div class="input-append">
                                                <label for="inputEmail3" class="app_point control-label">联系人:&nbsp;</label>
                                                <div class="controls app_value" style="height:;">
                                                    <label for="inputEmail3" class="col-sm-9 control-label">&nbsp;</label>
                                                    <label>&nbsp;&nbsp;${applicationCheck.check_points.relationship}|${applicationCheck.check_points.contact_name}|${applicationCheck.check_points.key_value}&nbsp;
                                                        <c:choose>
                                                            <c:when test="${fn:containsIgnoreCase(applicationCheck.check_points.check_xiaohao,'非临时小号') }">
                                                                <a type="button" style="cursor: pointer;margin-top: 4px;" class="btn btn-success"><img class="img_pro" alt="" src="/mfq/plugins/img/man.png">非临时小号</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a type="button" style="cursor: pointer;margin-top: 4px;background-color: #df3011" class="btn btn-success">${applicationCheck.check_points.check_xiaohao}</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </label> 
                                                    <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(applicationCheck.check_points.check_mobile,'没有') }">
                                                            <label style="width:100%; color:#5bb75b;">
                                                                &nbsp;&nbsp;${applicationCheck.check_points.check_mobile}&nbsp<img alt="" src="/mfq/plugins/img/jinggao.png">
                                                            </label> 
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label style="width:100% ;color:#8f6d12;">
                                                                &nbsp;&nbsp;${applicationCheck.check_points.check_mobile}&nbsp<img alt="" src="/mfq/plugins/img/jinggao2.png">
                                                            </label> 
                                                        </c:otherwise>
                                                    </c:choose>
                                              </div>
                                         </div>
                                     </div>
                                </c:if>
                                <!-- 家庭电话 -->
                                <c:if test="${applicationCheck.app_point=='home_phone'}">
                                     <div class="control-group" style="width: 100%;float: left;">
                                         <div class="input-append">
                                                <label for="inputEmail3" class="app_point control-label">家庭电话:&nbsp</label>
                                                <div class="controls app_value">
                                                  
                                                   <label style="float: left;">&nbsp
                                                    ${applicationCheck.check_points.check_mobile }
                                                  </label> 
                                                  <label for="inputEmail3" class="col-sm-9 control-label" style="float: left;">
                                                    &nbsp${applicationCheck.check_points.key_value }
                                                  </label>
                                                </div>
                                         </div>
                                     </div>
                                </c:if>
                             </c:forEach>
                        </div>
                    
                        <!-- 右半部分 -->
                        <div class="application" style="margin-top: 20px">
                            <p>用户信息检测</p>
                            <a style="" class="top_table">联系人数据</a>
                            
                            <table class="table table-bordered" style="    margin-top: 5px;">
                                <tr>
                                    <!-- <th>查询信息</th>
                                    <th>信息情况</th> -->
                                    <td rowspan="10">用户查询信息</td>
                                </tr>
                                <tr>
                                    <td>查询过该用户的相关企业数量（姓名+身份证+电话号码）</td>
                                    <td>
                                        ${report.user_info_check.check_search_info.searched_org_cnt }
                                    </td>
                                </tr>
                                <tr>
                                    <td>查询过该用户的相关企业类型（姓名+身份证+电话号码）</td>
                                    <td>
                                        <c:if test="${report.user_info_check.check_search_info.searched_org_type=='[]' }">
                                            <a type="button" style="cursor: pointer;" class="btn btn-success">无数据</a>
                                        </c:if>
                                        <c:if test="${report.user_info_check.check_search_info.searched_org_type!='[]' }">
                                            ${report.user_info_check.check_search_info.searched_org_type }
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>身份证组合过的其他姓名</td>
                                    <td>
                                        <c:if test="${report.user_info_check.check_search_info.idcard_with_other_names=='[]' }">
                                            <a type="button" style="cursor: pointer;" class="btn btn-success">无数据</a>
                                        </c:if>
                                        <c:if test="${report.user_info_check.check_search_info.idcard_with_other_names!='[]' }">
                                            ${report.user_info_check.check_search_info.idcard_with_other_names }
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>身份证组合过其他电话</td>
                                    <td><%-- ${report.user_info_check.check_search_info.idcard_with_other_phones } --%>
                                        <c:if test="${report.user_info_check.check_search_info.idcard_with_other_phones=='[]' }">
                                            <a type="button" style="cursor: pointer;" class="btn btn-success">无数据</a>
                                        </c:if>
                                        <c:if test="${report.user_info_check.check_search_info.idcard_with_other_phones!='[]' }">
                                            ${report.user_info_check.check_search_info.idcard_with_other_phones }
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>电话号码组合过其他姓名</td>
                                    <td><%-- ${report.user_info_check.check_search_info.phone_with_other_names } --%>
                                        <c:if test="${report.user_info_check.check_search_info.phone_with_other_names=='[]' }">
                                            <a type="button" style="cursor: pointer;" class="btn btn-success">无数据</a>
                                        </c:if>
                                        <c:if test="${report.user_info_check.check_search_info.phone_with_other_names!='[]' }">
                                            ${report.user_info_check.check_search_info.phone_with_other_names }
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>电话号码组合过其他身份证</td>
                                    <td><%-- ${report.user_info_check.check_search_info.phone_with_other_idcards } --%>
                                        <c:if test="${report.user_info_check.check_search_info.phone_with_other_idcards=='[]' }">
                                            <a type="button" style="cursor: pointer;" class="btn btn-success">无数据</a>
                                        </c:if>
                                        <c:if test="${report.user_info_check.check_search_info.phone_with_other_idcards!='[]' }">
                                            ${report.user_info_check.check_search_info.phone_with_other_idcards }
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>电话号码注册过的相关企业数量</td>
                                    <td>${report.user_info_check.check_search_info.register_org_cnt }</td>
                                </tr>
                                <tr>
                                    <td>电话号码注册过的相关企业类型</td>
                                    <td><%-- ${report.user_info_check.check_search_info.register_org_type } --%>
                                        <c:if test="${report.user_info_check.check_search_info.register_org_type=='[]' }">
                                            <a type="button" style="cursor: pointer;" class="btn btn-success">无数据</a>
                                        </c:if>
                                        <c:if test="${report.user_info_check.check_search_info.register_org_type!='[]' }">
                                            ${report.user_info_check.check_search_info.register_org_type }
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>电话号码出现过的百度贴吧</td>
                                    <td><%-- ${report.user_info_check.check_search_info.arised_open_web } --%>
                                        <c:if test="${report.user_info_check.check_search_info.arised_open_web=='[]' }">
                                            <a type="button" style="cursor: pointer;" class="btn btn-success">无数据</a>
                                        </c:if>
                                        <c:if test="${report.user_info_check.check_search_info.arised_open_web!='[]' }">
                                            ${report.user_info_check.check_search_info.arised_open_web }
                                        </c:if>
                                    </td>
                                </tr>
                            </table>
                            
                            <!-- 黑名单 -->
                            <a style="" class="top_table">黑名单</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                    <tr>
                                        <!-- <th>查询信息</th>
                                        <th>信息情况</th> -->
                                        <td rowspan="7">黑名单信息&nbsp&nbsp&nbsp</td>
                                    </tr>
                                    <tr>
                                        <td>用户号码联系黑中介分数</td>
                                        <td>${report.user_info_check.check_black_info.phone_gray_score }（分数范围0-100，参考分为10，分数越低关系越紧密）</td>
                                    </tr>
                                    <tr>
                                        <td>直接联系人中黑名单人数</td>
                                        <td>${report.user_info_check.check_black_info.contacts_class1_blacklist_cnt }（直接联系人：和被查询号码有通话记录）</td>
                                    </tr>
                                    <tr>
                                        <td>间接联系人中黑名单人数</td>
                                        <td>${report.user_info_check.check_black_info.contacts_class2_blacklist_cnt }（间接联系人：和被查询号码的直接联系人有通话记录）</td>
                                    </tr>
                                    <tr>
                                        <td>直接联系人人数</td>
                                        <td>${report.user_info_check.check_black_info.contacts_class1_cnt }（直接联系人：和被查询号码有通话记录）</td>
                                    </tr>
                                    <tr>
                                        <td>引起间接黑名单人数</td>
                                        <td>${report.user_info_check.check_black_info.contacts_router_cnt }（直接联系人有和黑名单用户的通讯记录的数量）</td>
                                    </tr>
                                    <tr>
                                        <td>直接联系人中引起间接黑名单占比</td>
                                        <td>
                                            <%-- ${report.user_info_check.check_black_info.contacts_router_ratio*100 }%（直接联系人有和黑名单用户的通讯记录的号码数量在直接联系人数量中的百分比） --%>
                                            <fmt:formatNumber type="number" value="${report.user_info_check.check_black_info.contacts_router_ratio*100}" maxFractionDigits="2"/>
                                            %（直接联系人有和黑名单用户的通讯记录的号码数量在直接联系人数量中的百分比）
                                        </td>
                                    </tr>
                                </table>
                        </div>
                      
                      <!-- 表1用户行为检测 -->
                      <div class="application" style="margin-top: 20px">
                            <p>用户行为检测</p>
                            <a style="" class="top_table">用户行为检测</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                            <tr>
                                <th style="font-size: 17px">检查项</th>
                                <th style="font-size: 17px">结果</th>
                                <th style="font-size: 17px">依据</th>
                            </tr>
                            
                            <c:forEach items="${report.behavior_check }" var="BehaviorCheck">
                                <tr>
                                    <td>${BehaviorCheck.check_point_cn }</td>
                                    <td>${BehaviorCheck.result }</td>
                                    <td>${BehaviorCheck.evidence }</td>
                                </tr>
                            </c:forEach>
                        </table>
                      </div>
                      
                        <!-- 表2移动运营商数据整理 -->
                         <div class="application" style="margin-top: 20px">
                            <p>运营商消费数据</p>
                            <a style="" class="top_table">运营商消费数据</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                            <tr>
                                <!--<th>运营商</th>  -->
                                <th>运营商(中文)</th>
                                <th>号码</th>
                                <th>归属地</th>
                                <th>月份</th>
                                <th>主叫时间（分钟）</th>
                                <th>被叫时间（分钟）</th>
                                <th>短信数量</th>
                                <th>流量M</th>
                                <th>话费消费</th>
                            </tr>
                            <c:forEach items="${report.cell_behavior}" var="behavior_Cell">
                                <c:forEach items="${behavior_Cell.behavior}" var="behavior">
                                    <tr>
                                        <!--<td>${behavior.cell_operator }</td>  -->
                                        <td>${behavior.cell_operator_zh }
                                            
                                        </td>
                                        <td>${behavior.cell_phone_num }</td>
                                        <td>${behavior.cell_loc }</td>
                                        <td>${behavior.cell_mth }</td>
                                        <td><%-- ${behavior.call_out_time } --%>
                                            <fmt:formatNumber type="number" value="${behavior.call_out_time }" maxFractionDigits="2"/>
                                        </td>
                                        <td><%-- ${behavior.call_in_time } --%>
                                            <fmt:formatNumber type="number" value="${behavior.call_in_time}" maxFractionDigits="2"/>
                                        </td>
                                        <td>${behavior.sms_cnt }</td>
                                        <td>${behavior.net_flow }</td>
                                        <td><%-- ${behavior.total_amount } --%>
                                            <c:if test="${behavior.total_amount=='-1.0' }">
                                                <a type="button" style="cursor: pointer;background-color: #df3011;" class="btn btn-success">无数据</a>
                                            </c:if>
                                            <c:if test="${behavior.total_amount!='-1.0' }">
                                                ${behavior.total_amount }
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:forEach>
                        </table>
                         </div>
                
                        <!-- 联系人区域汇总 -->
                        <div class="application" style="margin-top: 20px">
                            <p>联系人区域汇总</p>
                            <a style="" class="top_table">联系人区域汇总</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                <tr>
                                    <th>地区</th>
                                    <th>号码数量</th>
                                    <th>电话呼入次数</th>
                                    <th>电话呼入时间（分）</th>
                                    
                                    <th>平均呼入时间（分）</th>
                                    <th>电话呼入次数占比</th>
                                    <th>电话呼入时间占比</th>
                                    <th>电话呼出次数</th>
                                    <th>电话呼出时间（分）</th>
                                    <th>平均呼出时间（分）</th>
                                    <th>电话呼出次数占比</th>
                                    <th>电话呼出时间占比</th>
                                </tr>
                                <c:forEach items="${report.contact_region }" var="contactRegion">
                                    <tr>
                                        <td>${contactRegion.region_loc }</td>
                                        <td>${contactRegion.region_uniq_num_cnt }</td>
                                        <td>${contactRegion.region_call_in_cnt }</td>
                                        <td><%-- ${contactRegion.region_call_in_time } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_call_in_time}" maxFractionDigits="2"/>
                                        </td>
                                        <td><%-- ${contactRegion.region_avg_call_in_time } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_avg_call_in_time}" maxFractionDigits="2"/>
                                        </td>
                                        <td><%-- ${contactRegion.region_call_in_cnt_pct } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_call_in_cnt_pct*100}" maxFractionDigits="2"/>%
                                        </td>
                                        <td><%-- ${contactRegion.region_call_in_time_pct } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_call_in_time_pct*100}" maxFractionDigits="2"/>%
                                        </td>
                                        <td>${contactRegion.region_call_out_cnt }</td>
                                        <td><%-- ${contactRegion.region_call_out_time } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_call_out_time}" maxFractionDigits="2"/>
                                        </td>
                                        <td><%-- ${contactRegion.region_avg_call_out_time } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_avg_call_out_time}" maxFractionDigits="2"/>
                                        </td>
                                        <td><%-- ${contactRegion.region_call_out_cnt_pct } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_call_out_cnt_pct*100}" maxFractionDigits="2"/>%
                                        </td>
                                        <td><%-- ${contactRegion.region_call_out_time_pct } --%>
                                            <fmt:formatNumber type="number" value="${contactRegion.region_call_out_time_pct*100}" maxFractionDigits="2"/>%
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        
        
                        <!-- 运营商数据分析 -->
                        <div class="application" style="margin-top: 20px">
                            <p>运营商数据分析</p>
                            <a style="" class="top_table">运营商数据分析</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                <tr>
                                <th>号码</th>
                                <th>归属地</th>
                                <th>互联网标识</th>
                                <th>需求类型</th>
                                <th>主叫次数</th>
                                <th>主叫时间（分）</th>
                                <th>被叫次数</th>
                                <th>被叫时间（分）</th>
                                <th>联系次数</th>
                                <th>联系时间（分）</th>
                                <!--<th>最近一周</th>
                                <th>最近一月</th>
                                <th>最近三月</th>
                                <th>上午联系</th>
                                <th>中午联系</th>
                                <th>下午联系</th>
                                <th>晚上联系</th>
                                <th>凌晨联系</th>
                                <th>全天联系</th>
                                <th>周中联系</th>
                                <th>周末联系</th>
                                <th>节假日联系</th>  -->
                            </tr>
                            <c:forEach items="${report.contact_list }" var="contactCommunication">
                                <tr>
                                    <td>${contactCommunication.phone_num }</td>
                                    <td>${contactCommunication.phone_num_loc }</td>
                                    <td><%-- ${contactCommunication.contact_name } --%>
                                        <c:if test="${contactCommunication.contact_name=='未知'}">
                                            ${contactCommunication.contact_name }
                                        </c:if>
                                        <c:if test="${contactCommunication.contact_name!='未知'}">
                                            <a type="button" style="cursor: pointer;background-color: #0f7fdc" class="btn btn-success">${contactCommunication.contact_name }</a>
                                        </c:if>
                                    </td>
                                    <td>${contactCommunication.needs_type }</td>
                                    <td>${contactCommunication.call_out_cnt }</td>
                                    <td><%-- ${contactCommunication.call_out_len } --%>
                                        <fmt:formatNumber type="number" value="${contactCommunication.call_out_len}" maxFractionDigits="2"/>
                                    </td>
                                    <td>${contactCommunication.call_in_cnt }</td>
                                    <td><%-- ${contactCommunication.call_in_len } --%>
                                        <fmt:formatNumber type="number" value="${contactCommunication.call_in_len}" maxFractionDigits="2"/>
                                    </td>
                                    <td>${contactCommunication.call_cnt }</td>
                                    <td><%-- ${contactCommunication.call_len } --%>
                                        <fmt:formatNumber type="number" value="${contactCommunication.call_len}" maxFractionDigits="2"/>
                                    </td>
                                    <!--<td>${contactCommunication.contact_1w }</td>
                                    <td>${contactCommunication.contact_1m }</td>
                                    <td>${contactCommunication.contact_3m }</td>
                                    <td>${contactCommunication.contact_morning }</td>
                                    <td>${contactCommunication.contact_noon }</td>
                                    <td>${contactCommunication.contact_afternoon }</td>
                                    <td>${contactCommunication.contact_night }</td>
                                    <td>${contactCommunication.contact_early_morning }</td>
                                    <td>${contactCommunication.contact_all_day }</td>
                                    <td>${contactCommunication.contact_weekday }</td>
                                    <td>${contactCommunication.contact_weekend }</td>
                                    <td>${contactCommunication.contact_holiday }</td>-->
                                </tr>
                            </c:forEach>
                            </table>
                        </div>
        
                        <!-- 常用服务分析 -->
                        <div class="application" style="margin-top: 20px">
                            <p>运常用服务分析</p>
                            <a style="" class="top_table">常用服务分析</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                <tr>
                                    <th>服务企业类型</th>
                                    <th>企业名称</th>
                                    <th>总互动次数</th>
                                    <c:forEach items="${report.main_service}" var="main_service" varStatus="status">
                                        <c:if test="${status.index==0}">
                                            <c:forEach items="${main_service.service_details}" var="service_details">
                                                <th>${service_details.interact_mth}</th>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </tr>
                                <c:forEach items="${report.main_service}" var="mainService">
                                    <tr>
                                        <td>${mainService.company_type }</td>
                                        <td>${mainService.company_name }</td>
                                        <td>${mainService.total_service_cnt }</td>
                                        <c:forEach items="${mainService.service_details }" var="service_details">
                                           <td>${service_details.interact_cnt }</td>
                                        </c:forEach>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
        
                        <!-- 电商地址分析 -->
                        <div class="application" style="margin-top: 20px">
                            <p>电商地址分析 </p>
                            <a style="" class="top_table">电商地址分析 </a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                <tr>
                                    <th>地址</th>
                                    <th>预测地址类型</th>
                                    <th>最早时间</th>
                                    <th>最晚时间</th>
                                    <th>总消费次数</th>
                                    <th>总消费金额</th>
                                    <th>收货人姓名</th>
                                    <th>个人电话列表</th>
                                    <th>个人消费次数</th>
                                    <th>个人消费金额</th>
                                </tr>
                                <c:if test="${fn:length(report.deliver_address)!=0 }">
                                    <c:forEach items="${report.deliver_address }" var="deliverAddress">
                                            <tr>
                                                <td>${deliverAddress.address }</td>
                                                <td>${deliverAddress.predict_addr_type }</td>
                                                <td>${deliverAddress.begin_date }</td>
                                                <td>${deliverAddress.end_date }</td>
                                                <td>${deliverAddress.total_count }</td>
                                                <td><%-- ${deliverAddress.total_amount } --%>
                                                    <fmt:formatNumber type="number" value="${deliverAddress.total_amount}" maxFractionDigits="2"/>
                                                </td>
                                                <td>${deliverAddress.receiver.name }</td>
                                                <td>${deliverAddress.receiver.phone_num_list }</td>
                                                <td>${deliverAddress.receiver.count }</td>
                                                <td><%-- ${deliverAddress.receiver.amount } --%>
                                                    <fmt:formatNumber type="number" value="${deliverAddress.receiver.amount}" maxFractionDigits="2"/>
                                                </td>
                                            </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                            <c:if test="${fn:length(report.deliver_address)==0 }">
                                <div class="boom"><pre style="text-align: center;font-size: 15px;background-color: #eedee5;">未收集到电商数据</pre></div>
                            </c:if>
                        </div>
                        
                        <!-- 7电商月消费分析 -->
                        
                        <div class="application" style="margin-top: 20px">
                            <p>电商月消费分析</p>
                            <a style="" class="top_table">电商月消费分析 </a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                <tr>
                                    <th>月份</th>
                                    <th>全部消费笔数</th>
                                    <th>全部消费金额</th>
                                    <th>消费商品品类</th>
                                </tr>
                                <c:if test="${fn:length(report.ebusiness_expense)!=0 }">
                                    <c:forEach items="${report.ebusiness_expense }" var="ebusinessExpense">
                                        <tr>
                                            <td>${ebusinessExpense.trans_mth }</td>
                                            <td>${ebusinessExpense.all_count }</td>
                                            <td><%-- ${ebusinessExpense.all_amount } --%>
                                                <fmt:formatNumber type="number" value="${ebusinessExpense.all_amount}" maxFractionDigits="2"/>
                                            </td>
                                            <td>${ebusinessExpense.all_category}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                            <c:if test="${fn:length(report.ebusiness_expense)==0 }">
                                <div class="boom"><pre style="text-align: center;font-size: 15px;background-color: #eedee5;">未收集到电商月消费数据</pre></div>
                            </c:if>
                        </div>
                 
                        <!-- 联系人名单信息 -->
                        
                        <div class="application" style="margin-top: 20px">
                            <p>联系人名单</p>
                            <a style="" class="top_table">联系人名单</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                <tr>
                                    <th>联系人姓名</th>
                                    <th>最早时间</th>
                                    <th>最晚时间</th>
                                    <th>总消费次数</th>
                                    
                                    <th>总消费金额</th>
                                    <th>号码</th>
                                    <th>号码归属地</th>
                                    <th>拨打给申请人次数</th>
                                    
                                    <th>申请人拨打次数</th>
                                    <th>总计电话通数</th>
                                    <th>通话时长</th>
                                    <th>短信条数</th>
                                </tr>
                                <c:if test="${fn:length(report.collection_contact)!=0 }">
                                    <c:forEach items="${report.collection_contact }" var="collectionContact">
                                        <tr>
                                            <td>${collectionContact.contact_name }</td>
                                            <td>${collectionContact.begin_date }</td>
                                            <td>${collectionContact.end_date }</td>
                                            <td>${collectionContact.total_count }</td>
                                            <td><%-- ${collectionContact.total_amount } --%>
                                                <fmt:formatNumber type="number" value="${collectionContact.total_amount}" maxFractionDigits="2"/>
                                            </td>
                                            
                                            <td>${collectionContact.contact_details.phone_num }</td>
                                            <td>${collectionContact.contact_details.phone_num_loc }</td>
                                            <td>${collectionContact.contact_details.call_in_cnt }</td>
                                            <td>${collectionContact.contact_details.call_out_cnt }</td>
                                            <td>${collectionContact.contact_details.call_cnt }</td>
                                            <td><%-- ${collectionContact.contact_details.call_len } --%>
                                                <fmt:formatNumber type="number" value="${collectionContact.contact_details.call_len }" maxFractionDigits="2"/>
                                            </td>
                                            <td>${collectionContact.contact_details.sms_cnt }</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                            <c:if test="${fn:length(report.collection_contact)==0 }">
                                <div class="boom"><pre style="text-align: center;font-size: 15px;background-color: #eedee5;">未收集到联系人名单信息</pre></div>
                            </c:if>
                        </div>
                        
                        <!-- 出行分析 -->
                        
                        <div class="application" style="margin-top: 20px">
                            <p>出行分析</p>
                            <a style="" class="top_table">出行分析</a>
                            <table class="table table-bordered" style="margin-top:5px;">
                                <tr>
                                    <th>时间段</th>
                                    <th>出发时间</th>
                                    <th>回程时间</th>
                                    <th>出发地</th>
                                    <th>目的地</th>
                                </tr>
                                <c:if test="${fn:length(report.trip_info)!=0 }">
                                    <c:forEach items="${report.trip_info }" var="tripInfo">
                                        <tr>
                                            <td>${tripInfo.trip_type }</td>
                                            <td>${tripInfo.trip_start_time }</td>
                                            <td>${tripInfo.trip_end_time }</td>
                                            <td>${tripInfo.trip_leave }</td>
                                            <td>${tripInfo.trip_dest }</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                            
                            <c:if test="${fn:length(report.trip_info)==0 }">
                                <div class="boom"><pre style="text-align: center;font-size: 15px;background-color: #eedee5;">未收集到联系人名单信息</pre></div>
                            </c:if>
                        </div>
                        
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>