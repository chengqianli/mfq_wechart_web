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
                        <li>
                            <a href="#">详情页</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content" style="position: relative;">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">Banner</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left" id="editAppConfigId">
                                        <div class="col-md-9 col-sm-9 col-xs-12 ">
                                            <div class="form-group disType_01" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">活动名称</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" name="name" value="${appConfig.name}"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group disType_02 disType_03"
                                                 style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12 ">地区
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <select name="pushArea" id="areaId"
                                                            class="form-control"
                                                            onchange="cityChange()">
                                                        <option value="">请选择</option>
                                                        <option value="110000"  ${appConfig.pushArea == '110000' ? 'selected':''}>
                                                            北京
                                                        </option>
                                                        <option value="310000"  ${appConfig.pushArea == '310000' ? 'selected':''}>
                                                            上海
                                                        </option>
                                                        <option value="440100"  ${appConfig.pushArea == '440100' ? 'selected':''}>
                                                            广州
                                                        </option>
                                                        <option value="440300"  ${appConfig.pushArea == '440300' ? 'selected':''}>
                                                            深圳
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group disType_01" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">推送区域</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12"
                                                     style="margin-top: 5px;margin-bottom: 5px;">
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" value="" id="checkboxAllId"
                                                               onclick="checkCheng()"/>全选
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" name="areas"
                                                               value="110000" id="checkboxBJ"/>北京
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" name="areas"
                                                               value="310000" id="checkboxSH"/>上海
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" name="areas"
                                                               value="440000" id="checkboxGD"/>广东
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" name="areas"
                                                               value="510000" id="checkboxSC"/>四川
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" name="areas"
                                                               value="430000" id="checkboxHN"/>湖南
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" name="areas"
                                                               value="210000" id="checkboxLN"/>辽宁
                                                    </div>
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <input type="checkbox" name="areas"
                                                               value="370000" id="checkboxSD"/>山东
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group disType_01 disType_02 disType_03"
                                                 style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">排序
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <select name="sortNo" class="form-control">
                                                        <option value="1" ${appConfig.sortNo eq '1' ? 'selected' : '' } >
                                                            1
                                                        </option>
                                                        <option value="2" ${appConfig.sortNo eq '2' ? 'selected' : '' } >
                                                            2
                                                        </option>
                                                        <option value="3" ${appConfig.sortNo eq '3' ? 'selected' : '' } >
                                                            3
                                                        </option>
                                                        <option value="4" ${appConfig.sortNo eq '4' ? 'selected' : '' } >
                                                            4
                                                        </option>
                                                        <option value="5" ${appConfig.sortNo eq '5' ? 'selected' : '' } >
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

                                            <div class="form-group "
                                                 style="margin-bottom: 10px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">封面图片</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="col-md-1 col-sm-1 col-xs-12" style="padding:0;">
                                                        <label class="btn btn-primary btn-upload"
                                                               for="inputImage"
                                                               style=" float: left;color: #337ab7;background:#ffffff;border:0;padding-left:0;padding-bottom:0;">
                                                            <input type="file" class="sr-only"
                                                                   id="inputImage" name="file"
                                                                   accept="image/*">
                                                            <span style="color: #26b99a;" id="picture">上传图片</span>
                                                        </label>
                                                        <input type="hidden" name="imgUrl" value="${appConfig.imgUrl}"
                                                               id="appPathId"/>
                                                        <input type="hidden" name="imgName" value="${appConfig.imgName}"
                                                               id="imgNameId"/>
                                                    </div>
                                                    <div class="col-md-9 col-sm-9 col-xs-12"
                                                         id="disType_01"
                                                         style="margin-top: 8px;">
                                                        大图尺寸1080*720（背景颜色最好偏深）：展示尺寸1080*720
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group disType_01" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">url链接</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" name="url" value="${appConfig.url}"
                                                           class="form-control" placeholder="sdafadgafd">
                                                </div>
                                            </div>
                                            <div class="form-group disType_01" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">活动时间</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" class="form-control" name="reservation"
                                                           id="reservation_table"
                                                           value="<fmt:formatDate value="${appConfig.beginTime}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${appConfig.endTime}" pattern="yyyy-MM-dd"/>"
                                                           placeholder="sfsdgagsdfsdfsfsgf">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-12">
                                            <div style="text-align: center;width: 100%;">
                                                <img style="width: 70%;"
                                                     onerror='this.src="${pageContext.request.contextPath}/build/images/imgerror.png"'
                                                     id="imagePathId"
                                                     src="${appConfig.imgUrl}"/>
                                            </div>
                                        </div>
                                        <input type="hidden" name="id" value="${appConfig.id}"/>
                                    </form>
                                    <div class="form-group" style="margin-top: 20px; text-align: center;">
                                        <button type="button" class="btn btn-success antoclose" id="editAppConfig"
                                                data-dismiss="modal">保存
                                        </button>
                                        <button type="button" class="btn btn-primary antosubmit"
                                                onclick="window.location.href='${pageContext.request.contextPath}/mfq/app/appConfig.do'"
                                                data-dismiss="modal">取消
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="line-height: 1;font-size: 18px;">推荐日志</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form class="form-horizontal form-label-left">
                                        <table id="datatable_List"
                                               class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>时间</th>
                                                <c:if test="${appConfig.type == 'BANNER' || appConfig.type == 'PROGRAM' || appConfig.type == 'MEET' || appConfig.type == 'FITRED'}">
                                                    <th>活动名称</th>
                                                    <th>活动时间</th>
                                                    <th>推送区域</th>
                                                </c:if>
                                                <th>排序</th>
                                                <th>封面图片</th>
                                                <th>操作人</th>
                                            </tr>
                                            </thead>
                                        </table>
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
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>

