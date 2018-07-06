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
            <div class="title_left">
                <div class="span6">
                    <!-- 面包屑导航 -->
                    <ul class="breadcrumb">
                        <li><a herf="#">贷后管理</a></li>
                        <li><a herf="#">贷后订单</a></li>
                        <li class="active"><a href="#">外派订单</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">外派列表</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">
                                
                                <!-- 当期还款状态 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="detailStatus" name="detailStatus" class="form-control">
                                            <option value="">当期还款状态</option>
                                            <option value="01">未还</option>
                                            <option value="02">已还</option>
                                            <option value="06">逾期未还</option>
                                            <option value="07">逾期已还</option>
                                            <option value="09">部分还款</option>
                                            <option value="10">逾期部分还款</option>
                                            <option value="11">提前还款</option>
                                        </select>
                                    </div>
                                </div>
                                 <!--订单号 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="订单号" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="orderNo" name="orderNo" placeholder="">
                                    </div>
                                </div>
                                
                                <!-- 还款日期 -->
                                <div class="col-md-4 col-sm-4 col-xs-12">
								    <input type="" name="" id="" value="还款日期" class="form-control"
										style="width: 30%; float: left;background:#fff;" readonly/>
									<div class="col-xs-9" style="width: 70%; padding: 0;">
										<form class="form-horizontal">
											<fieldset>
												<div class="control-group">
													<div class="controls">
														<div class="input-prepend input-group">
															<span class="add-on input-group-addon"
																style="border-radius: 0;"><i
																class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
															<input type="text" name="reservation"
																id="reservation_table" class="form-control" />
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
			  
                                	<!--  分配状态  -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="status" name="status" class="form-control">
                                            <option value="">分配状态</option>
                                            <option value="01">已分配</option>
                                            <option value="00">待分配</option>
                                            <option value="02">已跟进</option>
                                            <option value="03">申请协助</option>
                                            <option value="04">待协助</option>
                                            <option value="05">留案</option>
                                            <option value="06">外催</option>
                                            <option value="07">已完成</option>
                                        </select>
                                    </div>
                                </div>
                                
   			                            
                                <!-- 还款人姓名 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="还款人姓名" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="repaymentUserName" name="repaymentUserName" placeholder="">
                                    </div>
                                </div>
                                
                                 <!-- 分配日期 -->
                                <div class="col-md-4 col-sm-4 col-xs-12">
								    <input type="" name="" id="" value="分配日期" class="form-control"
										style="width: 30%; float: left;background:#fff;" readonly/>
									<div class="col-xs-9" style="width: 70%; padding: 0;">
										<form class="form-horizontal">
											<fieldset>
												<div class="control-group">
													<div class="controls">
														<div class="input-prepend input-group">
															<span class="add-on input-group-addon"
																style="border-radius: 0;"><i
																class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
															<input type="text" name="reservation"
																id="reservation_table1" class="form-control" />
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>	
								
                                <!-- 账龄 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="orderLevel" name="orderLevel" class="form-control">
                                            <option value="">账龄</option>
                                            <option value="CD1">CD1</option>
                                            <option value="M1">M1</option>
                                            <option value="M2">M2</option>
                                            <option value="M3">M3</option>
                                            <option value="M4">M4</option>
                                            <option value="M5">M5</option>
                                            <option value="M6">M6</option>
                                            <option value="M6+">M6+</option>
                                        </select>
                                    </div>
                                </div>
                                
                               							
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                            
                            
                                <!-- 负责人姓名 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="负责人姓名" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="principalName" name="principalName" placeholder="">
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback" style="margin-top:20px;">
	                                <c:if test="${positionNo !='10019' }">
	                                    <div class="col-md-4 col-sm-4 col-xs-12">
	                                        <button type="button" id="searchBtn4" class="btn btn-success" onclick="disOrder()">分配</button>
	                                        <button type="button" id="searchBtn5" class="btn btn-success" onclick="editBack3()">收回</button>
	                                    </div>
	                                </c:if>
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                        <button type="button" id="searchBtn1" class="btn btn-success">重置</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="x_content">
                        <!-- 虚线 -->
                        <div class="divider-dashed "></div>
                        <table id="datatable_distributionOrder_list" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th><input type="checkbox"  class="checkall" id="checkF" onchange="quanXuan()"/></th>
                                <th>订单号</th>
                                <th>还款人姓名</th>
                                <th>还款日</th>
                                <th>账龄</th>
                                <th>负责人姓名</th>
                                <th>月还本息</th>
                                <th>当期还款状态</th>
                                <th>分配状态</th>
                                <th>分配日期</th>
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


