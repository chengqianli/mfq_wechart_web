<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ include file="/WEB-INF/common/resource_jstl.jsp" %>--%>
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
        .col-sm-7 {
            margin: 2% 0;
        }

        a:hover {
            text-decoration: underline;
        }

        #datatable_length {
            width: 100%;
        }

        #datatable_length {
            float: right;
        }

        .menu_section {
            margin-bottom: 0;
        }
        a{
            font-family: "Helvetica Neue",Roboto,Arial,"Droid Sans",sans-serif !important;
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
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="row title_left">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">放款机构管理</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">放款机构列表</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">查看合同</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <button type="button" class="btn btn-primary" style="float: right;"
                                onclick="window.location.href='${pageContext.request.contextPath}/mfq/lend/viewContract.do?orgNo=${orgNo}&type=2'" >
                            编辑合同
                        </button>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        ${viewContract}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp"%>

</body>
</html>