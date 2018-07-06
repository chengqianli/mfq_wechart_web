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
                        <li>放款机构列表</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".add_cooperation"
                                style="float: right;">添加合作
                        </button>

                        <div class="modal fade add_cooperation" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">放款机构</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div id="testmodal" style="padding: 5px 20px;">
                                            <form id="saveLend" class="form-horizontal calender" role="form">
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">机构名称:</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control" name="name"
                                                               placeholder="请输入机构名称">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">机构简称:</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control" name="shortName"
                                                               placeholder="请输入机构简称">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">开户名称:</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control" name="ccountName"
                                                               placeholder="请输入开户名称">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">银行账号:</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control" name="bankAccount"
                                                               placeholder="请输入银行账号">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">开户银行:</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" class="form-control" name="bank"
                                                               placeholder="请输入开户银行">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商务负责人：</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <select name="contactUserId" class="form-control">
                                                            <c:forEach items="${userList }" var="i">
                                                                <option value="${i.id }">${i.realName }</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">结算日</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <select name="selector" class="form-control">
                                                            <%
                                                                for (int i = 1; i <= 31; i++) {
                                                                    out.write("<option value='" + i + "'>" + i + "</option>");
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">结算周期</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <select class="form-control" name="settlePeriod">
                                                            <option value="moneth">月</option>
                                                            <option value="quarter">季</option>
                                                            <option value="year">年</option>
                                                            <option value="other">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">备注：
                                                    </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <textarea class="form-control" rows="5" name="remark"
                                                                  placeholder=''></textarea>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="text-align: center;">
                                        <button type="button" class="btn btn-success antoclose" data-dismiss="modal"
                                                id="saveLendId">
                                            确定
                                        </button>
                                        <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive col-xs-12">
                            <table id="datatable_fengkong_daishen2" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>机构名称</th>
                                    <th>机构简称</th>
                                    <th>商务负责人</th>
                                    <th>费率计算方式</th>
                                    <th>合作时间</th>
                                    <th style="width:8%;">借款合同</th>
                                    <th style="width:25%;">备注</th>
                                    <th>使用状态</th>
                                    <th style="width:5%;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lendList}" var="lendList">
                                    <tr>
                                        <td><span data-toggle="modal" data-target=".institutional_details"
                                                  onclick="detail('${lendList.orgNo}','${lendList.profitType}')"
                                                  style="   cursor: pointer;color: #3396c7;">${lendList.name }</span>
                                        </td>
                                        <td>${lendList.shortName}</td>
                                        <td>${lendList.contactUserId}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${lendList.profitType == '01'}"> <a
                                                        href="${pageContext.request.contextPath}/mfq/lend/findRate.do?id=${lendList.orgNo}&profittype=01"><font
                                                        color="#169BD5">等额本息</font></a></c:when>
                                                <c:when test="${lendList.profitType == '02'}"> <a
                                                        href="${pageContext.request.contextPath}/mfq/lend/findRate.do?id=${lendList.orgNo}&profittype=02"><font
                                                        color="#169BD5">等本等息</font></a></c:when>
                                                <c:otherwise><a
                                                        href="${pageContext.request.contextPath}/mfq/lend/findRate.do?id=${lendList.orgNo}&profittype="><font
                                                        color="#169BD5">添加费率</font></a></c:otherwise>
                                            </c:choose>
                                                <%--<a href="two_tables_fangkuan_fuwufei.html" style="color: #31B89A;border-bottom: 1px solid #31B89A;">测试123</a>--%>
                                        </td>
                                        <td><fmt:formatDate value="${lendList.corpDate}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td><a href="#" style="color: #31B89A;border-bottom: 1px solid #31B89A;"><a
                                                href="${pageContext.request.contextPath}/mfq/lend/viewContract.do?orgNo=${lendList.orgNo}&type=1"
                                                style="color: #3396c7;">查看合同</a></a>
                                        </td>
                                        <td>${lendList.remark}</td>
                                        <td>${lendList.status eq "1" ? "生效" : "已下线"}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${lendList.status == '1' }"><span
                                                        style="text-align: center;cursor: pointer; "
                                                        onclick="checkUp('${lendList.orgNo}')"><font
                                                        color="#169BD5">上线</font></span> </c:when>
                                                <c:otherwise><font color="#169BD5">下线</font></c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade institutional_details" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">机构详情</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div id="testmodal" style="padding: 5px 20px;">
                                            <form id="antoform" class="form-horizontal calender" role="form">
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">机构名称:</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 5px;"
                                                         id="nameId">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商务负责人</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 5px;"
                                                         id="userNameId">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">结算日</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 5px;"
                                                         id="settleDateId">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">结算周期</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 5px;"
                                                         id="settlePeriodId">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">服务费率</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 6px;">
                                                        <a href="" id="buttonEditId"
                                                           style="color: #31B89A;">编辑
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;color: #73879C;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 8px;"
                                                         id="remarkId">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">使用状态</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="margin-top: 6px;">
                                                        <%--<div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>
                                                                <input type="checkbox" id="statusId"/>
                                                            </label> 1 2
                                                        </div>--%>


                                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>
                                                                <input type="checkbox" class="js-switch"
                                                                       onclick="check()" id="checkId" checked/>
                                                            </label>
                                                        </div>


                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 5px;color: #73879C;">
                                                    <div class="x_content">
                                                        <table id="datatable-xiangqing"
                                                               class="table table-striped table-bordered">
                                                            <thead>
                                                            <tr id="activeTableId">
                                                                <th>服务费</th>
                                                                <th>用户分期</th>
                                                                <th>费率%</th>
                                                                <th>日逾期费率(%)</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="activeId">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </form>
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
</div>
<!-- /page content -->
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script>
    $("#saveLendId").click(function () {

        var name = $("#saveLend input[name='name']").val()
        if (!strCheck(name)) {
            $.confirm({
                title: '系统提示',
                text: "输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var shortName = $("#saveLend input[name='shortName']").val()
        if (!strCheck(shortName)) {
            $.confirm({
                title: '系统提示',
                text: "输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var ccountName = $("#saveLend input[name='ccountName']").val()
        if (!strCheck(ccountName)) {
            $.confirm({
                title: '系统提示',
                text: "输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var bankAccount = $("#saveLend input[name='bankAccount']").val()
        if (!strCheck(bankAccount)) {
            $.confirm({
                title: '系统提示',
                text: "输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var bank = $("#saveLend input[name='bank']").val()
        if (!strCheck(bank)) {
            $.confirm({
                title: '系统提示',
                text: "输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("saveLend"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/lend/saveLend.do",
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

    // 放款机构详情
    function detail(orgNo, profitType) {
//        var form = new FormData(document.getElementById("saveLend"));
        $("#buttonEditId").attr("href", '${pageContext.request.contextPath}/mfq/lend/findRate.do?id=' + orgNo + '&profittype=' + profitType);
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/lend/findLendDetail.do?orgNo=" + orgNo,
            type: "post",
            data: '',
            processData: false,
            contentType: false,
            success: function (obj) {
                var json = jQuery.parseJSON(obj);
                if (json.code == 1) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else if (json.code == -1) {
                    $.confirm({
                        title: '系统提示',
                        text: "参数错误!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    var data = json.lenderRateVO;
                    var active = json.active;
                    console.log(active);
                    $("#nameId").html(' ');
                    $("#userNameId").html('');
                    $("#settleDateId").html(' ');
                    $("#settlePeriodId").html(' ');
                    $("#remarkId").html(' ');

                    if (data.settlePeriod == 'moneth') {
                        settlePeriod = '月'
                    } else if (data.settlePeriod == 'quarter') {
                        settlePeriod = '季'
                    } else if (data.settlePeriod == 'year') {
                        settlePeriod = '年'
                    } else {
                        settlePeriod = '其他'
                    }
                    $("#nameId").html(data.name);
                    $("#userNameId").html(data.userName);
                    $("#settleDateId").html(data.settleDate);
                    $("#settlePeriodId").html(settlePeriod);
                    $("#remarkId").html(data.remark);

                    console.log(active.length);


                    var html = " ";
                    $("#activeId").html(html);
                    if (active[0].profitType == '02') {
                        html = "<tr>" +
                            "<td>" + "" + "-" + "" + "</td>" +
                            "<td>3、6、9、12</td>" +
                            "<td>" + active[0].threePeriodRate + "," + active[0].sixPeriodRate + "," + active[0].ninePeriodRate + "," + active[0].twelvePeriodRate + "</td>" +
                            "<td>" + "" + "</td>" +
                            "</tr>";
                    } else if (active[0].profitType == '01') {
                        html = "<tr>" +
                            "<td>" + "" + "-" + "" + "</td>" +
                            "<td></td>" +
                            "<td>" + active[0].flatRate + "</td>" +
                            "<td>" + active[0].overdueRate + "</td>" +
                            "</tr>";
                    }
                    $("#activeId").html(html);
                }
            },
            error: function (e) {
                console.log(e);
                location.reload();
            }
        });
    }

    // 检查是否可以上线
    function checkUp(orgNo) {
        $.ajax({
            type: "POST",
            url: "/mfq/lend/checkUp.do?orgNo=" + orgNo,
            async: false,
            dataType: "json",
            success: function (obj) {
                console.log(obj);
                var data = obj;
//                var data = jQuery.parseJSON(obj);
                if (data.code == '1') {
                    $.confirm({
                        title: '系统提示',
                        text: "请设置费率和合同模板，设置完成才能上线生效",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "已上线",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                }
            }
        });
    }

    function check(ck) {
        if ($("#checkId").attr("checked") == 'checked') {
            $("#checkId").removeAttr("checked");
        } else {
            $("#checkId").attr("checked", "checked");
        }
    }

</script>
</body>
</html>