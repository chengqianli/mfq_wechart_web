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
                        <li><a herf="#">案件分配</a></li>
                        <li class="active"><a href="#">订单操作</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size:18px;">操作列表</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        <div class="control-group">
                            <div class="controls">

                                <!-- 当期还款状态 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="cRepaymentStatus" name="cRepaymentStatus" class="form-control">
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
                                        <input type="" name="" value="订单号" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="orderNo" value="" name="searchTxt" placeholder="">
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
																id="repaymentDay" name="repaymentDay" class="form-control" />
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

                                <!-- 分配状态 -->
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <select id="status" name="status" class="form-control">
                                            <option value="">分配状态</option>
                                            <option value="01">已分配</option>
                                            <option value="00">待分配</option>
                                            <option value="02">已跟进</option>
                                            <option value="03">协助</option>
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
																id="ditribution" class="form-control" />
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
                                            <option value="M6+">M6+</option>
                                        </select>
                                    </div>
                                </div>
								<!-- 身份证号 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right:0;">
                                        <input type="" name="" id="" value="身份证号码" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="idNumber" name="idNumber" placeholder="">
                                    </div>
                                </div>
                                
                                <!-- 负责人姓名 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback" style="padding-left: 0;padding-right: 0;">
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
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <button type="button" id="searchBtn4" class="btn btn-success" onclick="editBack5()">设置留案</button>
                                        <button type="button" id="searchBtn5" class="btn btn-success" onclick="editBack3()">申请案件</button>
                                        <button type="button" id="searchBtn2" class="btn btn-success" onclick="editBack2()">设置协助</button>
                                    </div>


                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <button type="button" id="searchBtn" class="btn btn-success">查询</button>
                                        <button type="button" id="searchBtn1" class="btn btn-success">重置</button>
                                    </div>


                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- 设置留案 -->
						<div class="modal fade " tabindex="-1" id="payListModelIdsss"
						     role="dialog" aria-hidden="true">
						    <div class="modal-dialog modal-lg">
						        <div class="modal-content">
						
						            <div class="modal-header">
						                <h4 class="modal-title">设置留案</h4>
						            </div>
						            <div class="modal-body">
						                <input type="hidden" id="laitems" name="laitems" value="">
						                <input type="hidden" id="lastatus" name="lastatus" value="">
						                <select id="lauserid" name="lauserid" class="form-control" required>
						                    <option value="">请选择</option>
						                    <c:forEach items="${dHUser}" var="user">
						                        <option value="${user.id}">${user.realName}</option>
						                    </c:forEach>
						                </select>
						                <div style="padding: 5px 20px;">
						                    <div class="form-group">
						                        <h>是否将案件设置为留案状态（设置完成后，不会进入外催）</h>
						                    </div>
						                </div>
						            </div>
						            <div class="modal-footer">
						                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack4()">确认</button>
						                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">取消</button>
						            </div>
						        </div>
						    </div>
						</div>

                        <div class="control-group">
                               <div class="controls">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback" style="margin-top:20px;">
                                                                                                                                                当前案件：${statusconut}件 ，已分配：${statusconuttwo}件，已跟进：${statusconutthree}件 ，协助：${statusconutfour }件，留案：${statusconutfive}件
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="x_content">
                        <!-- 虚线 -->
                        <div class="divider-dashed "></div>
                        <table id="datatable_repayment_list" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th><input type="checkbox" class="checkall" id="checkF" onchange="quanXuan()"></th>
                                <th>订单号</th>
                                <th>还款人姓名</th>
                                <th>身份证号</th>
                                <th>还款日</th>
                                <th>账龄</th>
                                <th>月还本息</th>
                                <th>当期还款状态</th>
                                <th>负责人姓名</th>
                                <th>分配状态</th>
                                <th>分配日期</th>
                                <!-- <th>当前还款状态</th>
                                <th>操作</th> -->
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
</div>

