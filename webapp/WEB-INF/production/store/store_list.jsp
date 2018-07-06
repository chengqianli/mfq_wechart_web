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

        .x_title {
            border-bottom: 2px dashed #E6E9ED;
        }

        h3 {
            text-align: center;
            line-height: 2;
        }

        .tile-stats .count {
            margin: 0;
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
                        <li>商户管理</li>
                        <li>合作商户</li>
                        <li>${headType == "02" ? '意向':''}商户列表</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="tile-stats">
                                <!--<div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>-->
                                <div class="count">${storeTotalCount}</div>
                                <c:if test="${store.type == '01'}">
                                    <h3>合作商户总数</h3>
                                </c:if>
                                <c:if test="${store.type == '02'}">
                                    <h3>意向商户总数</h3>
                                </c:if>
                            </div>
                        </div>
                        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="tile-stats">
                                <div class="count">${storeMonthCount}</div>
                                <c:if test="${store.type == '01'}">
                                    <h3>本月新增商户</h3>
                                </c:if>
                                <c:if test="${store.type == '02'}">
                                    <h3>本月新增意向商户</h3>
                                </c:if>
                            </div>
                        </div>
                        <c:if test="${store.type == '02'}">
                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="count">${chengCooperation}</div>
                                    <h3>本月意向转化</h3>
                                </div>
                            </div>
                        </c:if>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <input type="hidden" value="${store.type}" id="headType"/>
                        <!--字段筛选-->

                        <div class="col-md-12 col-sm-12 col-xs-12"
                             style="box-sizing: border-box;padding: 8px 0;padding-left: 0;">
                            <%--<form action="${pageContext.request.contextPath}/mfq/store/findStoreList.do" method="post">--%>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <c:if test="${store.type == '01'}">
                                    <input type="" name="" id="" value="签约时间" class="form-control"
                                           style="width: 25%; float: left;background:#fff;" readonly/>
                                </c:if>
                                <c:if test="${store.type == '02'}">
                                    <select name="timeType" id="timeTypeId" class="form-control"
                                            style="width: 25%;float: left;">
                                        <option value="0">录入时间</option>
                                        <option value="1">更新时间</option>
                                    </select>
                                </c:if>
                                <div class="col-xs-9" style="padding: 0;width: 75%;">
                                    <div class="col-xs-12" style="padding: 0;">
                                        <form class="form-horizontal">
                                            <fieldset>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <div class="input-prepend input-group">
															<span class="add-on input-group-addon"
                                                                  style="border-radius: 0;"><i
                                                                    class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                            <input type="text" name="reservation"
                                                                   id="reservation_table" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select name="areaId" id="areaId" class="form-control"
                                        style="width: 100%;float: left;box-shadow: none;">
                                    <option value="">地域</option>
                                    <c:forEach items="${areas}" var="areas">
                                        <option value="${areas.id}">${areas.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select name="storeTypeId" id="storeTypeId" class="form-control"
                                        style="width: 100%;float: left;box-shadow: none;">
                                    <option value="">商户类型</option>
                                    <c:forEach items="${storeTypes}" var="storeTypes">
                                        <option value="${storeTypes.id}">${storeTypes.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <input type="" name="name" id="name" placeholder="搜索商户名称" class="form-control"
                                       style="width: 100%;float: left;box-shadow: none;"/>
                            </div>
                            <button type="button" id="query" class="btn btn-primary">查询</button>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".newly_build"
                                    style="cursor: pointer;">新建
                            </button>


                            <!-- ============================================================================================================================= -->


                            <div class="modal fade edit_build" tabindex="-1" role="dialog" aria-hidden="true"
                                 disabled="fals" id="edit">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <form id="editFrom" class="form-horizontal calender" method="post"
                                              action="${pageContext.request.contextPath}/mfq/store/updateStroe.do">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    ×
                                                </button>
                                                <h4 class="modal-title">意向商户转合作商户</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div style="padding: 5px 20px;">

                                                    <div class="form-group" style="margin-bottom: 20px;color: #CC0000;">
                                                        <div class="control-label col-md-4 col-sm-4 col-xs-12">
                                                            *所有内容全部为必填项
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户负责人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="principalUserId" class="form-control">
                                                                <c:forEach items="${userList }" var="i">
                                                                    <option id="${i.id }"
                                                                            value="${i.id }">${i.realName }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户名称</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="name"
                                                                   id="nameId"
                                                                   placeholder="只支持英文、汉字、数字">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户类型</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" name="storeTypeId">
                                                                <c:forEach items="${storeTypes}" var="storeTypes">
                                                                    <option id="${storeTypes.id}"
                                                                            value="${storeTypes.id}">${storeTypes.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户属性</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="storeAttr" class="form-control">
                                                                <option id="storeAttr_01" value="01">
                                                                    总店
                                                                </option>
                                                                <option id="storeAttr_02" value="02">
                                                                    分店
                                                                </option>
                                                                <option id="storeAttr_03" value="03">
                                                                    加盟店
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="creditLevel" class="form-control">
                                                                <option id="creditLevel_01" value="01">优秀</option>
                                                                <option id="creditLevel_02" value="02">良好</option>
                                                                <option id="creditLevel_03" value="03">一般</option>
                                                                <option id="creditLevel_04" value="04">黑名单</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="contactPerson"
                                                                   id="contactPersonId"
                                                                   placeholder="请输入联系人姓名">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人电话</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control"
                                                                   name="contactTelephone" id="contactTelephoneId"
                                                                   placeholder="请输入联系人电话">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户地址</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="padding-left: 0;margin-bottom: 5px;">
                                                                <select onchange="initCity(this,'_add')"
                                                                        class="form-control">
                                                                    <option value="">请选择省份</option>
                                                                    <c:forEach items="${province}"
                                                                               var="i">
                                                                        <option value="${i.id}">${i.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="margin-bottom: 5px;">
                                                                <select class="form-control" id="city_add"
                                                                        onchange="initDistrict(this,'_add')">
                                                                    <c:forEach items="${city}" var="i">
                                                                        <option value="${i.id}">${i.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="margin-bottom: 5px;">
                                                                <select class="form-control" id="district_add"
                                                                        name="areaId">
                                                                    <c:forEach items="${district}"
                                                                               var="i">
                                                                        <option value="${i.id}">${i.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-12 col-sm-12 col-xs-12"
                                                                 style="margin-bottom: 5px;padding-left: 0;">
                                                                <input type="text" class="form-control"
                                                                       name="address" id="addressId"
                                                                       placeholder="请输入商户详细地址">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">营业执照号</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="businessNo"
                                                                   id="businessNoId"
                                                                   placeholder="只支持英文、汉字、数字">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">签约周期</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" name="signCycle">
                                                                <option value="1">一年</option>
                                                                <option value="2">二年</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">基础授信额度</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control"
                                                                   name="storeCredit"
                                                                   placeholder="请输入正整数">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">授信周期</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="storeCreditType" class="form-control">
                                                                <option value="1">月</option>
                                                                <option value="3">季</option>
                                                                <option value="12">年</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">已付保证金</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="guarautee"
                                                                   placeholder="请输入正整数">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">保证金授信额度</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control"
                                                                   name="guarauteeCredit"
                                                                   placeholder="请输入正整数">
                                                        </div>
                                                    </div>

                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">营业执照副本</label>
                                                        <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                               class="form-control" value="选择文件上传"
                                                               onchange="imgChange('add_url1')" id="img_add_url1"
                                                               style="overflow: hidden;">
                                                        <input type="hidden" name="url1" id="add_url1">
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">法人身份证正面</label>
                                                        <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                               class="form-control" value="选择文件上传"
                                                               onchange="imgChange('add_url3')" id="img_add_url3"
                                                               style="overflow: hidden;">
                                                        <input type="hidden" name="url3" id="add_url3">

                                                    </div>
                                                    <%-- <div class="form-group" style="margin-bottom: 5px;">
                                                         <label class="control-label col-md-3 col-sm-3 col-xs-12">法人身份证背面</label>
                                                         <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                                class="form-control" value="选择文件上传"
                                                                style="overflow: hidden;">
                                                     </div>--%>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">组织机构代码证书</label>
                                                        <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                               class="form-control" value="选择文件上传"
                                                               onchange="imgChange('add_url2')" id="img_add_url2"
                                                               style="overflow: hidden;">
                                                        <input type="hidden" name="url2" id="add_url2">

                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">其他资质</label>
                                                        <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                               class="form-control" value="选择文件上传"
                                                               onchange="imgChange('add_url4')" id="img_add_url4"
                                                               style="overflow: hidden;">
                                                        <input type="hidden" name="url4" id="add_url4">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer" style="text-align: center;">
                                                <button type="button" class="btn btn-success antoclose" id="editButton"
                                                        data-dismiss="modal">确定
                                                </button>
                                                <button type="button" class="btn btn-primary antosubmit"
                                                        data-dismiss="modal">取消
                                                </button>
                                            </div>
                                            <input type="hidden" value="01" name="type"/>
                                            <input type="hidden" value="" name="id" id="storeId"/>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <!-- ============================================================================================================================= -->


                            <div class="modal fade newly_build" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <form id="antoform" class="form-horizontal calender" role="form"
                                              action="${pageContext.request.contextPath}/mfq/store/saveStore.do">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    ×
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">添加新商户</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div id="testmodal" style="padding: 5px 20px;">

                                                    <div class="form-group" style="margin-bottom: 20px;color: #CC0000;">
                                                        <div class="control-label col-md-4 col-sm-4 col-xs-12">
                                                            *所有内容全部为必填项
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户负责人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="principalUserId" class="form-control">
                                                                <c:forEach items="${userList }" var="i">
                                                                    <option value="${i.id }">${i.realName }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户名称</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="name"
                                                                   placeholder="只支持英文、汉字、数字">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户类型</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" name="storeTypeId">
                                                                <c:forEach items="${storeTypes}" var="storeTypes">
                                                                    <option value="${storeTypes.id}" ${store.storeTypeId == storeTypes.id ? 'selected':''}>${storeTypes.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户属性</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select name="storeAttr" class="form-control">
                                                                <option value="01">
                                                                    总店
                                                                </option>
                                                                <option value="02">
                                                                    分店
                                                                </option>
                                                                <option value="03">
                                                                    加盟店
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <c:if test="${store.type == '01'}">
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">信用等级</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <select name="creditLevel" class="form-control">
                                                                    <option id="edit_creditLevel_01" value="01">优秀
                                                                    </option>
                                                                    <option id="edit_creditLevel_02" value="02">良好
                                                                    </option>
                                                                    <option id="edit_creditLevel_03" value="03">一般
                                                                    </option>
                                                                    <option id="edit_creditLevel_04" value="04">黑名单
                                                                    </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${store.type == '02'}">
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">商户来源</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <select name="source" class="form-control">
                                                                    <option value="01">个人来源</option>
                                                                    <option value="02">公司来源</option>
                                                                    <option value="03">朋友介绍</option>
                                                                    <option value="04">扫店</option>
                                                                    <option value="05">客户介绍</option>
                                                                    <option value="99">其他</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" name="contactPerson"
                                                                   placeholder="请输入联系人姓名">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">联系人电话</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control"
                                                                   name="contactTelephone"
                                                                   placeholder="请输入联系人电话">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商户地址</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="padding-left: 0;margin-bottom: 5px;">
                                                                <select onchange="initCity(this,'_edit')"
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
                                                                <select id="city_edit" class="form-control"
                                                                        onchange="initDistrict(this, '_edit')">
                                                                    <c:forEach items="${city}" var="i">
                                                                        <option value="${i.id}" ${cityId eq i.id ? 'selected' : ''}>${i.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 col-sm-4 col-xs-12"
                                                                 style="margin-bottom: 5px;">
                                                                <select class="form-control"
                                                                        id="district_edit" name="areaId">
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
                                                                       placeholder="请输入商户详细地址">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <c:if test="${store.type == '01'}">
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">营业执照号</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <input type="text" class="form-control"
                                                                       name="businessNo"
                                                                       placeholder="只支持英文、汉字、数字">
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">签约周期</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <select class="form-control" name="signCycle">
                                                                    <option value="1">一年</option>
                                                                    <option value="2">二年</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">基础授信额度</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <input type="text" class="form-control"
                                                                       name="storeCredit"
                                                                       placeholder="请输入正整数">
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">授信周期</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <select name="storeCreditType" class="form-control">
                                                                    <option value="1">月</option>
                                                                    <option value="3">季</option>
                                                                    <option value="12">年</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">已付保证金</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <input type="text" class="form-control" name="guarautee"
                                                                       placeholder="请输入正整数">
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">保证金授信额度</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <input type="text" class="form-control"
                                                                       name="guarauteeCredit"
                                                                       placeholder="请输入正整数">
                                                            </div>
                                                        </div>

                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">营业执照副本</label>
                                                            <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                                   onchange="imgChange('save_url1')" id="img_save_url1"
                                                                   class="form-control" value="选择文件上传"
                                                                   style="overflow: hidden;">
                                                            <input type="hidden" name="url1" id="save_url1">
                                                        </div>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">法人身份证正面</label>
                                                            <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                                   class="form-control" value="选择文件上传"
                                                                   onchange="imgChange('save_url3')" id="img_save_url3"
                                                                   style="overflow: hidden;">
                                                            <input type="hidden" name="url3" id="save_url3">
                                                        </div>
                                                        <%--<div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">法人身份证背面</label>
                                                            <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                                   class="form-control" value="选择文件上传"
                                                                   style="overflow: hidden;">
                                                        </div>--%>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">组织机构代码证书</label>
                                                            <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                                   onchange="imgChange('save_url2')" id="img_save_url2"
                                                                   class="form-control" value="选择文件上传"
                                                                   style="overflow: hidden;">
                                                            <input type="hidden" name="url2" id="save_url2">
                                                        </div>
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">其他资质</label>
                                                            <input class="col-md-9 col-sm-9 col-xs-12" type="file"
                                                                   onchange="imgChange('save_url4')" id="img_save_url4"
                                                                   class="form-control" value="选择文件上传"
                                                                   style="overflow: hidden;">
                                                            <input type="hidden" name="url4" id="save_url4">
                                                        </div>
                                                    </c:if>


                                                    <c:if test="${store.type == '02'}">
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">商户优势</label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <label> <input type="checkbox"
                                                                                   name="radio"
                                                                                   value="01"/>
                                                                        可用社保
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <label> <input type="checkbox"
                                                                                   name="radio"
                                                                                   value="02"/>
                                                                        上市企业
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <label> <input type="checkbox"
                                                                                   name="radio"
                                                                                   value="03"/>
                                                                        连锁
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <label> <input type="checkbox"
                                                                                   name="radio"
                                                                                   value="05"/>
                                                                        行业前三
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <label> <input type="checkbox"
                                                                                   name="radio"
                                                                                   value="04"/>
                                                                        行业第一
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <label> <input type="checkbox"
                                                                                   name="radio"
                                                                                   value="06"
                                                                                   checked="checked"/>
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
                                                                                      placeholder=''></textarea>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="modal-footer" style="text-align: center;">
                                                <button type="button" class="btn btn-success antoclose" id="submit"
                                                        data-dismiss="modal">确定
                                                </button>
                                                <button type="button" class="btn btn-primary antosubmit"
                                                        data-dismiss="modal">取消
                                                </button>
                                            </div>
                                            <input type="hidden" value="${store.type}" name="type"/>
                                        </form>
                                    </div>

                                </div>
                            </div>
                            <button type="button" onclick="exportStore()" id="exportStoreId"
                                    class="btn btn-primary">
                                导出
                            </button>
                            <%--</form>--%>
                        </div>
                        <div class="col-xs-12 ln_solid"></div>

                        <table id="datatable_List" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <c:if test="${store.type == '01'}">
                                    <th>商户名称</th>
                                    <th>商户类型</th>
                                    <th>地域</th>
                                    <th>信用等级</th>
                                    <th>市场负责人</th>
                                    <th>签约时间</th>
                                    <th>营业执照号</th>
                                </c:if>

                                <c:if test="${store.type == '02'}">
                                    <th>商户名称</th>
                                    <th>商户类型</th>
                                    <th>地域</th>
                                    <th>信息来源</th>
                                    <th>市场负责人</th>
                                    <th>录入时间</th>
                                    <th>最近更新时间</th>
                                    <th>转为合作商户</th>
                                </c:if>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>
<!-- ========================================================================================================================= -->

<script type="text/javascript">

    //
    $(function () {
        console.log('${headType == "01"}')
        if (${headType == "01"}) {   // 合作商户 (5列)
            // 初始化DataTables
            var table = $('#datatable_List').dataTable({
                autoWidth: false,  	// 禁用自动调整列宽
                scrollX: '100%',
                stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
                processing: false,  	// 隐藏加载提示,自行处理
                serverSide: true,  	// 启用服务器端分页
                searching: false,  	// 禁用原生搜索
                deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
                orderMulti: false,   // 启用多列排序
                aLengthMenu: [25, 50, 100],
                bPaginate: true,  //是否显示分页器
                bSort: false, //是否启动各个字段的排序功能
                order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
                renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
                ajaxSource: '${pageContext.request.contextPath}/mfq/store/storeList/' + $("#headType").val() + '.do',

                fnServerData: function (sSource, aoData, fnCallback) {
                    var timeType = "";
                    var reservation = $("#reservation_table").val();
                    var areaId = $("#areaId").val();
                    var storeTypeId = $("#storeTypeId").val();
                    var name = $("#name").val();
                    if ($("#headType").val() == '02') {
                        timeType = $("#timeTypeId").val();
                    }
//                var headType = $("#headType").val();
                    // 往后台封装数据，json格式的字符串
                    aoData.push({"name": "reservation", "value": reservation});
                    aoData.push({"name": "storeTypeId", "value": storeTypeId});
                    aoData.push({"name": "areaId", "value": areaId});
                    aoData.push({"name": "name", "value": name});
                    aoData.push({"name": "timeType", "value": timeType});
                    $.ajax({
                        type: 'POST',
                        url: sSource,
                        data: aoData,
                        dataType: 'json',
                        success: function (rs) {
                            console.log(rs);
                            fnCallback(rs);
                        }
                    });
                },
                columns: [
                    {
                        "data": function (obj) {
                            return "<a style='color:#3396c7;' href='${pageContext.request.contextPath}/mfq/store/findStoreDetail/" + obj.type + ".do?id=" + obj.id + "' style='cursor: pointer; text-decoration: underline; target='_blank'>" + obj.name + "</a>";
                        }
                    },
                    {"data": "storeTypeName","defaultContent": ""},
                    {"data": "areaName","defaultContent": ""},
                    {"data": "creditName","defaultContent": ""},
                    {"data": "principalName","defaultContent": ""},
                    {
                        "data": function (obj) {
                            if (obj.signTime != null) {
                                var substringedDate = obj.signTime;
                                (6); //substringedDate= 1291548407008)/
                                var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                                var date = new Date(parsedIntDate);  // parsedIntDate passed to date constructor
                                return timeStamp2String(date);
                            } else {
                                return '';
                            }
                        }
                    },
                    {
                        "data": function (obj) {
                            if (obj.businessNo != null) {
                                return obj.businessNo;
                            } else {
                                return '';
                            }
                        }
                    }
                ]
            });
        } else {     // 意向商户 (7列)
            // 初始化DataTables
            var table = $('#datatable_List').dataTable({
                autoWidth: false,  	// 禁用自动调整列宽
                scrollX: '100%',
                stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
                processing: false,  	// 隐藏加载提示,自行处理
                serverSide: true,  	// 启用服务器端分页
                searching: false,  	// 禁用原生搜索
                deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
                orderMulti: false,   // 启用多列排序
                aLengthMenu: [25, 50, 100],
                bPaginate: true,  //是否显示分页器
                bSort: false, //是否启动各个字段的排序功能
                order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
                renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
                ajaxSource: '${pageContext.request.contextPath}/mfq/store/storeList/' + $("#headType").val() + '.do',
                fnServerData: function (sSource, aoData, fnCallback) {
                    var timeType = "";
                    var reservation = $("#reservation_table").val();
                    var areaId = $("#areaId").val();
                    var storeTypeId = $("#storeTypeId").val();
                    var name = $("#name").val();
                    if ($("#headType").val() == '02') {
                        timeType = $("#timeTypeId").val();
                    }
//                var headType = $("#headType").val();
                    // 往后台封装数据，json格式的字符串
                    aoData.push({"name": "reservation", "value": reservation});
                    aoData.push({"name": "storeTypeId", "value": storeTypeId});
                    aoData.push({"name": "areaId", "value": areaId});
                    aoData.push({"name": "name", "value": name});
                    aoData.push({"name": "timeType", "value": timeType});
                    $.ajax({
                        type: 'POST',
                        url: sSource,
                        data: aoData,
                        dataType: 'json',
                        success: function (rs) {
                            console.log(rs);
                            fnCallback(rs);
                        }
                    });
                },
                columns: [
                    {
                        "data": function (obj) {
                            return "<a style='color:#3396c7;' href='${pageContext.request.contextPath}/mfq/store/findStoreDetail/" + obj.type + ".do?id=" + obj.id + "' style='cursor: pointer; text-decoration: underline; target='_blank'>" + obj.name + "</a>";
                        }
                    },
                    {"data": "storeTypeName","defaultContent": ""},
                    {"data": "areaName","defaultContent": ""},
                    {
                        "data": function (obj) {
                            if (obj.source == '01') {
                                return "个人来源"
                            } else if (obj.source == '02') {
                                return "公司来源"
                            } else if (obj.source == '03') {
                                return "朋友介绍"
                            } else if (obj.source == '04') {
                                return "扫店"
                            } else if (obj.source == '05') {
                                return "客户介绍"
                            } else {
                                return "其他"
                            }
                        }
                    },
                    {"data": "principalName","defaultContent": ""},
                    {
                        "data": function (obj) {
                            if (obj.updateTime != null) {
                                var substringedDate = obj.updateTime;
                                (6); //substringedDate= 1291548407008)/
                                var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                                var date = new Date(parsedIntDate);  // parsedIntDate passed to date constructor
                                return timeStamp2String(date);
                            } else {
                                return '';
                            }
                        }
                    },
                    {
                        "data": function (obj) {
                            if (obj.createTime != null) {
                                var substringedDate = obj.createTime;
                                (6); //substringedDate= 1291548407008)/
                                var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
                                var date = new Date(parsedIntDate);  // parsedIntDate passed to date constructor
                                return timeStamp2String(date);
                            } else {
                                return '';
                            }
                        }
                    },
                    {
                        "data": function (obj) {
                            return '<a style="color:#3396c7;" herf="#" onclick="edit(\'' + obj.id + '\')" data-toggle="modal" data-target=".edit_build" style="cursor:pointer;color:#1abb9c;">转为合作商户</a>';

                        }
                    }
                ]
            });
        }
        $('#query').click(function () {
            table.fnReloadAjax();
        });
    });

    // 导出
    function exportStore() {
        var timeType = "";
        var reservation = $("#reservation_table").val();
        var areaId = $("#areaId").val();
        var storeTypeId = $("#storeTypeId").val();
        var name = $("#name").val();
        var type = $("#headType").val();
        if ($("#headType").val() == '02') {
            timeType = $("#timeTypeId").val();
        }
        // 导出拼接参数
        var param = 'type=' + type + '&areaId=' + areaId + '&name=' + name + '&storeTypeId=' + storeTypeId
            + '&reservation=' + reservation + '&timeType=' + timeType;
        var url = '${pageContext.request.contextPath}/mfq/store/exportStore.do?' + param;
        window.location.href = url;
    }

    // 时间格式化
    function timeStamp2String(time) {
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        return year + "-" + month + "-" + date
    }
</script>
<script type="text/javascript">
    $('#reservation').daterangepicker({
        locale: {
            format: 'YYYY-MM-DD'
        }
    })

    // 加载市
    function initCity(i, typeName) {
        if (i != null && $.trim(i).length != 0) {
            $("#district" + typeName).prev().find("span").html("");
            $("#city" + typeName).prev().find("span").html("");
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mfq/store/findProvince.do",
                data: {
                    "pid": $(i).val()
                },
                success: function (data) {
                    var json = jQuery.parseJSON(data);
                    $("#city" + typeName).empty();
                    $("#district" + typeName).empty();
                    $("#city" + typeName).append($("<option value=''>请选择城市</option>"));
                    for (var int = 0; int < json.length; int++) {
                        $("#city" + typeName).append($("<option value=" + json[int].id + ">" + json[int].name + "</option>"));
                    }
                }
            });
        }
    };

    // 加载区
    function initDistrict(i, typeName) {
        if (i != null && $.trim(i).length != 0) {
            $("#district" + typeName).prev().find("span").html("");
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mfq/store/findProvince.do",
                data: {
                    "pid": $(i).val()
                },
                success: function (data) {
                    var json = jQuery.parseJSON(data);
                    $("#district" + typeName).empty();
                    $("#district" + typeName).append($("<option value=''>请选择区</option>"));
                    for (var int = 0; int < json.length; int++) {
                        $("#district" + typeName).append($("<option value=" + json[int].id + ">" + json[int].name + "</option>"));
                    }
                }
            });
        }
    }

    // 新建商户
    $("#submit").click(function () {
        var name = $("#antoform input[name='name']").val();
        if (!strCheck(name)) {
            $.confirm({
                title: '系统提示',
                text: "名称输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var address = $("#antoform input[name='address']").val();
        if (!strCheck(address)) {
            $.confirm({
                title: '系统提示',
                text: "地址输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactTelephone = $("#antoform input[name='contactTelephone']").val();
        if (!strCheck(contactTelephone)) {
            $.confirm({
                title: '系统提示',
                text: "联系人电话输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactPerson = $("#antoform input[name='contactPerson']").val();
        if (!strCheck(contactPerson)) {
            $.confirm({
                title: '系统提示',
                text: "联系人输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var form = new FormData(document.getElementById("antoform"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/saveStore.do",
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

    // 转为合作商户展开页
    function edit(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/store/findById.do?id=" + id,
            type: "post",
            data: '',
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                $("#" + data.principalUserId).attr('selected', 'selected');
                $("#" + data.storeTypeId).attr('selected', 'selected');
                $("#storeAttr_" + data.storeAttr).attr('selected', 'selected');
                $("#creditLevel_" + data.creditLevel).attr('selected', 'selected');
//                $("#creditLevel_"+data.creditLevel).attr('selected','selected');
                $("#nameId").val(data.name);
                $("#contactPersonId").val(data.contactPerson);
                $("#contactTelephoneId").val(data.contactTelephone);
                $("#addressId").val(data.address);
                $("#storeId").val(data.id);
                $("#businessNoId").val(data.businessNo);
            },
            error: function (e) {
                console.log(e);
                location.reload();
            }
        });
    }

    // 装为合作商户
    $("#editButton").click(function () {
        var name = $("#editFrom input[name='name']").val();
        if (!strCheck(name)) {
            $.confirm({
                title: '系统提示',
                text: "名称输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var address = $("#editFrom input[name='address']").val();
        if (!strCheck(address)) {
            $.confirm({
                title: '系统提示',
                text: "地址输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactTelephone = $("#editFrom input[name='contactTelephone']").val();
        if (!strCheck(contactTelephone)) {
            $.confirm({
                title: '系统提示',
                text: "联系人电话输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var contactPerson = $("#editFrom input[name='contactPerson']").val();
        if (!strCheck(contactPerson)) {
            $.confirm({
                title: '系统提示',
                text: "联系人输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var storeCredit = $("#editFrom input[name='storeCredit']").val();
        if (!strCheck(storeCredit)) {
            $.confirm({
                title: '系统提示',
                text: "授信额度输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var guarauteeCredit = $("#editFrom input[name='guarauteeCredit']").val();
        if (!strCheck(guarauteeCredit)) {
            $.confirm({
                title: '系统提示',
                text: "保证金额度输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var guarautee = $("#editFrom input[name='guarautee']").val();
        if (!strCheck(guarautee)) {
            $.confirm({
                title: '系统提示',
                text: "保证金输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }
        var form = new FormData(document.getElementById("editFrom"));
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
                $("#" + name).val(data.path)
            }
        }).fail(function (res) {
            console.log(res);
        });
    }
</script>

</body>
</html>