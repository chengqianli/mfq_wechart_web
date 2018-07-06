<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
  <div class="menu_section">
    <h3></h3>
    <form id="formId">
    
     <input type="hidden" name="type" value="01"/>
     <input type="hidden" name="params" value=""/>
     <ul class="nav side-menu">
       <c:forEach var="menu" items="${menuList}" varStatus="status" >
     	 <c:forEach var="childMenu" items="${menu.childMenu }">
       		<li><a style="position:relative;"><i class="${childMenu.icon }"></i> ${childMenu.label }
       			<c:if test="${childMenu.label == '风控管理' }">
		       			<div class="notice-flag-new" id= "news" style="display: none">new</div>
				</c:if>
       		<span class="fa fa-chevron-left"></span></a>
    			<ul class="nav child_menu">
    				<c:forEach var="secondChildMenu" items="${childMenu.childMenu }">
    					<c:if test="${secondChildMenu.childMenu == null}">
    						<li><a href="${pageContext.request.contextPath}/${secondChildMenu.url}">${secondChildMenu.label }
    							</a>
    						</li>
    					</c:if>
    					<c:if test="${secondChildMenu.childMenu != null}">
    						<li><a>${secondChildMenu.label }
					       		<c:if test="${secondChildMenu.label == '订单审核'}">
		    							<small class="badge bg-green notice-flag-num" id="num">0</small>
								</c:if>
								<c:if test="${secondChildMenu.label == '分配放款机构'}">
		    							<small class="badge bg-green notice-flag-num" id="count">0</small>
								</c:if>
    						 <span class="fa fa-chevron-left"></span></a>

    						<ul class="nav child_menu">
    							<c:forEach var="threeChildMenu" items="${secondChildMenu.childMenu }">
    								<li><a href="${pageContext.request.contextPath}/${threeChildMenu.url}">${threeChildMenu.label }
    								<c:if test="${threeChildMenu.label == '待审核订单'}">
		    							<small class="badge bg-green notice-flag-num" id="num1">0</small>
									</c:if>
									<c:if test="${threeChildMenu.label == '未分配'}">
		    							<small class="badge bg-green notice-flag-num" id="num2">0</small>
									</c:if>
    								</a></li>
    							</c:forEach>
    						</ul>
    					</c:if>
    				</c:forEach>
    			</ul>
       	  </c:forEach>
        </c:forEach>
      </ul>
     </form>
  </div>
</div>
<!-- /sidebar menu -->