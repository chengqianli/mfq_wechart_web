<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/resource_jstl.jsp" %>

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
                    <!-- 面包屑导航 -->
                    <ul class="breadcrumb">
                        <li><a herf="#">贷后管理</a></li>
                        <li><a herf="#">贷后订单</a></li>
                        <li class="active"><a href="#">扣款记录</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">订单列表</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">
                                <!-- 组合筛选 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <select id="searchType" name="searchType" class="form-control">
                                            <option value="01">订单号</option>
                                            <option value="02">姓名</option>
                                            <option value="03">商户姓名</option>
                                            <option value="04">银行名称</option>
                                        </select>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="searchTxt" name="searchTxt" placeholder="">
                                    </div>
                                </div>
                                <!-- 扣款状态 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="handleResult" name="handleResult" class="form-control">
                                            <option value="">扣款状态</option>
                                            <option value="1">正常</option>
                                            <option value="2">失败</option>
                                            <option value="3">等待</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- 扣款来源 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12" style="padding-left: 0;">
                                        <select id="handleSource" name="handleSource" class="form-control">
                                            <option value="">扣款来源</option>
                                            <option value="1">宝付</option>
                                            <option value="3">先锋</option>
                                            <option value="4">连连</option>
                                            <option value="5">支付宝</option>
                                            <option value="6">微信</option>
                                            <option value="7">对公转账 -- 招商一般户</option>
                                            <option value="8">对公转账 -- 法人卡转账</option>
                                            <option value="2">其他</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-2 col-sm-2 col-xs-12 form-group has-feedback"></div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <!-- 还款时间 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="control-label col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="text" class="form-control"
                                               style="padding-right: 12px;background:#fff;" value="扣款日期" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control has-feedback-left" id="debitDate"
                                               placeholder="" aria-describedby="inputSuccess2Status">
                                        <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"
                                              style="left:1px;"></span>
                                        <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                    </div>
                                </div>

                                <!-- 还款方式 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="handleType" name="handleType" class="form-control">
                                            <option value="">扣款方式</option>
                                            <option value="1">自动</option>
                                            <option value="2">手动</option>
                                            <option value="3">主动还款</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group">
                                    <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                    <button type="button" id="exportBtn" class="btn btn-primary">导出</button>
                                    <!-- <div class="btn-group">
                                          <button type="button" class="btn btn-primary">导出</button>
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                              <span class="caret"></span>
                                             <span class="sr-only">Toggle Dropdown</span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                          <li><a href="javascript:void(0);">xls/xlsx</a>
                                          </li>
                                          <li><a href="javascript:void(0);">csv</a>
                                          </li>
                                          <li><a href="javascript:void(0);">png</a>
                                          </li>
                                          <li><a href="javascript:void(0);">pdf</a>
                                          </li>
                                        </ul>
                                      </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="x_content">
                        <!-- 虚线 -->
                        <div class="divider-dashed"></div>
                        <table id="datatable_repayment_result_list" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>姓名</th>
                                <th>扣款时间</th>
                                <th>实收金额(线上)</th>
                                <th>实收金额(线下)</th>
                                <th>扣款状态</th>
                                <th>扣款源</th>
                                <th>扣款信息</th>
                                <th>扣款方式</th>
                                <th>商户订单号</th>
                                <th>操作人</th>
                                <th>结果描述</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

<%-- footer --%>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>

