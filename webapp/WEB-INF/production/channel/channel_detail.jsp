<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                        <li><a href="javascript:history.back(-1)">渠道管理</a></li>
                        <li>渠道详情</li>
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

                            <div class="col-md-6 col-xs-12" style="margin-top: 10px;">

                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">基本信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <!-- <li><a class=""><i class="fa fa-pencil-square-o" style="font-size: 20px;"
                                                               data-toggle="modal"
                                                               data-target=".essential_information"></i></a>
                                            </li> -->
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                            <div class="modal fade essential_information" tabindex="-1" role="dialog"
                                                 aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">

                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-hidden="true">×
                                                            </button>
                                                            <h4 class="modal-title" id="">渠道基本信息</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div id="" style="padding: 5px 20px;">
                                                                <form id="base" class="form-horizontal calender"
                                                                      role="form">
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道名称</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   value="${list.channelName}"
                                                                                   name="channelName"
                                                                                   placeholder="只支持英文、汉字、数字">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道类型</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="storeTypeId">
                                                                                <c:forEach items="${storeType}"
                                                                                           var="storeTypes">
                                                                                    <option value="${storeTypes.id}" ${list.storeTypeId == storeTypes.id ? 'selected':''}>${storeTypes.name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="creditLevel">
                                                                                <option value="01" ${list.creditLevel == '01'? 'selected':''}>
                                                                                    优秀
                                                                                </option>
                                                                                <option value="02" ${list.creditLevel == '02'? 'selected':''}>
                                                                                    良好
                                                                                </option>
                                                                                <option value="03" ${list.creditLevel == '03'? 'selected':''}>
                                                                                    一般
                                                                                </option>
                                                                                <option value="04" ${list.creditLevel == '04'? 'selected':''}>
                                                                                    黑名单
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   value="${list.contactPerson }"
                                                                                   name="contactPerson"
                                                                                   placeholder="请输入联系人姓名">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人电话</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   value="${list.contactTelephone }"
                                                                                   name="contactTelephone"
                                                                                   placeholder="请输入联系人电话">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道地址</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                                 style="padding-left: 0;margin-bottom: 5px;">
                                                                                <select onchange="initCity(this)"
                                                                                        class="form-control"
                                                                                        id="province">
                                                                                    <option value="">请选择省份</option>
                                                                                    <c:forEach items="${province}"
                                                                                               var="i">
                                                                                        <option value="${i.id}" ${provinceId eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                                 style="margin-bottom: 5px;">
                                                                                <select id="city" class="form-control"
                                                                                        onchange="initDistrict(this)">
                                                                                    <c:forEach items="${city}" var="i">
                                                                                        <option value="${i.id}" ${cityId eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                                 style="margin-bottom: 5px;">
                                                                                <select class="form-control"
                                                                                        id="district" name="areaId">
                                                                                    <c:forEach items="${district}"
                                                                                               var="i">
                                                                                        <option value="${i.id}" ${list.areaId eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-md-12 col-sm-12 col-xs-12"
                                                                                 style="margin-bottom: 5px;padding-left: 0;">
                                                                                <input type="text" class="form-control"
                                                                                       name="address"
                                                                                       value="${list.address}"
                                                                                       placeholder="请输入渠道详细地址">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" name="id" value="${list.id}"/>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer" style="text-align: center;">
                                                            <button type="button" class="btn btn-success antoclose"
                                                                    onclick="updateBase()"
                                                                    data-dismiss="modal">保存
                                                            </button>
                                                            <button type="button" class="btn btn-primary antosubmit"
                                                                    data-dismiss="modal">
                                                                取消
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </ul>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target=".essential_information" style="float: right;">编辑
                                        </button>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <form id="demo-form2" data-parsley-validate
                                              class="form-horizontal form-label-left">
                                            <div class="form-group col-md-4 col-sm-4 col-xs-12"
                                                 style="text-align: center;">
                                                <div class="form-group"
                                                     style=" border: 1px solid #EEEEEE;margin: auto;"><img
                                                        src="${channelQrUrl}"
                                                        style="width: 100%;"/>
                                                    <span><a
                                                            href="${pageContext.request.contextPath}/mfq/store/dowload.do?fileName=${list.qrCode}">下载二维码</a></span>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-8 col-sm-8 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道名称</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            ${list.channelName}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道类型</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            ${list.channelTypeName}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            ${list.contactPerson }
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">联系电话</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            ${list.contactTelephone }
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            ${list.creditName}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道地址</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            ${list.address}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="form-group col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-2 col-sm-3 col-xs-12">商户简介 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            ${list.address}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-2 col-sm-3 col-xs-12"></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                            <div class="form-group">
                                                <%--<label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级</label>--%>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <%--${list.creditName}--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>


                                <!--收款信息-->

                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">收款信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <!-- <li><a class=""><i class="fa fa-pencil-square-o" style="font-size: 20px;"
                                                               data-toggle="modal"
                                                               data-target=".receivables_information"></i></a>
                                            </li> -->
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                            <div class="modal fade receivables_information" tabindex="-1" role="dialog"
                                                 aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">

                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-hidden="true">×
                                                            </button>
                                                            <h4 class="modal-title" id="myModalLabel">收款信息</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div id="testmodal" style="padding: 5px 20px;">
                                                                <form id="bank" class="form-horizontal calender"
                                                                      role="form">
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">账号类型</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="bankType">
                                                                                <option value="01"${list.bankType == '01'? 'selected':''}>
                                                                                    公司账号
                                                                                </option>
                                                                                <option value="02" ${list.bankType == '02'? 'selected':''}>
                                                                                    个人账号
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">银行名称</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="openingBank">
                                                                                <c:forEach items="${banks}" var="bank">
                                                                                    <option value="${bank.code}" ${list.openingBank == bank.code ? 'selected': '' }>${bank.name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">支行信息</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   value="${list.bankBranchName}"
                                                                                   name="bankBranchName"
                                                                                   placeholder="请输入支行信息">
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">银行开户行名</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   value="${list.openingBankName }"
                                                                                   name="openingBankName"
                                                                                   placeholder="请输入银行开户行名">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">银行账户</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="number" class="form-control"
                                                                                   value="${list.bankCard }"
                                                                                   name="bankCard"
                                                                                   placeholder="请输入银行账号">
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" name="id" value="${list.id}"/>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer" style="text-align: center;">
                                                            <button type="button" class="btn btn-success antoclose"
                                                                    onclick="updateBank()"
                                                                    data-dismiss="modal">保存
                                                            </button>
                                                            <button type="button" class="btn btn-primary antosubmit"
                                                                    data-dismiss="modal">取消
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ul>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target=".receivables_information" style="float: right;">编辑
                                        </button>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <form class="form-horizontal form-label-left">

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">账户类型</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <c:if test="${list.bankType eq '01'}">公司账号</c:if>
                                                        <c:if test="${list.bankType eq '02'}">个人账号</c:if>
                                                        <c:if test="${list.bankType == '' || list.bankType == null}">暂无记录</c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">银行名称 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.bkName}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">支行信息 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.bankBranchName}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">银行开户行名 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.openingBankName }
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">银行账户 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.bankCard }
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!--签约详情-->

                            <div class="col-md-6 col-xs-12" style="margin-top: 10px;">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">签约详情</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <!-- <li><a class=""><i class="fa fa-pencil-square-o" style="font-size: 20px;"
                                                               data-toggle="modal"
                                                               data-target=".details_of_contract"></i></a>
                                            </li> -->
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                            <div class="modal fade details_of_contract" tabindex="-1" role="dialog"
                                                 aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">

                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-hidden="true">×
                                                            </button>
                                                            <h4 class="modal-title" id="">签约详情</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div id="" style="padding: 5px 20px;">
                                                                <form id="sign" class="form-horizontal calender"
                                                                      role="form">
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">签约周期</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="signCycle">
                                                                                <option value="1" ${list.signCycle == 1 ? 'selected':''}>
                                                                                    一年
                                                                                </option>
                                                                                <option value="2" ${list.signCycle == 2 ? 'selected':''}>
                                                                                    二年
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">使用费率</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="signRateType">
                                                                                <option value="1" ${list.signRateType == '1' ? 'selected':''}>
                                                                                    商户费率
                                                                                </option>
                                                                                <option value="2" ${list.signRateType == '2' ? 'selected':''}>
                                                                                    渠道费率
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">合作方式</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="workType">
                                                                                <option value="01" ${list.workType == '01' ? 'selected': ''}>
                                                                                    无担保
                                                                                </option>
                                                                                <option value="02" ${list.workType == '02' ? 'selected': ''}>
                                                                                    联合担保
                                                                                </option>
                                                                                <option value="03" ${list.workType == '03' ? 'selected': ''}>
                                                                                    全额担保
                                                                                </option>
                                                                                <option value="" ${list.workType == '' || list.workType==null? 'selected': ''}>
                                                                                    暂未选择
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">基础授信额度</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <input type="number"
                                                                                       class="form-control"
                                                                                       value="${storeCreditVO.credit == null ? 0:storeCreditVO.credit}"
                                                                                       name="storeCredit"
                                                                                       placeholder="请输入正整数">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">授信周期</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <select name="storeCreditType"
                                                                                        class="form-control">
                                                                                    <option value="1">月</option>
                                                                                    <option value="3">季</option>
                                                                                    <option value="12">年</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">已付担保金</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <input type="number"
                                                                                       class="form-control"
                                                                                       value="${storeGuarauteeVO.guarautee == null? 0: storeGuarauteeVO.guarautee}"
                                                                                       name="guarautee"
                                                                                       placeholder="请输入正整数">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">担保金授信额度</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <input type="number"
                                                                                       class="form-control"
                                                                                       value="${storeGuarauteeVO.guarauteeCredit == null ? 0: storeGuarauteeVO.guarauteeCredit}"
                                                                                       name="guarauteeCredit"
                                                                                       placeholder="请输入正整数">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" name="id" value="${list.id}"/>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer" style="text-align: center;">
                                                            <button type="button" class="btn btn-success antoclose"
                                                                    onclick="channelSign()"
                                                                    data-dismiss="modal">保存
                                                            </button>
                                                            <button type="button" class="btn btn-primary antosubmit"
                                                                    data-dismiss="modal">取消
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ul>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target=".details_of_contract" style="float: right;">编辑
                                        </button>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <form class="form-horizontal form-label-left">

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">签约时间</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <fmt:formatDate value="${list.signTime}" pattern="yyyy-MM-dd"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">签约周期 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.signCycle }年
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">使用费率</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <c:if test="${list.signRateType == '1'}">商户费率</c:if>
                                                        <c:if test="${list.signRateType == '2'}">渠道费率</c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道费率 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:#29BB9C;font-size: 14px;margin-bottom: 10px;">
                                                        <a href="${pageContext.request.contextPath}/mfq/store/storeRateDetail.do?storeId=${list.id}&type=STORE"
                                                           style="color:#29BB9C;">查看编辑</a></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">用户费率 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;font-size: 14px;margin-bottom: 10px;">
                                                        <a href="${pageContext.request.contextPath}/mfq/store/platformList.do?storeId=${list.id}&rateType=02"
                                                           style="color:#29BB9C;">查看编辑</a></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">基础授信额度</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <span style="float: left;">${storeCreditVO.surplusCredit == null ? 0:storeCreditVO.surplusCredit}（已用）/${storeCreditVO.credit == null ? 0:storeCreditVO.credit}</span>
                                                        <i class="fa fa-exclamation-circle"
                                                           style="font-size: 20px;float: right;color: #EEAC57;cursor: pointer;"
                                                           data-toggle="modal" data-target=".basic_credit_line"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">已付担保金</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${storeGuarauteeVO.guarautee == null? 0: storeGuarauteeVO.guarautee}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">担保金授信额度</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <span style="float: left;">${storeGuarauteeVO.surplusGuarauteeCredit == null ? 0:storeGuarauteeVO.surplusGuarauteeCredit}（已用）/${storeGuarauteeVO.guarauteeCredit == null ? 0: storeGuarauteeVO.guarauteeCredit}</span><i
                                                            class="fa fa-exclamation-circle"
                                                            style="font-size: 20px;float: right;color: #EEAC57;cursor: pointer;"
                                                            data-toggle="modal" data-target=".credit_credit_line"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">信息来源</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                        </ul>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target=".change_of_person" style="float: right;">编辑
                                        </button>
                                        <div class="clearfix"></div>
                                    </div>

                                    <!--信用额度模态框-->


                                    <div class="modal fade basic_credit_line" tabindex="-1" role="dialog"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">×
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">基础授信额度</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div id="testmodal" style="padding: 5px 20px;">
                                                        <form id="antoform" class="form-horizontal calender"
                                                              role="form">
                                                            <div class="form-group" style="margin-bottom: 5px;">
                                                                <div class="x_content">
                                                                    <table id="datatable-xiangqing"
                                                                           class="table table-striped table-bordered">
                                                                        <thead>
                                                                        <tr>
                                                                            <th>更新时间</th>
                                                                            <th>使用额度</th>
                                                                            <th>备注</th>
                                                                            <th>操作人</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <c:forEach items="${creditLogs}"
                                                                                   var="creditLog">
                                                                            <tr>
                                                                                <td><fmt:formatDate
                                                                                        value="${creditLog.createTime}"
                                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                                <td>${creditLog.type == 'TRUE' ? '＋':'－'}${creditLog.credit}</td>
                                                                                <td>${creditLog.remark}</td>
                                                                                <td>${creditLog.creator}</td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <!-- <div class="modal-footer" style="text-align: center;">
                                                    <button type="button" class="btn btn-primary antosubmit"
                                                            data-dismiss="modal">取消
                                                    </button>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>


                                    <div class="modal fade credit_credit_line" tabindex="-1" role="dialog"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">×
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">担保金授信额度</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div id="testmodal" style="padding: 5px 20px;">
                                                        <form id="antoform" class="form-horizontal calender"
                                                              role="form">
                                                            <div class="form-group" style="margin-bottom: 5px;">
                                                                <div class="x_content">
                                                                    <table id="datatable-xiangqing"
                                                                           class="table table-striped table-bordered">
                                                                        <thead>
                                                                        <tr>
                                                                            <th>更新时间</th>
                                                                            <th>使用额度</th>
                                                                            <th>备注</th>
                                                                            <th>操作人</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <c:forEach items="${guarauteeLogs}"
                                                                                   var="guarauteeLog">
                                                                            <tr>
                                                                                <td><fmt:formatDate
                                                                                        value="${guarauteeLog.createTime}"
                                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                                <td>${guarauteeLog.type == 'TRUE' ? '＋':'－'}${guarauteeLog.credit == null? 0:guarauteeLog.credit}</td>
                                                                                <td>${guarauteeLog.remark}</td>
                                                                                <td>${guarauteeLog.creator}</td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <!-- <div class="modal-footer" style="text-align: center;">
                                                    <button type="button" class="btn btn-primary antosubmit"
                                                            data-dismiss="modal">取消
                                                    </button>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>

                                    <!--信息来源-->
                                    <div class="x_content">
                                        <form class="form-horizontal form-label-left">

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">信息来源</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <c:choose>
                                                            <c:when test="${list.source eq '01'}">
                                                                个人资源
                                                            </c:when>
                                                            <c:when test="${list.source eq '02'}">
                                                                公司资源
                                                            </c:when>
                                                            <c:when test="${list.source eq '03'}">
                                                                朋友介绍
                                                            </c:when>
                                                            <c:when test="${list.source eq '04'}">
                                                                扫店
                                                            </c:when>
                                                            <c:when test="${list.source eq '05'}">
                                                                客户介绍
                                                            </c:when>
                                                            <c:otherwise>
                                                                其他
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">创建时间 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <fmt:formatDate value="${list.createTime}"
                                                                        pattern="yyyy-MM-dd"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">创建人 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.creator }
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">负责人 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.principalName}
                                                        <div style="float: right;"><span
                                                                style="padding-right: 10px;color: #29BB9C;cursor: pointer;"
                                                                data-toggle="modal" data-target=".change_the_record">更改记录</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">部门</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        ${list.detpName}
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!--信息来源模态框	-->

                            <div class="modal fade change_the_record" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                ×
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">负责人更换记录</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="testmodal" style="padding: 5px 20px;">
                                                <form id="antoform" class="form-horizontal calender" role="form">
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <div class="x_content">
                                                            <table id="datatable-xiangqing"
                                                                   class="table table-striped table-bordered">
                                                                <thead>
                                                                <tr>
                                                                    <th>更新时间</th>
                                                                    <th>负责人</th>
                                                                    <th>操作人</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach var="headerchanges"
                                                                           items="${headerChangeList}"
                                                                           varStatus="status">
                                                                    <tr>
                                                                        <td><fmt:formatDate
                                                                                value="${headerchanges.update_time}"
                                                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                        <td>${headerchanges.principal_name}</td>
                                                                        <td>${headerchanges.operators}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- <div class="modal-footer" style="text-align: center;">
                                            <button type="button" class="btn btn-primary antosubmit"
                                                    data-dismiss="modal">取消
                                            </button>
                                        </div> -->
                                    </div>
                                </div>
                            </div>


                            <div class="modal fade change_of_person" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                ×
                                            </button>
                                            <h4 class="modal-title" id="">负责人变更</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="" style="padding: 5px 20px;">
                                                <form id="updatEprincipalUserIds" class="form-horizontal calender"
                                                      role="form">
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">原负责人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            ${list.principalName}
                                                        </div>
                                                    </div>

                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">新负责人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="principalUserIds" class="form-control">
                                                                <c:forEach items="${userList }" var="i">
                                                                    <option value="${i.id }">${i.realName }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="id" value="${list.id}"/>
                                                    <input type="hidden" name="type" value="02"/>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer" style="text-align: center;">
                                            <button type="button" onclick="subprincipalUserIds()"
                                                    class="btn btn-success antoclose" data-dismiss="modal">
                                                保存
                                            </button>
                                            <button type="button" class="btn btn-primary antosubmit"
                                                    data-dismiss="modal"
                                                    style="">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--关联商户-->

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">关联商户</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                        </ul>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target=".add_related_businesses" style="float: right;">添加
                                        </button>

                                        <div class="modal fade add_related_businesses" tabindex="-1" role="dialog"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">×
                                                        </button>
                                                        <h4 class="modal-title" id="">添加关联商户</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div id="" style="padding: 5px 20px;">
                                                            <form id="saveSore" class="form-horizontal calender"
                                                                  role="form">
                                                                <div class="form-group" style="margin-bottom: 5px;">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商户名称</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <select class="form-control" name="id">
                                                                            <c:forEach items="${storeList}"
                                                                                       var="storeList">
                                                                                <option value="${storeList.id}">${storeList.name}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <%--<div class="form-group" style="margin-bottom: 5px;">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">审核方式</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <select class="form-control" name="auditMethod">
                                                                            <option value="3">正常审核</option>
                                                                            <option value="2">分级审核</option>
                                                                            <option value="1">自动审核</option>
                                                                        </select>
                                                                    </div>
                                                                </div>--%>
                                                                <div class="form-group" style="margin-bottom: 5px;">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">审核方</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <select class="form-control" name="auditParty">
                                                                            <option value="1">渠道审核</option>
                                                                            <option value="2">商户审核</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer" style="text-align: center;">
                                                        <button type="button" class="btn btn-success antoclose"
                                                                onclick="saveSore()"
                                                                data-dismiss="modal">保存
                                                        </button>
                                                        <button type="button" class="btn btn-primary antosubmit"
                                                                data-dismiss="modal">取消
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="" class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>商户名称</th>
                                                <th>商户类型</th>
                                                <th>审核方</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="channelStore" items="${channelStore}" varStatus="status">
                                                <tr>
                                                    <td>${channelStore.name}</td>
                                                    <td>${channelStore.storeTypeName}</td>
                                                    <td>
                                                        <c:if test="${channelStore.auditParty == 1 }">渠道审核</c:if>
                                                        <c:if test="${channelStore.auditParty == 2 }">商户审核</c:if>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <span class=""
                                                              style="padding:5px; background:#5bc0de;color:#ffffff;border-radius:5px;cursor: pointer;margin-right:5px;"
                                                              data-toggle="modal"
                                                              data-target=".amend_the_merchant_${channelStore.id}">修改

                                                        </span>
                                                        <div class="modal fade amend_the_merchant_${channelStore.id}"
                                                             tabindex="-1"
                                                             role="dialog" aria-hidden="true">
                                                            <div class="modal-dialog modal-lg">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                                onclick="deleteStore('${channelStore.id}')"
                                                                                data-dismiss="modal" aria-hidden="true">
                                                                            ×
                                                                        </button>
                                                                        <h4 class="modal-title" id="">
                                                                            修改关联商户</h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div id="" style="padding: 5px 20px;">
                                                                            <form id="updateAuditType_${channelStore.id}"
                                                                                  class="form-horizontal calender"
                                                                                  role="form">
                                                                                    <%--<div class="form-group"
                                                                                         style="margin-bottom: 5px;">
                                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">审核方式</label>
                                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                            <select name="auditMethod"
                                                                                                    class="form-control">
                                                                                                <option value="3" ${channelStore.auditMethod == 3 ? 'selected':'' }>
                                                                                                    正常审核
                                                                                                </option>
                                                                                                <option value="2" ${channelStore.auditMethod == 2 ? 'selected':'' }>
                                                                                                    分级审核
                                                                                                </option>
                                                                                                <option value="1" ${channelStore.auditMethod == 1 ? 'selected':'' }>
                                                                                                    自动审核
                                                                                                </option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>--%>
                                                                                <div class="form-group"
                                                                                     style="margin-bottom: 5px;">
                                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">审核方</label>
                                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                        <select class="form-control"
                                                                                                name="auditParty">
                                                                                            <option value="1" ${channelStore.auditParty == 1 ? 'selected':''}>
                                                                                                渠道审核
                                                                                            </option>
                                                                                            <option value="2" ${channelStore.auditParty == 2 ? 'selected':''}>
                                                                                                商户审核
                                                                                            </option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                                <input type="hidden" name="id"
                                                                                       value="${channelStore.id}"/>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer"
                                                                         style="text-align: center;">
                                                                        <button type="button"
                                                                                onclick="updateAuditType('${channelStore.id}')"
                                                                                class="btn btn-success antoclose"
                                                                                data-dismiss="modal">保存
                                                                        </button>
                                                                        <button type="button"
                                                                                class="btn btn-primary antosubmit"
                                                                                data-dismiss="modal">取消
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <span class=""
                                                              onclick="deleteStore('${channelStore.id}')"
                                                              style="padding:5px; background:#E54E43;color:#ffffff;border-radius:5px;">删除</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>


                            <!--渠道账号-->

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">渠道账号</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                        </ul>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target=".merchant_account_number" style="float: right;">添加
                                        </button>

                                        <div class="modal fade merchant_account_number" tabindex="-1" role="dialog"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">×
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">添加渠道账号</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div id="" style="padding: 5px 20px;">
                                                            <form id="saveUser" class="form-horizontal calender"
                                                                  role="form">
                                                                <div class="form-group" style="margin-bottom: 5px;">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">登录账号</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <input type="text" class="form-control"
                                                                               name="userName" maxlength="11"
                                                                               pattern="^1[34578]\d{9}$"
                                                                               placeholder="请输入登录账号">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group" style="margin-bottom: 5px;">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">真实姓名</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <input type="text" class="form-control"
                                                                               name="realName"
                                                                               placeholder="请输入真实姓名">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group" style="margin-bottom: 5px;">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">账号描述</label>
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <input type="text" class="form-control"
                                                                               name="remark"
                                                                               placeholder="请输入账号描述">
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" name="type" value="04"/>
                                                                <input type="hidden" name="storeId"
                                                                       value="${list.id}"/>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer" style="text-align: center;">
                                                        <button type="button" onclick="subLogin()"
                                                                class="btn btn-success antoclose"
                                                                data-dismiss="modal">保存
                                                        </button>
                                                        <button type="button" class="btn btn-primary antosubmit"
                                                                data-dismiss="modal">取消
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="datatable-zhenhe" class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>登录账号</th>
                                                <th>创建日期</th>
                                                <th>真实姓名</th>
                                                <th>账号描述</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="users" items="${userAccountVOList}">
                                                <tr>
                                                    <td>${users.userName}</td>
                                                    <td><fmt:formatDate value="${users.createTime}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td>${users.realName}</td>
                                                    <td>${users.remark}</td>
                                                    <td><span class=""
                                                              style="padding:5px; background:#E54E43;color:#ffffff;border-radius:5px;cursor: pointer;"
                                                              data-toggle="modal"
                                                              onclick="deleteLog('${users.id}')"/>删除</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <!--会访记录-->

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">会访记录</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                        </ul>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target=".bs-example-modal-lg"
                                                style="float: right;background:#ffffff;color:#286090;padding:0;font-size:18px;border:0;">
                                            添加
                                        </button>

                                        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">×
                                                        </button>
                                                        <h4 class="modal-title" id="">添加会访记录</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div id="" style="padding: 5px 20px;">
                                                            <form id="seeId" class="form-horizontal calender"
                                                                  role="form">
                                                                <div class="form-group">
                                                                    <div class="col-xs-12">
                                                                    <textarea class="form-control" style="height:100px;"
                                                                              id="descr" name="context"></textarea>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" name="storeId" value="${list.id}"/>
                                                                <input type="hidden" name="type" value="02"/>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer" style="text-align:center;">
                                                        <button type="button" onclick="subSee()"
                                                                class="btn btn-success antoclose"
                                                                data-dismiss="modal">保存
                                                        </button>
                                                        <button type="button" class="btn btn-primary antosubmit"
                                                                data-dismiss="modal">取消
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="datatable-beizhu" class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>创建人</th>
                                                <th>创建时间</th>
                                                <th>内容</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${maps }">
                                                <tr>
                                                    <td>${item.realName}</td>
                                                    <td><fmt:formatDate value="${item.createTime}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td>${item.context }</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
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
    // 添加拜访记录
    function subSee() {
        var desc = $("#seeId textarea[name='context']").val();
        if (!strCheck(desc)) {
            $.confirm({
                title: '系统提示',
                text: "输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var form = new FormData(document.getElementById("seeId"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/saveMeetingRecord.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败",
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

    // 修改商户审核方式
    function updateAuditType(id) {
        var form = new FormData(document.getElementById("updateAuditType_" + id));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/updateStore.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "更改失败",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    location.reload();
                }
            },
            error: function (e) {
                alert(e);
            }
        });
    }

    // 负责人变更
    function subprincipalUserIds() {
        var form = new FormData(document.getElementById("updatEprincipalUserIds"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/headerchange.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "更改失败",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    location.reload();
                }
            },
            error: function (e) {
            }
        });
    }

    // 更新签约信息
    function channelSign() {

        var guarauteeCredit = $("#sign input[name='guarauteeCredit']").val();
        if (!strCheck(guarauteeCredit)) {
            $.confirm({
                title: '系统提示',
                text: "担保金额度输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var guarautee = $("#sign input[name='guarautee']").val();
        if (!strCheck(guarautee)) {
            $.confirm({
                title: '系统提示',
                text: "担保金输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var storeCredit = $("#sign input[name='storeCredit']").val();
        if (!strCheck(storeCredit)) {
            $.confirm({
                title: '系统提示',
                text: "授信额度输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("sign"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/channel/updateChannel.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "修改失败",
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

    // 删除登录账号
    function deleteLog(id) {
        if (confirm('确认删除吗 ?')) {
            $.ajax({
                url: "${pageContext.request.contextPath}/mfq/channel/deleteUser.do?id=" + id,
                type: "post",
                data: "",
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.code == 0) {
                        $.confirm({
                            title: '系统提示',
                            text: "添加失败",
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
    }

    // 删除关联商户
    function deleteStore(id) {

        if (confirm('确认删除吗 ?')) {
            var url = "${pageContext.request.contextPath}/mfq/channel/updateChannelChange/${list.id}/0.do?id=" + id
            $.ajax({
                url: url,
                type: "post",
                data: "",
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.code == 0) {
                        $.confirm({
                            title: '系统提示',
                            text: "添加失败",
                            confirmButton: '确认',
                            cancelButton: false,
                        });
                    } else {
                        location.reload();
                    }
                },
                error: function (e) {
                    console.log(e);
                    alert(e);
                }
            });
        }
    }

    // 添加关联商户
    function saveSore() {
        var form = new FormData(document.getElementById("saveSore"));
        var url = "${pageContext.request.contextPath}/mfq/channel/updateChannelChange/${list.id}/1.do";
        $.ajax({
            url: url,
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败",
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

    // 更改银行信息
    function updateBank() {

        var bankCard = $("#bank input[name='bankCard']").val()
        if (!strCheck(bankCard)) {
            $.confirm({
                title: '系统提示',
                text: "银行名称输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var openingBankName = $("#bank input[name='openingBankName']").val()
        if (!strCheck(openingBankName)) {
            $.confirm({
                title: '系统提示',
                text: "开户行名输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var bankBranchName = $("#bank input[name='bankBranchName']").val()
        if (!strCheck(bankBranchName)) {
            $.confirm({
                title: '系统提示',
                text: "支行信息输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("bank"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/channel/updateChannel.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "修改失败",
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

    // 修改基本信息
    function updateBase() {

        var address = $("#base input[name='address']").val();
        if (!strCheck(address)) {
            $.confirm({
                title: '系统提示',
                text: "地址输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactTelephone = $("#base input[name='contactTelephone']").val();
        if (!strCheck(contactTelephone)) {
            $.confirm({
                title: '系统提示',
                text: "联系人电话输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactPerson = $("#base input[name='contactPerson']").val();
        if (!strCheck(contactPerson)) {
            $.confirm({
                title: '系统提示',
                text: "联系人输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var channelName = $("#base input[name='channelName']").val();
        if (!strCheck(channelName)) {
            $.confirm({
                title: '系统提示',
                text: "名称输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("base"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/channel/updateChannel.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "修改失败",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "修改成功",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                    location.reload();
                }
            },
            error: function (e) {
            }
        });
    }

    // 加载市
    function initCity(i) {
        if (i != null && $.trim(i).length != 0) {
            $("#district").prev().find("span").html("");
            $("#city").prev().find("span").html("");
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mfq/store/findProvince.do",
                data: {
                    "pid": $(i).val()
                },
                success: function (data) {
                    var json = jQuery.parseJSON(data);
                    $("#city").empty();
                    $("#district").empty();
                    $("#city").append($("<option value=''>请选择城市</option>"));
                    for (var int = 0; int < json.length; int++) {
                        $("#city").append($("<option value=" + json[int].id + ">" + json[int].name + "</option>"));
                    }
                }
            });
        }
    };

    // 加载区
    function initDistrict(i) {
        if (i != null && $.trim(i).length != 0) {
            $("#district").prev().find("span").html("");
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mfq/store/findProvince.do",
                data: {
                    "pid": $(i).val()
                },
                success: function (data) {
                    var json = jQuery.parseJSON(data);
                    $("#district").empty();
                    $("#district").append($("<option value=''>请选择区</option>"));
                    for (var int = 0; int < json.length; int++) {
                        $("#district").append($("<option value=" + json[int].id + ">" + json[int].name + "</option>"));
                    }
                }
            });
        }
    }

    // 添加账号
    function subLogin() {

        var realName = $("#saveUser input[name='realName']").val()
        if (!strCheck(realName)) {
            $.confirm({
                title: '系统提示',
                text: "真实姓名输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var userName = $("#saveUser input[name='userName']").val()
        if (!strCheck(userName)) {
            $.confirm({
                title: '系统提示',
                text: "账号输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("saveUser"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/userAccount/saveUserAccoVO.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                if (data.num == 1) {
                    location.reload();
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                }
            },
            error: function (e) {
                alert(e);
            }
        });
    }
</script>
</body>
</html>