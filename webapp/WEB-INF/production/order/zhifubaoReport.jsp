<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>美分期-支付宝报告</title>
        <style type="text/css">
        	body{
        		background-color: #2e363f;
        		margin: 0;
        		padding: 0;
        		color: #999999;
        		font-size: 14px;
        	}
        	.main{
        		width: 1500px;
        		background-color: #f5f5f5;
        		margin-left: auto;
        		margin-right: auto;
        		overflow: hidden;
        	}
        	.content{
        		width: 1400px;
        		border: solid 1px #d4d4d4;
        		margin-left: auto;
        		margin-right: auto;
        		margin-top: 40px;
        		background-color: white;
        		margin-bottom: 40px;
        	}
        	.titleDiv{
        		background-color: #f4f4f4;
        		height: 40px;
        		line-height: 40px;
        		padding-left: 20px;
        		border-bottom: solid 1px #d4d4d4;
        	}
        	.titleDiv2{
        		background-color: #dff0d8;
        		width: 1340px;
        		height: 36px;
        		margin-left: auto;
        		margin-right: auto;
        		margin-top: 20px;
        		line-height: 36px;
        		padding-left: 10px;
        		border: solid 1px #dddddd;
        		border-top-left-radius: 5px;
        		border-top-right-radius: 5px;
        		color: #333333;
        	}
        	table{
        		width: 1350px;
        		margin-left: auto;
        		margin-right: auto;
        	}
        	td{
        		border-left: solid 1px #dddddd;
        		border-bottom: solid 1px #dddddd;
        		height: 36px;
        		padding-left: 10px;
        		color: #333333;
        	}
        	th{
        		text-align: left;
        		padding-left: 10px;
        		color: #333333;
        		border-left: solid 1px #dddddd;
        		border-bottom: solid 1px #dddddd;
        		height: 36px;
        		
        	}
        	.titleDiv3{
        		background-color: #dff0d8;
        		width: 1340px;
        		height: 36px;
        		margin-left: auto;
        		margin-right: auto;
        		margin-top: 20px;
        		line-height: 36px;
        		padding-left: 10px;
        		border-bottom: solid 1px #dddddd;
        		border-top: solid 1px #dddddd;
        		color: #333333;
        	}
        	.oderDetailDiv{
        		margin-left: auto;
        		margin-right: auto;
        		width: 1350px;
        		margin-bottom: 40px;
        	}
        	.orderDetailTd{
        		border: 0;
        		background-color: #ebe7d2;
        		border-bottom: solid 1px #dddddd;
        	}
        	.oderDetailTd2{
        		border: 0;
        		border-bottom: solid 1px #dddddd;
        	}
        	img{
        		margin-left: 20px;
        	}
        </style>
    </head>
    <body>
    	<c:if test="${result == 'fail' }">
    		<h2 style="color: white;text-align: center;">无数据</h2>
    	</c:if>
    	<c:if test="${result == 'success' }">
    		<div class="main">
	    		<div class="content">
	    			<div class="titleDiv">淘宝查询结果</div>
	    			<div class="titleDiv2">基本信息</div>
	    			<form>
	    				<table border="0" cellspacing="0" cellpadding="0">
	    					<tr>
	    						<td style="font-weight: bolder;">姓名:${zhifubaoUserInfo.username }</td>
	    						<td style="font-weight: bolder;">
	    							性别:
	    							<c:if test="${zhifubaoUserInfo.gender == 'MALE' }">
	    								男
	    							</c:if>
	    							<c:if test="${zhifubaoUserInfo.gender == 'FEMALE' }">
	    								女
	    							</c:if>
	    						</td>
	    						<td style="font-weight: bolder;">身份证号:${zhifubaoUserInfo.cardnumber }</td>
	    						<td style="border-right: solid 1px #dddddd; font-weight: bolder;">
	    							是否实名认证: 
	    							<c:choose>
	    								<c:when test="${zhifubaoUserInfo.certified == '1' }">
	    									是
	    								</c:when>
	    								<c:otherwise>
	    									否
	    								</c:otherwise>
	    							</c:choose>
	    						</td>
	    					</tr>
	    					<tr>
	    						<td style="font-weight: bolder;">邮箱:${zhifubaoUserInfo.email }</td>
	    						<td style="font-weight: bolder;">手机号:${zhifubaoUserInfo.phonenumber }</td>
	    						<td style="font-weight: bolder;">淘宝会员名:${zhifubaoUserInfo.taobaoid }</td>
	    						<td style="border-right: solid 1px #dddddd; font-weight: bolder;"></td>
	    					</tr>
	    				</table>
	    			</form>
	    			<div class="titleDiv2">资产状况</div>
	    			<form>
	    				<table border="0" cellspacing="0" cellpadding="0">
	    					<tr>
	    						<td style="font-weight: bolder;">余额:${zhifubaoWealth.yue/100.0 }元</td>
	    						<td style="font-weight: bolder;">余额宝:${zhifubaoWealth.yeb/100.0 }元</td>
	    						<td style="font-weight: bolder;">招财宝:${zhifubaoWealth.zcb/100.0 }元</td>
	    						<td style="border-right: solid 1px #dddddd;font-weight: bolder;">基金:${zhifubaoWealth.fund/100.0 }元</td>
	    					</tr>
	    					<tr>
	    						<td style="font-weight: bolder;">存金宝: ${zhifubaoWealth.cjb/100.0 }元</td>
	    						<td style="font-weight: bolder;">淘宝理财:${zhifubaoWealth.taolicai/100.0 }元</td>
	    						<td style="font-weight: bolder;">花呗额度:${zhifubaoWealth.huabailimit/100.0 }元</td>
	    						<td style="border-right: solid 1px #dddddd;font-weight: bolder;"></td>
	    					</tr>
	    				</table>
	    			</form>
	    			<div class="titleDiv2">交易记录</div>
	    			<form>
						<table border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 40px;">
							<tr>
								<th style="width: 13%;">交易时间</th>
								<th style="width: 8%;">交易类型</th>
								<th>交易对方</th>
								<th>商品名称</th>
								<th style="width: 8%;">交易金额(元)</th>
								<th style="border-right: solid 1px #dddddd;width: 8%;">交易状态</th>
							</tr>
							<c:forEach items="${zhifubaoTraderecords }" var="zhifubaoTraderecord">
								<tr>
									<td>
										<fmt:formatDate value="${zhifubaoTraderecord.tradetime }" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>${zhifubaoTraderecord.tradetype }</td>
									<td>${zhifubaoTraderecord.counterparty }</td>
									<td>${zhifubaoTraderecord.productname }</td>
									<td>${zhifubaoTraderecord.tradeamount }</td>
									<td style="border-right: solid 1px #dddddd;">${zhifubaoTraderecord.tradestatus }</td>
								</tr>
							</c:forEach>
						</table>
	    			</form>
	    		</div>
	    	</div>
    	</c:if>
    	
 	</body>
</html>