<!-- 分配模态框-->
<div id="myModalLabelDis" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">分配</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">总案件量</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="hidden" id="disSumItems" name="disSumItems" value="">
                                <input type="text" class="form-control" id="disSum" name="disSum" value="" style="border:0;">
                            </div>
                        </div>
                        <table class="table table-striped table-bordered" style="table-layout: fixed;">
                            <thead>
                            <tr> 
                                <th><input type="checkbox" class="dhcheckall"/></th>
                                <th>职位</th>
                                <th>姓名</th>
                                <th style="width:30%;">案件量</th>
                            </tr>
                            </thead>
                            <tbody id="dhDisSet">
                                 <c:forEach items="${wPUser}" var="user">
	                                <tr>
	                                    <th><input type="checkbox" class="dhchildren" name="dhchildren" value="${user.id}"/></th>
	                                    <th>${user.position}</th>
	                                    <th>${user.realName}</th>
	                                    <th style="word-wrap: break-word;">
	                                    	<input type="text" id="disNum" name="disNum" class="form-control"/>
	                                    </th>
	                                </tr>
	                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack1()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div id="fc_debit" data-toggle="modal" data-target="#debit_modal"></div>
<!-- /提前还款 or 用户退款 模态框 -->

<!-- 案件分配结果如下 -->
<div class="modal fade " tabindex="-1" id="payListModelId"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <!-- <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button> -->
                <h4 class="modal-title">案件分配结果如下</h4>
            </div>
            <div class="modal-body">
                <div style="padding: 5px 20px;">
                    <div class="form-group">
                        <table class="table table-striped table-bordered" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th>职位</th>
                                <th>姓名</th>
                                <th>案件量</th>
                            </tr>
                            </thead>
                            <tbody id="messageListTbodyId">
                               <th>贷后主管</th>
                               <th>张飞</th>
                               <th>10</th>
                            </tbody>
                            <label><span>剩余订单：<span id="surplusNum">1</span></span></label>
                            <input type="hidden" id="findisUserid" name="findisUserid" value="">
		                    <input type="hidden" id="findisUserName" name="findisUserName" value="">
		                    <input type="hidden" id="findisNum" name="findisNum" value="">
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal" data-toggle="modal" data-target="#debit_modal">上一步</button>
            </div>
        </div>
    </div>
</div>



<!-- /page content -->

<%-- footer --%>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>

<script src="${pageContext.request.contextPath}/build/js/TimeInit.js"></script>

