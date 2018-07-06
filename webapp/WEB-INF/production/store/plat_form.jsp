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
    <%-- resource css --%>
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
                        <li>用户服务费率</li>
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
                                        <h2 style="line-height: 1;font-size: 18px;">用户服务费率</h2>
                                        <button type="button" class="btn btn-primary" onclick="add('addPlat')"
                                                style="margin-left: 30px;">添加规则
                                        </button>
                                        <button type="button" onClick="javascript :history.back(-1);"
                                                class="btn btn-primary" style="float: right;">返回
                                        </button>
                                        <div class="clearfix"></div>
                                    </div>


                                    <div class="x_panel" id="addPlat" style="display: none;">
                                        <div class="x_content">
                                            <form id="addPlatId">
                                                <table id=""
                                                       class="table table-striped table-bordered"
                                                       style="margin-bottom: 0;">
                                                    <tr>
                                                        <th>规则<input type="text" name="name" style="width: 50%;"></th>
                                                        <th>日逾期费率（‰）：<input type="number" name="overdueRate"
                                                                            style="width: 50%;"></th>
                                                    </tr>
                                                </table>
                                                <table
                                                        class="table table-striped table-bordered"
                                                        style="margin-bottom: 0; float: left;">
                                                    <tr>
                                                        <th>
                                                            项目价格（元）：<input type="number" name="userApplyMinMoney"
                                                                           style="width: 20%">~<input type="number"
                                                                                                      name="userApplyMaxMoney"
                                                                                                      style="width: 20%">
                                                        </th>
                                                        <th>费用承当方式：
                                                            <select name="serviceRate">
                                                                <option value="01">用户承担</option>
                                                                <option value="02">商户承担</option>
                                                            </select>
                                                    </tr>
                                                </table>
                                                <table id="datatable-beizhu"
                                                       class="table table-striped table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>用户分期数（期）</th>
                                                        <th>服务费（%）</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td><input type="text" name="period3" value="3" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate3" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="period6" value="6" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate6" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="period9" value="9" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate9" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="period12" value="12" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate12" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="period15" value="15" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate15" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="period18" value="18" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate18" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="period21" value="21" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate21" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="period24" value="24" readonly
                                                                   class="inputClass"></td>
                                                        <td><input type="number" name="platformRate24" value=""></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                <input type="hidden" name="storeId" value="${storeId}"/>
                                            </form>
                                        </div>
                                        <div class="modal-footer" style="text-align: center;">
                                            <button type="button" class="btn btn-success antoclose"
                                                    onclick="addPlat()"
                                                    data-dismiss="modal">保存
                                            </button>
                                            <button type="button" class="btn btn-primary antosubmit"
                                                    onclick="off('addPlat')"
                                                    data-dismiss="modal">取消
                                            </button>
                                        </div>
                                    </div>

                                    <div class="x_content">
                                        <c:forEach items="${platformList}" var="item" varStatus="status">
                                            <div class="col-md-6 col-xs-12" style="margin-top: 10px;">
                                                <div class="x_panel">
                                                    <div class="x_content">
                                                        <form id="${item.ruleGroup}_fromId">
                                                            <table id=""
                                                                   class="table table-striped table-bordered"
                                                                   style="margin-bottom: 0;">
                                                                <tr>
                                                                    <th style="width: 30%">规则: <input
                                                                            value="${item.name}"
                                                                            name="name" style="width: 20%"
                                                                            class="inputClass ${item.ruleGroup}_inputClass"
                                                                            readonly/></th>
                                                                    <th style="width: 40%">日逾期费率（‰）：<input
                                                                            value="${item.overdueRate}"
                                                                            name="overdueRate" style="width: 20%"
                                                                            class="inputClass ${item.ruleGroup}_inputClass"
                                                                            readonly/></th>
                                                                    <th><span
                                                                            style="padding: 0 4px;color: #29BB9C;cursor: pointer;"
                                                                            onclick="editShow('${item.ruleGroup}')">编辑</span><span
                                                                            style="padding: 0 4px;color: #CC0000;cursor: pointer;"
                                                                            onclick="deletePlat('${item.ruleGroup}')">删除</span>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                            <table id="datatable-beizhu"
                                                                   class="table table-striped table-bordered"
                                                                   style="margin-bottom: 0; float: left;">
                                                                <tr>
                                                                    <th>
                                                                        项目价格（元）：<input value="${item.userApplyMinMoney}"
                                                                                       name="userApplyMinMoney"
                                                                                       style="width: 20%"
                                                                                       class="inputClass ${item.ruleGroup}_inputClass"
                                                                                       readonly/>~<input
                                                                            value="${item.userApplyMaxMoney}"
                                                                            name="userApplyMaxMoney" style="width: 20%"
                                                                            class="inputClass ${item.ruleGroup}_inputClass"
                                                                            readonly/></th>
                                                                    <th>费用承当方式：
                                                                        <select name="serviceRate" style="border: 0"
                                                                                disabled
                                                                                id="${item.ruleGroup}_selectId">
                                                                            <option value="01" ${item.serviceRate=='01'? 'selected':''}>
                                                                                用户承担
                                                                            </option>
                                                                            <option value="02" ${item.serviceRate=='02'? 'selected':''}>
                                                                                商户承担
                                                                            </option>
                                                                        </select>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                            <table id="datatable-beizhu"
                                                                   class="table table-striped table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <th>用户分期数（期）</th>
                                                                    <th>服务费（%）</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${item.list[0]}" var="list"
                                                                           varStatus="status">
                                                                    <tr>
                                                                        <td><input value="${list.period}"
                                                                                   name="period${(status.index+1) * 3}"
                                                                                   class="inputClass"
                                                                                   readonly/></td>
                                                                        <td><input value="${list.platformRate}"
                                                                                   name="platformRate${(status.index+1) * 3}"
                                                                                   style="width: 20%"
                                                                                   class="inputClass ${item.ruleGroup}_inputClass"
                                                                                   readonly/></td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                            <input type="hidden" name="ruleGroup"
                                                                   value="${item.ruleGroup}"/>
                                                            <input type="hidden" name="storeId"
                                                                   value="${item.storeId}"/>
                                                        </form>
                                                    </div>

                                                    <div class="modal-footer" style="text-align: center;display: none"
                                                         id="${item.ruleGroup}_buttonId">
                                                        <button type="button" class="btn btn-success antoclose"
                                                                onclick="editPlatSub('${item.ruleGroup}')"
                                                                data-dismiss="modal">保存
                                                        </button>
                                                        <button type="button" class="btn btn-primary antosubmit"
                                                                onclick="offEdit('${item.ruleGroup}')"
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
    function off(divId) {
        $("#" + divId).hide();
    }

    function add(divId) {
        $("#" + divId).show();
    }

    // 添加
    function addPlat() {

        var overdueRate = $("#addPlatId input[name='overdueRate']").val()
        if (!numCheck(overdueRate)) {
            $.confirm({
                title: '系统提示',
                text: "日逾期费率输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var userApplyMinMoney = $("#addPlatId input[name='userApplyMinMoney']").val()
        if (!numCheck(userApplyMinMoney)) {
            $.confirm({
                title: '系统提示',
                text: "最小金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var userApplyMaxMoney = $("#addPlatId input[name='userApplyMaxMoney']").val()
        if (!numCheck(userApplyMaxMoney)) {
            $.confirm({
                title: '系统提示',
                text: "最大金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("addPlatId"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/savePlat.do",
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
            }
        });
    }

    function deletePlat(ruleGroup) {
//        var form = new FormData(document.getElementById("addPlatId"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/deletePlat.do?ruleGroup=" + ruleGroup,
            type: "post",
            data: '',
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
            }
        });

    }

    function editShow(ruleGroup) {
        $("." + ruleGroup + "_inputClass").removeClass("inputClass");
        $("." + ruleGroup + "_inputClass").removeAttr('readonly');
        $("#" + ruleGroup + "_buttonId").show();
        $("#" + ruleGroup + "_selectId").removeAttr('disabled')
    }

    // 取消编辑
    function offEdit(ruleGroup) {
        location.reload();
    }

    function editPlatSub(ruleGroup) {

        var overdueRate = $("#" + ruleGroup + "_fromId" + " input[name='overdueRate']").val()
        if (!numCheck(overdueRate)) {
            $.confirm({
                title: '系统提示',
                text: "日逾期费率输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var userApplyMinMoney = $("#" + ruleGroup + "_fromId" + " input[name='userApplyMinMoney']").val()
        if (!numCheck(userApplyMinMoney)) {
            $.confirm({
                title: '系统提示',
                text: "最小金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var userApplyMaxMoney = $("#" + ruleGroup + "_fromId" + " input[name='userApplyMaxMoney']").val()
        if (!numCheck(userApplyMaxMoney)) {
            $.confirm({
                title: '系统提示',
                text: "最大金额输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById(ruleGroup + "_fromId"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/editPlatSub.do",
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