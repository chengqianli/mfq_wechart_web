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
                        <li>操作日志</li>
                        <li>订单操作日志</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">

                        <div class="col-md-12 col-sm-12 col-xs-12"
                             style="box-sizing: border-box;padding: 8px 0;padding-left: 0;">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select name="operationType" id="operationType" class="form-control"
                                        style="width: 100%;float: left;box-shadow: none;">
                                    <option value="">操作类型</option>
                                    <option value="309">测试订单</option>
                                    <option value="310">订单关闭</option>
                                    <option value="311">客户取消</option>
                                    <option value="312">提前还款</option>
                                    <option value="313">替换订单</option>
                                    <option value="08">初审通过</option>
                                    <option value="09">初审拒绝</option>
                                    <option value="301">终审通过</option>
                                    <option value="304">终审拒绝</option>
                                    <option value="10">放款</option>
                                </select>
                            </div>
                            <button type="button" id="query" class="btn btn-primary">查询</button>
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
                                <th>订单号</th>
                                <th>IP地址</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                                <th>操作内容</th>
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
<!-- ========================================================================================================================= -->

<script type="text/javascript">

    //
    $(function () {
        console.log('${headType == "01"}')
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
            ajaxSource: '${pageContext.request.contextPath}/mfq/log/findOrderLogList.do',

            fnServerData: function (sSource, aoData, fnCallback) {
                var operationType = $("#operationType").val();
                aoData.push({"name": "operationType", "value": operationType});
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
                {"data": function (obj) {
                    if (obj.orderNo != null) {
                        return obj.orderNo;
                    }else {
                        return "";
                    }
                }},
                {"data": function (obj) {
                    if (obj.actionIp != null) {
                        return obj.actionIp;
                    }else {
                        return '';
                    }
                }},
                {"data": "creator"},
                {
                    "data": function (obj) {
                        if (obj.createTime != null) {
                            return timeStamp2String(obj.createTime);
                        } else {
                            return '';
                        }
                    }
                },
                {"data": "description"}
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
        var h = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours() + ':';
        var m = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes() + ':';
        var s = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date + " " + h + m + s;
    }

    // 导出
    function exportStore() {
        var operationType = $("#operationType").val();
        var url = '${pageContext.request.contextPath}/mfq/log/export.do?operationType=' + operationType;
        window.location.href = url;
    }
</script>
</body>
</html>