<script type="text/javascript">

	// 分配设置
	function editBack1() {
	    var cc = false;
	    var disSum = $("#disSum").val();
	    var sum = 0;
	    var htm = "";
	    var findisUserids = new Array();
	    var findisNums = new Array();
	    var findisUserNames = new Array();
	    $("#messageListTbodyId").html("");
	    $("#surplusNum").text("");//案件剩余数量
	    $("#findisUserid").val("");//分配人员
	    $("#findisNum").val("");//分配数量
	    $("#findisUserName").val("");//分配人员姓名
	    $("input[name='dhchildren']:checkbox:checked").each(function () {
	        var disNum = $(this).parent().parent().find("input[name='disNum']").val();
	        var obj1 = $(this).parents('tr').find('th').eq(0).find('input').val();
	        var obj2 = $(this).parents('tr').find('th').eq(1).text();
	        var obj3 = $(this).parents('tr').find('th').eq(2).text();
	    //  	alert(disNum+","+obj1+","+obj2+","+obj3)
	        var h = "<tr>" + "<th>" + obj2 + "</th>" + "<th>" + obj3 + "</th>" + "<th>" + disNum + "</th>" + "</tr>";
	        console.log("disNum:" + disNum)
	        sum = sum + Number(disNum);
	        htm += h;
	        if (sum > Number(disSum) || Number(disNum) > Number(disSum)) {
	            cc = true;
	            return false;
	        }
	        console.log("sum:" + sum);
	        findisUserids.push(obj1);
	        findisNums.push(disNum);
	        findisUserNames.push(obj3); 
	    });
	    if (cc == true) {
	        $.confirm({
	            title: '系统提示',
	            text: "分配案件数错误",
	            confirmButton: '确认',
	            cancelButton: false,
	        });
	    } else {
	        var surplusNum = Number(disSum) - Number(sum);
	        $("#surplusNum").text(surplusNum);
	        $("#messageListTbodyId").html(htm);
	        $("#findisUserid").val(findisUserids + "");
	        $("#findisNum").val(findisNums + "");
	        $("#findisUserName").val(findisUserNames + "");
	        $('#payListModelId').modal('show')
	    }  
	}
	//成功分配
	function editBack() {
	    var url = "${pageContext.request.contextPath}/mfq/distributionOrder/distributionOrder.do";
	    //分配人员
	    var findisUserid = $("#findisUserid").val();
	    //分配人员姓名
	    var findisUserName = $("#findisUserName").val();
	    //分配数量
	    var findisNum = $("#findisNum").val();
	    //分配订单
	    var disSumItems = $("#disSumItems").val();
	    if (findisUserid == null || findisUserid == '') {
	        alert("请选择分单专员");
	        return;
	    }
	    if (findisNum == null || findisNum == '') {
	        alert("请选择分单数量");
	        return;
	    }
	    if (disSumItems == null || disSumItems == '') {
	        alert("请选择分配的订单");
	        return;
	    }
	    var req = {
	        findisUserid: findisUserid,
	        findisNum: findisNum,
	        disSumItems: disSumItems,
	        findisUserName: findisUserName
	    };
	 //   alert(findisUserid+"|"+findisUserName+"|"+findisNum+"|"+disSumItems)
	     $.ajax({
	        url: url,
	        data: req,
	        dataType: "json",
	        type: "post",
	        success: function (data) {
	            if (data.code == 's') {
	                $.confirm({
	                    title: '系统提示',
	                    text: "分配成功",
	                    confirmButton: '确认',
	                    cancelButton: false,
	                    confirm: function (button) {
	                        location.reload(true);
	                    }
	                });
	            } else {
	                alert("分配失败");
	            }
	        }
	    }); 
	
	}

	//更换贷后人员
	function changeDhUser() {
	    var deptid = $("#deptid").val();
	    if (deptid == null || deptid == '') {
	        alert("请选择部门");
	        return;
	    }
	    var url = "${pageContext.request.contextPath}/mfq/distributionOrder/changeDhUser.do";
	    var req = {
	        deptid: deptid
	    };
	    $.ajax({
	        url: url,
	        data: req,
	        dataType: "json",
	        type: "post",
	        success: function (data) {
	            var u = data.list;
	            var oldh = $("#dhDisSet").html();
	            $("#dhDisSet").html("");
	            var ht = ""
	            for (var i = 0; i < u.length; i++) {
	                ht = ht + '<tr><th><input type="checkbox" class="dhchildren" name="dhchildren" value="' + u[i].id + '"/></th><th>' + u[i].position + '</th><th>' + u[i].realName + '</th><th style="word-wrap: break-word;"><input type="text" id="disNum" name="disNum" class="form-control"/></th></tr>';
	            }
	            $("#dhDisSet").html(ht);
	        }
	    });
	}

	//分配
	function disOrder() {
	    $("#disSum").val("");
	    $("#disSumItems").val("");
	    var zz = false;
	    var items = new Array;
	    var len = $(".checkchild:checked").length;
	    // 循环选中的值
	    if (len > 0) {
	        $("input[name='checkchild']:checkbox:checked").each(function () {
	            var obj = $(this).parent().parent().find("td")[8];
	            if ($(obj).html() != '外催' && $(obj).html() != '待分配') {
	                zz = true;
	                items.slice(0, items.length);
	                return false;
	            }
	            var item = $(this).val();
	            items.push(item);
	        });
	     
	    } else {
	        zz = true;
	    }
	    console.log("items:" + items)
	    if (zz == true) {
	        $.confirm({
	            title: '收回订单',
	            text: "请选择待分配、外催状态的订单进行分配",
	            confirmButton: '确认',
	            cancelButton: false,
	        });
	    } else {
	        $("#disSum").val(len);
	        $("#disSumItems").val(items + "");
	        $('#myModalLabelDis').modal('show');
	    }
	}
