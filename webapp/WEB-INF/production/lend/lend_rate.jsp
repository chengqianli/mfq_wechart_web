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
    <title>美分期后台管理系统</title>
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

        .inputClass {
            border: 0;
            text-align: center;
            background-color: inherit;
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
                        <li>放款机构管理</li>
                        <li><a href="#" onclick="javascript :history.back(-1);">放款机构列表</a></li>
                        <li>机构服务费</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="line-height: 1;font-size: 18px;">机构服务费</h2>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".add_cooperation"
                                id="buttonId"
                        ${activeByOrgNo != null && activeByOrgNo.size() > 0 ? 'style="display: none"':'style="display: block;float: right;"'}>
                            添加规则
                        </button>
                        <div class="modal fade add_cooperation" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">费率模式</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div id="testmodal" style="padding: 5px 20px;">
                                            <form id="antoform" class="form-horizontal calender" role="form">
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <p style="text-align: center;">
                                                            <input type="radio" name="editType" value="1" checked/>等额本息
                                                        </p>
                                                        <p style="text-align: center;">
                                                            <input type="radio" name="editType" value="2"/>p2p等本等息
                                                        </p>
                                                        <p style="text-align: center;">>每个金融机构只会有一个费率模式，请核实费率准确性，</p>
                                                        <p style="text-align: center;"> 避免频繁更改影响业务结算和合同内容！</p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="text-align: center;">
                                        <button type="button" class="btn btn-success antoclose" data-dismiss="modal"
                                                onclick="editType()">
                                            确定
                                        </button>
                                        <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table class="table table-striped table-bordered"
                               id="profittype_01" ${activeByOrgNo[0].profitType == '01'?'style="display: table"':'style="display: none"'}>
                            <thead>
                            <tr>
                                <th>费率模式</th>
                                <th>年利率（%）${activeByOrgNo[0].profitType == '02'?'style="display: none"':''}</th>
                                <th>日预期利率（%）</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <form id="profittype_01_From">
                                <input type="hidden" name="profitType" id="profitType_profittype_01_From" value="01">
                                <input type="hidden" name="id" value="${activeByOrgNo[0].id}">
                                <input type="hidden" name="lenderId" value="${id}">
                                <tr>
                                    <th>等额本息</th>
                                    <th><input type="number" class="inputClass" name="flatRate"
                                               id="flatRate_profittype_01_From" readonly
                                               value="${activeByOrgNo[0].flatRate}"/></th>
                                    <th><input type="number" class="inputClass" name="overdueRate"
                                               id="overdueRate_profittype_01_From" readonly
                                               value="${activeByOrgNo[0].overdueRate}"/>
                                    </th>
                                    <th>
                                        <button type="button"
                                                class="btn btn-primary antosubmit subClass" ${activeByOrgNo != null ? 'style="display: none"':''}
                                                onclick="sub('profittype_01_From')">保存
                                        </button>
                                        <button type="button"
                                                class="btn btn-primary antosubmit editClass" ${activeByOrgNo == null ? 'style="display: none"':''}
                                                onclick="editTable()">编辑
                                        </button>
                                    </th>
                                <tr>
                            </form>
                            </tbody>
                        </table>
                        <table class="table table-striped table-bordered"
                               id="profittype_02" ${activeByOrgNo[0].profitType == '02'?'':'style="display: none"'}>
                            <thead>
                            <tr>
                                <th colspan="2" style="height: 50px;vertical-align:  middle;font-size: 20px;">
                                    <div>
                                        等本等息
                                    </div>
                                </th>
                                <%--<th></th>--%>
                            </tr>
                            <tr>
                                <th>用户分期数</th>
                                <th>费率（%）</th>
                            </tr>
                            </thead>
                            <tbody>
                            <form id="profittype_02_From">
                                <input type="hidden" name="profitType" id="profitType_profittype_02_From" value="02">
                                <input type="hidden" name="id" value="${activeByOrgNo[0].id}">
                                <input type="hidden" name="lenderId" value="${id}">

                                <tr>
                                    <th>3</th>
                                    <th><input type="number" name="threePeriodRate" class="inputClass" readonly id="threePeriodRate"
                                               value="${activeByOrgNo[0].threePeriodRate}"/>
                                    </th>
                                </tr>
                                <tr>
                                    <th>6</th>
                                    <th><input type="number" name="sixPeriodRate" id="sixPeriodRate"
                                               value="${activeByOrgNo[0].sixPeriodRate}" class="inputClass" readonly/>
                                    </th>
                                </tr>
                                <tr>
                                    <th>9</th>
                                    <th><input type="number" class="inputClass" readonly name="ninePeriodRate" id="ninePeriodRate"
                                               value="${activeByOrgNo[0].ninePeriodRate}"/></th>
                                </tr>
                                <tr>
                                    <th>12</th>
                                    <th><input type="number" class="inputClass" readonly name="twelvePeriodRate" id="twelvePeriodRate"
                                               value="${activeByOrgNo[0].twelvePeriodRate}"/></th>
                                </tr>
                                <tr>
                                    <th>15</th>
                                    <th><input type="number" class="inputClass" readonly name="fifteenRate" id="fifteenRate"
                                               value="${activeByOrgNo[0].fifteenRate}"/></th>
                                </tr>
                                <tr>
                                    <th>18</th>
                                    <th><input type="number" class="inputClass" readonly name="eighteenRate" id="eighteenRate"
                                               value="${activeByOrgNo[0].eighteenRate}"/>
                                    </th>
                                </tr>
                                <tr>
                                    <th>21</th>
                                    <th><input type="number" class="inputClass" readonly name="twentyOneRate" id="twentyOneRate"
                                               value="${activeByOrgNo[0].twentyOneRate}"/>
                                    </th>
                                </tr>
                                <tr>
                                    <th>24</th>
                                    <th><input type="number" class="inputClass" readonly name="twentyFourRate" id="twentyFourRate"
                                               value="${activeByOrgNo[0].twentyFourRate}"/></th>
                                </tr>

                                <tr>
                                    <th colspan="2" style="height: 50px;vertical-align:  middle">
                                        <div>
                                            <button type="button"
                                                    class="btn btn-primary antosubmit subClass" ${activeByOrgNo != null ? 'style="display: none"':''}
                                                    onclick="sub('profittype_02_From')">保存
                                            </button>
                                            <button type="button"
                                                    class="btn btn-primary antosubmit editClass" ${activeByOrgNo == null ? 'style="display: none"':''}
                                                    onclick="editTable()">编辑
                                            </button>
                                        </div>
                                    </th>
                                </tr>
                            </form>
                            </tbody>
                        </table>
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

    $(function () {
        if ('${activeByOrgNo == null}' == 'true') {
            $(".inputClass").removeAttr('readonly');
            $(".inputClass").removeClass("inputClass");
        }
    });

    function editTable() {
        $(".inputClass").removeAttr('readonly');
        $(".inputClass").removeClass("inputClass");
        $(".subClass").css("display", 'inline');
        $(".editClass").css("display", 'none');
    }

    function editType() {
        $(".inputClass").removeAttr('readonly');
        $(".inputClass").removeClass("inputClass");
        $(".subClass").css("display", 'inline');
        $(".editClass").css("display", 'none');
        var type = $("input[type='radio']:checked").val();
        $("#buttonId").css("display", "none");
        if (type == 2) {
            $("#profittype_02").css("display", "table");
        } else {
            $("#profittype_01").css("display", "table");
        }
    }

    function sub(fromId) {
        var profitType = $("#profitType_" + fromId).val();
        if (!numCheck(profitType)) {
            $.confirm({
                title: '系统提示',
                text: "费率类型错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        if (profitType == '01') {
            var overdueRate = $("#overdueRate_" + fromId).val()
            if (!numCheck(overdueRate)) {
                $.confirm({
                    title: '系统提示',
                    text: "日逾期费输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var flatRate = $("#flatRate_" + fromId).val();
            if (!numCheck(flatRate)) {
                $.confirm({
                    title: '系统提示',
                    text: "年利率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
        }else {
            var value = $("#threePeriodRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "3期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var value = $("#sixPeriodRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "6期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var value = $("#ninePeriodRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "9期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var value = $("#twelvePeriodRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "12期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var value = $("#fifteenRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "15期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var value = $("#eighteenRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "18期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var value = $("#twentyOneRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "21期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
            var value = $("#twentyFourRate").val();
            if (!numCheck(value)) {
                $.confirm({
                    title: '系统提示',
                    text: "24期费率输入格式错误",
                    confirmButton: '确认',
                    cancelButton: false,
                });
                return;
            }
        }
        var form = new FormData(document.getElementById(fromId));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/lend/editRate.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "更新失败!",
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