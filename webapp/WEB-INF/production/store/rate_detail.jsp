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
        a:hover {
            text-decoration: underline;
        }

        .erji-daohang {
            list-style: none;
            float: left;
            display: block;
            width: 25%;
            line-height: 4;
            background: #29BB9C;
        }

        .kuangkuang {
            list-style: none;
            padding: 0;
        }

        .jibie {
            width: 70%;
            line-height: 40px;
            background: rgba(116, 135, 155, 1);
            margin: 10px auto 0;
            color: #FFFFFF;
            position: relative;
        }

        .dasanjiao .after {
            z-index: 10;
            content: "";
            position: absolute;
            top: 0;
            left: 100%;
            border: 0 solid #FFFFFF;
            border-width: 55.5px 0 55.5px 30px;
            border-bottom-color: #29BB9C;
            border-top-color: #29BB9C;
        }

        .after:after {
            content: "";
            position: absolute;
            top: -55.5px;
            left: -34px;
            border: 0 solid #29BB9C;
            border-width: 55.5px 0 55.5px 30px;
            border-bottom-color: transparent;
            border-top-color: transparent;
        }

        h2 {
            font-size: 26px;
            line-height: 2;
            text-align: right;
            padding-right: 10px;
        }

        .shijian {
            font-size: 20px;
            line-height: 1.471;
            text-align: right;
            padding-right: 10px;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        .form-group {
            margin-bottom: 0px;
        }

        label {
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        th, td {
            text-align: center;
        }

        .inputClass {
            border: 0;
            text-align: center;
            background-color: inherit
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
            <div class="row title_left" style="width: 100%;">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>商户管理</li>
                        <li>合作商户</li>
                        <li>商户服务费率</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <div class="erji-daohang-kuang" style="margin: 0 auto;">
                            <!--基本信息-->

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">商户服务费率</h2>
                                        <button type="button" class="btn btn-primary" onclick="addRate()"
                                                style="margin-left: 30px;">添加规则
                                        </button>
                                        <button type="button" onClick="javascript :history.back(-1);"
                                                class="btn btn-primary" style="float: right;">返回
                                        </button>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="x_panel" id="addRate" style="display: none">
                                            <form id="addRateFrom">
                                                <div class="x_content">
                                                    <table class="table table-striped table-bordered"
                                                           style="margin-bottom: 0;">
                                                        <tr>
                                                            <th>规则<%--${status.index+1} --%></th>
                                                            <th>日逾期费率（‰）：<input type="number" name="overdueRate"/><%--${active.overdueRate}--%>
                                                            </th>
                                                            <%--<th><span
                                                                    style="padding: 0 4px;color: #29BB9C;">编辑</span><span
                                                                    style="padding: 0 4px;color: #CC0000;">删除</span>
                                                            </th>--%>
                                                        </tr>
                                                    </table>
                                                    <table id=""
                                                           class="table table-striped table-bordered"
                                                           style="margin-bottom: 0; float: left;">
                                                        <tr>
                                                            <th>
                                                                项目价格（元）：<input type="number"
                                                                               name="storeMinRate"/>&mdash;
                                                                <input type="number" name="storeMaxRate"/><%--${active.storeMinRate}&mdash;${active.storeMaxRate}--%>
                                                            </th>
                                                        </tr>
                                                    </table>
                                                    <table
                                                            class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>用户分期数（期）</th>
                                                            <th>服务费（%）</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>3</td>
                                                            <td><input type="number" name="threePeriodRate"/><%--${active.threePeriodRate}--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td><input type="number" name="sixPeriodRate"/><%--${active.sixPeriodRate}--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>9</td>
                                                            <td><input type="number" name="ninePeriodRate"/><%--${active.ninePeriodRate}--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>12</td>
                                                            <td><input type="number" name="twelvePeriodRate"/><%--${active.twelvePeriodRate}--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>15</td>
                                                            <td><input type="number" name="fifteenRate"/><%--${active.fifteenRate}--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>18</td>
                                                            <td><input type="number" name="eighteenRate"/><%--${active.eighteenRate}--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>21</td>
                                                            <td><input type="number" name="twentyOneRate"/><%--${active.twentyOneRate}--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>24</td>
                                                            <td><input type="number" name="twentyFourRate"/><%--${active.twentyFourRate}--%>
                                                            </td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="modal-footer" style="text-align: center;">
                                                    <button type="button" class="btn btn-success antoclose"
                                                            onclick="addrateSub()"
                                                            data-dismiss="modal">保存
                                                    </button>
                                                    <button type="button" class="btn btn-primary antosubmit"
                                                            onclick="off('addRate')"
                                                            data-dismiss="modal">取消
                                                    </button>
                                                </div>
                                                <input type="hidden" name="lenderId" value="${storeId}"/>
                                                <input type="hidden" name="type" value="${type}"/>
                                            </form>
                                        </div>
                                        <c:forEach items="${active}" var="active" varStatus="status">
                                            <div class="col-md-6 col-xs-12" style="margin-top: 10px;">
                                                <div class="x_panel">
                                                    <form id="${active.id}_fromId">
                                                        <div class="x_content">
                                                            <table class="table table-striped table-bordered"
                                                                   style="margin-bottom: 0;">
                                                                <tr>
                                                                    <th>规则${status.index+1}</th>
                                                                    <th>日逾期费率（‰）：<input value="${active.overdueRate}"
                                                                                        name="overdueRate" type="number"
                                                                                        class="inputClass ${active.id}_inputClass"
                                                                                        readonly/></th>
                                                                    <th>
                                                                    <span style="padding: 0 4px;color: #29BB9C;cursor:pointer;"
                                                                          onclick="edit('${active.id}')">编辑</span>
                                                                        <span style="padding: 0 4px;color: #CC0000;cursor: pointer;"
                                                                              onclick="deleteRate('${active.id}')">删除</span>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                            <table
                                                                    class="table table-striped table-bordered"
                                                                    style="margin-bottom: 0; float: left;">
                                                                <tr>
                                                                    <th>
                                                                        项目价格（元）：<input value="${active.storeMinRate}"
                                                                                       name="storeMinRate" type="number"
                                                                                       class="inputClass ${active.id}_inputClass"
                                                                                       readonly/>&mdash;<input
                                                                            value="${active.storeMaxRate}"
                                                                            name="storeMaxRate" type="number"
                                                                            class="inputClass ${active.id}_inputClass"
                                                                            readonly/></th>
                                                                </tr>
                                                            </table>
                                                            <table id=""
                                                                   class="table table-striped table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <th>用户分期数（期）</th>
                                                                    <th>服务费（%）</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td>3</td>
                                                                    <td><input value="${active.threePeriodRate}"
                                                                               name="threePeriodRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>6</td>
                                                                    <td><input value="${active.sixPeriodRate}"
                                                                               name="sixPeriodRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>9</td>
                                                                    <td><input value="${active.ninePeriodRate}"
                                                                               name="ninePeriodRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>12</td>
                                                                    <td><input value="${active.twelvePeriodRate}"
                                                                               name="twelvePeriodRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>15</td>
                                                                    <td><input value="${active.fifteenRate}"
                                                                               name="fifteenRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>18</td>
                                                                    <td><input value="${active.eighteenRate}"
                                                                               name="eighteenRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>21</td>
                                                                    <td><input value="${active.twentyOneRate}"
                                                                               name="twentyOneRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>24</td>
                                                                    <td><input value="${active.twentyFourRate}"
                                                                               name="twentyFourRate" type="number"
                                                                               class="inputClass ${active.id}_inputClass"
                                                                               readonly/></td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <input type="hidden" name="id" value="${active.id}"/>
                                                        <input type="hidden" name="lenderId" value="${storeId}"/>
                                                        <input type="hidden" name="type"
                                                               value="${type == null? 'STORE':type}"/>
                                                    </form>
                                                    <div class="modal-footer" style="text-align: center;display: none"
                                                         id="${active.id}_buttonId">
                                                        <button type="button" class="btn btn-success antoclose"
                                                                onclick="editRateSub('${active.id}')"
                                                                data-dismiss="modal">保存
                                                        </button>
                                                        <button type="button" class="btn btn-primary antosubmit"
                                                                onclick="offEdit('${active.id}')"
                                                                data-dismiss="modal">取消
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script>
    function addRate() {
        $("#addRate").show();
    }

    function off(divId) {
        $("#" + divId).hide();
    }

    function addrateSub() {
        var overdueRate = $("#addRateFrom input[name='overdueRate']").val()
        if (!numCheck(overdueRate)) {
            $.confirm({
                title: '系统提示',
                text: "日逾期费率输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var storeMinRate = $("#addRateFrom input[name='storeMinRate']").val()
        if (!numCheck(storeMinRate)) {
            $.confirm({
                title: '系统提示',
                text: "最小金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var storeMaxRate = $("#addRateFrom input[name='storeMaxRate']").val()
        if (!numCheck(storeMaxRate)) {
            $.confirm({
                title: '系统提示',
                text: "最大金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var form = new FormData(document.getElementById("addRateFrom"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/saveRate.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else if (data.code == 2) {
                    $.confirm({
                        title: '系统提示',
                        text: "项目价格区间重复!",
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
    }

    function deleteRate(id) {
//        var form = new FormData(document.getElementById("addRateFrom"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/deleteRate.do?id=" + id,
            type: "post",
            data: '',
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "删除失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    location.reload();
                }
            },
            error: function (e) {
                location.reload();
            }
        });
    }

    // 编辑费率
    function edit(id) {
        $("." + id + "_inputClass").removeClass("inputClass");
        $("." + id + "_inputClass").removeAttr('readonly');
        $("#" + id + "_buttonId").show();
    }

    // 取消编辑
    function offEdit(id) {
        location.reload();
    }

    // 保存编辑
    function editRateSub(id) {
        var overdueRate = $("#" + id + "_fromId input[name='overdueRate']").val()
        if (!numCheck(overdueRate)) {
            $.confirm({
                title: '系统提示',
                text: "日逾期费率输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var storeMinRate = $("#" + id + "_fromId input[name='storeMinRate']").val()
        if (!numCheck(storeMinRate)) {
            $.confirm({
                title: '系统提示',
                text: "最小金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var storeMaxRate = $("#" + id + "_fromId input[name='storeMaxRate']").val()
        if (!numCheck(storeMaxRate)) {
            $.confirm({
                title: '系统提示',
                text: "最大金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var form = new FormData(document.getElementById(id + "_fromId"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/editRate.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else if (data.code == 2) {
                    $.confirm({
                        title: '系统提示',
                        text: "项目价格区间重复!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    location.reload();
                }
            },
            error: function (e) {
                location.reload();
            }
        });
    }

    // 校验字符串非空和特殊字符
    function numCheck(str) {
        if (str == null || str == '') {
            return false
        }
        return true;
    }

</script>
</body>
</html>