/* // 成功分配
	function editBack() {
	        $.confirm({
	            title: '系统提示',
	            text: "分配成功",
	            confirmButton: '确认',
	            cancelButton: false,
	            confirm: function (button) {
	                location.reload(true);
	            }
	        });
	}
	 */
	
	/* // 分配失败
	function editBack1() {
		var cc=false;
		if(cc == true){
			 $.confirm({
		            title: '系统提示',
		            text: "分配案件数错误",
		            confirmButton: '确认',
		            cancelButton: false,
		        });
		}else{
			 $('#payListModelId').modal('show')
		}
	} */
	
	
	
//  收回
    function editBack3() {
        var zz = false;
        var items = new Array;
        // 循环选中的值
        if ($(".checkchild:checked").length > 0) {
            $("input[name='checkchild']:checkbox:checked").each(function () {
                var obj = $(this).parent().parent().find("td")[8];
                if ($(obj).html() != '已分配' && $(obj).html() != '已跟进') {
                    zz = true;
                    return false;
                }
                var item = $(this).val();
                items.push(item);
            });
        } else {
            zz = true;
        }
        console.log("items:" + items)
        
        if (zz == true) {
            $.confirm({
                title: '收回订单',
                text: "请选择已经分配订单进行进行收回",
                confirmButton: '确认',
                cancelButton: false,
            });
        } else {
            $.confirm({
                title: '收回订单',
                text: "是否将当前" + $(".checkchild:checked").length + "个订单变成待分配状态",
                confirmButton: '确认',
                cancelButton: '取消',
                confirm: function (button) {
                    takeBack(items);
                },
                cancel: function (button) {
                    // nothing to do
                },
            });
        }
    }

	
	
	// 收回订单
    function takeBack(obj) {
        var url = "${pageContext.request.contextPath}/mfq/distributionOrder/takeBackDistributionOrder.do";
        var req = {
            ids: obj + ""
        };
        console.log("收回订单req:" + req.ids)
        $.ajax({
            url: url,
            data: req,
            dataType: "json",
            type: "post",
            success: function (data) {
                if (data.code == 's') {
                    alert('回收成功')
                    window.location.reload(true);
                } else {
                    alert('回收失败')
                }
            }
        }); 
    }
	
	
    $(function () {

    	var beginTimeStore = '';
        var endTimeStore = '';
        $('#reservation_table1').daterangepicker(
            {
                "linkedCalendars": false,
                "autoUpdateInput": false,
                "locale": {
                    format: 'YYYY-MM-DD',
                    separator: ' ~ ',
                    applyLabel: "应用",
                    cancelLabel: "清除",
                },
            },
            function (start, end, label) {
                beginTimeStore = start;
                endTimeStore = end;
                console.log(this.startDate.format(this.locale.format));
                console.log(this.endDate.format(this.locale.format));
                if (!this.startDate) {
                    this.element.val('');
                } else {
                    this.element.val(this.startDate
                            .format(this.locale.format)
                        + this.locale.separator
                        + this.endDate.format(this.locale.format));
                }
            });

        $('#searchBtn').click(function () {
            table.fnReloadAjax();
        })
    
     $('#searchBtn1').click(function () {
    	 	$("#detailStatus").val("");
			$("#orderNo").val("");
			$("#reservation_table").val("");
			$("#repaymentUserName").val("");
   			$("#reservation_table1").val("");
   			$("#orderLevel").val("");
   			$("#principalName").val("");
   			$("#status").val("");
       })
    
    // 初始化DataTables
        var table = $('#datatable_distributionOrder_list').dataTable({
            autoWidth: false,  	// 禁用自动调整列宽
            scrollX: '100%',
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            aLengthMenu: [[25, 50, 100, 10000], [25, 50, 100, 10000]],
            paginate: true,		// 翻页功能
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
            orderMulti: false,   // 启用多列排序
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
            ajaxSource: '${pageContext.request.contextPath}/mfq/dhoe/getDistributionOrderInfo.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                // 组合晒选类型
                var detailStatus = $('#detailStatus').val();//还款状态
                var orderNo = $('#orderNo').val();//订单号
                var reservation_table = $('#reservation_table').val();//还款日期
                var status = $('#status').val();
                var repaymentUserName = $('#repaymentUserName').val();//还款人姓名
                var reservation_table1 = $('#reservation_table1').val();//分配日期
                var orderLevel = $('#orderLevel').val();//账龄
                var principalName = $('#principalName').val();//负责人姓名
                // 往后台封装数据，json格式的字符串
                
                aoData.push({"name": "detailStatus", "value": detailStatus});
                aoData.push({"name": "orderNo", "value": orderNo});
                aoData.push({"name": "reservation_table", "value": reservation_table});
                aoData.push({"name": "status", "value": status});
                aoData.push({"name": "repaymentUserName", "value": repaymentUserName});
                aoData.push({"name": "reservation_table1", "value": reservation_table1});
                aoData.push({"name": "orderLevel", "value": orderLevel});
                aoData.push({"name": "principalName", "value": principalName});
                $.ajax({
                    type: 'POST',
                    url: sSource,
                    data: {"aoData": JSON.stringify(aoData)},
                    dataType: 'json',
                    success: function (rs) {
                    	console.log(rs)
                        fnCallback(rs);
                    }
                });
            },
            columns: [
                {
                    "sClass": "text-center",
                    "data": "id",
                    "render": function (obj) {
                        return '<input type="checkbox"  class="checkchild" name="checkchild"  value="' + obj + '" />';
                    },
                    "bSortable": false
                },
                {
                	 "data": function (obj) {
						 return "<a href='${pageContext.request.contextPath}/mfq/repayment/detail.do?&orderNo="
                         + obj.orderNo + "&orderId="
                         + obj.orderId + "&userId="
                         + obj.userId + "&repaymentId="
                         + obj.repaymentId + "&repaymentDetailId="
                         + obj.repaymentDetailId + "&pageValue=00"
                         + "' style='color:#3396c7;'>"+ obj.orderNo + "</a>"
					 }
				},
                {"data": "repaymentUserName", "defaultContent": ""},
                {
                    "data": function (obj) {
                        if (obj.repaymentDay != null) {
                            return new Date(parseInt(obj.repaymentDay)).format('yyyy-MM-dd');
                        }
                    }, "defaultContent": ""
                },
                {"data": "orderLevel", "defaultContent": ""},
                {"data": "principalName", "defaultContent": ""},
                {"data": "repaymentMoney", "defaultContent": ""},
                {
                    "data": function (obj) {
                        var detailStatus;
                        switch (obj.detailStatus) {
                            case '01':
                                detailStatus = '未还';
                                break;
                            case '02':
                                detailStatus = '已还';
                                break;
                            case '06':
                                detailStatus = '逾期未还';
                                break;
                            case '07':
                                detailStatus = '逾期已还';
                                break;
                            case '09':
                                detailStatus = '部分还款';
                                break;
                            case '10':
                                detailStatus = '逾期部分还款';
                                break;
                            case '11':
                                detailStatus = '提前还款';
                                break;
                        }
                        return detailStatus;
                    }
                },
                {
                    "data": function (obj) {
                        var status;
                        switch (obj.status) {
                            case '00':
                                status = '待分配';
                                break;
                            case '01':
                                status = '已分配';
                                break;
                            case '02':
                                status = '已跟进';
                                break;
                            case '03':
                                status = '申请协助';
                                break;
                            case '04':
                                status = '待协助';
                                break;
                            case '05':
                                status = '留案';
                                break;
                            case '06':
                                status = '外催';
                                break;
                            case '07':
                                status = '已完成';
                                break;
                            case '08':
                                status = '未完成';
                                break;
                            case '09':
                                status = '未跟进';
                                break;
                        }
                        return status;
                    }
                },
                {
                    "data": function (obj) {
                        if (obj.ditributionTime != null) {
                            return new Date(parseInt(obj.ditributionTime)).format('yyyy-MM-dd');
                        }
                    }, "defaultContent": ""
                }
            ]

        });

    })
    
    function quanXuan(){
    	var checkF = $("#checkF").is(":checked");
    	if(checkF){
    		$("#datatable_distributionOrder_list").find('.checkchild').prop('checked',true);
    	}else{
    		$("#datatable_distributionOrder_list").find('.checkchild').prop('checked',false);
    	}
    }
</script>
</body>
</html>