<!-- 申请案件-->
<div id="debit_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <input type="hidden" id="ups" name="ups" value="${ups }">
        <input type="hidden" id="biaozhun" name="biaozhun" value="${biaozhun }">
        <input type="hidden" id="operatorname" name="operatorname" value="${operatorname }">
        <input type="hidden" id="biaozhundbo" name="biaozhundbo" value="${biaozhundbo }">
        <input type="hidden" id="zongNum" name="zongNum" value="${zongNum }">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">申请案件</h4>
            </div>
            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">当前案件：</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="debitMoney" name="debitMoney" value="${statusconut}" style="border:0;background:#fff;" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">待分配案件：</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="waitMoney" name="debitMoney" value="${statusconutzero}" style="border:0;background:#fff;" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label">申请案件：</label>
                            <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="Money" name="Money">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div id="fc_debit" data-toggle="modal" data-target="#debit_modal"></div>
<!-- /提前还款 or 用户退款 模态框 -->



<!-- 设置留案 -->
<div class="modal fade " tabindex="-1" id="payListModelIdsss"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">设置留案</h4>
            </div>
            <div class="modal-body">
                <div style="padding: 5px 20px;">
                    <div class="form-group">
                        <h>是否将案件设置为留案状态（设置完成后，不会进入外催）</h>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack4()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 设置协助 -->
