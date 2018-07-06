<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>数美逾期黑名单</title>
        <style type="text/css">
        	body{
        		margin: 0px;
        		padding: 0px;
        		background-color: #2e363f;
        	}
        	.main{
        		width: 1500px;
        		background-color: white;
        		margin-left: auto;
        		margin-right: auto;
        		color: #363636;
        		overflow: hidden;
        	}
        	h1{
        		font-size: 19px;
        		text-align: center;
        		font-weight: inherit;
        	}
        	img{
        		margin-left: 250px;
        		margin-top: 40px;
        	}
        	.baseInfo{
        		width: 900px;
        		height: 100px;
        		margin-right: auto;
        		margin-left: auto;
        	}
        	.baseInfoDiv{
        		height: 50%;
        		width: 50%;
        		float: left;
        		line-height: 50px;
        	}
        	.content{
        		width: 900px;
        		height: 750px;
        		margin-left: auto;
        		margin-right: auto;
        		margin-top: 0px;
        	}
        	p{
				height: 40px;
				line-height: 40px;
				margin: 0px;
				font-size: 16px;
        	}
        </style>
    </head>
    <body>
    	<c:choose>
    		<c:when test="${result == 'success'}">
    			<div class="main">
		    		<h1>数美逾期黑名单</h1>
		    		<img src="${pageContext.request.contextPath}/build/images/base_info.png"/>
		    		<div class="baseInfo">
		    			<div class="baseInfoDiv">姓名&nbsp;&nbsp;&nbsp;&nbsp;${userBaseInfo.realName }</div>
		    			<div class="baseInfoDiv">身份证号&nbsp;&nbsp;&nbsp;&nbsp;${userBaseInfo.idNumber }</div>
		    			<div class="baseInfoDiv">手机号&nbsp;&nbsp;&nbsp;&nbsp;${userBaseInfo.mobileNumber }</div>
		    			<div class="baseInfoDiv">银行卡号&nbsp;&nbsp;&nbsp;&nbsp;${userBank.cardNumber }</div>
		    		</div>
		    		<img src="${pageContext.request.contextPath}/build/images/blacklist.png" style="margin-top: 15px;"/>
		    		<div class="content">
		    			<p style="margin-top: 20px;">
		    				是否命中黑名单&nbsp;&nbsp;&nbsp;&nbsp;---------------------------------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
		    					<c:when test="${detail.in_black == '1'}">
		    						是
		    					</c:when>
		    					<c:otherwise>
		    						否
		    					</c:otherwise>
		    				</c:choose>
		    			</p>
		    			<p>
		    				是否命中命中灰名单&nbsp;&nbsp;&nbsp;&nbsp;----------------------------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
								<c:when test="${detail.in_grey == '1'}">
									是
								</c:when>
								<c:otherwise>
									否
								</c:otherwise>		    				
		    				</c:choose>
		    			</p>
		    			<p>
		    				该用户在多少不同网贷平台发生了逾期&nbsp;&nbsp;&nbsp;&nbsp;----------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${detail.itfin_loan_overdues }
		    			</p>
		    			<p>
		    				网贷最大逾期时长级别&nbsp;&nbsp;&nbsp;&nbsp;---------------------------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
		    					<c:when test="${detail.itfin_loan_overdue_duration == null}">
		    						无数据
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration == 'M1' }">
		    						小于30 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration == 'M2' }">
		    						大于等于30 天，小于60 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration == 'M3' }">
		    						大于等于60 天，小于90 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration == 'M3+' }">
		    						大于等于90 天
		    					</c:when>
		    				</c:choose>
		    			</p>
		    			<p>
		    				在最近7 天中，该用户在多少不同网贷平台发生了逾期&nbsp;&nbsp;&nbsp;&nbsp;-------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;${detail.itfin_loan_overdues_7d }
		    			</p>
		    			<p>
		    				在最近7 天中，网贷最大逾期时长级别&nbsp;&nbsp;&nbsp;&nbsp;-----------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
		    					<c:when test="${detail.itfin_loan_overdue_duration_7d == null}">
		    						无数据
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_7d == 'M1' }">
		    						小于30 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_7d == 'M2' }">
		    						大于等于30 天，小于60 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_7d == 'M3' }">
		    						大于等于60 天，小于90 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_7d == 'M3+' }">
		    						大于等于90 天
		    					</c:when>
		    				</c:choose>
		    			</p>
		    			<p>
		    				在最近30 天中，该用户在多少不同网贷平台发生了逾期&nbsp;&nbsp;&nbsp;&nbsp;------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;${detail.itfin_loan_overdues_30d }
		    			</p>
		    			<p>
		    				在最近30 天中，网贷最大逾期时长级别&nbsp;&nbsp;&nbsp;&nbsp;----------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
		    					<c:when test="${detail.itfin_loan_overdue_duration_30d == null}">
		    						无数据
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_30d == 'M1' }">
		    						小于30 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_30d == 'M2' }">
		    						大于等于30 天，小于60 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_30d == 'M3' }">
		    						大于等于60 天，小于90 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_30d == 'M3+' }">
		    						大于等于90 天
		    					</c:when>
		    				</c:choose>
		    			</p>
		    			<p>
		    				在最近60 天中，该用户在多少不同网贷平台发生了逾期&nbsp;&nbsp;&nbsp;&nbsp;------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;${detail.itfin_loan_overdues_60d }
		    			</p>
		    			<p>
		    				在最近60 天中，网贷最大逾期时长级别&nbsp;&nbsp;&nbsp;&nbsp;----------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
		    					<c:when test="${detail.itfin_loan_overdue_duration_60d == null}">
		    						无数据
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_60d == 'M1' }">
		    						小于30 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_60d == 'M2' }">
		    						大于等于30 天，小于60 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_60d == 'M3' }">
		    						大于等于60 天，小于90 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_60d == 'M3+' }">
		    						大于等于90 天
		    					</c:when>
		    				</c:choose>
		    			</p>
		    			<p>
		    				在最近90 天中，该用户在多少不同网贷平台发生了逾期&nbsp;&nbsp;&nbsp;&nbsp;------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;${detail.itfin_loan_overdues_90d }
		    			</p>
		    			<p>
		    				在最近90 天中，网贷最大逾期时长级别&nbsp;&nbsp;&nbsp;&nbsp;----------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
		    					<c:when test="${detail.itfin_loan_overdue_duration_90d == null}">
		    						无数据
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_90d == 'M1' }">
		    						小于30 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_90d == 'M2' }">
		    						大于等于30 天，小于60 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_90d == 'M3' }">
		    						大于等于60 天，小于90 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_90d == 'M3+' }">
		    						大于等于90 天
		    					</c:when>
		    				</c:choose>
		    			</p>
		    			<p>
		    				在最近180 天中，该用户在多少不同网贷平台发生了逾期&nbsp;&nbsp;&nbsp;&nbsp;-----------------------------------&nbsp;&nbsp;&nbsp;&nbsp;${detail.itfin_loan_overdues_180d }
		    			</p>
		    			<p>
		    				在最近180 天中，网贷最大逾期时长级别&nbsp;&nbsp;&nbsp;&nbsp;---------------------------------------------------&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:choose>
		    					<c:when test="${detail.itfin_loan_overdue_duration_180d == null}">
		    						无数据
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_180d == 'M1' }">
		    						小于30 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_180d == 'M2' }">
		    						大于等于30 天，小于60 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_180d == 'M3' }">
		    						大于等于60 天，小于90 天
		    					</c:when>
		    					<c:when test="${detail.itfin_loan_overdue_duration_180d == 'M3+' }">
		    						大于等于90 天
		    					</c:when>
		    				</c:choose>
		    			</p>
		    		</div>
		    	</div>
    		</c:when>
    		<c:otherwise>
    			<h1 style="color: white;font-weight: bold;">无数据</h1>
    		</c:otherwise>
    	</c:choose>
    	
 	</body>
</html>