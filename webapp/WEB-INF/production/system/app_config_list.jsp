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

        #datatable_wrapper {
            padding-top: 20px;
        }

        .icheckbox_flat-green {
            margin-bottom: 2px;
        }

        .disType_01, .disType_02, .disType_03 {
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
                        <li>
                            <a href="#">媒体资源</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">app活动配置</a> <span class="divider"></span>
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
                        <h2 style="font-size:18px;">app活动配置</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content" style="position: relative;">

                        <!--字段筛选-->

                        <div class="col-md-12 col-sm-12 col-xs-12"
                             style="box-sizing: border-box;padding: 8px 0;padding-left: 0;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select name="area" id="area" class="form-control" style="width: 100%;float: left;">
                                    <option value="">全国</option>
                                    <option value="110000">北京</option>
                                    <option value="310000">上海</option>
                                    <option value="440000">广东</option>
                                    <option value="510000">四川</option>
                                    <option value="430000">湖南</option>
                                    <option value="210000">辽宁</option>
                                    <option value="370000">山东</option>
                                </select>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="padding: 0;text-align: right;margin-top: 8px;padding-right: 8px;">
                                    名称/ID
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12" style="padding: 0;">
                                    <input type="text" name="name" id="name" value="" class="form-control"/>
                                </div>
                                <input type="hidden" name="type" id="type" value="${type}"/>
                            </div>
                            <button type="button" class="btn btn-primary" id="query" style="margin-left: 20px;">查询
                            </button>
                        </div>


                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_content">


                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist"
                                            style="background: inherit;">
                                            <li role="presentation" class="active"><a href="#" id="BANNER"
                                                                                      role="tab" data-toggle="tab"
                                                                                      aria-expanded="true">Banner</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#" role="tab"
                                                                                id="PROGRAM" data-toggle="tab"
                                                                                aria-expanded="false">推荐活动</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#" role="tab"
                                                                                id="MEET" data-toggle="tab"
                                                                                aria-expanded="false">发现</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#" role="tab"
                                                                                id="FITRED" data-toggle="tab"
                                                                                aria-expanded="false">首推图</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#" role="tab"
                                                                                id="STORE" data-toggle="tab"
                                                                                aria-expanded="false">推荐商家</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#" role="tab"
                                                                                id="SERVICE" data-toggle="tab"
                                                                                aria-expanded="false">推荐项目</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#" role="tab"
                                                                                id="HIGSTO" data-toggle="tab"
                                                                                aria-expanded="false">优质商家</a>
                                            </li>
                                            <li role="presentation" class="" style="border: 0;float: right;">
                                                <button type="button" class="btn btn-primary" onclick="addAppConfig()"
                                                        style="margin-left: 20px;">新建
                                                </button>
                                            </li>
                                        </ul>


                                        <div class="modal fade" tabindex="-1" role="dialog" style="display: none"
                                             aria-hidden="true" id="add_form">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">×
                                                        </button>
                                                        <h4 class="modal-title">添加app配置</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div style="padding: 5px 20px;">
                                                            <form class="form-horizontal form-label-left"
                                                                  id="addFormId">
                                                                <div class="col-md-8 col-sm-8 col-xs-12">
                                                                    <div class="form-group disType_01"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">活动名称</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" name="name"
                                                                                   class="form-control">
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group disType_02 disType_03"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">地区
                                                                        </label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select name="pushArea" id="areaId"
                                                                                    class="form-control"
                                                                                    onchange="cityChange()">
                                                                                <option value="">请选择</option>
                                                                                <option value="110000">北京</option>
                                                                                <option value="310000">上海</option>
                                                                                <option value="440100">广州</option>
                                                                                <option value="440300">深圳</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group disType_01"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">推送区域</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12"
                                                                             style="margin-top: 5px;margin-bottom: 5px;">
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox"
                                                                                       onclick="checkCheng()"/>全选
                                                                            </div>
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox" name="areas"
                                                                                       value="110000"/>北京
                                                                            </div>
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox" name="areas"
                                                                                       value="310000"/>上海
                                                                            </div>
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox" name="areas"
                                                                                       value="440000"/>广东
                                                                            </div>
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox" name="areas"
                                                                                       value="510000"/>四川
                                                                            </div>
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox" name="areas"
                                                                                       value="430000"/>湖南
                                                                            </div>
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox" name="areas"
                                                                                       value="210000"/>辽宁
                                                                            </div>
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <input type="checkbox" name="areas"
                                                                                       value="370000"/>山东
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group disType_01 disType_02 disType_03"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">排序
                                                                        </label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select name="sortNo" class="form-control">
                                                                                <option value="1">
                                                                                    1
                                                                                </option>
                                                                                <option value="2">
                                                                                    2
                                                                                </option>
                                                                                <option value="3">
                                                                                    3
                                                                                </option>
                                                                                <option value="4">
                                                                                    4
                                                                                </option>
                                                                                <option value="5">
                                                                                    5
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group disType_03"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">商家
                                                                        </label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select name="storeId" id="storeId"
                                                                                    onchange="chengStore()"
                                                                                    class="form-control">
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group disType_02"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">项目
                                                                        </label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <select name="serviceId" id="serviceId"
                                                                                    class="form-control">
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group disType_01 disType_02 disType_03"
                                                                         style="margin-bottom: 10px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">封面图片</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                                                <label class="btn btn-primary btn-upload"
                                                                                       for="inputImage"
                                                                                       style=" float: right;color: #FFFFFF;">
                                                                                    <input type="file" class="sr-only"
                                                                                           id="inputImage" name="file"
                                                                                           accept="image/*">
                                                                                    <span style="color: #FFFFFF;"
                                                                                          id="picture">
                                                                                    上传图片
                                                                                </span>
                                                                                </label>
                                                                                <input type="hidden" name="imgUrl"
                                                                                       id="appPathId"/>
                                                                                <input type="hidden" name="imgName"
                                                                                       id="imgNameId"/>
                                                                            </div>
                                                                            <div class="col-md-9 col-sm-9 col-xs-12"
                                                                                 id="disType_01"
                                                                                 style="margin-top: 8px;">
                                                                                大图尺寸1080*720（背景颜色最好偏深）：展示尺寸1080*720
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group disType_01"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">url链接</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <input type="text" name="url"
                                                                                   class="form-control"
                                                                                   placeholder="sdafadgafd">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group disType_01"
                                                                         style="margin-bottom: 5px;">
                                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">活动时间</label>
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <%-- <input type="text" class="form-control"
                                                                                    name="beginTime"
                                                                                    placeholder="sfsdgagsdfsdfsfsgf">--%>
                                                                            <input type="text" name="reservation"
                                                                                   id="reservation_table"
                                                                                   class="form-control" value=""/>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <div style="text-align: center;width: 100%;">
                                                                        <img style="width: 70%;"
                                                                             onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'
                                                                             id="imagePathId"
                                                                             src="${pageContext.request.contextPath}/build/images/imgerror.png"/>
                                                                    </div>
                                                                </div>


                                                            </form>
                                                            <div class="form-group"
                                                                 style="margin-top: 20px; text-align: center;">
                                                                <button type="button"
                                                                        class="btn btn-success antoclose"
                                                                        id="addSubButId"
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
                                            </div>
                                        </div>


                                        <div id="myTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1"
                                                 aria-labelledby="home-tab">
                                                <table id="datatable_List" class="table table-striped table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>是否生效</th>
                                                        <th>活动ID</th>
                                                        <th>名称</th>
                                                        <th>推荐类型</th>
                                                        <th>推送区域</th>
                                                        <th>创建时间</th>
                                                        <th>图片</th>
                                                        <th>URL链接</th>
                                                        <th>排序</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
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
            bSort: false, //是否启动各个字段的排序功能
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/app/findAppConfig.do',

            fnServerData: function (sSource, aoData, fnCallback) {
                var name = $("#name").val();
                var area = $("#area").val();
                var type = $("#type").val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "name", "value": name});
                aoData.push({"name": "area", "value": area});
                aoData.push({"name": "type", "value": type});
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
                        if (obj.isActive == 'TRUE') {
                            return '<i class="fa fa-check"></i>';
                        } else {
                            return '<i class="fa fa-close"></i>';
                        }
                    }
                },
                {
                    "data": function (obj) {
                        return '<a style="text-decoration: underline;" href="${pageContext.request.contextPath}/mfq/app/findAppConfigDetail.do?id=' + obj.id + '">' + obj.id + '</a>';
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.name != null) {
                            return obj.name;
                        } else {
                            return '';
                        }

                    }
                },
                {
                    "data": function (obj) {
                        if (obj.type == 'BANNER') {
                            return 'banner';
                        } else if (obj.type == 'PROGRAM') {
                            return '推荐活动';
                        } else if (obj.type == 'MEET') {
                            return '发现';
                        } else if (obj.type == 'FITRED') {
                            return '首推图';
                        } else if (obj.type == 'STORE') {
                            return '推荐商家';
                        } else if (obj.type == 'SERVICE') {
                            return '推荐项目';
                        } else if (obj.type == 'HIGSTO') {
                            return '优质商家';
                        }
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.pushArea != null) {

                            var split = obj.pushArea.split(",");
                            if (split.length >= 7) return '全国';
                            var pushAreaStr = '';
                            for (var i = 0; i < split.length; i++) {
                                if (split[i] == '110000') pushAreaStr = pushAreaStr + '北京' + "&nbsp&nbsp";
                                if (split[i] == '310000') pushAreaStr = pushAreaStr + '上海' + "&nbsp&nbsp";
                                if (split[i] == '440000') pushAreaStr = pushAreaStr + '广东' + "&nbsp&nbsp";
                                if (split[i] == '510000') pushAreaStr = pushAreaStr + '四川' + "&nbsp&nbsp";
                                if (split[i] == '430000') pushAreaStr = pushAreaStr + '湖南' + "&nbsp&nbsp";
                                if (split[i] == '210000') pushAreaStr = pushAreaStr + '辽宁' + "&nbsp&nbsp";
                                if (split[i] == '370000') pushAreaStr = pushAreaStr + '山东' + "&nbsp&nbsp";
                                if (split[i] == '440100') pushAreaStr = pushAreaStr + '广州' + "&nbsp&nbsp";
                                if (split[i] == '440300') pushAreaStr = pushAreaStr + '深圳';
                            }
                            return pushAreaStr;
                        } else {
                            return '';
                        }
                    }
                },
                {"data": "createTime","defaultContent": ""},
                {"data": "imgName","defaultContent": ""},
                {
                    "data": function (obj) {
                        if (obj.url != null) {
                            return obj.url;
                        } else {
                            return '';
                        }

                    }
                },
                {"data": "sortNo","defaultContent": ""},
                {
                    "data": function (obj) {
                        var h = '<button type="button" class="btn btn-danger btn-xs" onclick="uotAppConfig(\'' + obj.id + '\', \'1\', \'isDelete\')" style="margin-left: 20px;">删除</button>';
                        if (obj.isActive == 'TRUE') {
                            h = h + '<button type="button" class="btn btn-primary btn-xs" onclick="uotAppConfig(\'' + obj.id + '\', \'FALSE\', \'isActive\')" style="margin-left: 20px;">下架</button>';
                        } else {
                            h = h + '<button type="button" class="btn btn-primary btn-xs" onclick="uotAppConfig(\'' + obj.id + '\', \'TRUE\', \'isActive\')" style="margin-left: 20px;">上架</button>';
                        }
                        return h;
                    }
                },

            ]
        });
        $('#query').click(function () {
            table.fnReloadAjax();
        });
        $('#BANNER').click(function () {
            $("#type").val("BANNER")
            table.fnReloadAjax();
        });
        $('#PROGRAM').click(function () {
            $("#type").val("PROGRAM")
            table.fnReloadAjax();
        });
        $('#MEET').click(function () {
            $("#type").val("MEET")
            table.fnReloadAjax();
        });
        $('#FITRED').click(function () {
            $("#type").val("FITRED")
            table.fnReloadAjax();
        });
        $('#STORE').click(function () {
            $("#type").val("STORE")
            table.fnReloadAjax();
        });
        $('#SERVICE').click(function () {
            $("#type").val("SERVICE")
            table.fnReloadAjax();
        });
        $('#HIGSTO').click(function () {
            $("#type").val("HIGSTO")
            table.fnReloadAjax();
        });
    });

    function uotAppConfig(id, type, name) {
        if (confirm('确认修改吗?')) {
            var formData = new FormData();
            formData.append('id', id);
            formData.append(name, type);
            $.ajax({
                url: '${pageContext.request.contextPath}/mfq/app/updateAppConfig.do',
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false
            }).done(function (res) {
                var data = jQuery.parseJSON(res);
                if (data.code == 1) {
                    $.confirm({
                        title: '系统提示',
                        text: "修改成功",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "修改失败",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                }
                location.reload();
            }).fail(function (res) {
                console.log(res);
            });
        }
    }

    function deleteAppConfig(id) {
        if (confirm('确认删除吗 ?')) {
            var formData = new FormData();
            formData.append('id', id);
            formData.append('isDelete', 1);
            $.ajax({
                url: '${pageContext.request.contextPath}/mfq/app/updateAppConfig.do',
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false
            }).done(function (res) {
                var data = jQuery.parseJSON(res);
                if (data.code == 1) {
                    $.confirm({
                        title: '系统提示',
                        text: "删除成功",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                } else {
                    $.confirm({
                        title: '系统提示',
                        text: "删除失败",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                }
                location.reload();
            }).fail(function (res) {
                console.log(res);
            });
        }
    }

    // 显示添加页面
    function addAppConfig() {
        var type = $("#type").val();
        if (type == 'BANNER' || type == 'PROGRAM' || type == 'MEET' || type == 'FITRED') {
            $(".disType_02").hide();
            $(".disType_03").hide();
            $(".disType_01").show();
        }
        if (type == 'STORE' || type == 'HIGSTO') {
            $(".disType_01").hide();
            $(".disType_02").hide();
            $(".disType_03").show();
        }
        if (type == 'SERVICE') {
            $(".disType_01").hide();
            $(".disType_03").show();
            $(".disType_02").show();
        }
        $("#add_form").modal('show');
    }

    // 复选框全选
    function checkCheng() {
        var checkboxs = document.getElementsByName("areas");
        for (var i = 0; i < checkboxs.length; i++) {
            var e = checkboxs[i];
            e.checked = !e.checked;
        }
    }

    function cityChange() {
        var area = $("#areaId").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/mfq/store/findStoreByArea.do?area=' + area,
            type: 'get',
            cache: false,
            processData: false,
            contentType: false
        }).done(function (res) {
            var data = jQuery.parseJSON(res);
            console.log(data);
            var html = ' <option value="">请选择</option>';
            for (var i = 0; i < data.length; i++) {
                html = html + ' <option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $("#storeId").html(html);
        }).fail(function (res) {
            console.log(res);
        });
    }

    function chengStore() {
        var storeId = $("#storeId").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/mfq/store/findServiceParams.do?storeId=' + storeId,
            type: 'get',
            cache: false,
            processData: false,
            contentType: false
        }).done(function (res) {
            var data = jQuery.parseJSON(res);
            console.log(data);
            var html = ' <option value="">请选择</option>';
            for (var i = 0; i < data.length; i++) {
                html = html + ' <option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $("#serviceId").html(html);
        }).fail(function (res) {
            console.log(res);
        });
    }

    $("#addSubButId").click(function () {
        var form = new FormData(document.getElementById('addFormId'));
        form.append("type", $("#type").val());
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/app/saveAppConfig.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (obj) {
                var data = jQuery.parseJSON(obj);
                if (data.code == 1) {
                    $.confirm({
                        title: '系统提示',
                        text: "添加成功!",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
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
                console.log(e);
            }
        });
    });

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
            $("#appPathId").val(data.path);
            $("#imgNameId").val(data.path.split('/')[2]);
            $("#imagePathId").attr("src", data.path)
        }).fail(function (res) {
            console.log(res);
        });
    });


</script>
</body>
</html>