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

        .details-control {
            text-align: center;
        }

        .tile-stats .count {
            margin: 0;
            text-align: center;
        }

        h3 {
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
                        <li>财务管理</li>
                        <li>闪银还款订单</li>
                        <!--<li class="active"><a href="#">待放款订单</a> <span class="divider"></span></li>-->
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <div class="x_title">
                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <!--<div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                    </div>-->
                                    <div class="count" id="totalCount">123</div>
                                    <h3>订单总数</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="count" id="totalSum"></div>
                                    <h3>还款总金额</h3>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <!--字段筛选-->

                        <div class="col-md-12 col-sm-12 col-xs-12"
                             style="box-sizing: border-box;padding: 8px 0;padding-left: 0;position: relative;">
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="" name="" id="" value="还款日期" class="form-control"
                                       style="width: 30%;float: left;background:#fff;" readonly/>
                                <div class="col-xs-9" style="width:70%;padding:0;">
                                    <form class="form-horizontal">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <div class="input-prepend input-group">
                                                        <span class="add-on input-group-addon"
                                                              style="border-radius: 0;"><i
                                                                class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                        <input type="text" name="startDate" id="reservation_table"
                                                               class="form-control" value="${dataStr}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select name="repaymentStatus" id="repaymentStatus" class="form-control">
                                    <option value="">还款状态</option>
                                    <option value="0">未放款</option>
                                    <option value="1">已还款</option>
                                    <option value="9">已买回</option>

                                </select>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <select name="seachType" id="seachType" class="form-control"
                                        style="width: 40%;float: left;">
                                    <option value="1">订单号</option>
                                    <option value="2">姓名</option>
                                    <option value="3">商户名称</option>
                                </select>
                                <input type="" name="seach" id="seach" class="form-control"
                                       style="width: 60%;float: left;"/>
                            </div>
                            <button type="button" id="query" class="btn btn-primary">查询</button>
                            <button type="button" class="btn btn-primary" id="exportBtn">导出</button>
                            <button type="button" class="btn btn-primary" id="myButton">结算</button>
                        </div>
                        <div class="col-xs-12 ln_solid"></div>
                        <%--<button type="button" id="myButton" class="btn btn-primary" style="position:absolute;top:18%;right:0;z-index:10;position: absolute;">确定</button>--%>
                        <table id="datatable_caiwu_sanyin" class="table table-striped table-bordered">
                            <table id="datatable_List" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="all"  onclick="chk()" /></th>
                                    <th>订单号</th>
                                    <th>申请人</th>
                                    <th>还款总额</th>
                                    <th>当前期数/总期数</th>
                                    <th>起息日</th>
                                    <th>月还款</th>
                                    <th>还款计划状态</th>
                                    <th>结算状态</th>
                                    <th>结算时间</th>
                                </tr>
                                </thead>
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
<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>
<script>
    $(function () {

        // export
        $('#exportBtn').click(function() {
            $('#datatable_List').tableExport({
                type: 'excel',
                escape: false,
                fileName: "闪银还款订单",
            });
        })

        // 初始化还款时间
        $('#reservation_table').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_3",
            locale: {
                format: 'YYYY-MM-DD'
            },
            autoUpdateInput: false,
        }, function(start, end, label) {
        });


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
            aLengthMenu: [[25, 50, 100, -1], [25, 50, 100, "全部"]],
            bSort: false, //是否启动各个字段的排序功能
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/finance/findAsset.do',

            fnServerData: function (sSource, aoData, fnCallback) {
                var reservation = $("#reservation_table").val();
                var repaymentStatus = $("#repaymentStatus").val();
                var seachType = $("#seachType").val();
                var seach = $("#seach").val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "startDate", "value": reservation});
                aoData.push({"name": "repaymentStatus", "value": repaymentStatus});
                aoData.push({"name": "seachType", "value": seachType});
                aoData.push({"name": "seach", "value": seach});
                $.ajax({
                    type: 'POST',
                    url: sSource,
                    data: aoData,
                    dataType: 'json',
                    success: function (rs) {
                        $("#totalCount").html(rs.iTotalRecords)
                        $("#totalSum").html(rs.totalSum)
                        console.log(rs);
                        fnCallback(rs);
                    }
                });
            },
            columns: [
                {
                    "data" : function(obj) {

                        if(obj.isRepay != 'TRUE'){
                            return "<input  name='mychk' type='checkbox' value='"+obj.arId+"' />";
                        }else{
                            return "<input type='checkbox' name='mychk' disabled='disabled' />";
                        }
                    }
                },
                {"data": "orderNo","defaultContent": ""},
                {"data": "realName","defaultContent": ""},
                {
                    "data": function (obj) {
                        return (obj.period * obj.repayAmount).toFixed(2)
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        return obj.seq + '/' + obj.period
                    },"defaultContent": ""
                },
                {"data": "startDate","defaultContent": ""},
                {"data": "repayAmount","defaultContent": ""},
                {
                    "data": function (obj) {
                        if (obj.planStatus == 0) {
                            return '未还款';
                        }
                        if (obj.planStatus == 1) {
                            return '已还款';
                        }
                        if (obj.planStatus == 9) {
                            return '已买回';
                        } else {
                            return '';
                        }
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.isRepay == 'TRUE') {
                            return '成功'
                        } else {
                            return '';
                        }
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.repayTime != null) {
                            return obj.repayTime;
                        } else {
                            return '';
                        }
                    }
                }
            ]
        });
        $('#query').click(function () {
            table.fnReloadAjax();
        });
    });

    function chk(){
        var all = document.getElementById("all");
        var mychk = document.getElementsByName("mychk");
        if(all.checked==true){
            if(mychk.length){
                for(var i=0;i<mychk.length;i++){
                    mychk[i].checked = true;
                }

            }
            mychk.checked=true;
        }else{
            if(mychk.length){
                for(var i=0;i<mychk.length;i++){
                    mychk[i].checked = false;
                }

            }
        }
    }

    $('#myButton').on('click', function () {
        // 执行方法
        var repayIdArray = new Array();
        $('input[name="mychk"]:checked').each(function(){
            if($(this).val() != '' && $(this).val() != null && $(this).val() != 'on' ){
                repayIdArray.push($(this).val());
            }
        })
        if(repayIdArray.length == 0){
            $.confirm({
                title : '系统提示',
                text : '请选择一个需要结算的数据！',
                confirmButton : '确认',
                cancelButton : false,
            });
            return false;
        }
        var r=confirm("确认结算吗?");
        if (r!=true){
            $.confirm({
                title : '系统提示',
                text : '你取消了结算!',
                confirmButton : '确认',
                cancelButton : false,
            });
            return;
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/mfq/finance/assetRepay.do', //后台处理程序
            type : 'post', //数据发送方式
            dataType : 'json', //接受数据格式
            data : {repayIdArray : repayIdArray}, //要传递的数据
            success : function(result) {
                if (result.code == '0') {
                    $.confirm({
                        title : '系统提示',
                        text : '操作成功',
                        confirmButton : '确认',
                        cancelButton : false,
                        confirm: function(button) {
                            location.reload(true);
                        }
                    });
                } else {
                    $.confirm({
                        title : '系统提示',
                        text : '操作失败',
                        confirmButton : '确认',
                        cancelButton : false,
                    });
                }
            }
        });
    })
</script>
</body>
</html>