<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        th, td {
            text-align: center;
        }

        #datatable_shanghu_liebiao_paginate {
            display: none;
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
                        <li>系统设置</li>
                        <li>app更新配置</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <!--字段筛选-->
                        <form class="form-horizontal" id="seachId"
                              action="${pageContext.request.contextPath}/mfq/app/findAppEditionList.do" method="post">
                            <div class="col-md-12 col-sm-12 col-xs-12"
                                 style="box-sizing: border-box;padding: 8px 0;padding-left: 0;">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <input type="" name="versionCode" id="versionCodeSechId" placeholder="请输入版本标识"
                                           class="form-control"
                                           value="${commAppEditionDTO.versionCode}"
                                           style="float: left;"/>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <input type="" name="versionName" id="versionNameSechId" placeholder="请输入版本名称"
                                           class="form-control"
                                           value="${commAppEditionDTO.versionName}"
                                           style="float: left;"/>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <select name="type" class="form-control" id="typeId"
                                            style="width: 100%;float: left;">
                                        <option value="">版本类型</option>
                                        <option value="1" ${commAppEditionDTO.type == 1? 'selected':''}>android</option>
                                        <option value="2" ${commAppEditionDTO.type == 2? 'selected':''}>ios</option>
                                    </select>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <input type="" name="" id="inputText" value="发布时间" class="form-control"
                                           style="width: 40%; float: left;background:#fff;" readonly/>
                                    <div class="col-xs-9" style="padding: 0;width:60%;">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <div class="input-prepend input-group">
                                                        <span class="add-on input-group-addon"
                                                              style="border-radius: 0;"><i
                                                                class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                        <input type="text" name="reservation" id="reservation_table"
                                                               class="form-control"
                                                               value="${commAppEditionDTO.reservation}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" id="query">查询</button>
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target=".newly_build"
                                        style="cursor: pointer;">新建
                                </button>
                            </div>
                        </form>
                    </div>

                    <div class="modal fade newly_build" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        ×
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">发布更新</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="testmodal" style="padding: 5px 20px;">
                                        <form id="antoform" class="form-horizontal calender" role="form">
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">版本标识</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" class="form-control" name="versionCode"
                                                           id="versionCodeId"
                                                           placeholder="Android上次的版本标识${maxVersionCode}">
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">版本名称</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" class="form-control" name="versionName"
                                                           id="versionNameId"
                                                           placeholder="Android上次的版本名称${maxVersionName}">
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">更新内容
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <textarea class="form-control" rows="5" name="updateContent"
                                                                      placeholder=''></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">更新要求</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                                        <label>
                                                            <input type="radio" checked name="forceUpdating" value="2"/>
                                                            普通升级
                                                        </label>
                                                    </div>
                                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                                        <label>
                                                            <input type="radio" name="forceUpdating" value="1"/> 强制升级
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">版本类型</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                                        <label>
                                                            <input type="radio" checked name="type" value="1"
                                                                   onchange="editPlace(1)"/>
                                                            Android
                                                        </label>
                                                    </div>
                                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                                        <label>
                                                            <input type="radio" name="type" value="2"
                                                                   onchange="editPlace(2)"/> iOS
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">上传渠道apk</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <table id=""
                                                           class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>渠道标识</th>
                                                            <th>文件路径</th>
                                                            <th>操作</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td id="appType">安卓商城</td>
                                                            <td id="appPath">
                                                            </td>
                                                            <td>
                                                                <label class="btn btn-primary btn-upload" id="hiddenId"
                                                                       for="inputImage"
                                                                       style=" float: right;color: #FFFFFF;margin-right:32% ;">
                                                                    <input type="file" class="sr-only"
                                                                           id="inputImage" name="file">
                                                                    <span style="color: #FFFFFF;" id="picture">
                                                                                选择文件
                                                                            </span>
                                                                    <input type="hidden" name="appPath" id="appPathId"
                                                                           value=""/>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">备注（非必填）
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <textarea class="form-control" rows="5" name="remarks"
                                                                      placeholder=''></textarea>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer" style="text-align: center;">
                                    <button type="button" class="btn btn-success antoclose" id="save"
                                            data-dismiss="modal">确定
                                    </button>
                                    <button type="button" class="btn btn-primary antosubmit"
                                            data-dismiss="modal">取消
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 ln_solid"></div>
                    <div class="table-responsive col-xs-12">
                        <table id="datatable_List" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>发布时间</th>
                                <th>操作人</th>
                                <th>版本标识</th>
                                <th>版本名称</th>
                                <th>版本类型</th>
                                <th>更新要求</th>
                                <th>更新内容</th>
                                <th>备注</th>
                            </tr>
                            </thead>


                            <%-- <tbody>
                             <c:forEach items="${list}" var="app">
                                 <tr>
                                     <td><fmt:formatDate value="${app.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                     <td>${app.operationName}</td>
                                     <td>${app.versionCode}</td>
                                     <td>${app.versionName}</td>
                                     <td>${app.type == 1 ? 'android' : 'ios'}</td>
                                     <td>${app.forceUpdating == 1? "强制更新": "普通更新"}</td>
                                     <td>${app.updateContent}</td>
                                     <td>${app.remarks}</td>
                                 </tr>
                             </c:forEach>
                        </tbody>--%>
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
<script>

    $(function () {
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
            bPaginate: true,  //是否显示分页器
            aLengthMenu: [25, 50, 100],
            bSort: false, //是否启动各个字段的排序功能
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/app/appEditionList.do',

            fnServerData: function (sSource, aoData, fnCallback) {
                var reservation = $("#reservation_table").val();
                var type = $("#typeId").val();
                var versionName = $("#versionNameSechId").val();
                var versionCode = $("#versionCodeSechId").val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "reservation", "value": reservation});
                aoData.push({"name": "type", "value": type});
                aoData.push({"name": "versionName", "value": versionName});
                aoData.push({"name": "versionCode", "value": versionCode});
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
                    "data": function (app) {
                        if (app.createTime != null) {
                            return timeStamp2String(app.createTime);
                        } else {
                            return '';
                        }
                    }
                },
                {"data": "operationName","defaultContent": ""},
                {"data": "versionCode","defaultContent": ""},
                {"data": "versionName","defaultContent": ""},
                {
                    "data": function (app) {
                        if (app.type == 1) {
                            return "android";
                        } else {
                            return "ios";
                        }
                    }
                },
                {
                    "data": function (app) {
                        if (app.forceUpdating == 1) {
                            return "强制更新";
                        } else {
                            return "普通更新";
                        }
                    }
                },
                {"data": "updateContent","defaultContent": ""},
                {"data": "remarks","defaultContent": ""}
            ]
        });
        $('#query').click(function () {
            table.fnReloadAjax();
        });
    });

    // 时间格式化
    function timeStamp2String(time) {
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        return year + "-" + month + "-" + date
    }

    $("#save").click(function () {
        var form = new FormData(document.getElementById("antoform"));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/app/save.do",
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

    function editPlace(type) {
        var plan = "上次的版本"
        if (type == 1) {
            plan = "Android" + plan;
            $("#hiddenId").css("display", "block")
            $("#appType").html("安卓商城");
            $("#appPath").html($("#appPathId").val());
        } else {
            plan = "IOS" + plan;
            $("#hiddenId").css("display", "none");
            $("#appType").html("苹果商城");
            $("#appPath").html("https://itunes.apple.com/cn/app/id1289159846?mt=8");
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/app/findMaxVersion.do?type=" + type,
            type: "post",
            data: '',
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                $("#versionNameId").attr("placeholder", plan + "名称" + data.versionName);
                $("#versionCodeId").attr("placeholder", plan + "标识" + data.versionCode);
            },
            error: function (e) {
                console.log(e);
                location.reload();
            }
        });
    }

    $("#inputImage").change(function () {
        var formData = new FormData();
        formData.append('file', $('#inputImage')[0].files[0]);
        $.ajax({
            url: '${pageContext.request.contextPath}/mfq/app/fileUpload.do',
            type: 'POST',
            cache: false,
            data: formData,
            processData: false,
            contentType: false
        }).done(function (res) {
            var data = jQuery.parseJSON(res);
            console.log(data);
            $("#appPathId").val(data.path);
            $("#appPath").html(data.path);
        }).fail(function (res) {
            console.log(res);
        });
    });
</script>
</body>
</html>