<script>
    $(function () {
        var type = '${appConfig.type}';
        if (type == 'BANNER' || type == 'PROGRAM' || type == 'MEET' || type == 'FITRED') {
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
                ajaxSource: '${pageContext.request.contextPath}/mfq/app/findAppConfigLog.do?id=' + '${appConfig.id}',
                /*
                            fnServerData: function (sSource, aoData, fnCallback) {
                            },*/
                columns: [
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
                    {"data": "name","defaultContent": ""},
                    {"data": "upRecommendTime","defaultContent": ""},
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
                    {"data": "sortNo","defaultContent": ""},
                    {"data": "imgName","defaultContent": ""},
                    {"data": "operatorName","defaultContent": ""}
                ]
            });
        } else {
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
                ajaxSource: '${pageContext.request.contextPath}/mfq/app/findAppConfigLog.do?id=' + '${appConfig.id}',
                /*
                            fnServerData: function (sSource, aoData, fnCallback) {
                            },*/
                columns: [
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
                    {"data": "sortNo","defaultContent": ""},
                    {"data": "imgName","defaultContent": ""},
                    {"data": "operatorName","defaultContent": ""}
                ]
            });
        }
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

</script>

<script>
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

    function chengStore(storeId) {
        if (storeId == null) {
            storeId = $("#storeId").val();
        }
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
                var selected = '';
                if ('${appConfig.serviceId}' == data[i].id) {
                    selected = 'selected';
                }
                html = html + ' <option value="' + data[i].id + '" ' + selected + '>' + data[i].name + '</option>';
            }
            $("#serviceId").html(html);
        }).fail(function (res) {
            console.log(res);
        });
    }

    function cityChange(area) {
        if (area == null) {
            area = $("#areaId").val();
        }
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
                var selected = '';
                if ('${appConfig.storeId}' == data[i].id) {
                    selected = 'selected';
                }
                html = html + ' <option value="' + data[i].id + '" ' + selected + '>' + data[i].name + '</option>';
            }
            $("#storeId").html(html);
        }).fail(function (res) {
            console.log(res);
        });
    }

    // 复选框全选
    function checkCheng() {
        var checkboxs = document.getElementsByName("areas");
        for (var i = 0; i < checkboxs.length; i++) {
            var e = checkboxs[i];
            e.checked = !e.checked;
        }
    }

    $(function () {
        var type = '${appConfig.type}';
        if (type == 'BANNER' || type == 'PROGRAM' || type == 'MEET' || type == 'FITRED') {
            $(".disType_02").css("display", 'none');
            $(".disType_03").css("display", 'none');
            $(".disType_01").css("display", 'block');
        }
        if (type == 'STORE' || type == 'HIGSTO') {
            $(".disType_01").css("display", 'none');
            $(".disType_02").css("display", 'none');
            $(".disType_03").css("display", 'block');
        }
        if (type == 'SERVICE') {
            $(".disType_01").css("display", 'none');
            $(".disType_03").css("display", 'block');
            $(".disType_02").css("display", 'block');
        }
        cityChange('${appConfig.pushArea}')
        chengStore('${appConfig.storeId}')

        var split = '${appConfig.pushArea}'.split(",");
        if (split.length >= 7) {
            var checkboxs = document.getElementsByName("areas");
            for (var i = 0; i < checkboxs.length; i++) {
                var e = checkboxs[i];
                e.checked = !e.checked;
            }
            $("#checkboxAllId").attr('checked', 'checked');
        } else {
            for (var i = 0; i < split.length; i++) {
                if (split[i] == '110000') {
                    $("#checkboxBJ").attr('checked', 'checked');
                }
                if (split[i] == '310000') {
                    $("#checkboxSH").attr('checked', 'checked');
                }
                if (split[i] == '440000') {
                    $("#checkboxGD").attr('checked', 'checked');
                }
                if (split[i] == '510000') {
                    $("#checkboxSC").attr('checked', 'checked');
                }
                if (split[i] == '430000') {
                    $("#checkboxHN").attr('checked', 'checked');
                }
                if (split[i] == '210000') {
                    $("#checkboxLN").attr('checked', 'checked');
                }
                if (split[i] == '370000') {
                    $("#checkboxSD").attr('checked', 'checked');
                }
            }
        }

    });

    $("#editAppConfig").click(function () {
        var form = new FormData(document.getElementById('editAppConfigId'));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/app/updateAppConfig.do",
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
                    window.location.href = '${pageContext.request.contextPath}/mfq/app/appConfig.do';
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
    })

</script>
</body>
</html>