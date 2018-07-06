<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Boss Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/boss.css" rel="stylesheet">
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

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="row title_left">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>商户管理</li>
                        <li>商户类型管理</li>
                        <li>商户分类</li>
                    </ul>
                </div>
            </div>

            <button type="button" class="btn btn-primary" style="float: right;margin-top:10px ;cursor: pointer;"
                    data-toggle="modal" data-target=".add_business_type">添加类型
            </button>
            <div class="modal fade add_business_type" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" id="myModalLabel">添加商户类型</h4>
                        </div>
                        <div class="modal-body">
                            <div id="testmodal" style="padding: 5px 20px;">
                                <form id="antoform" class="form-horizontal calender" role="form" method="post"
                                      action="${pageContext.request.contextPath}/mfq/store/saveStoreType.do">
                                    <div class="form-group" style="margin-bottom: 5px;">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">类型名称</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" placeholder="名称" name="name">
                                        </div>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 5px;">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">类型说明
                                        </label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <textarea class="form-control" rows="5" placeholder=''
                                                      name="desc"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="text-align: center;">
                                        <button type="button" class="btn btn-success antoclose" id="submitId"
                                                data-dismiss="modal">保存
                                        </button>
                                        <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <table id="datatable_shanghu_fenlei" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <!--<th><input type="checkbox"/>全部</th>-->
                                <th>商户类型</th>
                                <th>商户数量</th>
                                <th>商户描述</th>
                            </tr>
                            <c:forEach items="${storeTypes}" var="storeTypes">
                                <tr class="odd" role="row">
                                    <td>${storeTypes.name}</td>
                                    <td>${storeTypes.storeSum}</td>
                                    <td>${storeTypes.desc}</td>
                                </tr>
                            </c:forEach>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<!-- /footer content -->
<%-- footer --%>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- 各个表的初始化-->
<%--<script src="${pageContext.request.contextPath}/build/js/chushi.js"></script>--%>
<script>
    $("#submitId").click(function () {
        var name = $("#antoform input[name='name']").val()
        if (!strCheck(name)) {
            $.confirm({
                title: '系统提示',
                text: "名称输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var desc = $("#antoform textarea[name='desc']").val();
        if (!strCheck(desc)) {
            $.confirm({
                title: '系统提示',
                text: "描述输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var form = new FormData(document.getElementById("antoform"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/saveStoreType.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    location.reload();
                }
            },
            error: function (e) {
                console.log(e);
                location.reload();
            }
        });
    });
</script>

</body>
</html>