<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>美分期-淘宝报告</title>
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
	    						<td style="font-weight: bolder;">淘宝昵称:${taobaoUserInfo.nick }</td>
	    						<td style="font-weight: bolder;">姓名:${taobaoUserInfo.realname }</td>
	    						<td style="font-weight: bolder;">电话号码:${taobaoUserInfo.phonenumber }</td>
	    						<td style="border-right: solid 1px #dddddd; font-weight: bolder;">绑定邮箱:${taobaoUserInfo.email }</td>
	    					</tr>
	    					<tr>
	    						<td style="font-weight: bolder;">VIP等级:${taobaoUserInfo.viplevel }</td>
	    						<td style="font-weight: bolder;">成长值:${taobaoUserInfo.vipcount }</td>
	    						<td style="font-weight: bolder;">绑定微博账号:${taobaoUserInfo.weiboaccount }</td>
	    						<td style="border-right: solid 1px #dddddd; font-weight: bolder;">绑定微博昵称:${taobaoUserInfo.weibonick }  </td>
	    					</tr>
	    					<tr>
	    						<td style="border-right: solid 1px #dddddd; font-weight: bolder;" colspan="4">绑定支付宝账号:${taobaoUserInfo.alipayaccount }</td>
	    					</tr>
	    				</table>
	    			</form>
	    			<div class="titleDiv2">全部收货地址</div>
	    			<form>
	    				<table border="0" cellspacing="0" cellpadding="0">
	    					<tr>
	    						<th>姓名</th>
	    						<th>电话</th>
	    						<th>邮编</th>
	    						<th>地址</th>
	    						<th style="border-right: solid 1px #dddddd;">是否默认收货地址</th>
	    					</tr>
	    					<c:forEach items="${taobaoDeliverAddresses }" var="taobaoDeliverAddress">
	    						<tr>
		    						<td>${taobaoDeliverAddress.name }</td>
		    						<td>${taobaoDeliverAddress.phonenumber }</td>
		    						<td>${taobaoDeliverAddress.zipcode }</td>
		    						<td>${taobaoDeliverAddress.province}${taobaoDeliverAddress.city}${taobaoDeliverAddress.fulladdress}</td>
		    						<td style="border-right: solid 1px #dddddd;">
		    							<c:if test="${taobaoDeliverAddress.isdefault == '1' }">是</c:if>
		    							<c:if test="${taobaoDeliverAddress.isdefault == '0' }">否</c:if>
		    						</td>
	    						</tr>
	    					</c:forEach>
	    				</table>
	    			</form>
	    			<div class="titleDiv2">最近订单收货地址</div>
	    			<form>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>订单时间</th>
								<th>姓名</th>
								<th>收货地址</th>
								<th>手机</th>
								<th>固定电话</th>
								<th>邮编</th>
								<th style="border-right: solid 1px #dddddd;">发票抬头</th>
							</tr>
							<c:forEach items="${taobaoRecentAddresses }" var="taobaoRecentAddress">
								<tr>
									<td><fmt:formatDate value="${taobaoRecentAddress.tradecreatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${taobaoRecentAddress.delivername }</td>
									<td>${taobaoRecentAddress.deliveraddress }</td>
									<td>${taobaoRecentAddress.delivermobilephone }</td>
									<td>${taobaoRecentAddress.deliverfixedphone }</td>
									<td>${taobaoRecentAddress.deliverpostcode }</td>
									<td style="border-right: solid 1px #dddddd;">${taobaoRecentAddress.invoicename }</td>
								</tr>
							</c:forEach>
						</table>
	    			</form>
	    			<div class="titleDiv3">订单信息 </div>
	    			<div class="oderDetailDiv">
	    				<form>
		    				<table border="0" cellspacing="0" cellpadding="0">
		    					<c:forEach items="${taobaoInfos }" var="taobaoInfo">
		    						<tr>
			    						<td class="orderDetailTd" style="width: 13%;"><fmt:formatDate value="${taobaoInfo.tradeCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			    						<td class="orderDetailTd" style="width: 40%;">订单号:${taobaoInfo.tradeId }</td>
			    						<td class="orderDetailTd">店铺:${taobaoInfo.sellerShopName }</td>
			    						<td class="orderDetailTd">卖家:${taobaoInfo.sellerNick }</td>
			    						<td class="orderDetailTd">金额:${taobaoInfo.actualFee }元</td>
			    					</tr>
			    					<tr>
			    						<td class="oderDetailTd2">
			    							<img src="http:${taobaoInfo.itemPic}"/>
			    						</td>
			    						<td class="oderDetailTd2">${taobaoInfo.itemName }</td>
			    						<td class="oderDetailTd2">${taobaoInfo.realTotal}元</td>
			    						<td class="oderDetailTd2"></td>
			    						<td class="oderDetailTd2"></td>
			    					</tr>
		    					</c:forEach>
		    				</table>
		    			</form>
	    			</div>
	    		</div>
	    	</div>
    	</c:if>
    	
 	</body>
</html>