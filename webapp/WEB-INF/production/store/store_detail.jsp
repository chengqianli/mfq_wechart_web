<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Boss Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/boss.css" rel="stylesheet">
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
                        <li>合作商户</li>
                        <li><a href="javascript:history.back(-1)">商户列表</a></li>
                        <li>商户详情</li>
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
                                        <h2 style="line-height: 1;font-size: 18px;">基本信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
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
                                                            <h4 class="modal-title">基本信息</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div style="padding: 5px 20px;">
                                                                <form id="updateBaseId" class="form-horizontal calender"
                                                                      role="form">
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户名称</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   value="${store.name}" name="name"
                                                                                   id="nameId"
                                                                                   placeholder="只支持英文、汉字、数字">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户类型</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="storeTypeId">
                                                                                <c:forEach items="${storeType}"
                                                                                           var="storeTypes">
                                                                                    <option value="${storeTypes.id}" ${store.storeTypeId == storeTypes.id ? 'selected':''}>${storeTypes.name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户属性</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select name="storeAttr"
                                                                                    class="form-control">
                                                                                <option value="01" ${store.storeAttr == '01' ? 'selected':''}>
                                                                                    总店
                                                                                </option>
                                                                                <option value="02" ${store.storeAttr == '02' ? 'selected':''}>
                                                                                    分店
                                                                                </option>
                                                                                <option value="03" ${store.storeAttr == '03' ? 'selected':''}>
                                                                                    加盟店
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select name="creditLevel"
                                                                                    class="form-control">
                                                                                <option value="01">优秀</option>
                                                                                <option value="02">良好</option>
                                                                                <option value="03">一般</option>
                                                                                <option value="04">黑名单</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   name="contactPerson"
                                                                                   value="${store.contactPerson}"
                                                                                   placeholder="请输入联系人姓名">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人电话</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" class="form-control"
                                                                                   name="contactTelephone"
                                                                                   value="${store.contactTelephone}"
                                                                                   placeholder="请输入联系人电话">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户地址</label>
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
                                                                                        <option value="${i.id}" ${list.AREA_ID eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-md-12 col-sm-12 col-xs-12"
                                                                                 style="margin-bottom: 5px;padding-left: 0;">
                                                                                <input type="text" class="form-control"
                                                                                       name="address"
                                                                                       value="${store.address }"
                                                                                       placeholder="请输入商户详细地址">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${headType == '01'}">
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">营业执照号</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <input type="text" class="form-control"
                                                                                       value="${store.businessNo}"
                                                                                       name="businessNo"
                                                                                       id="businessNoId"
                                                                                       placeholder="只支持英文、汉字、数字">
                                                                            </div>
                                                                        </div>
                                                                    </c:if>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户优势</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                <label> <input type="checkbox"
                                                                                               name="radio"
                                                                                               id="vl_01"
                                                                                               value="01"/>
                                                                                    可用社保
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                <label> <input type="checkbox"
                                                                                               name="radio"
                                                                                               id="vl_02"
                                                                                               value="02"/>
                                                                                    上市企业
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                <label> <input type="checkbox"
                                                                                               name="radio"
                                                                                               id="vl_03"
                                                                                               value="03"/>
                                                                                    连锁
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                <label> <input type="checkbox"
                                                                                               name="radio"
                                                                                               id="vl_05"
                                                                                               value="05"/>
                                                                                    行业前三
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                <label> <input type="checkbox"
                                                                                               name="radio"
                                                                                               id="vl_04"
                                                                                               value="04"/>
                                                                                    行业第一
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                                                <label> <input type="checkbox"
                                                                                               name="radio"
                                                                                               id="vl_06"
                                                                                               value="06"
                                                                                />
                                                                                    美容认证
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户简介
                                                                        </label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <textarea class="form-control" rows="5"
                                                                                      name="shortName"
                                                                                      placeholder=''>${store.shortName}</textarea>
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" name="id" value="${store.id}">
                                                                    <input type="hidden" name="type"
                                                                           value="${headType}">
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer" style="text-align: center;">
                                                            <button type="button" onclick="subBasic()"
                                                                    class="btn btn-success antoclose"
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
                                            <c:if test="${headType == '01'}">
                                                <div class="form-group col-md-2 col-sm-2 col-xs-12"
                                                     style="text-align: center;">
                                                    <div class="form-group"
                                                         style="border: 1px solid #EEEEEE;margin: auto;">
                                                        <img onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'
                                                             src="${storeQrUrl}"
                                                             style="width: 100%;"/>
                                                            <%-- <img onerror='this.src="http://ww4.sinaimg.cn/large/006y8mN6gw1fa5obmqrmvj305k05k3yh.jpg"'
                                                             src="${storeQrUrl}"
                                                             style="width: 100%;"/>--%>
                                                        <span><a
                                                                href="${pageContext.request.contextPath}/mfq/store/dowload.do?fileName=${store.qrCode}">下载二维码</a></span>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="form-group col-md-5 col-sm-5 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商户名称</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.name}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商户属性</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            <c:if test="${store.storeAttr == '01'}">总店</c:if>
                                                            <c:if test="${store.storeAttr == '02'}">分店</c:if>
                                                            <c:if test="${store.storeAttr == '03'}">加盟店</c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.contactPerson }</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商户地址</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.address }</div>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商户简介 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="position: relative;"
                                                         id="bomb_box_mine">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
                                                            ${store.shortName}
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-xs-12" id="bomb_box"
                                                             style="background:#ffffff; display: none;position: absolute;top: 20px;left: 40%;border: 1px solid;border-radius: 8px;z-index: 10;">
                                                            ${store.shortName}
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>


                                            <div class="form-group col-md-5 col-sm-5 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商户类型</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.storeTypeName }</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            <c:if test="${store.creditLevel == '01'}">优秀</c:if>
                                                            <c:if test="${store.creditLevel == '02'}">良好</c:if>
                                                            <c:if test="${store.creditLevel == '03'}">一般</c:if>
                                                            <c:if test="${store.creditLevel == '04'}">黑名单</c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">联系电话</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.contactTelephone}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">商户优势 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                            <c:set value='${store.advantage.split(",") }'
                                                                   var="advantages"/>
                                                            <c:forEach var="i" items="${ advantages }">
                                                                <c:if test="${i eq '01' }">可用社保 &nbsp;&nbsp;</c:if>
                                                                <c:if test="${i eq '02' }">上市企业&nbsp;&nbsp;</c:if>
                                                                <c:if test="${i eq '03' }">连锁&nbsp;&nbsp;</c:if>
                                                                <c:if test="${i eq '04' }">行业第一&nbsp;&nbsp;</c:if>
                                                                <c:if test="${i eq '05' }">行业前三&nbsp;&nbsp;</c:if>
                                                                <c:if test="${i eq '06' }">美容认证&nbsp;&nbsp;</c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${headType == '01'}">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">营业执照号</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <div class="ln_solid"
                                                                 style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                                    ${store.businessNo}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>

                                            <%--<div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           style="padding-right: 20px">商户简介 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="padding-left: 0">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.shortName}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           style="padding-right: 20px"></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12" style="padding-left: 0">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                                    </div>
                                                </div>
                                            </div>--%>


                                        </form>
                                    </div>
                                </div>
                            </div>


                            <!--收款信息-->

                            <div class="col-md-6 col-xs-12" style="margin-top: 10px;">
                                <c:if test="${headType == '01'}">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2 style="line-height: 1;font-size: 18px;">收款信息</h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <!-- <li><a class=""><i class="fa fa-pencil-square-o"
                                                                   style="font-size: 20px;"
                                                                   data-toggle="modal"
                                                                   data-target=".receivables_information"></i></a>
                                                </li> -->
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>
                                                <div class="modal fade receivables_information" tabindex="-1"
                                                     role="dialog"
                                                     aria-hidden="true">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">

                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-hidden="true">×
                                                                </button>
                                                                <h4 class="modal-title">收款信息</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div style="padding: 5px 20px;">
                                                                    <form id="updateBankId"
                                                                          class="form-horizontal calender"
                                                                          role="form">
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">账号类型</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <select class="form-control"
                                                                                        name="bankType">
                                                                                    <option value="01" ${store.bankType == '01' ? 'selected':''}>
                                                                                        公司
                                                                                    </option>
                                                                                    <option value="02" ${store.bankType == '02' ? 'selected':''}>
                                                                                        个人
                                                                                    </option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">银行名称</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <select class="form-control"
                                                                                        name="openingBank">
                                                                                    <c:forEach items="${banks}"
                                                                                               var="bank">
                                                                                        <option value="${bank.code}" ${store.openingBank == bank.code ? 'selected': '' }>${bank.name}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">支行信息</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <input type="text" class="form-control"
                                                                                       value="${store.bankBranchName}"
                                                                                       name="bankBranchName"
                                                                                       placeholder="请输入支行信息">
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">银行开户行名</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <input type="text" class="form-control"
                                                                                       value="${store.openingBankName}"
                                                                                       name="openingBankName"
                                                                                       placeholder="请输入银行开户行名">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group"
                                                                             style="margin-bottom: 5px;">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">银行账户</label>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <input type="number"
                                                                                       class="form-control"
                                                                                       value="${store.bankCard}"
                                                                                       name="bankCard"
                                                                                       placeholder="请输入银行账号">
                                                                            </div>
                                                                        </div>
                                                                        <input type="hidden" name="id"
                                                                               value="${store.id}"/>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer" style="text-align: center;">
                                                                <button type="button" onclick="subBank()"
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
                                                            <c:if test="${store.bankType == '01'}">公司</c:if>
                                                            <c:if test="${store.bankType == '02'}">个人</c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">银行名称 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.bkName}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">支行信息 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.bankBranchName}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">银行开户行名 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.openingBankName}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">银行账户 </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.bankCard}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="ln_solid"
                                                             style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:if>
                                <!--商户资质-->
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">商户资质</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <form class="form-horizontal form-label-left">

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">营业执照副本</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <span style="padding-right: 10px;color:#E54D42;">已验证</span>
                                                        <div style="float: right;">
                                                            <span style="color: #29BB9C;cursor: pointer;"
                                                                  data-toggle="modal" data-target=".see_five">查看</span>
                                                            <label class="btn btn-upload" for="img_url1"
                                                                   style=" float: right;padding: 0;border: 0;margin: 0;margin-left:5px;margin-top:5px;">
                                                                <input type="file" class="sr-only" name="file"
                                                                       accept="image/*" onchange="imgChange('url1')"
                                                                       id="img_url1">
                                                                <span style="color: #29BB9C;" i>
                                                                     上传
                                                              </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">法人身份证</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <span style="padding-right: 10px;color:#E54D42;">已验证</span>
                                                        <div style="float: right;">
                                                        <span style="color: #29BB9C;cursor: pointer;"
                                                              data-toggle="modal" data-target=".see_four">查看</span>
                                                            <label class="btn btn-upload" for="img_url3"
                                                                   style=" float: right;padding: 0;border: 0;margin: 0;margin-left:5px;margin-top:5px;">
                                                                <input type="file" class="sr-only"
                                                                       onchange="imgChange('url3')" id="img_url3"
                                                                       name="file" accept="image/*">
                                                                <span style="color: #29BB9C" id="">
														                                                        上传
														                          </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">组织机构代码证书 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <span style="padding-right: 10px;color:#E54D42;">已验证</span>
                                                        <div style="float: right;">
                                                        <span style="color: #29BB9C;cursor: pointer;"
                                                              data-toggle="modal" data-target=".see_two">查看</span>

                                                            <label class="btn btn-upload" for="img_url2"
                                                                   style=" float: right;padding: 0;border: 0;margin: 0;margin-left:5px;margin-top:5px;">
                                                                <input type="file" class="sr-only"
                                                                       onchange="imgChange('url2')" id="img_url2"
                                                                       name="file" accept="image/*">
                                                                <span style="color: #29BB9C;" id="">
														                         上传
														                          </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">其他资质 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <span style="padding-right: 10px;color:#E54D42;">已验证</span>
                                                        <div style="float: right;">
                                                                <span style="color: #29BB9C; cursor: pointer;"
                                                                      data-toggle="modal"
                                                                      data-target=".see_one">查看</span>
                                                            <label class="btn btn-upload" for="img_url4"
                                                                   style=" float: right;padding: 0;border: 0;margin: 0;margin-left:5px;margin-top:5px;">
                                                                <input type="file" class="sr-only"
                                                                       onchange="imgChange('url4')" id="img_url4"
                                                                       name="file" accept="image/*">
                                                                <span style="color: #29BB9C;" id="picture">
														                                上传
														                          </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;"></div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <!--					       查看模态框   -->
                            <div class="modal fade see_five" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                ×
                                            </button>
                                            <h4 class="modal-title" id="" style="float: left;">营业执照副本</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="" style="padding: 5px 20px;">
                                                <form id="" class="form-horizontal calender" role="form">
                                                    <div class="form-group"
                                                         style="margin-bottom: 10px; text-align: center;">
                                                        <img src="${servicePicUrl}${store.url1}"
                                                             style="max-width: 100%; max-height: 100%"
                                                             onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'/>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer" style="text-align: center;">
                                            <button type="button" class="btn btn-primary antosubmit"
                                                    data-dismiss="modal">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade see_four" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                ×
                                            </button>
                                            <h4 class="modal-title" id="" style="float: left;">法人身份证</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="" style="padding: 5px 20px;">
                                                <form id="" class="form-horizontal calender" role="form">
                                                    <div class="form-group"
                                                         style="margin-bottom: 10px; text-align: center;">
                                                        <img src="${servicePicUrl}${store.url3}"
                                                             style="max-width: 100%; max-height: 100%"
                                                             onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'/>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer" style="text-align: center;">
                                            <button type="button" class="btn btn-primary antosubmit"
                                                    data-dismiss="modal">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade see_two" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title" style="float: left;">组织结构代码</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div style="padding: 5px 20px;">
                                            <form class="form-horizontal calender" role="form">
                                                <div class="form-group"
                                                     style="margin-bottom: 10px; text-align: center;">
                                                    <img src="${servicePicUrl}${store.url2}"
                                                         style="max-width: 100%; max-height: 100%"
                                                         onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'/>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="text-align: center;">
                                        <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade see_one" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title" style="float: left;">其它资质 </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div style="padding: 5px 20px;">
                                            <form class="form-horizontal calender" role="form">
                                                <div class="form-group"
                                                     style="margin-bottom: 10px; text-align: center;">
                                                    <img src="${servicePicUrl}${store.url4}"
                                                         style="max-width: 100%; max-height: 100%"
                                                         onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'/>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="text-align: center;">
                                        <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--签约详情-->

                        <div class="col-md-6 col-xs-12" style="margin-top: 10px;">
                            <c:if test="${headType == '01'}">
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
                                                            <h4 class="modal-title">签约详情</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div id="" style="padding: 5px 20px;">
                                                                <form id="subSignId" class="form-horizontal calender"
                                                                      role="form">
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">签约周期</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select class="form-control"
                                                                                    name="signCycle">
                                                                                <option value="1">一年</option>
                                                                                <option value="2">二年</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">基础授信额度</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="number" class="form-control"
                                                                                   value="${storeCreditVO.credit == null ? 0:storeCreditVO.credit}"
                                                                                   name="storeCredit"
                                                                                   placeholder="请输入正整数">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
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
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">已付担保金</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="number" class="form-control"
                                                                                   value="${storeGuarauteeVO.guarautee == null? 0: storeGuarauteeVO.guarautee}"
                                                                                   name="guarautee"
                                                                                   placeholder="请输入正整数">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">担保金授信额度</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="number" class="form-control"
                                                                                   value="${storeGuarauteeVO.guarauteeCredit == null ? 0: storeGuarauteeVO.guarauteeCredit}"
                                                                                   name="guarauteeCredit"
                                                                                   placeholder="请输入正整数">
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" name="id" value="${store.id}"/>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer" style="text-align: center;">
                                                            <button type="button" onclick="subSign()"
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
                                                        <fmt:formatDate value="${store.signTime}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">签约周期 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">
                                                        <c:if test="${store.signCycle == '1'}">一年</c:if>
                                                        <c:if test="${store.signCycle == '2'}">二年</c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">商户费率 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:#29BB9C;font-size: 14px;margin-bottom: 10px;">
                                                        <a href="${pageContext.request.contextPath}/mfq/store/storeRateDetail.do?storeId=${store.id}&type=STORE"
                                                           style="color:#29BB9C;">查看编辑</a></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">用户费率 </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="ln_solid"
                                                         style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;font-size: 14px;margin-bottom: 10px;">
                                                        <a href="${pageContext.request.contextPath}/mfq/store/platformList.do?storeId=${store.id}&rateType=02"
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
                            </c:if>
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
                                                <h4 class="modal-title">基础授信额度</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div style="padding: 5px 20px;">
                                                    <form class="form-horizontal calender" role="form">
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <div class="x_content">
                                                                <table
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
                                                                    <c:forEach items="${creditLogs}" var="creditLog">
                                                                        <tr>
                                                                            <td><fmt:formatDate
                                                                                    value="${creditLog.createTime}"
                                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                            <td>
                                                                                    ${creditLog.type == 'TRUE' ? '＋':'－'}
                                                                                    ${creditLog.credit}
                                                                            </td>
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
                                            <div class="modal-footer" style="text-align: center;">
                                                <button type="button" class="btn btn-primary antosubmit"
                                                        data-dismiss="modal">取消
                                                </button>
                                            </div>
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
                                                    <form id="antoform" class="form-horizontal calender" role="form">
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <div class="x_content">
                                                                <table
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
                                                                            <td> ${guarauteeLog.type == 'TRUE' ? '＋':'－'}${guarauteeLog.credit == null? 0:guarauteeLog.credit}</td>
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
                                            <div class="modal-footer" style="text-align: center;">
                                                <button type="button" class="btn btn-primary antosubmit"
                                                        data-dismiss="modal">取消
                                                </button>
                                            </div>
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
                                                    <fmt:formatDate value="${store.createTime}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">创建人 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.creator}</div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">负责人 </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.principalName}

                                                    <div style="float: right;"><span
                                                            style="padding-right: 10px;color: #29BB9C;cursor: pointer;"
                                                            data-toggle="modal"
                                                            data-target=".change_the_record">更改记录</span>
                                                        <!-- <i class="fa fa-pencil-square-o"
                                                           style="font-size: 20px; cursor: pointer;" data-toggle="modal"
                                                           data-target=".change_of_person"></i> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">部门</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="ln_solid"
                                                     style="border-bottom: 1px solid #e5e5e5;border-top: 0;width: 80%;height: 30px; line-height: 30px;margin-top: 0;color:inherit;font-size: 14px;margin-bottom: 10px;">${store.detpName}</div>
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
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
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
                                                            <c:forEach var="headerChangeList"
                                                                       items="${headerChangeList}">
                                                                <tr>
                                                                    <td>${headerChangeList.update_time}</td>
                                                                    <td>${headerChangeList.principal_name}</td>
                                                                    <td>${headerChangeList.operators}</td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="text-align: center;">
                                        <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">
                                            取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="modal fade change_of_person" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
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
                                                        ${store.principalName}
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
                                                <input type="hidden" name="id" value="${store.id}"/>
                                                <input type="hidden" name="type" value="01"/>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="text-align: center;">
                                        <button type="button" onclick="subprincipalUserIds()"
                                                class="btn btn-success antoclose" data-dismiss="modal">
                                            保存
                                        </button>
                                        <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal"
                                        >取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--服务项目-->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <c:if test="${headType == '01'}">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">服务项目</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="" class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>服务名称</th>
                                                <th>创建日期</th>
                                                <th>市场价</th>
                                                <th>优惠价</th>
                                                    <%--<th>操作</th>--%>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${servicesList}" var="service">
                                                <tr>
                                                    <td>${service.serverName}</td>
                                                    <td><fmt:formatDate value="${service.createDate}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td>${service.marketPrice}</td>
                                                    <td>${service.price}</td>
                                                        <%--<td style="text-align: center;"><i class="fa fa-pencil-square-o" style="font-size: 20px;padding-right: 10px;"></i><i class="fa fa-times-circle" style="font-size: 20px;color: #E54E43;"></i></td>--%>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:if>
                        </div>


                        <!--商户账号-->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <c:if test="${headType == '01'}">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="line-height: 1;font-size: 18px;">商户账号</h2>
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
                                                        <h4 class="modal-title" id="">添加商户账号</h4>
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
                                                                <input type="hidden" name="type" value="02"/>
                                                                <input type="hidden" name="storeId"
                                                                       value="${store.id}"/>
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
                                                        <%--<td>${users.createTime}</td>--%>
                                                    <td>${users.realName}</td>
                                                    <td>${users.remark}</td>
                                                    <td><span class=""
                                                              style="padding:5px; background:#E54E43;color:#ffffff;border-radius:5px; cursor: pointer;"
                                                              data-toggle="modal"
                                                              onclick="deleteLog('${users.id}')"/>删除</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:if>
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
                                            data-target=".bs-example-modal-lg" style="float: right;">添加
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
                                                            <input type="hidden" name="storeId" value="${store.id}"/>
                                                            <input type="hidden" name="type" value="01"/>
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
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script>

    $(function () {
        console.log('${store.advantage}')
        var advantages = '${store.advantage}';
        var adv = advantages.split(",")
        console.log(adv)
        for (var i = 0; i < adv.length; i++) {
            console.log(adv[i])
            $("#vl_" + adv[i]).attr("checked", "checked");
        }
    });

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

    // 修改基本信息
    function subBasic() {
        var shortName = $("#updateBaseId textarea[name='shortName']").val()
        if (!strCheck(shortName)) {
            $.confirm({
                title: '系统提示',
                text: "简介输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var address = $("#updateBaseId input[name='address']").val()
        if (!strCheck(address)) {
            $.confirm({
                title: '系统提示',
                text: "地址输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactTelephone = $("#updateBaseId input[name='contactTelephone']").val()
        if (!strCheck(contactTelephone)) {
            $.confirm({
                title: '系统提示',
                text: "联系人电话输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactPerson = $("#updateBaseId input[name='contactPerson']").val()
        if (!strCheck(contactPerson)) {
            $.confirm({
                title: '系统提示',
                text: "联系人输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var name = $("#updateBaseId input[name='name']").val()
        if (!strCheck(name)) {
            $.confirm({
                title: '系统提示',
                text: "名称输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }


        var form = new FormData(document.getElementById("updateBaseId"));
        var flg = jiaoyan("nameId");
        if (!flg) {
            $.confirm({
                title: '系统提示',
                text: "商户名称错误!",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        //jiaoyan(2);
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/updateStore.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data)
                if (data.code == 0) {
                    $.confirm({
                        title: '系统提示',
                        text: "商家更改失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "商家更改成功!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                    location.reload();
                }
            }/*,
                error:function(e){
                }*/
        });
    }

    // 修改银行信息
    function subBank() {

        var bankCard = $("#updateBankId input[name='bankCard']").val()
        if (!strCheck(bankCard)) {
            $.confirm({
                title: '系统提示',
                text: "银行账号输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var openingBankName = $("#updateBankId input[name='openingBankName']").val()
        if (!strCheck(openingBankName)) {
            $.confirm({
                title: '系统提示',
                text: "开户行名输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var bankBranchName = $("#updateBankId input[name='bankBranchName']").val()
        if (!strCheck(bankBranchName)) {
            $.confirm({
                title: '系统提示',
                text: "支行信息输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("updateBankId"));
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
                        text: "更改失败!",
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
                        text: "更改失败!",
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
                text: "用户账号输入格式错误",
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
                    $.confirm({
                        title: '系统提示',
                        text: data.msg,
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                    location.reload();
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "添加失败!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                }
            },
            error: function (e) {
            }
        });
    }

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

    // 修改授信额度
    function subSign() {

        var guarauteeCredit = $("#subSignId input[name='guarauteeCredit']").val()
        if (!strCheck(guarauteeCredit)) {
            $.confirm({
                title: '系统提示',
                text: "担保金额度输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var guarautee = $("#subSignId input[name='guarautee']").val()
        if (!strCheck(guarautee)) {
            $.confirm({
                title: '系统提示',
                text: "担保金输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var storeCredit = $("#subSignId input[name='storeCredit']").val()
        if (!strCheck(storeCredit)) {
            $.confirm({
                title: '系统提示',
                text: "授信额度输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById("subSignId"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/updateSign.do",
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
    }

    function jiaoyan(type) {
        //商户名称 :
        var str = $("#" + type).val().replace(" ", "");
        $("#" + type).val(str);
        var flg = true;
        var sa = str.match(/^[\u4E00-\u9FA5a-zA-Z0-9_()（）]{0,}$/g);
        //由数字、26个英文字母或者下划线组成的字符串:/^[0-9a-zA-Z_]{1,}$/g
        if (null == sa || "" == str) {
            $("#" + type).focus();
            flg = false;
        }
        return flg;
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
    }

    $(function () {
        $('#bomb_box_mine').hover(function () {
            $('#bomb_box').css('display', 'block')
        }, function () {
            $('#bomb_box').css('display', 'none')
        })
    })


    // 文件上传
    function imgChange(name) {
        var formData = new FormData();
        formData.append('file', $('#img_' + name)[0].files[0]);
        $.ajax({
            url: '${pageContext.request.contextPath}/mfq/store/fileUpload.do',
            type: 'POST',
            cache: false,
            data: formData,
            processData: false,
            contentType: false
        }).done(function (res) {
            var data = jQuery.parseJSON(res);
            console.log(data);
            if (data.path != null) {
                $.confirm({
                    title: '系统提示',
                    text: '上传成功',
                    confirmButton: '确认',
                    cancelButton: false,
                });
                // 调用数据更新图片
                updateStoreImg(data.path, name);
            }
        }).fail(function (res) {
            console.log(res);
        });
    }

    // 修改商户图片
    function updateStoreImg(pth, name) {
        var formData = new FormData();
        formData.append('id', '${store.id}');
        formData.append(name, pth);
        $.ajax({
            url: '${pageContext.request.contextPath}/mfq/store/updateStore.do',
            type: 'POST',
            cache: false,
            data: formData,
            processData: false,
            contentType: false
        }).done(function (res) {
            var data = jQuery.parseJSON(res);
            if (data.code == 0) {
                $.confirm({
                    title: '系统提示',
                    text: "更改失败!",
                    confirmButton: '确认',
                    cancelButton: false,
                });
            } else {
                location.reload();
            }
        }).fail(function (res) {
            console.log(res);
        });

    }
</script>
</body>
</html>