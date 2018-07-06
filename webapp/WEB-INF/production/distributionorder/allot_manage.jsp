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
                        <li class="active"><a href="#">订单管理</a></li>
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
																id="reservation_table1" class="form-control" />
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
                                <!-- 身份证号 -->
                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                    <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left: 0;padding-right: 0;">
                                        <input type="" name="" id="" value="身份证号码" class="form-control" style="background:#fff;" readonly/>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left: 0;padding-right: 0;">
                                        <input type="text" class="form-control" style="padding-right: 12px;"
                                               id="idNumber" name="idNumber" placeholder="">
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback" style="margin-top:20px;">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" id="searchBtn4" class="btn btn-success" onclick="disOrder()">分配</button>
                                        <button type="button" id="searchBtn5" class="btn btn-success" onclick="editBack3()">收回</button>
                                    </div>
                                    
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <button type="button" id="searchBtn2" class="btn btn-success" onclick="editBack2()">设置协助</button>
                                        <button type="button" id="searchBtn3" class="btn btn-success" onclick="editBack5()">设置留案</button>
                                    </div>
                                    
                                    
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
<div class="modal fade" id="myModalLabelDis" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">分配</h4>
            </div>
            <div class="modal-body">
                <div id="dismodal" style="padding: 5px 20px;">
                    <form class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 col-md-2 control-label">组<span style="color:#fff;">你好</span>号</label>
                            <div class="col-sm-4 col-md-4">
                                <select id="deptid" name="deptid" onchange="changeDhUser()" class="form-control" required>
                                    <option value="">请选择</option>
                                    <c:forEach items="${dept}" var="d">
                                        <option value="${d.id}">${d.NAME}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
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
                            <c:forEach items="${dHUser}" var="user">
                                <tr>
                                    <th><input type="checkbox" class="dhchildren" name="dhchildren" value="${user.id}"/></th>
                                    <th>${user.position}</th>
                                    <th>${user.realName}</th>
                                    <th style="word-wrap: break-word;"><input type="text" id="disNum" name="disNum"
                                                                              class="form-control"/></th>
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
                        </table>
                    </div>
                    <label><span>剩余订单：<span id="surplusNum">1</span></span></label>
                    <input type="hidden" id="findisUserid" name="findisUserid" value="">
                    <input type="hidden" id="findisUserName" name="findisUserName" value="">
                    <input type="hidden" id="findisNum" name="findisNum" value="">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary antoclose" data-dismiss="modal" onclick="editBack()">确认</button>
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal" onclick="disBack()">上一步</button>
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
                    </form>
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

    // 协助
    function setAssist(type){
        var url = "${pageContext.request.contextPath}/mfq/distributionOrder/setAssistUser.do";
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
                var obj = $(this).parent().parent().find("td")[8];
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
            		items.push($(this).val());
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
                if ($(obj).html() != '待分配') {
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
                text: "请选择待分配状态的订单进行分配",
                confirmButton: '确认',
                cancelButton: false,
            });
        } else {
            $("#disSum").val(len);
            $("#disSumItems").val(items + "");
            $('#myModalLabelDis').modal('show');
        }
    }

    // 成功分配
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

    //上一步
    function disBack() {
        $('#myModalLabelDis').modal('show');
    }

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
        $("#surplusNum").text("");
        $("#findisUserid").val("");
        $("#findisNum").val("");
        $("#findisUserName").val("");
        $("input[name='dhchildren']:checkbox:checked").each(function () {
            var disNum = $(this).parent().parent().find("input[name='disNum']").val();
            var obj1 = $(this).parents('tr').find('th').eq(0).find('input').val();
            var obj2 = $(this).parents('tr').find('th').eq(1).text();
            var obj3 = $(this).parents('tr').find('th').eq(2).text();
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
                var obj = $(this).parent().parent().find("td")[8];
                console.log("设置留案判断:" + $(obj).html());
                if ($(obj).html() == '已完成' || $(obj).html() == '协助') {
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
                text: "请选择已经分配订单进行收回",
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

    // 设置留案
    function leaveCase(type) {
        var url = "${pageContext.request.contextPath}/mfq/distributionOrder/leaveCaseDistributionOrder.do";
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


    $(function () {

        //全选
        $(".checkall").click(function () {
            var check = $(this).prop("checked");
            $(".checkchild").prop("checked", check);
        });

        //全选
        $(".dhcheckall").click(function () {
            var check = $(this).prop("checked");
            $(".dhchildren").prop("checked", check);
        });

        // 初始化还款时间
        $('#reservation_table2').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_3",
            locale: {
                format: 'D'
            },
            autoUpdateInput: false,
        }, function (start, end, label) {
        });

        // 初始化分配时间
        $('#reservation_table2').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_3",
            locale: {
                format: 'D'
            },
            autoUpdateInput: false,
        }, function (start, end, label) {
        });

        $('#searchBtn').click(function () {
            table.fnReloadAjax();
        })
		 $('#searchBtn1').click(function () {
			$("#detailStatus").val("");
            $("#orderNo").val("");
            $("#reservation_table").val("");
            $("#status").val("");
            $("#repaymentUserName").val("");
            $("#reservation_table1").val("");
            $("#orderLevel").val("");
            $("#principalName").val("");
            $("#idNumber").val("");
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
            ajaxSource: '${pageContext.request.contextPath}/mfq/distributionOrder/getDistributionOrderInfo.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                // 组合晒选类型
                var detailStatus = $('#detailStatus').val();
                var orderNo = $('#orderNo').val();
                var reservation_table = $('#reservation_table').val();
                var status = $('#status').val();
                var repaymentUserName = $('#repaymentUserName').val();
                var reservation_table1 = $('#reservation_table1').val();
                var orderLevel = $('#orderLevel').val();
                var principalName = $('#principalName').val();
                var idNumber = $('#idNumber').val();
                // 往后台封装数据，json格式的字符串
                aoData.push({"name": "detailStatus", "value": detailStatus});
                aoData.push({"name": "orderNo", "value": orderNo});
                aoData.push({"name": "reservation_table", "value": reservation_table});
                aoData.push({"name": "status", "value": status});
                aoData.push({"name": "repaymentUserName", "value": repaymentUserName});
                aoData.push({"name": "reservation_table1", "value": reservation_table1});
                aoData.push({"name": "orderLevel", "value": orderLevel});
                aoData.push({"name": "principalName", "value": principalName});
                aoData.push({"name": "idNumber", "value": idNumber});
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
                {"data": "orderNo", "defaultContent": ""},
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


    $(document).ready(
        function () {
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

        })
     function quanXuan(){
    	var checkF = $("#checkF").is(":checked");
    	if(checkF){
    		$("#datatable_distributionOrder_list").find('.checkchild').prop('checked',true);
    	}else{
    		$("#datatable_distributionOrder_list").find('.checkchild').prop('checked',false);
    	}
    }
 // 取消协助
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
</script>
</body>
</html>