<div class="modal fade " tabindex="-1" id="messageListModelId"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">设置协助</h4>
            </div>
             <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">组<span style="color:#fff;">你好</span></label>
                            <div class="col-sm-4 col-md-4">
                                <select id="assistDebitId" name="assistDebitId" onchange="changeAssistUser()" class="form-control" required>
                                    <option value="">请选择</option>
                                    <c:forEach items="${dept}" var="d">
                                        <option value="${d.id}">${d.NAME}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">协助人</label>
                            <div class="col-sm-4 col-md-4">
                                <select id="assistUserid" name="assistUserid" class="form-control" required>
                                    <option value="">请选择</option>
                                    <c:forEach items="${dHUser}" var="user">
                                        <option value="${user.id}">${user.realName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" id="assistLaitems" name="assistLastatus" value="">
                        <input type="hidden" id="assistLastatus" name="assistLastatus" value="">
                    <!-- </form> -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="setAssistBack()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">取消</button>
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



    //申请
    function editBack() {
        var wait=$('#waitMoney').val();//待分配案件数
        var money = $('#Money').val();//申请案件数
        var ups= $('#ups').val(); //分配上线
        var biaozhun= $('#biaozhun').val();//三天内完成数量
        var biaozhundbo= $('#biaozhundbo').val();///分配标准
        var zongNum= $('#zongNum').val();///当天申请总数
        console.log(wait,money,ups,biaozhun,biaozhundbo,zongNum)
        
        if(Number(money) > Number(wait)){
        	
            $.confirm({
                title: '申请案件',
                text: "待分配案件不足请重新申请",
                confirmButton: '确认',
                cancelButton: false,
            });
        }else if(money == "" || money == "0"){
        
            $.confirm({
                title: '申请案件',
                text: "申请案件数不合法",
                confirmButton: '确认',
                cancelButton: false,
            });
         }else if( Number(money) >= Number(ups) || Number(zongNum) > Number(ups)){
            $.confirm({
                title: '申请案件',
                text: "申请案件数不能超过申请上限",
                confirmButton: '确认',
                cancelButton: false,
            }); 
         }else if(Number(biaozhundbo) < Number(biaozhun)){
            $.confirm({
                title: '申请案件',
                text: "不符合申请标准",
                confirmButton: '确认',
                cancelButton: false,
            }); 
        }
        else{
        //	alert(money);
            var url = "${pageContext.request.contextPath}/mfq/Distributionorder/updateApplicationcase.do";
            /*  var req ={Money:Money}; */ 
            $.ajax({
                url: url,
                data: "Money="+money,
                /* dataType: "json", */ 
                type: "post",
                success: function (data) {
                        window.location.reload(true);
                        location.reload(); // 刷新页面
                }
            });

            $.confirm({
                title: '申请案件',
                text: "申请成功",
                confirmButton: '确认',
                cancelButton: false,
            });
        }
    }

	// 设置协助
	function editBack20(obj) {
		
			 $.confirm({
		            title: '设置协助',
		            text: "是否取消协助状态",
		            confirmButton: '确认',
		            cancelButton: '取消',
		            confirm: function (button) {
		            	var url = "${pageContext.request.contextPath}/mfq/Distributionorder/setAssistUser.do";
		            	 $.ajax({
		                     url: url,
		                     data: "ids="+obj+"&type=qx",
		                     dataType: "json",
		                     type: "post",
		                     success: function (data) {
		                         if (data.code == 's') {
		                             alert('取消协助成功')
		                             window.location.reload(true);
		                         } else {
		                             alert('取消协助失败')
		                         }
		                     }
		                 });
		         
                    },
                    cancel: function (button) {
                    }
		        });
	}


	// 设置留案
	function editBack4() {
		$.confirm({
            title: '设置留案',
            text: "是否取消留案状态",
            confirmButton: '确认',
            cancelButton: '取消',
        });
	}



	//  申请案件
	function editBack3() {

		/*var debitMoney = $("#debitMoney").val();
        var deiMoney=$("#deiMoney").val();
        var shenqingMoney=$("#shenqingMoney").val();
		if(shenqingMoney > deiMoney ){
			 $.confirm({
		            title: '申请案件',
		            text: "申请案件不能大于待分配案件",
		            confirmButton: '确认',
		            cancelButton: false,
		        });
		}else if(shenqingMoney ="") {
            $.confirm({
                title: '申请案件',
                text: "您确定放弃申请案件待分配案件？",
                confirmButton: '确认',
                cancelButton: false,
            });
        }else if(zz == 01){
			$.confirm({
	            title: '收回订单',
	            text: "是否将当前100个订单变成待分配状态",
	            confirmButton: '确认',
	            cancelButton: '取消',
	            confirm: function (button) {
	            	alert('回收成功')
	            },
	            cancel: function(button) {
	                // nothing to do
	            },
	        });
		}else{*/
			$('#debit_modal').modal('show')
		/*}*/
	}





    $(function () {
    	
    	
    	riqigesi()

        // 初始化还款时间

        $('#searchBtn').click(function () {
            table.fnReloadAjax();
        });

    	$('#searchBtn1').click(function () {
			$("#detailStatus").val("");
            $("#orderNo").val("");
            $("#repaymentDay").val("");
            $("#status").val("");
            $("#repaymentUserName").val("");
            $("#ditribution").val("");
            $("#orderLevel").val("");
            $("#cRepaymentStatus").val("");
            $("#idNumber").val("");
        })

    // 初始化DataTables
        var table = $('#datatable_repayment_list').dataTable({
            autoWidth: false,  	// 禁用自动调整列宽
            scrollX: '100%',
            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            processing: false,  	// 隐藏加载提示,自行处理
            serverSide: true,  	// 启用服务器端分页
            aLengthMenu: [[25, 50, 100, 10000], [25, 50, 100, 10000]],
            paginate: true,		// 翻页功能
            searching: false,  	// 禁用原生搜索
            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力  /mfq/Distributionorder/getDistributionorderList
            orderMulti: false,   // 启用多列排序
            aoColumnDefs: [{"bSortable": false, "aTargets": [10]}],
            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头 /mfq/Distributionorder/getDistributionorderList
            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui /mfq/distributionOrder getDistributionOrderInfo
            ajaxSource: '${pageContext.request.contextPath}/mfq/Distributionorder/getDistributionorderList.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                // 组合晒选类型
                var detailStatus = $('#detailStatus').val();
                var orderNo = $('#orderNo').val();
                var repaymentDay = $('#repaymentDay').val();
                var repaymentUserName = $('#repaymentUserName').val();
                var ditribution = $('#ditribution').val();
                var orderLevel = $('#orderLevel').val();
                var cRepaymentStatus = $('#cRepaymentStatus').val();
                var status = $('#status').val();
                var idNumber = $('#idNumber').val();
                var principalName = $('#principalName').val();

                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "detailStatus", "value": detailStatus });
                aoData.push({"name": "orderNo", "value": orderNo});
                aoData.push({"name": "repaymentDay", "value": repaymentDay});
                aoData.push({"name": "repaymentUserName", "value": repaymentUserName});
                aoData.push({"name": "ditribution", "value": ditribution});
                aoData.push({"name": "orderLevel", "value": orderLevel});
                aoData.push({"name": "cRepaymentStatus", "value": cRepaymentStatus});
                aoData.push({"name": "status", "value": status});
                aoData.push({"name": "idNumber", "value": idNumber});
                aoData.push({"name": "principalName", "value": principalName});
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
                {"data": "repaymentUserName","defaultContent": ""},
                {"data": "idNumber","defaultContent": ""},
                /* {"data": "repaymentDay","defaultContent": ""}, */
                {
                    "data": function (obj) {
                        if (obj.repaymentDay != null) {
                            return new Date(parseInt(obj.repaymentDay)).format('yyyy-MM-dd');
                        }
                    }, "defaultContent": ""
                },
                {"data": "orderLevel","defaultContent": ""},
                {"data": "repaymentMoney","defaultContent": ""},
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
                {"data": "principalName","defaultContent": ""},
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
                                status = '协助';
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
      // 协助
    function setAssist(type){
        var url = "${pageContext.request.contextPath}/mfq/Distributionorder/setAssistUser.do";
        var assistLaitems = $("#assistLaitems").val();
        var assistUserid = $("#assistUserid").val();
        var assistUsername = $("#assistUserid").find("option:selected").text();
        if ('add' == type && (assistUserid == null || assistUsername == '')) {
            alert("请选择协助人员");
            return;
        }
        var req = {
            ids: assistLaitems,
            assistUserid: assistUserid,
            type: type,
            assistUsername: assistUsername
        };
        console.log("协助订单req:" + req.ids)
        $.ajax({
            url: url,
            data: req,
            dataType: "json",
            type: "post",
            success: function (data) {
                if (data.code == 's') {
                    alert('设置协助成功')
                    window.location.reload(true);
                } else {
                    alert('设置协助失败')
                }
            }
        });

    }

    //更换协助人员
    function changeAssistUser() {
        var deptid = $("#assistDebitId").val();
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
                var oldh = $("#assistUserid").html();
                $("#assistUserid").html("");
                var ht = '<option value="">请选择</option>'
                for (var i = 0; i < u.length; i++) {
                    ht = ht + '<option value="'+u[i].id+'">'+u[i].realName+'</option>';
                }
                $("#assistUserid").html(ht);
            }
        });
    }

    //设置协助
    function setAssistBack(){
        var assistLastatus = $("#assistLastatus").val();
        console.log("assistLastatus:" + assistLastatus);
        if ("取消协助" == assistLastatus) {
            $.confirm({
                title: '设置协助',
                text: "是否取消协助状态",
                confirmButton: '确认',
                cancelButton: '取消',
                confirm: function (button) {
                    setAssist("qx");
                },
                cancel: function (button) {
                    // nothing to do
                },
            });
        }
        if ("设置协助" == assistLastatus) {
            setAssist("add");
        }
    }

    // 设置协助判断
    function editBack2() {
        $("#assistLaitems").val("");
        $("#assistLastatus").val("");
        var bb = false;
        var flag= false;
        var items = new Array;
        // 循环选中的值
        var len = $("input[name='checkchild']:checkbox:checked").length;
        var check = $("input[name='checkchild']:checkbox:checked");
        if (len > 0) {
            console.log("设置协助判断len:" + len);
            $(check).each(function () {
                var obj = $(this).parent().parent().find("td")[9];
                console.log("设置协助判断:" + $(obj).html());
                //已分配”和“已跟进”，和“留案”的可以设置为协助
                if ($(obj).html() != '已分配' && $(obj).html() != '已跟进' && $(obj).html() != '留案' &&  $(obj).html() != '协助') {
                    bb = true;
                    items.slice(0, items.length);
                    $.confirm({
                        title: '设置协助',
                        text: "只有已分配、已跟进、留案的状态，可以设置为协助",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                    return false;
                }else if($(obj).html() == '协助'){
                	 flag = true;
                	 bb = true;
                	//alert($(this).val())
                	items.push($(this).val())
                //	editBack20($(obj2).html());
                }else{
                	$('#messageListModelId').modal("show")
                }
            });
            
            if(flag){
            	editBack20(items);
            }
            //终止运行
            if (bb == true) {
                return;
            }
            if (len > 1) {
                var la = true;
                $(check).each(function () {
                    var obj = $(this).parent().parent().find("td")[8];
                    if ($(obj).html() != '协助') {
                        bb = true;
                        la = false;
                        items.slice(0, items.length);
                        return false;
                    }
                    var item = $(this).val();
                    items.push(item);
                    $("#assistLastatus").val("取消协助");
                });
                //已完成。待协助，待分配
                console.log("已完成。待协助，待分配la:" + la)
                console.log("已完成。待协助，待分配bb:" + bb)
                if (!la) {
                    bb = false;
                    $(check).each(function () {
                        var obj = $(this).parent().parent().find("td")[8];
                        console.log("已完成。待协助，待分配bb:" + ($(obj).html() == '留案'))
                        if ($(obj).html() == '协助') {
                            bb = true;
                            items.slice(0, items.length);
                            return false;
                        }
                        var item = $(this).val();
                        items.push(item);
                        $("#assistLastatus").val("设置协助");
                    });
                }
            } else {
                var item = $("input[name='checkchild']:checkbox:checked").val();
                var obj = $("input[name='checkchild']:checkbox:checked").parent().parent().find("td")[8];
                if ($(obj).html() == '协助') {
                    $("#assistLastatus").val("取消协助");
                } else {
                    $("#assistLastatus").val("设置协助");
                }
                items.push(item);
            }
        } else {
            $.confirm({
                title: '设置协助',
                text: "请选择订单进行操作",
                confirmButton: '确认',
                cancelButton: false,
            });
            return false;
        }
        console.log("items:" + items)
        if (bb == true) {
            $.confirm({
                title: '设置协助',
                text: "请选择相同订单状态进行批量操作",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        } else {
            $("#assistLaitems").val(items + "");
            $('#messageListModelId').modal('show')
        }
    }




    //上一步
    function disBack() {
        $('#myModalLabelDis').modal('show');
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

    // 设置留案
    function editBack4() {
        var lastatus = $("#lastatus").val();
        console.log("lastatus:" + lastatus);
        if ("取消留案" == lastatus) {
            $.confirm({
                title: '设置留案',
                text: "是否取消留案状态",
                confirmButton: '确认',
                cancelButton: '取消',
                confirm: function (button) {
                    leaveCase("qx");
                },
                cancel: function (button) {
                    // nothing to do
                },
            });
        }
        if ("设置留案" == lastatus) {
            leaveCase("add");
        }

    }


    // 设置留案判断
    function editBack5() {
        $("#laitems").val("");
        $("#lastatus").val("");
        var bb = false;
        var items = new Array;
        // 循环选中的值
        var len = $("input[name='checkchild']:checkbox:checked").length;
        var check = $("input[name='checkchild']:checkbox:checked");
        if (len > 0) {
            console.log("设置留案判断len:" + len);
            $(check).each(function () {
                var obj = $(this).parent().parent().find("td")[9];
                console.log("设置留案判断:" + $(obj).html());
                if ($(obj).html() == '已完成' ||  $(obj).html() == '协助') {
                    bb = true;
                    items.slice(0, items.length);
                    $.confirm({
                        title: '设置留案',
                        text: "已完成,协助 状态的案件，不能设置留案",
                        confirmButton: '确认',
                        cancelButton: false,
                    });
                    return false;
                }
            });
            //终止运行
            if (bb == true) {
                return;
            }
            if (len > 1) {
                var la = true;
                $(check).each(function () {
                    var obj = $(this).parent().parent().find("td")[8];
                    if ($(obj).html() != '留案') {
                        bb = true;
                        la = false;
                        items.slice(0, items.length);
                        return false;
                    }
                    var item = $(this).val();
                    items.push(item);
                    $("#lastatus").val("取消留案");
                });
                //已完成。待协助，待分配
                console.log("已完成。待协助，待分配la:" + la)
                console.log("已完成。待协助，待分配bb:" + bb)
                if (!la) {
                    bb = false;
                    $(check).each(function () {
                        var obj = $(this).parent().parent().find("td")[8];
                        console.log("已完成。待协助，待分配bb:" + ($(obj).html() == '留案'))
                        if ($(obj).html() == '留案') {
                            bb = true;
                            items.slice(0, items.length);
                            return false;
                        }
                        var item = $(this).val();
                        items.push(item);
                        $("#lastatus").val("设置留案");
                    });
                }
            } else {
                var item = $("input[name='checkchild']:checkbox:checked").val();
                var obj = $("input[name='checkchild']:checkbox:checked").parent().parent().find("td")[8];
                if ($(obj).html() == '留案') {
                    $("#lastatus").val("取消留案");
                } else {
                    $("#lastatus").val("设置留案");
                }
                items.push(item);
            }
        } else {
            $.confirm({
                title: '设置留案',
                text: "请选择订单进行操作",
                confirmButton: '确认',
                cancelButton: false,
            });
            return false;
        }
        console.log("items:" + items)
        if (bb == true) {
            $.confirm({
                title: '设置留案',
                text: "请选择相同订单状态进行批量操作",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        } else {
            $("#laitems").val(items + "");
            $('#payListModelIdsss').modal('show')
        }
    }



    // 设置留案
    function leaveCase(type) {
        var url = "${pageContext.request.contextPath}/mfq/Distributionorder/leaveCaseDistributionOrder.do";
        var items = $("#laitems").val();
        var lauserid = $("#lauserid").val();
        var lausername = $("#lauserid").find("option:selected").text();
        if ('add' == type && (lauserid == null || lauserid == '')) {
            alert("请选择留案人员");
            return;
        }
        var req = {
            ids: items,
            lauserid: lauserid,
            type: type,
            lausername: lausername
        };
        console.log("留案订单req:" + req.ids)
        $.ajax({
            url: url,
            data: req,
            dataType: "json",
            type: "post",
            success: function (data) {
                if (data.code == 's') {
                    alert('设置留案成功')
                    window.location.reload(true);
                } else {
                    alert('设置留案失败')
                }
            }
        });
    }
    
    function riqigesi() {
        var beginTimeStore = '';
        var endTimeStore = '';
        $('#ditribution').daterangepicker(
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
            }) 
            
    }
    
    $(document).ready(
    		
            function () {
                var beginTimeStore = '';
                var endTimeStore = '';
                $('#repaymentDay').daterangepicker(
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

            }
            
        )
        
        function quanXuan(){
    	var checkF = $("#checkF").is(":checked");
    	if(checkF){
    		$("#datatable_repayment_list").find('.checkchild').prop('checked',true);
    	}else{
    		$("#datatable_repayment_list").find('.checkchild').prop('checked',false);
    	}
    }
</script>
</body>
</html>