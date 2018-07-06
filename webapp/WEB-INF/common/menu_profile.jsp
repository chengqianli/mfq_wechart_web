<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container body">
  <div class="main_container">
    <div class="col-md-3 left_col">
      <div class="left_col scroll-view">
      
		<div class="navbar nav_title" style="border: 0;">
		  <a href="javaScript:void(0);" class="site_title"><!-- <i class="fa fa-paw"></i> -->
		 	<div class="logo logo-nav"></div>
		  <span>美分期</span></a>
		</div>
		
		<div class="clearfix"></div>
		
		<!-- menu profile quick info -->
		<div class="profile clearfix">
		  <div class="profile_pic">
		    <c:if test="${user.user.sex == '0'}">
		    		<img src="${pageContext.request.contextPath}/build/images/default-head-girl.png" alt="..." class="img-circle profile_img">
		    </c:if>
		    <c:if test="${user.user.sex == '1'}">
		    		<img src="${pageContext.request.contextPath}/build/images/default-head-boy.png" alt="..." class="img-circle profile_img">
		    </c:if>
		  </div>
		  <div class="profile_info">
		    <span>欢迎，</span>
		    <span class="icon-hi"></span>
		    <h2>${user.userAccount.realName }</h2>
		  </div>
		</div>
		<!-- /menu profile quick info -->
		
		<br />
			