<script type="text/javascript">
    $(function () {

        // 初始化还款时间
        $('#debitDate').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_3",
            locale: {
                format: 'YYYY-MM-DD'
            },
            //autoUpdateInput: false
        }, function (start, end, label) {
        });

        // 查询
        $('#searchBtn').click(function () {
            table.fnReloadAjax();
        })

        // export
        $('#exportBtn').click(function () {
            $('#datatable_repayment_result_list').tableExport({
                type: 'excel',
                escape: false,
                fileName: "扣款记录",
            });
        })

        // 初始化DataTables
        var table = $('#datatable_repayment_result_list').dataTable({
            autoWidth: false,  	// 禁用自动调整列宽
            scrollX: '100%',
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            aLengthMenu: [[25, 50, 100, -1], [25, 50, 100, "全部"]],
            paginate: true,		// 翻页功能
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            // aoColumnDefs: [ { "bSortable": false, "aTargets": [ 11 ] }],
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            stateSave: true,
            ajaxSource: '${pageContext.request.contextPath}/mfq/repayment/repaymentResultList.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                // 组合晒选类型
                var searchType = $('#searchType').val();
                var searchTxt = $('#searchTxt').val();
                var handleResult = $('#handleResult').val();
                var handleSource = $('#handleSource').val();
                var debitDate = $('#debitDate').val();
                var handleType = $('#handleType').val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "searchType", "value": searchType});
                aoData.push({"name": "searchTxt", "value": searchTxt});
                aoData.push({"name": "handleResult", "value": handleResult});
                aoData.push({"name": "handleSource", "value": handleSource});
                aoData.push({"name": "debitDate", "value": debitDate});
                aoData.push({"name": "handleType", "value": handleType});
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
                        return obj.orderNo;
                    },"defaultContent": ""
                },
                {"data": "realName","defaultContent": ""},
                {
                    "data": function (obj) {
                        return new Date(parseInt(obj.createTime)).format('yyyy-MM-dd hh:mm:ss');
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                    	 if(obj.actualMoney == null){
                    		return 0;
                    	}else{
                    		return parseFloat(obj.actualMoney).toFixed(2);
                    	}
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                    	if(obj.thirdpartyMoney == null){
                    		return 0;
                    	}else{
                    		return parseFloat(obj.thirdpartyMoney).toFixed(2);
                    	}
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        if (obj.chergeStatus === '1') {
                            return '成功';
                        } else if (obj.chergeStatus === '2') {
                            return '失败';
                        } else {
                            return '等待结果中';
                        }
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.chergeSource === '1') {
                            return '宝付';
                        } else if (obj.chergeSource === '2') {
                            return '其他';
                        } else if (obj.chergeSource === '3') {
                            return '先锋';
                        } else if (obj.chergeSource === '4') {
                            return '连连';
                        } else if (obj.chergeSource === '5') {
                            return '支付宝';
                        } else if (obj.chergeSource === '6') {
                            return '微信';
                        } else if (obj.chergeSource === '7') {
                            return '对公转账 -- 招商一般户';
                        } else if (obj.chergeSource === '8') {
                            return '对公转账 -- 法人卡转账';
                        } else if (obj.chergeSource === '9') {
                            return '民盛';
                        }
                    }
                },
                {
                   /*  "data": function (obj) {
                        if (obj.chergeWay === 9){
                            if (obj.chergeWay === 2) {
                                return '手动扣款';
                            } else {
                                return '自动扣款';
                            }
                        }else{
                            return obj.remark
                        }
                    },"defaultContent": ""
                }, */
                	 "data": function (obj) {
                         if (obj.chergeWay === '1'){
                            return '手动扣款';
                         }else if(obj.chergeWay === '2'){
                        	 return '退款';
                         }else if(obj.chergeWay === '3'){
                        	 return '提前还款';
                         }else if(obj.chergeWay === '4'){
                        	 return '三方扣款';
                         }else if(obj.chergeWay === '5'){
                        	 return '部分扣款';
                         }else if(obj.chergeWay === '6'){
                        	 return '宝付定时任务';
                         }else if(obj.chergeWay === '7'){
                        	 return '先锋定时任务'; 
                         }else{
                        	 return '未知';
                         }
                     },"defaultContent": ""
                 },
                {
                    "data": function (obj) {
                        if (obj.handleType === 2) {
                            return '手动';
                        } else if(obj.handleType === 1){
                            return '自动';
                        }else{
                        	return '主动还款';
                        }
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        if (obj.orderNo == null || obj.orderNo == '') {
                            return '未知';
                        } else {
                            return obj.orderNo;
                        }
                    },"defaultContent": ""
                },
                {
                    "data": function (obj) {
                        if (obj.userName == null || obj.userName == '') {
                            return '未知';
                        } else {
                            return obj.userName;
                        }
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.respMsg == null || obj.respMsg == '') {
                            if (obj.handleSource === 9){
                                if (obj.handleResult === 1) {
                                    return '扣款成功';
                                } else if (obj.handleResult === 2) {
                                    return '扣款失败';
                                } else {
                                    return '扣款中';
                                }
                            }
                            return '';
                        } else {
                            return obj.respMsg;
                        }
                    }
                }
            ]

        });

    })

</script>
</body>
</html>