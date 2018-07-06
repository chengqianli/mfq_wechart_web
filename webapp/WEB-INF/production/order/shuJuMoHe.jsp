<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>运营商报告</title>
        <script type="text/javascript" src="/mfq/plugins/js/echarts.min.js" ></script>
        <style type="text/css">
        	body{
        		padding: 0px;
        		margin: 0px;
        		background-color: #2e363f;
        		font-size: 11px;
        		color: #888888;
        	}
        	.main{
        		width: 1442px;
        		margin-left: auto;
        		margin-right: auto;
        	}
        	.topDiv{
        		width: 1442px;
        		height: 63px;
        		background-color: white;
        	}
        	.centerDiv{
        		width: 1442px;
        		background-color: #ececec;
        		overflow: hidden;
        	}
        	.bottom{
        		width: 1442px;
        		height: 63px;
        		background-color: white;
        	}
        	.title1{
        		width: 1442px;
        		height: 30px;
        	}
        	#home{
        		display: inline-block;
        		height: 30px;
        		line-height: 30px;
        		margin-left: 24px;
        	}
        	#dataService{
        		font-weight: bold;
        		margin-left: 10px;
        		color: #666666;
        	}
        	.content{
        		width: 1403px;
        		margin-left: auto;
        		margin-right: auto;
        		background-color: white;
				margin-bottom: 30px;
				overflow: hidden;
				
        	}
        	
        	.reportAuthorization{
        		margin-left: 24px;
        		height: 100px;
        		line-height: 100px;
        	}
        	.title2{
        		width: 1345px;
        		height: 120px;
        		background-color: #f7f7f7;
        		margin-left: auto;
        		margin-right: auto;
        		border-radius: 0.5em;
        		overflow: hidden;
        	}
        	h1{
        		font-weight: inherit;
        		text-align: center;
				color: #666666;
        		margin-top: 28px;
        		margin-bottom: 0px;
        	}
        	ul{
        		width: 1345px;
        		margin-top: 20px;
        		padding: 0px;
        	}
        	li{
        		float: left;
        		list-style-type: none;
        		margin-left: 20px;
        		text-align: center;
        	}
        	.title3Div{
        		height: 47px;
        		width: 1343px;
        		border: 1px solid;
        		border-color: #d8d8d8;
        		margin-left: auto;
        		margin-right: auto;
        		margin-top: 15px;
        		border-top-right-radius: 0.5em;
        		border-top-left-radius: 0.5em;
        	}
        	.title3{
        		line-height: 47px;
        		margin-left: 20px;
        		color: #666666;
        	}
        	.basicInfoContent{
        		height: 428px;
        		width: 1343px;
        		border: 1px solid;
        		border-color: #d8d8d8;
        		border-top: 0px;
        		margin-left: auto;
        		margin-right: auto;
        		overflow: hidden;
        	}
        	.basicInfo{
        		width: 1343px;
        		height: 142px;
        		margin-top: 10px;
        		overflow: hidden;
        	}
        	.infoLeft{
        		width: 20%;
        		height: 100%;
        		display: inline-block;
        		margin-right: 0px;
        		float: left;
        	}
        	.infoRigth{
        		width: 80%;
        		height: 100%;
        		display: inline-block;
        		margin-left: 0px;
        		float: left;
        	}
        	.labelLeft{
        		display: block;
        		text-align: right;
        		margin-top: 18px;
        	}
        	.labelRight{
        		display: block;
        		margin-top: 18px;
        		height: 17px;
        		width: 100%;
        	}
        	.backImg{
        		width: 995px;
        		height: 100%;
        		background-color: #e4e4e4;
        		margin-left: 5px;
        		border-radius: 3px;
        		padding-left: 10px;
        		overflow: hidden;
        	}
        	table{
        		width: 1345px;
        		border-left: 1px solid;
        		border-color: #d8d8d8;
        		margin-left: auto;
        		margin-right: auto;
        		
        	}
        	tr:hover{
        		background-color: #eaf8fe;
        	}
        	th{
				height: 50px;  
				border-bottom: 1px solid;
				border-right: 1px solid;  
				border-color: #d8d8d8; 
				background-color: #f7f7f7;  
				color: #736f66; 
				text-align: left;
				padding-left: 20px;		
        	}
        	td{
				border-bottom: 1px solid;
				border-right: 1px solid;  
				border-color: #d8d8d8;
				text-align: left;
				padding-left: 20px;
				padding-top: 20px;
				padding-bottom: 20px;
        	}
        	.noData{
        		width: 1345px;
        		height: 50px;
        		line-height: 50px;
        		text-align: center;
        		border-bottom: 1px solid;
        		border-color: #d8d8d8;
        		margin-left: auto;
        		margin-right: auto;
        		background-image: url(img/zanWuShuJu.png);
        		background-repeat: no-repeat;
        		background-position: 480px center;
        	}
        	#figureTable1{
        		width: 1343px;
        		height:577px;
        		background-color: #f7f7f7;
        		margin-left: auto;
        		margin-right: auto;
        		border: 1px solid;
        		border-top: 0px;
        		border-color: #d8d8d8;
        	}
        	#figureTable2{
        		width: 1343px;
        		height:477px;
        		background-color: #f7f7f7;
        		margin-left: auto;
        		margin-right: auto;
        		border: 1px solid;
        		border-top: 0px;
        		border-color: #d8d8d8;
        	}
        	#figureTable2L{
        		height: 100%;
        		width: 50%;
        		display: inline-block;
        		float: left;
        	}
        	#figureTable2R{
        		height: 100%;
        		width: 50%;
        		display: inline-block;
        		float: right;
        	}
        	#figureTable3{
        		width: 1343px;
        		height:477px;
        		background-color: #f7f7f7;
        		margin-left: auto;
        		margin-right: auto;
        		border: 1px solid;
        		border-top: 0px;
        		border-color: #d8d8d8;
        	}
        	#figureTable3L{
        		height: 100%;
        		width: 50%;
        		display: inline-block;
        		float: left;
        	}
        	#figureTable3R{
        		height: 100%;
        		width: 50%;
        		display: inline-block;
        		float: right;
        	}
        	#figureTable4{
        		width: 1343px;
        		height:477px;
        		background-color: #f7f7f7;
        		margin-left: auto;
        		margin-right: auto;
        		border: 1px solid;
        		border-top: 0px;
        		border-color: #d8d8d8;
        	}
        	.useStatement{
        		width: 1323px;
        		height: 90px;
        		background-color: #f7f7f7;
        		margin-top: 30px;
        		margin-left: auto;
        		margin-right: auto;
        		margin-bottom: 30px;
        		padding-left: 20px;
        		padding-top: 20px;
        		border-radius: 3px;
        	}
        </style>
    </head>
    <body>
    	<div class="main">
    	<c:choose>
    		<c:when test="${getResultIsOk}">
    			<div class="topDiv">
	    		</div>
	    		<div class="centerDiv">
	    			<div class="title1">
	    				<span id="home">主页&nbsp;&nbsp;/</span><span id="dataService">数据服务</span>
	    			</div>
	    			<div class="content">
	    				<div class="reportAuthorization">
	    					本报告已经获得终端用户充分必要的授权
	    				</div>
	    				<div class="title2">
	    					<h1>运营商数据报告</h1>
	    					<ul>
	    						<li style="width: 27%;">编号:&nbsp;&nbsp;&nbsp;&nbsp;${reportInfo.report_id }</li>
	    						<li style="width: 15%;">运营商:&nbsp;&nbsp;&nbsp;&nbsp;${mobileInfo.mobile_carrier }</li>
	    						<li style="width: 20%;">报告时间:&nbsp;&nbsp;&nbsp;&nbsp;${reportInfo.report_update_time }</li>
	    						<li style="width: 30%;">数据时间范围:&nbsp;&nbsp;&nbsp;&nbsp;${minTime }——${maxTime }</li>
	    					</ul>
	    				</div>
	    				<div class="title3Div">
	    					<span class="title3" style="font-weight: bold;color: #666666; font-size: 13px;">
	    						基础信息
	    					</span>
	    				</div>
	    				<div class="basicInfoContent">
	    					<div class="basicInfo" style="margin-top: 24px; height: 66px;">
	    						<div class="infoLeft">
	    							<label class="labelLeft" style="margin-top: 9px;">姓名:</label>
	    							<label class="labelLeft">身份证号码:</label>
	    						</div>
	    						<div class="infoRigth">
	    							<div class="backImg">
	    								<label class="labelRight" style="margin-top: 9px;">${userInfo.real_name }</label>
	    								<label class="labelRight">${userInfo.identity_code }</label>
	    							</div>
	    						</div>
	    					</div>
	    					<div class="basicInfo">
	    						<div class="infoLeft">
	    							<label class="labelLeft" style="margin-top: 9px;">手机号码:</label>
	    							<label class="labelLeft">入网时间:</label>
	    							<label class="labelLeft">账户状态:</label>
	    							<label class="labelLeft">套餐类型:</label>
	    						</div>
	    						<div class="infoRigth">
	    							<div class="backImg">
	    								<label class="labelRight" style="margin-top: 9px;">${mobileInfo.user_mobile }</label>
	    								<label class="labelRight">${mobileInfo.mobile_net_time }</label>
	    								<label class="labelRight">${mobileInfo.account_status }</label>
	    								<label class="labelRight">无数据</label>
	    							</div>
	    						</div>
	    					</div>
	    					<div class="basicInfo">
	    						<div class="infoLeft">
	    							<label class="labelLeft" style="margin-top: 9px;">最近常用通话地:</label>
	    							<label class="labelLeft">入网归属地:</label>
	    							<label class="labelLeft">身份证归属地:</label>
	    							<label class="labelLeft">联系地址:</label>
	    						</div>
	    						<div class="infoRigth">
	    							<div class="backImg">
	    								<label class="labelRight" style="margin-top: 9px;">${call_area_city }</label>
	    								<label class="labelRight">${mobileInfo.mobile_net_addr }</label>
	    								<label class="labelRight">${userInfo.hometown }</label>
	    								<label class="labelRight">${mobileInfo.contact_addr }</label>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    				<div class="title3Div">
	    					<span class="title3">
	    						行为检测
	    					</span>
	    				</div>
	    				<form>
	    					<table cellpadding="0" cellspacing="0" border="0">
	    						<tr>
	    							<th>检查项目</th><th>检测结果</th>
	    						</tr>
	    						<tr>
	    							<td>
	    								手机静默使用情况
	    							</td>
	    							<td>
	    								最长连续静默天数:${activeSilenceStats.max_continue_silence_day_0call_6month }天<br/>
										月均手机静默天数:<fmt:formatNumber value="${activeSilenceStats.silence_day_0call_6month/6.0}" pattern="#.##" minFractionDigits="2" ></fmt:formatNumber>天<br/>
										连续静默天数超过15天的次数和记录:${activeSilenceStats.continue_silence_day_over15_0call_6month }<br/>
										连续静默天数超过3天的次数和记录:${activeSilenceStats.continue_silence_day_over3_0call_6month }<br/>
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								手机号入网时长
	    							</td>
	    							<td>
	    								手机号码入网时长:
	    								<c:choose>
	    									<c:when test="${mobileInfo.mobile_net_age != null}">
	    										${mobileInfo.mobile_net_age }月
	    									</c:when>
	    									<c:otherwise>
	    										无
	    									</c:otherwise>
	    								</c:choose>
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								异地使用情况
	    							</td>
	    							<td>
										最近常用通话地:${call_area_city }<br/>
										手机入网地:${mobileInfo.mobile_net_addr}<br/>
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								互通号码情况
	    							</td>
	    							<td>
	    								互通电话号码个数:${allContactStats.contact_count_mutual_6month }<br/>
										互通电话号码占比:
										<c:choose>
											<c:when test="${allContactStats.contact_count_6month == 0 }">
												0
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${allContactStats.contact_count_mutual_6month * 100.0/allContactStats.contact_count_6month}"></fmt:formatNumber>%
											</c:otherwise>
										</c:choose>
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								特殊号码通话记录
	    							</td>
	    							<td>
	    								110号码通话记录:
	    								<c:choose>
	    									<c:when test="${number110 != null}">
	    										${number110 }
	    									</c:when>
	    									<c:otherwise>
	    										0
	    									</c:otherwise>
	    								</c:choose>
	    								<br/>
										120号码通话记录:
										<c:choose>
	    									<c:when test="${number120 != null}">
	    										${number120 }
	    									</c:when>
	    									<c:otherwise>
	    										0
	    									</c:otherwise>
	    								</c:choose>
										<br/>
										澳门地区通话记录:	
										<c:choose>
	    									<c:when test="${numberMacau != null}">
	    										${numberMacau }
	    									</c:when>
	    									<c:otherwise>
	    										0
	    									</c:otherwise>
	    								</c:choose>
	    							</td>
	    						</tr>
	    						<tr>
	    							<td>
	    								主叫被叫通话详情
	    							</td>
	    							<td>
	    								主叫通话时长:${allContactStats.call_time_active_6month }分钟<br/>
										被叫通话时长:${allContactStats.call_time_passive_6month }分钟<br/>
										主叫被叫比例:
										<c:choose>
											<c:when test="${allContactStats.call_time_passive_6month == 0 }">
												0
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${allContactStats.call_time_active_6month / allContactStats.call_time_passive_6month}"></fmt:formatNumber>
											</c:otherwise>
										</c:choose>
										 : 1
	    							</td>
	    						</tr>
	    					</table>
	    				</form>
	    				<div class="title3Div">
	    					<span class="title3">
	    						紧急联系人
	    					</span>
	    				</div>
	    				<form>
	    					<table cellspacing="0" cellpadding="0" border="0">
	    						<tr>
	    							<th>手机号码</th>
	    							<th>归属地</th>
	    							<th>主叫时长(分钟)</th>
	    							<th>主叫时长占比(%)</th>
	    							<th>被叫时长(分钟)</th>
	    							<th>被叫时长占比(%)</th>
	    							<th>主叫次数</th>
	    							<th>被叫次数</th>
	    							<th>短信次数</th>
	    						</tr>
	    						<c:if test="${emergencyContactDetail1 != null}">
	    							<tr>
		    							<td>${emergencyContactDetail1.contact_number }</td>
		    							<td>${emergencyContactDetail1.contact_area }</td>
		    							<td>${emergencyContactDetail1.call_time_active_6month }</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${emergencyContactDetail1.call_time_6month == 0}">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										${emergencyContactDetail1.call_time_active_6month/emergencyContactDetail1.call_time_6month }
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${emergencyContactDetail1.call_time_passive_6month }</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${emergencyContactDetail1.call_time_6month == 0}">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										${emergencyContactDetail1.call_time_passive_6month/emergencyContactDetail1.call_time_6month }
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${emergencyContactDetail1.call_count_active_6month }</td>
		    							<td>${emergencyContactDetail1.call_count_passive_6month }</td>
		    							<td>${emergencyContactDetail1.msg_count_6month }</td>
		    						</tr>
	    						</c:if>
	    					</table>
	    				</form>
	    				<c:if test="${emergencyContactDetail1 == null}">
	    					<div class="noData">
	    						暂无数据
	    					</div>
	    				</c:if>
	    				<div class="title3Div">
	    					<span class="title3">
	    						亲情号联系人
	    					</span>
	    				</div>
	    				<form>
	    					<table cellpadding="0" cellspacing="0" border="0">
	    						<tr>
	    							<th>手机号码</th>
	    							<th>归属地</th>
	    							<th>主叫时长(分钟)</th>
	    							<th>主叫时长占比(%)</th>
	    							<th>被叫时长(分钟)</th>
	    							<th>被叫时长占比(%)</th>
	    							<th>主叫次数</th>
	    							<th>被叫次数</th>
	    							<th>短信次数</th>
	    						</tr>
	    						<c:if test="${homeTelDetail != null }">
	    							<tr>
		    							<td>${homeTelDetail.contact_number }</td>
		    							<td>${homeTelDetail.contact_area }</td>
		    							<td>${homeTelDetail.call_time_active_6month }</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${homeTelDetail.call_time_6month == 0}">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										${homeTelDetail.call_time_active_6month/homeTelDetail.call_time_6month }
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${homeTelDetail.call_time_passive_6month }</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${homeTelDetail.call_time_6month == 0}">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										${homeTelDetail.call_time_passive_6month/homeTelDetail.call_time_6month }
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${homeTelDetail.call_count_active_6month }</td>
		    							<td>${homeTelDetail.call_count_passive_6month }</td>
		    							<td>${homeTelDetail.msg_count_6month }</td>
		    						</tr>
	    						</c:if>
	    					</table>
	    				</form>
	    				<c:if test="${homeTelDetail == null }">
	    					<div class="noData">
	    						暂无数据
	    					</div>
	    				</c:if>
	    				<div class="title3Div">
	    					<span class="title3">
	    						常用联系人TOP10
	    					</span>
	    				</div>
	    				<form>
	    					<table cellspacing="0" cellpadding="0" border="0">
	    						<tr>
	    							<th style="width: 30px;"></th>
	    							<th>手机号码</th>
	    							<th>归属地</th>
	    							<th>主叫时长(分钟)</th>
	    							<th>主叫时长占比(%)</th>
	    							<th>被叫时长(分钟)</th>
	    							<th>被叫时长占比(%)</th>
	    							<th>主叫次数</th>
	    							<th>被叫次数</th>
	    							<th>短信次数</th>
	    						</tr>
	    						<c:forEach var="contactDetail" begin="0" end="9" varStatus="status" items="${allContactDetail}">
	    							<tr>
		    							<td>${status.index + 1}</td>
		    							<td>${contactDetail.contact_number }</td>
		    							<td>${contactDetail.contact_area }</td>
		    							<td>${contactDetail.call_time_active_6month }</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${contactDetail.call_time_6month == 0 }">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										<fmt:formatNumber value="${contactDetail.call_time_active_6month/contactDetail.call_time_6month }"></fmt:formatNumber>
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${contactDetail.call_time_passive_6month }</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${contactDetail.call_time_6month == 0 }">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										<fmt:formatNumber value="${contactDetail.call_time_passive_6month/contactDetail.call_time_6month }"></fmt:formatNumber>
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${contactDetail.call_count_active_6month }</td>
		    							<td>${contactDetail.call_count_passive_6month }</td>
		    							<td>${contactDetail.msg_count_6month }</td>
		    						</tr>
	    						</c:forEach>
	    					</table>
	    				</form>
	    				<div id="figureTable1"></div>
	    				<div class="title3Div">
	    					<span class="title3">
	    						联系人地区分布
	    					</span>
	    				</div>
	    				<form>
	    					<table cellpadding="0" cellspacing="0" border="0">
	    						<tr>
	    							<th>地区</th>
	    							<th>联系人数量</th>
	    							<th>联系人占比</th>
	    							<th>主叫时长(分钟)</th>
	    							<th>主叫时长占比</th>
	    							<th>被叫时长(分钟)</th>
	    							<th>被叫时长占比</th>
	    							<th>主叫次数</th>
	    							<th>被叫次数</th>
	    						</tr>
	    						<c:forEach var="contactArea" items="${contactAreaStatsPerCity }">
	    							<tr>
	    								<td>${contactArea.contact_area_city}</td>
		    							<td>${contactArea.contact_count_6month}</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${allAreaNum == 0}">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										<fmt:formatNumber value="${contactArea.contact_count_6month/allAreaNum }"></fmt:formatNumber>
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>
		    								${contactArea.call_time_active_6month}
		    							</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${contactArea.call_time_6month == 0 }">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										<fmt:formatNumber value="${contactArea.call_time_active_6month/contactArea.call_time_6month}"></fmt:formatNumber>
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${contactArea.call_time_passive_6month}</td>
		    							<td>
		    								<c:choose>
		    									<c:when test="${contactArea.call_time_6month == 0 }">
		    										0
		    									</c:when>
		    									<c:otherwise>
		    										<fmt:formatNumber value="${contactArea.call_time_passive_6month/contactArea.call_time_6month}"></fmt:formatNumber>
		    									</c:otherwise>
		    								</c:choose>
		    							</td>
		    							<td>${contactArea.call_count_active_6month}</td>
		    							<td>${contactArea.call_count_passive_6month}</td>
		    						</tr>
	    						</c:forEach>
	    					</table>
	    				</form>
	    				<div id="figureTable2">
	    					<div id="figureTable2L">
	    					</div>
	    					<div id="figureTable2R">
	    					</div>
	    				</div>
	    				<div class="title3Div">
	    					<span class="title3">
	    						运营商数据统计
	    					</span>
	    				</div>
	    				<form>
	    					<table cellspacing="0" cellpadding="0" border="0">
	    						<tr>
	    							<th>月份</th>
	    							<th>主叫时长(分钟)</th>
	    							<th>被叫时长(分钟)</th>
	    							<th>主叫次数</th>
	    							<th>被叫次数</th>
	    							<th>短信次数</th>
	    							<th>月消费金额(元)</th>
	    							<th>月充值金额(元)</th>
	    							
	    						</tr>
	    						<c:forEach var="allContactStats" items="${allContactStatsPerMonth }">
	    							<tr>
		    							<td>${allContactStats.month }</td>
		    							<td>${allContactStats.call_time_active }</td>
		    							<td>${allContactStats.call_time_passive }</td>
		    							<td>${allContactStats.call_count_active }</td>
		    							<td>${allContactStats.call_count_passive }</td>
		    							<td>${allContactStats.msg_count }</td>
		    							<td>
		    								<c:forEach var="carrierConsumption" items="${carrierConsumptionStatsPerMonth}">
		    									<c:if test="${allContactStats.month == carrierConsumption.month}">
		    										${carrierConsumption.consume_amount/100.0 }
		    									</c:if>
		    								</c:forEach>
		    							</td>
		    							<td>
		    								<c:forEach var="carrierConsumption" items="${carrierConsumptionStatsPerMonth}">
		    									<c:if test="${allContactStats.month == carrierConsumption.month}">
		    										${carrierConsumption.recharge_amount/100.0 }
		    									</c:if>
		    								</c:forEach>
		    							</td>
		    							
		    						</tr>
	    						</c:forEach>
	    					</table>
	    				</form>
	    				<div id="figureTable3">
	    					<div id="figureTable3L">
	    					</div>
	    					<div id="figureTable3R">
	    					</div>
	    				</div>
	    				<div class="title3Div">
	    					<span class="title3">
	    						通话地区分析
	    					</span>
	    				</div>
	    				<form>
	    					<table cellpadding="0" cellspacing="0" border="0">
	    						<tr>
	    							<th>通话地区</th>
	    							<th>通话天数</th>
	    							<th>主叫时长(分钟)</th>
	    							<th>被叫时长(分钟)</th>
	    							<th>主叫次数</th>
	    							<th>被叫次数</th>
	    						</tr>
	    						<c:forEach var="callAreaStatsPer"  items="${callAreaStatsPerCity }">
	    							<tr>
	    								<td>${callAreaStatsPer.call_area_city }</td>
		    							<td>${callAreaStatsPer.active_day_1call_6month }</td>
		    							<td>${callAreaStatsPer.call_time_active_6month }</td>
		    							<td>${callAreaStatsPer.call_time_passive_6month }</td>
		    							<td>${callAreaStatsPer.call_count_active_6month }</td>
		    							<td>${callAreaStatsPer.call_count_passive_6month }</td>	
	    							</tr>
	    						</c:forEach>
	    					</table>
	    				</form>
	    				<div id="figureTable4"></div>
	    				<div class="useStatement">
	    					使用声明:<br/>
							本报告仅限于约定的范围内使用<br/>
							本报告使用机构不得将报告数据提交给其他任何第三方,不承担因此造成的任何损失<br/>
							本报告分析结果仅供参考
	    				</div>
	    			</div>
	    		</div>
	    		<div class="bottom">
	    			
	    		</div>
    		</c:when>
    		<c:otherwise>
    				<h1 style="color: white;">无数据</h1>
    		</c:otherwise>
    	</c:choose>	
    	</div>
 	</body>
 	
 	
 	<script type="text/javascript">
 		// 常用联系人通话情况条形统计图
        var frContacts = echarts.init(document.getElementById('figureTable1'));
        // 指定图表的配置项和数据
        var frContactsJson = {
        	color: ['#64d8ea','#fde394'],
        	backgroundColor:'#f7f7f7',
            title : {
		        text: '常用联系人通话情况',
   			},
    	tooltip : {
       		 trigger: 'axis'
    	},
    	legend: {
        	data:['主叫时长（分钟）','被叫时长（分钟）']
    	},
    	toolbox: {
        	show : true,
        	feature : {
            	dataView : {show: true, readOnly: false},
            	magicType : {show: true, type: ['line', 'bar']},
            	restore : {show: true},
            	saveAsImage : {show: true}
        	}
    	},
    	calculable : true,
    	xAxis : [
       		{
            	type : 'category',
       			data : ['${contactNumberTop10[0]}', '${contactNumberTop10[1]}', '${contactNumberTop10[2]}', '${contactNumberTop10[3]}', '${contactNumberTop10[4]}', '${contactNumberTop10[5]}', '${contactNumberTop10[6]}', '${contactNumberTop10[7]}', '${contactNumberTop10[8]}', '${contactNumberTop10[9]}']
        	}
    	],
    	yAxis : [
        	{
            	type : 'value',
        	}
   		 ],
	    series : [
	        {
	            name:'主叫时长（分钟）',
	            type:'bar',
	            data:["${active6monthTop10[0]}", "${active6monthTop10[1]}", "${active6monthTop10[2]}", "${active6monthTop10[3]}", "${active6monthTop10[4]}", "${active6monthTop10[5]}", "${active6monthTop10[6]}", "${active6monthTop10[7]}", "${active6monthTop10[8]}","${active6monthTop10[9]}"],
	            markPoint : {
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ]
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ]
	            }
	        },
	        {
	            name:'被叫时长（分钟）',
	            type:'bar',
	            data:["${passive6month10[0]}", "${passive6month10[1]}", "${passive6month10[2]}", "${passive6month10[3]}", "${passive6month10[4]}", "${passive6month10[5]}", "${passive6month10[6]}", "${passive6month10[7]}", "${passive6month10[8]}", "${passive6month10[9]}"],
	            markPoint : {
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ]
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name : '平均值'}
	                ]
	            }
	        }
	    ]
        };
        frContacts.setOption(frContactsJson);
        
        //地区联系人数量分布
        var areaContactsL = echarts.init(document.getElementById('figureTable2L'));
        var areaContactsLJson = {
        	 title : {
		        text: '地区联系人数量分布',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['${contactAreaStatsPerCity[0].contact_area_city}',
		               '${contactAreaStatsPerCity[1].contact_area_city}',
		               '${contactAreaStatsPerCity[2].contact_area_city}',
		               '${contactAreaStatsPerCity[3].contact_area_city}',
		               '${contactAreaStatsPerCity[4].contact_area_city}']
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:"${contactAreaStatsPerCity[0].contact_count_6month}", name:'${contactAreaStatsPerCity[0].contact_area_city}'},
		                {value:"${contactAreaStatsPerCity[1].contact_count_6month}", name:'${contactAreaStatsPerCity[1].contact_area_city}'},
		                {value:"${contactAreaStatsPerCity[2].contact_count_6month}", name:'${contactAreaStatsPerCity[2].contact_area_city}'},
		                {value:"${contactAreaStatsPerCity[3].contact_count_6month}", name:'${contactAreaStatsPerCity[3].contact_area_city}'},
		                {value:"${contactAreaStatsPerCity[4].contact_count_6month}", name:'${contactAreaStatsPerCity[4].contact_area_city}'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
        };
        areaContactsL.setOption(areaContactsLJson);
        
        //地区联系人通话时长
        var areaContactsR = echarts.init(document.getElementById('figureTable2R'));
        var areaContactsRJson = {
        	color: ['#64d8ea','#fde394'],
        	backgroundColor:'#f7f7f7',
        	title : {
		        text: '地区联系人通话时长',
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['主叫时长（分钟）','被叫时长（分钟）']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            data : ['${contactAreaStatsPerCity[0].contact_area_city}',
		                    '${contactAreaStatsPerCity[1].contact_area_city}',
		                    '${contactAreaStatsPerCity[2].contact_area_city}',
		                    '${contactAreaStatsPerCity[3].contact_area_city}',
		                    '${contactAreaStatsPerCity[4].contact_area_city}']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'主叫时长（分钟）',
		            type:'bar',
		            data:["${contactAreaStatsPerCity[0].call_time_active_6month}",
		                  "${contactAreaStatsPerCity[1].call_time_active_6month}",
		                  "${contactAreaStatsPerCity[2].call_time_active_6month}",
		                  "${contactAreaStatsPerCity[3].call_time_active_6month}",
		                  "${contactAreaStatsPerCity[4].call_time_active_6month}"],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            }
		        },
		        {
		            name:'被叫时长（分钟）',
		            type:'bar',
		            data:["${contactAreaStatsPerCity[0].call_time_passive_6month}",
		                  "${contactAreaStatsPerCity[1].call_time_passive_6month}",
		                  "${contactAreaStatsPerCity[2].call_time_passive_6month}",
		                  "${contactAreaStatsPerCity[3].call_time_passive_6month}",
		                  "${contactAreaStatsPerCity[4].call_time_passive_6month}"],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name : '平均值'}
		                ]
		            }
		        }
		    ]
        };
        areaContactsR.setOption(areaContactsRJson);
        
        //6个月通话数据统计
        var sixMothsContectData = echarts.init(document.getElementById('figureTable3L'));
        var sixMothsContectDataJson = {
        	color: ['#64d8ea','#fde394'],
        	backgroundColor:'#f7f7f7',
        	title : {
		        text: '6个月通话数据统计',
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['主叫时长（分钟）','被叫时长（分钟）']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            data : ["${allContactStatsPerMonth[0].month}",
		                    "${allContactStatsPerMonth[1].month}",
		                    "${allContactStatsPerMonth[2].month}",
		                    "${allContactStatsPerMonth[3].month}",
		                    "${allContactStatsPerMonth[4].month}",
		                    "${allContactStatsPerMonth[5].month}"
		                    ]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'主叫时长（分钟）',
		            type:'bar',
		            data:["${allContactStatsPerMonth[0].call_time_active}",
		                  "${allContactStatsPerMonth[1].call_time_active}",
		                  "${allContactStatsPerMonth[2].call_time_active}",
		                  "${allContactStatsPerMonth[3].call_time_active}",
		                  "${allContactStatsPerMonth[4].call_time_active}",
		                  "${allContactStatsPerMonth[5].call_time_active}"
		                    ],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            }
		        },
		        {
		            name:'被叫时长（分钟）',
		            type:'bar',
		            data:["${allContactStatsPerMonth[0].call_time_passive}",
		                  "${allContactStatsPerMonth[1].call_time_passive}",
		                  "${allContactStatsPerMonth[2].call_time_passive}",
		                  "${allContactStatsPerMonth[3].call_time_passive}",
		                  "${allContactStatsPerMonth[4].call_time_passive}",
		                  "${allContactStatsPerMonth[5].call_time_passive}"
		                    ],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name : '平均值'}
		                ]
		            }
		        }
		    ]
        };
        sixMothsContectData.setOption(sixMothsContectDataJson);
        
        //6个月消费数据统计
        var sixMothsFeeData = echarts.init(document.getElementById('figureTable3R'));
        var sixMothsFeeDataJson = {
        	color: ['#64d8ea','#fde394'],
        	backgroundColor:'#f7f7f7',
        	title : {
		        text: '6个月消费数据统计'
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['月消费金额（元）','月充值金额（元）']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            data : ["${carrierConsumptionStatsPerMonth[0].month}",
		                    "${carrierConsumptionStatsPerMonth[1].month}",
		                    "${carrierConsumptionStatsPerMonth[2].month}",
		                    "${carrierConsumptionStatsPerMonth[3].month}",
		                    "${carrierConsumptionStatsPerMonth[4].month}",
		                    "${carrierConsumptionStatsPerMonth[5].month}"
		                    ]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'月消费金额（元）',
		            type:'bar',
		            data:["${carrierConsumptionStatsPerMonth[0].consume_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[1].consume_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[2].consume_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[3].consume_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[4].consume_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[5].consume_amount/100.0}"
		                    ],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            }
		        },
		        {
		            name:'月充值金额（元）',
		            type:'bar',
		            data:["${carrierConsumptionStatsPerMonth[0].recharge_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[1].recharge_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[2].recharge_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[3].recharge_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[4].recharge_amount/100.0}",
		                   "${carrierConsumptionStatsPerMonth[5].recharge_amount/100.0}"
		                    ],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name : '平均值'}
		                ]
		            }
		        }
		    ]
        };
        sixMothsFeeData.setOption(sixMothsFeeDataJson);
        
        //地区通话天数分布
        var areaContacts = echarts.init(document.getElementById('figureTable4'));
        var areaContactsJson = {
        	 title : {
		        text: '地区通话天数分布',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['${callAreaStatsPerCity[0].call_area_city}',
		               '${callAreaStatsPerCity[1].call_area_city}',
		               '${callAreaStatsPerCity[2].call_area_city}',
		               '${callAreaStatsPerCity[3].call_area_city}',
		               '${callAreaStatsPerCity[4].call_area_city}']
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:'${callAreaStatsPerCity[0].active_day_1call_6month}', name:'${callAreaStatsPerCity[0].call_area_city}'},
		                {value:'${callAreaStatsPerCity[1].active_day_1call_6month}', name:'${callAreaStatsPerCity[1].call_area_city}'},
		                {value:'${callAreaStatsPerCity[2].active_day_1call_6month}', name:'${callAreaStatsPerCity[2].call_area_city}'},
		                {value:'${callAreaStatsPerCity[3].active_day_1call_6month}', name:'${callAreaStatsPerCity[3].call_area_city}'},
		                {value:'${callAreaStatsPerCity[4].active_day_1call_6month}', name:'${callAreaStatsPerCity[4].call_area_city}'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
        };
        areaContacts.setOption(areaContactsJson);
 	</script>
</html>