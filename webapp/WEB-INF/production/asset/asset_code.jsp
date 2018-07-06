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

        #datatable_wrapper {
            padding-top: 20px;
        }

        .icheckbox_flat-green {
            margin-bottom: 2px;
        }

        /*  label {
              float: right;
          }*/
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
                        <li>闪银商户编号管理</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2 style="font-size:18px;">闪银商户编码信息</h2>
                    <button type="button" class="btn btn-primary"
                            style="margin-left: 20px; float: right;cursor: pointer;" data-toggle="modal"
                            data-target=".add_change_number">添加闪银编号
                    </button>


                    <div class="modal fade add_change_number" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">添加闪银编号</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="testmodal" style="padding: 5px 20px;">
                                        <form id="antoform" class="form-horizontal calender" role="form">
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">商家名称：</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <select class="form-control" name="storeId">
                                                        <c:forEach items="${stores}" var="store">
                                                            <option value="${store.id}">${store.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">闪银平台编号：</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" class="form-control" name="assetCode">
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">备注：</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" class="form-control" name="remark">
                                                </div>
                                            </div>
                                            <input type="hidden" name="id"/>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer" style="text-align: center;">
                                    <button type="button" class="btn btn-success antoclose" data-dismiss="modal"
                                            onclick="subEdit('antoform')">保存
                                    </button>
                                    <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">取消
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="table-responsive col-xs-12">
                    <table id="datatable_List" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>商户名称</th>
                            <th>闪银平台编号</th>
                            <th>创建日期</th>
                            <th>最后修改日期</th>
                            <th>描述</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                    </table>
                </div>
                <div class="modal fade delete" tabindex="-1" role="dialog" aria-hidden="true" id="editId">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                </button>
                                <h4 class="modal-title" id="">修改闪银编号</h4>
                            </div>
                            <div class="modal-body">
                                <div id="" style="padding: 5px 20px;">
                                    <form id="deitFormId" class="form-horizontal calender" role="form">
                                        <div class="form-group" style="margin-bottom: 5px;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">商家名称：</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <select class="form-control" name="storeId">
                                                    <c:forEach items="${stores}" var="store">
                                                        <option id="${store.id}_edit"
                                                                value="${store.id}">${store.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin-bottom: 5px;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">闪银平台编号：</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" placeholder="" name="assetCode"
                                                       id="assetCodeId">
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin-bottom: 5px;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">备注：</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" placeholder="" name="remark"
                                                       value="" id="remarkId">
                                            </div>
                                        </div>
                                        <input type="hidden" name="id" id="id" value="">
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer" style="text-align: center;">
                                <button type="button" class="btn btn-success antoclose" data-dismiss="modal"
                                        onclick="subEdit('deitFormId')">保存
                                </button>
                                <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">取消
                                </button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade delete" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                </button>
                                <h4 class="modal-title" id="">删除记录</h4>
                            </div>
                            <div class="modal-body">
                                <div id="" style="padding: 5px 20px;">
                                    <form id="" class="form-horizontal calender" role="form">

                                        <div class="form-group" style="margin-bottom: 5px;text-align: center;">
                                            确认要删除此记录吗？

                                        </div>

                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer" style="text-align: center;">
                                <button type="button" class="btn btn-success antoclose" data-dismiss="modal">保存
                                </button>
                                <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">取消
                                </button>
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
<%-- footer --%>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<script>
    $(function () {
        // 初始化DataTables
        var table = $('#datatable_List').dataTable({
            autoWidth: false,  	// 禁用自动调整列宽
            /* scrollX: '100%', */
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            aLengthMenu: [25, 50, 100],
            bPaginate: true,  //是否显示分页器
            bSort: true, //是否启动各个字段的排序功能
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/asset/getAssetCodeList.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                var realName = $('#realName').val();
                var inputText = $('#inputText').val();
                var areaId = $('#areaId').val();
                var typeId = $('#typeId').val();
                var status = $('#status').val();
                var reservation_table = $('#reservation_table').val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "realName", "value": realName});
                aoData.push({"name": "inputText", "value": inputText});
                aoData.push({"name": "areaId", "value": areaId});
                aoData.push({"name": "typeId", "value": typeId});
                aoData.push({"name": "status", "value": status});
                aoData.push({"name": "reservation_table", "value": reservation_table});
                $.ajax({
                    type: 'POST',
                    url: sSource,
                    data: {"aoData": JSON.stringify(aoData)},
                    dataType: 'json',
                    success: function (rs) {
                        fnCallback(rs);
                    }
                });
            },
            columns: [
                {
                    "data": function (obj) {
                        if (obj.storeName == null) {
                            return '';
                        } else {
                            return obj.storeName;
                        }
                    },"defaultContent": ""
                },
                {"data": "assetCode","defaultContent": ""},
                {"data": "createTime","defaultContent": ""},
                {"data": "updateTime","defaultContent": ""},
                {"data": "remark","defaultContent": ""},
                {
                    "data": function (obj) {
                        return '<span style="padding-right: 10px;cursor: pointer;color: #1abb9c;" data-toggle="modal;" onclick="edit(\'' + obj.id + '\',\'' + obj.storeName + '\',\'' + obj.assetCode + '\',\'' + obj.remark + '\',\'' + obj.storeId + '\')">修改' +
                            '</span><span style="cursor: pointer;color: red;" data-toggle="modal" onclick="deleteCode(\'' + obj.id + '\')">删除</span>';
                    },"defaultContent": ""
                }
            ]
        });
        $('#query').click(function () {
            console.log("=======");
            table.fnReloadAjax();
        });
    });

    function edit(id, name, code, remark, storeId) {
        $("#assetCodeId").val(code);
        $("#remarkId").val(remark);
        $("#id").val(id);
        $("#" + storeId + "_edit").attr("selected", true);
        $('#editId').modal('show')

    }

    function subEdit(formId) {
        var assetCode = $("#" + formId + " input[name='assetCode']").val()
        if (!strCheck(assetCode)) {
            $.confirm({
                title: '系统提示',
                text: "编号输入格式错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var form = new FormData(document.getElementById(formId));
        $.ajax({
            url: "${pageContext.request.contextPath}/mfq/asset/editAssetCode.do",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.code == 0) {
                    alert("更新失败!");
                } else {
                    location.reload();
                }
            },
            error: function (e) {
                location.reload();
            }
        });
    }

    function deleteCode(id) {
        if (confirm('确认删除吗 ?')) {
            $.ajax({
                url: "${pageContext.request.contextPath}/mfq/asset/deleteAssetCode.do?id=" + id,
                type: "post",
                data: '',
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.code == 0) {
                        alert("更新失败!");
                    } else {
                        location.reload();
                    }
                },
                error: function (e) {
                    location.reload();
                }
            });
        }
    }
</script>
</body>
</html>