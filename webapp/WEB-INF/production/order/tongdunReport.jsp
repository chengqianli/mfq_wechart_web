<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
    <head>
        <title>同盾报告</title>
        <%-- resource js --%>
		<%@ include file="/WEB-INF/common/resource_js.jsp"%>
        <style>
            html,body {
                zoom: 1;
                z-index: 99999;
                height: 100%;
                position: relative;
                margin: 0;
                padding: 0;
            }
            .w30 {
                width: 30px !important;
            }
            .container {
                position: absolute;
                margin-left: -449px;
                top: 0;
                left: 35%;
                background-color: #f9f9f9;
                padding-top: 10px;
                padding-left: 20px;
                padding-right: 20px;
                font-size: 13px;
                width: 70%;
                min-height: 100%;
            }
            .header {
                font-size: 12px;
                overflow: hidden;
                padding: 13px 0px;
                font-family: STSong, NSimSun, SimSun, serif;
            }
            .header-title {
                margin: 0 10px 0 0;
                font-size: 20px;
                color: #333;
                font-family: 'Microsoft Yahei';
            }
            .header-report-id {
                margin-top: 8px;
            }
            
            .header-report-application {
                margin-top: 3px;
            }
            .header-scan-time {
                margin-top: 8px;
            }
             
            .header .report-application {
                margin-bottom: 2px;
            }
            /*个人基本信息*/
            .person-info {
                padding-top: 5px;
                border-top: 20px solid #f9f9f9;
                border-bottom: 10px solid #f9f9f9;
                position: relative;
                z-index: 997;
            }
            h2 {
                color: #666;
            }
            .rpi-subitem .fl {
                margin-top: 10px !important;
                margin: 0px;
            }
            .person-info .monitor-report-preloan,.person-info .monitor-report-loan {
                display: inline-block;
                width: 48%;
                font-size: 14px;
                color: #999;
            }
            .person-info .rpi-subitem {
                overflow: hidden;
                padding: 0 23px 16px;
                font-size: 14px;
                color: #999;
            }
            .person-info .pl30 {
                padding-left: 30px;
            }
            .person-info .rpi-subitem .rpi-title {
                font-size: 14px;
                padding-left: 0;
                margin-top: 0;
            }
            .person-info .rpi-subitem .rpi-subitem {
                padding: 0 0 0 16px;
            }
            .person-info .rpi-subitem p.fl,.person-info .rpi-subitem p.fr {
                display: inline-block;
                width: 49%;
            }
            .person-info .rpi-subitem .per49w {
                display: inline-block;
                width: 49%;
                height: 18px;
                line-height: 18px;
                margin-top: 0;
                vertical-align: top;
                /*overflow: hidden;*/
            } 
            .person-info .rpi-subitem .per98w {
                width: 98%;
            } 
            .person-info .rpi-subitem .p-hidden {
                height: 18px;
                line-height: 18px;
                overflow: hidden;
            }
            .person-info .contact-person {
                overflow: hidden;
            }
            .person-info .contact1_person,.person-info .contact2_person,.person-info .contact3_person
                {
                display: inline-block;
                width: 32%;
                vertical-align: top;
            }
            /*检测项目*/
            .rp-basic-check {
                padding: 10px 10px 10px 0px;
                color: #999;
            }
            .rp-item {
                border-bottom: 10px solid #f9f9f9;
                border-top: 20px solid #f9f9f9;
                position: relative;
                z-index: 997;
            }
            .table-wrap {
                padding: 0 20px 10px;
            }
            .check-table {
                font-size: 13px;
                padding-left: 20px;
                width: 100%;
                border-collapse: collapse;
            }
            .check-table thead {
                border-bottom: 2px solid #eaeaea;
            }
            .check-table .risk-item-name {
                color: #333;
            }
            .check-table .risk-item-level {
                color: #333;
                text-align: center;
            }
            .check-table .border-bottom-2 {
                border-bottom: 2px solid #eaeaea;
            }
            .check-table .border-bottom-1 {
                border-bottom: 1px solid #eaeaea;
            }
            .check-table th,.check-table td {
                padding-left: 10px;
                height: 36px;
                text-align: left;
            }
            .check-table .inline-center {
                text-align: center;
                padding-left: 0px;
            }
            .check-table .rownbsp {
                width: 18%;
            }
            .check-table .row1 {
                width: 30%;
            }
            .check-table .risk-item-level {
                color: #333;
                text-align: center;
            }
            .check-table .row3 { /*width:35%;*/
                
            }
            .check-table .row2 {
                width: 13%;
                text-align: center;
                padding-left: 0px;
            }
            .check-table .row4 {
                width: 13%;
            }
            .template-tip {
                padding: 0px 23px 0px 20px;
                color: #C00;
                display: none;
                font-size: 14px;
            }
            /*报告内自体的颜色*/
            .container .risk-content-count-now,.container .table-mark {
                color: #C00;
            }
            .label-number {
                font-size: 12px;
            }
            
            .label-span {
                color: #666;
                word-break: break-all;
                display: inline-block;
            }
            .label-title {
                display: inline-block;
                vertical-align: top;
            } 
            .label {
                color: #999;
                font-size: 14px;
            } 
            .rpi-title {
                font-size: 16px;
                font-weight: 700;
                padding: 0px 23px 0px 20px;
            } 
            .contact-person-title {
                font-size: 16px;
                font-weight: 700;
                padding: 0px 23px 0px 20px;
            } 
            /*报告头部信息*/
            .risk-score {
                height: 178px;
                position: relative;
            } 
            .result-score-wrap {
                width: 244px;
                height: 122px;
                position: absolute;
                top: 50%;
                left: 47px;
                margin-top: -61px;
            } 
            .result-score-canvas-main {
                position: absolute;
            } 
            #canvas-main {
                display: block;
                width: 244px;
                height: 122px;
            } 
            .result-score-canvas-bg {
                position: absolute;
            } 
            .result-score-text {
                top: 60%;
                left: 28px;
                width: 64px;
                margin-top: -42px;
                position: absolute;
            } 
            .result-score {
                font-size: 32px;
                color: #333;
                text-align: center;
            } 
            .result-cat {
                font-size: 14px;
                text-align: center;
                height: 23px;
                line-height: 23px;
                border-top: 1px solid #eee;
                border-bottom: 1px solid #eee;
            }
            .result-text {
                margin-top: 60px;
                margin-left: 325px;
                float: left;
            }
            .result-text .result {
                font-size: 14px;
                margin-top: 12px;
            }
            .result-text p {
                line-height: 1;
            }
            .result-text a {
                display: inline-block;
                color: #2ea5ff;
                height: 18px;
                line-height: 18px;
                padding: 0 2px;
                border-bottom: 1px solid #2ea5ff;
                text-decoration: none;
            } 
            .fl {
                float: left;
            }
            
            .fr {
                float: right;
            } 
            .result-text .tip {
                font-size: 16px;
                font-weight: 700;
            }
            
            .result-cat.reject {
                color: #ff6c5c;
            }
            
            .result-cat.accept {
                color: #8cdb65;
            }
            .result-cat.review {
                color: #f8d436;
            }
             
            .report-container {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                overflow-y: auto;
                background-color: #2e363f;
            } 
            .dimension-section,.risk-detail-section {
                padding-top: 1px;
                color: #666;
            }
            
            .risk-detail-section {
                width: 300px;
            }
            
            .dimension-title,.risk-detail-title {
                display: inline-block;
                cursor: pointer;
            }
            
            .dimension-list,.risk-detail-list {
                display: none;
                padding: 1px 0 0 20px;
                list-style: none;
            }
            
            .risk-detail-list {
                list-style-type: circle;
            }
            
            .dimension-item {
                padding-bottom: 3px;
            }
            
            .inner {
                background-color: #fff;
            }
            .person-info .left,.person-info .right {
                display: inline-block;
                width: 300px;
                margin: 0px 0px 14px 0px;
                height: 18px;
                line-height: 18px;
            }
        </style>
    </head>
    <body>
        <div class="report-container">
            <div class="container">
            <c:choose>
            <c:when test="${report.success==false || report.success=='false'}">
                <div><h2>无报告</h2></div>
            </c:when>
            <c:otherwise>
                <div class="header">
                    <h1 class="header-title fl">贷前审核报告</h1>
                    <div class="header-report-application  fl">
                        <div class="report-application">
                            <span class="label-number">报告编号:</span> <span
                                id="monitor-detail-id">${report.report_id}</span>
                        </div>
                        <div class="report-application">
                            <span class="label-number">申请编号:</span> <span
                                id="monitor-detail-id">${report.application_id}</span>
                        </div>
                    </div>
                    <div class="header-scan-time fr">
                        <span class="label-number">报告时间:</span> <span
                            id="monitor-scan-time">${report.rptTime}</span>
                    </div>
                </div>
                <div class="inner">
                    <div class="risk-score">
                        <div class="fl result-score-wrap">
                            <div class="result-score-canvas-main">
                                <canvas id="canvas-main"></canvas>
                            </div>
                            <div class="result-score-canvas-bg">
                                <canvas id="canvas-bg"></canvas>
                            </div>
                            <div class="result-score-text">
                                <div id="result-score" class="result-score">${report.final_score}</div>
                                <div id="result-cat" class="result-cat reject">${report.rptDecision}</div>
                            </div>
                        </div>
                        <div class="fl result-text">
                            <p class="tip">申请用户检测风险，${report.rptDecision}</p>
                            <p class="result"> 共发现<a id="risk-count" href="javascript:void(0);"><c:out value="${fn:length(report.risk_items)}"/></a>异常信息
                            </p>
                        </div>
                    </div>
                    <!-- 复杂入参start -->
                    <div class="person-info" style="border-bottom: 0;">
                        <h2 class="rpi-title">个人基本信息</h2>
                        <div class="rpi-subitem">
                            <p class="per49w">
                                <span class="label">申请借款金额: <span
                                    class="label-span"> ${order.finallySum}元 </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">申请借款期限: <span
                                    class="label-span"> ${order.stageValue}期 </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">申请借款日期: <span
                                    class="label-span"> ${order.createTime} </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">借款用途: <span
                                    class="label-span"> ${service.serviceName} </span> 
                                </span>
                            </p>
                            <p class="per49w">
                                <span class="label">进件省份: <span
                                    class="label-span"> ${provinceName} </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">进件城市: <span
                                    class="label-span"> ${cityName} </span> </span>
                            </p>
                        </div>
                        <div class="rpi-subitem">
                            <p class="per49w">
                                <span class="label">姓&nbsp;&nbsp;&nbsp;&nbsp;名:
                                    <span class="label-span"> ${base.realName} </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">身份证号:<span
                                    class="label-span">${base.idNumber}
                                </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">手机号码: <span
                                    class="label-span"> ${base.mobileNumber} </span>
                                </span>
                            </p>
                            <p class="per49w">
                                <span class="label">银行卡号: <span
                                    class="label-span">${bank.cardNumber}
                                </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">单位座机: <span
                                    class="label-span"> ${job.companyPhone} </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">学&nbsp;&nbsp;&nbsp;&nbsp;历:
                                    <span class="label-span"> 
                                        <c:forEach items="${usrTypes}" var="u">
                                            <c:if test="${u.key=='QF_USER_BASE_INFO.EDUCATION'}">
                                                <c:forEach items="${u.value}" var="t">
                                                    <c:if test="${t.code==base.education}">${t.name}</c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach> 
                                    </span>
                                </span>
                            </p>
                            <p class="per49w">
                                <span class="label">婚姻: 
                                    <span class="label-span"> 
                                        <c:forEach items="${usrTypes}" var="u">
                                            <c:if test="${u.key=='QF_USER_BASE_INFO.IS_MARRIED'}">
                                                <c:forEach items="${u.value}" var="t">
                                                    <c:if test="${t.code==base.isMarried}">${t.name}</c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>  
                                    </span>
                                </span>
                            </p>
                            <p class="per49w">
                                <span class="label">房产情况: 
                                    <span class="label-span"> 
                                        <c:forEach items="${usrTypes}" var="u">
                                            <c:if test="${u.key=='QF_USER_BASE_INFO.HOUSETYPE'}">
                                                <c:forEach items="${u.value}" var="t">
                                                    <c:if test="${t.code==base.houseType}">${t.name}</c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </span> 
                                </span>
                            </p>
                            <p class="per49w">
                                <span class="label">职业: 
                                    <span class="label-span"> 
                                        <c:forEach items="${usrTypes}" var="u">
                                            <c:if test="${u.key=='QF_USER_BASE_INFO.JOBTYPE'}">
                                                <c:forEach items="${u.value}" var="t">
                                                    <c:if test="${t.code==base.jobType}">${t.name}</c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </span> 
                                </span>
                            </p>
                            <p class="per49w">
                                <span class="label">工作时间: <span
                                    class="label-span"> ${job.workAges} </span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">工作单位: <span
                                    class="label-span"> ${job.companyName}</span> </span>
                            </p>
                            <p class="per49w">
                                <span class="label">年收入: 
                                    <span class="label-span"> 
                                        <c:forEach items="${workTypes}" var="w">
                                            <c:if test="${w.key=='QF_USER_JOB.INCOME_SUM'}">
                                                <c:forEach items="${w.value}" var="t">
                                                    <c:if test="${t.code==job.incomeSum}">${t.name}</c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach> 
                                    </span> 
                                </span>
                            </p>
                            <p class="p-hidden">
                                <span class="label">家庭地址: <span
                                    class="label-span">${base.addressDetail}
                                </span> </span>
                            </p>
                        </div>
    
                        <!--<div class="rpi-subitem">
                            <p>
                                <span class="label">用户承诺3个月内是否在其它平台申请借款:</span><span
                                    class="label-span">有借款申请</span><span
                                    class="label" style="margin-left: 30px">个数:1</span>
                            </p>
                            <p>
                                <span class="label">用户承诺3个月内是否在其它平台借款负债:</span><span
                                    class="label-span">有借款负债</span><span
                                    class="label" style="margin-left: 30px">个数:1</span>
                            </p>
                            <p>
                                <span class="label">身份证与姓名是否核实:</span><span
                                    class="label-span">有核实</span>
                            </p>
                        </div> 
                        <div class="contact-person">
                            <div class="contact1_person">
                                <h2 class="contact-person-title">第一联系人</h2>
                                <div class="rpi-subitem">
                                    <p>
                                        <span class="label">手机号码:</span> <span
                                            class="label-span">15510557731</span>
                                    </p>
                                    <p>
                                        <span class="label">家庭地址:</span><span
                                            class="label-span">黑龙江省哈尔滨市通河县富林乡岔林村</span>
                                    </p>
                                    <p>
                                        <span class="label">工作单位:</span><span
                                            class="label-span">地税局</span>
                                    </p>
                                    <p>
                                        <span class="label">单位地址:</span><span
                                            class="label-span">黑龙江省通河县</span>
                                    </p>
                                    <p>
                                        <span class="label">社会关系:</span><span
                                            class="label-span">父亲</span>
                                    </p>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <!--归属地解析-->
                    <c:if test="${report.address_detect != null}">
                        <div class="person-info">
                            <h2 class="rpi-title">归属地解析</h2>
                            <div class="rpi-subitem">
                                <c:if test="${report.address_detect.id_card_address != null}">
                                    <p class="p-hidden">
                                        <span class="label">身份证所属地: <span
                                            class="label-span"> ${report.address_detect.id_card_address} </span>
                                        </span>
                                    </p>
                                </c:if>
                                <c:if test="${report.address_detect.mobile_address != null}">
                                    <p class="p-hidden">
                                        <span class="label">手机所属地: <span
                                            class="label-span"> ${report.address_detect.mobile_address} </span>
                                        </span>
                                    </p>
                                </c:if>
                                <c:if test="${report.address_detect.true_ip_address != null}">
                                    <p class="p-hidden">
                                        <span class="label">ip所属地: <span
                                            class="label-span"> ${report.address_detect.true_ip_address} </span>
                                        </span>
                                    </p>
                                </c:if>
                                <c:if test="${report.address_detect.wifi_address != null}">
                                    <p class="p-hidden">
                                        <span class="label">wifi所属地: <span
                                            class="label-span"> ${report.address_detect.wifi_address} </span>
                                        </span>
                                    </p>
                                </c:if>
                                <c:if test="${report.address_detect.cell_address != null}">
                                    <p class="p-hidden">
                                        <span class="label">基站所属地: <span
                                            class="label-span"> ${report.address_detect.cell_address} </span>
                                        </span>
                                    </p>
                                </c:if>
                                <c:if test="${report.address_detect.bank_card_address != null}">
                                    <p class="p-hidden">
                                        <span class="label">银行卡归属地: <span
                                            class="label-span"> ${report.address_detect.bank_card_address} </span>
                                        </span>
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </c:if>
                    <!-- 检测项目 -->
                    <div class="rp-item rp-basic-check" id="risk-items">
                        <h2 class="rpi-title">贷前风险情况</h2>
                        <div class="table-wrap">
                            <table class="check-table">
                                <thead>
                                    <tr>
                                        <th class="rownbsp">&nbsp;</th>
                                        <th class="row1">检查项目</th>
                                        <th class="row2">风险等级</th>
                                        <th class="row3">备注</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${report.groupItems}" var="entry">
                                        <c:if test="${entry.value == null}">
                                            <tr class="border-bottom-2">
                                                <td>${entry.key}</td>
                                                <td colspan="3"><img style="width:20px;height:20px;" src="/mfq/plugins/img/pass.png"></td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${entry.value != null}">
                                            <c:forEach items="${entry.value}" var="list" varStatus="status">
                                                <tr class="risk-items-flag border-bottom-1">
                                                    <c:if test="${status.index==0}">
                                                        <td rowspan="${fn:length(entry.value)}">${entry.key}</td>
                                                    </c:if>
                                                    <td class="risk-item-name">${list.item_name}</td>
                                                    <td class="risk-item-level">${list.rptRiskLevel}</td>
                                                    <td>
                                                        <c:if test="${list.item_detail!= null}">
                                                            <ul class="table-mark">
                                                                <div class="risk-detail-section">
                                                                    <span class="risk-detail-title"><i class="iconfont icon-list"></i> 频度规则详情</span>
                                                                    <ul class="risk-detail-list">
                                                                        <!-- 信贷逾期名单 -->
                                                                        <c:if test="${list.item_detail.type=='discredit_count'}">
                                                                            <li class="risk-detail-item">
                                                                                <span class="risk-detail-item-title">信贷逾期次数：${list.item_detail.discredit_times}</span>
                                                                                <ul class="risk-detail-sub-list">
                                                                                    <c:forEach items="${list.item_detail.overdue_details}" var="overdue">
                                                                                        <li class="risk-detail-item">
                                                                                            <span class="risk-detail-item-title">
                                                                                                                                                                                                                                                    逾期金额：${overdue.overdue_amount_range},
                                                                                                                                                                                                                                                    逾期笔数：${overdue.overdue_count},
                                                                                                                                                                                                                                                    逾期天数：${overdue.overdue_day_range},
                                                                                                                                                                                                                                                    逾期日期：${overdue.overdue_time}                                                                                
                                                                                            </span>
                                                                                        </li>
                                                                                    </c:forEach>
                                                                                </ul>
                                                                            </li>
                                                                        </c:if>
                                                                        <!-- 借贷平台详情 -->
                                                                        <c:if test="${list.item_detail.type=='platform_detail'}">
                                                                            <li class="risk-detail-item">
                                                                                <span class="risk-detail-item-title">多头借贷：${list.item_detail.platform_count}</span>
                                                                            </li>
                                                                            <li class="risk-detail-item">
                                                                                <span class="risk-detail-item-title">借贷详情：
                                                                                    <c:forEach items="${list.item_detail.platform_detail}" var="dt">
                                                                                        <c:out value="${dt}" />
                                                                                    </c:forEach>
                                                                                </span>
                                                                            </li>
                                                                            <li class="risk-detail-item">
                                                                                <span class="risk-detail-item-title">多平台细分维度详情</span>
                                                                                <ul class="risk-detail-sub-list">
                                                                                    <c:forEach items="${list.item_detail.platform_detail_dimension}" var="dimension">
                                                                                        <li class="risk-detail-item">
                                                                                            <span class="risk-detail-item-title">
                                                                                              <span style="display:block;">维度展示名：${dimension.dimension}</span>
                                                                                              <span>维度命中多头个数：${dimension.count},</span>
                                                                                              <span>维度命中多头详情：${dimension.detail},</span>
                                                                                            </span>
                                                                                        </li>
                                                                                    </c:forEach>
                                                                                </ul>
                                                                            </li>
                                                                        </c:if>
                                                                        <!-- 高风险区域-->
                                                                        <c:if test="${list.item_detail.type=='custom_list'}">
                                                                            <li class="risk-detail-item">
                                                                                <span class="risk-detail-item-title">高风险区域：
                                                                                    <c:forEach items="${list.item_detail.high_risk_areas}" var="area">
                                                                                        <c:out value="${area}" />
                                                                                    </c:forEach>
                                                                                </span>
                                                                            </li>
                                                                            <li class="risk-detail-item">
                                                                                <span class="risk-detail-item-title">列表数据：
                                                                                    <c:forEach items="${list.item_detail.hit_list_datas}" var="datas">
                                                                                        <c:out value="${datas}" />
                                                                                    </c:forEach>
                                                                                </span>
                                                                            </li>
                                                                        </c:if>
                                                                        <!-- 频度详情 -->
                                                                        <c:if test="${list.item_detail.type=='frequency_detail'}">
                                                                            <c:forEach items="${list.item_detail.frequency_detail_list}" var="frequency">
                                                                                <li class="risk-detail-item">
                                                                                    <span class="risk-detail-item-title">${frequency.detail},${frequency.data}</span>
                                                                                 </li>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                        <!-- 跨事件频度统计详情 -->
                                                                        <c:if test="${list.item_detail.type=='cross_frequency_detail'}">
                                                                            <c:forEach items="${list.item_detail.cross_frequency_detail_list}" var="cross">
                                                                                <li class="risk-detail-item">
                                                                                    <span class="risk-detail-item-title">${cross.detail},${cross.data}</span>
                                                                                </li>
                                                                            </c:forEach>
                                                                            
                                                                        </c:if>
                                                                        <!-- 跨事件频度统计详情 -->
                                                                        <c:if test="${list.item_detail.type=='cross_event_detail'}">
                                                                            <c:forEach items="${list.item_detail.cross_event_detail_list}" var="event">
                                                                                <li class="risk-detail-item">
                                                                                    <span class="risk-detail-item-title">${event.detail},${event.data}</span>
                                                                                </li>
                                                                            </c:forEach>
                                                                            </li>
                                                                        </c:if>
                                                                        <!-- 跨事件频度统计详情 -->
                                                                        <c:if test="${list.item_detail.namelist_hit_details != null}">
                                                                            <c:forEach items="${list.item_detail.namelist_hit_details}" var="name">
                                                                                <li class="risk-detail-item">
                                                                                    <c:choose>
                                                                                        <c:when test="${name.type=='fuzzy_list'}">
                                                                                            <span class="risk-detail-item-title">模糊名单,${name.description}</span>
                                                                                            <ul class="risk-detail-sub-list">
                                                                                                <c:forEach items="${name.fuzzy_detail_hits}" var="fuzz">
                                                                                                    <li class="risk-detail-item">
                                                                                                        <span class="risk-detail-item-title">
                                                                                                         ${fuzzz.fraud_type}, ${fuzzz.fuzzy_name}, ${fuzzz.fuzzy_id_number}
                                                                                                        </span>
                                                                                                    </li>
                                                                                                </c:forEach>
                                                                                            </ul>
                                                                                        </c:when>
                                                                                        <c:when test="${name.type=='grey_list'}">
                                                                                            <span class="risk-detail-item-title">关注名单,${name.fraud_type},${name.hit_type_displayname},${name.description}</span>
                                                                                        </c:when>
                                                                                        <c:when test="${name.type=='black_list'}">
                                                                                            <span class="risk-detail-item-title">风险名单,${name.fraud_type},${name.hit_type_displayname},${name.description}</span>
                                                                                            <ul class="risk-detail-sub-list">
                                                                                                <c:forEach items="${name.court_details}" var="court">
                                                                                                    <li class="risk-detail-item">
                                                                                                        <span class="risk-detail-item-title">法院信息</span>
                                                                                                        <span class="risk-detail-item-title">风险类型：${court.fraud_type}</span>
                                                                                                        <span class="risk-detail-item-title">被执行人姓名：${court.name}</span>
                                                                                                        <span class="risk-detail-item-title">年龄：${court.age}</span>
                                                                                                        <span class="risk-detail-item-title">性别：${court.gender}</span>
                                                                                                        <span class="risk-detail-item-title">省份：${court.province}</span>
                                                                                                        <span class="risk-detail-item-title">立案时间：${court.filing_time}</span>
                                                                                                        <span class="risk-detail-item-title">执行法院：${court.court_name}</span>
                                                                                                        <span class="risk-detail-item-title">依据单位：${court.execution_department}</span>
                                                                                                        <span class="risk-detail-item-title">生效法律文书确定的义务：${court.duty}</span>
                                                                                                        <span class="risk-detail-item-title">被执行人的履行情况：${court.situation}</span>
                                                                                                        <span class="risk-detail-item-title">失信被执行人行为具体情形：${court.discredit_detail}</span>
                                                                                                        <span class="risk-detail-item-title">执行依据文号：${court.execution_base}</span>
                                                                                                        <span class="risk-detail-item-title">案号：${court.case_number}</span>
                                                                                                        <span class="risk-detail-item-title">执行标的：${court.execution_number}</span>
                                                                                                        <span class="risk-detail-item-title">执行状态：${court.execution_status}</span>
                                                                                                    </li>
                                                                                                </c:forEach>
                                                                                            </ul>
                                                                                        </c:when>
                                                                                    </c:choose>
                                                                                </li>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </ul>
                                                                </div>
                                                            </ul>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>  
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        <script type="text/javascript">
        $(function () {
            $("#risk-count").on("click", function () {
                var scrollHeight = $("#risk-items").offset().top;
                $(".report-container").animate({scrollTop: scrollHeight}, 300);
            });
            $(".report-container").on("click", function (e) {
                e = e || window.event;
                e.stopPropagation();
                e.preventDefault();
        
                $("#report-a-close").trigger("click");
            });
            $(".container").on("click", function (e) {
                e = e || window.event;
                e.stopPropagation();
                e.preventDefault();
            }) 
            if ($('#canvas-main').length > 0) {
                var canvasMain = $('#canvas-main')[0];
                var mainCtx = canvasMain.getContext('2d');
                var score = parseInt($('#result-score').text(), 10);
                var resultCat = $('#result-cat').text();
                var i = 1;
                if (score > 0 && score < 100) {
                    i = (100 - score) / 100;
                }
                if (score === 0) {
                    i = 1;
                }
                // console.log(i);
                mainCtx.rotate(-Math.PI / 2);
                mainCtx.lineWidth = 8;
                // console.log(resultCat);
                if (resultCat.indexOf('拒绝') > -1) {
                    $('#result-cat').addClass('reject');
                    mainCtx.strokeStyle = '#ff6c5c';
                } else if (resultCat.indexOf('通过') > -1) {
                    $('#result-cat').addClass('accept');
                    mainCtx.strokeStyle = '#8cdb65';
                } else if (resultCat.indexOf('审核') > -1) {
                    $('#result-cat').addClass('review');
                    mainCtx.strokeStyle = '#f8d436';
                }
                mainCtx.beginPath();
                mainCtx.arc(-75, 75, 69, 0, Math.PI * (i * 2), true);
                mainCtx.stroke();
                // 75, 75, 0
                // 17, 103, 0.1
                // -17, 104
        
                var canvasBg = $('#canvas-bg')[0];
                var bgCtx = canvasBg.getContext('2d');
                bgCtx.fillStyle = '#fafafa';
                bgCtx.beginPath();
                bgCtx.arc(61, 61, 52, 0, Math.PI * 2, true);
                bgCtx.closePath();
                bgCtx.fill();
            } 
            $('.risk-detail-title').on('click', function () {
                var detailList = $(this).next('.risk-detail-list');
                if (detailList.length) {
                    detailList.slideToggle(200);
                }
                //数据库中会出现这个※,换成*,主要原因太丑了
                var li = $(this).next('.risk-detail-list').find('.risk-detail-sub-list').children('li')
                $.each(li, function (index, value) {
                    var text = $(value).text().replace(/[※]/g, '*');
                    $(value).text(text);
                });
            });
        });
        </script>
    </body>
</html>