<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- header --%>
<%@include file="/WEB-INF/common/header.jsp" %>

    <link href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="${pageContext.request.contextPath}/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
	<!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
</head>
  <body class="nav-md">
			
	<%-- menuProfile --%>
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
        <div class="clearfix"></div>
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2>日志列表页 <small></small></h2>
                <div class="clearfix"></div>
              </div>
              <!--字段筛选-->
                  				
					                  <div class="col-xs-12" style="height:100px;box-sizing: border-box;padding: 8px 0;padding-left: 0;margin-bottom: 20px;">
											        	<div class="col-lg-3">
											        		<select name="" class="form-control" style="width: 40%;float: left;">
											        			<option value="">订单号</option>
											        			<option value="">姓名</option>
											        			<option value="">商户名称</option>
											        		</select>
											        		<input type="" name="" id="" value="" class="form-control" style="width: 60%;float: left;"/>
											        	</div>
											        	<div class="col-xs-2">
											        		<select name="" class="form-control" style="width: 100%;float: left;">
											        			<option value="">地域</option>
											        		</select>
											        	</div>
											        	<div class="col-xs-2">
											        		<select name="" class="form-control" style="width: 100%;float: left;">
											        			<option value="">商户类型</option>
											        			<option value="">眼科</option>
											        			<option value="">口腔</option>
											        			<option value="">生活美容</option>
											        			<option value="">植发</option>
											        			<option value="">类型</option>
											        		</select>
											        	</div>
											        	<div class="col-lg-2">
											        		<select name="" class="form-control" style="width: 100%;float: left;">
											        			<option value="">订单状态sss</option>
											        			<option value="">审核中</option>
											        			<option value="">审核拒绝</option>
											        			<option value="">审核通过</option>
											        			<option value="">测试订单</option>
											        			<option value="">订单关闭</option>
											        			<option value="">用户退款</option>
											        			<option value="">提前还款</option>
											        			<option value="">客户取消</option>
											        			<option value="">替换订单</option>
											        		</select>
											        	</div>
											        	<button type="button" class="btn btn-primary" style="margin-left: 20px;">确定</button>
											        	<br />
											        	<div class="col-xs-3" style="margin-top: 10px;">
											        		<span style="float: left;padding-top: 8px;width: 40%;">下单时间</span>
											        		<div class="col-xs-9" style="width: 60%;padding: 0;">
						                        <form class="form-horizontal">
						                          <fieldset>
						                            <div class="control-group">
						                              <div class="controls">
						                                <div class="input-prepend input-group">
						                                  <span class="add-on input-group-addon" style="border-radius: 0;"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
						                                  <input type="text" name="reservation" id="reservation_table" class="form-control" value="2017/12/11~2017/12/20" />
						                                </div>
						                              </div>
						                            </div>
						                          </fieldset>
						                        </form>
						                      </div>
											        	</div>
											        	<div class="col-lg-2" style="margin-top: 10px;">
											        		<select name="" class="form-control" style="width:100%;float: left;">
											        			<option value="">放款机构</option>
											        			<option value="">闪银</option>
											        			<option value="">手投网</option>
											        			<option value="">乾坤袋</option>
											        			<option value="">青蚨在线</option>
											        			<option value="">青蚨资产</option>
											        		</select>
											        	</div>
											        	<div class="col-lg-2" style="margin-top: 10px;">
											        		<select name="" class="form-control" style="width: 100%;float: left;">
											        			<option value="">合同状态</option>
											        			<option value="">已签署</option>
											        			<option value="">未签署</option>
											        		</select>
											        	</div>
									        </div>
              
              <div class="x_content">
				<!-- 这个table中封装了分页，和页面显示多少那个下拉框 -->
                <table id="datatable_operatorLog" class="table table-striped table-bordered">
                  <thead>
                        <tr>
                          <th>订单号</th>
                          <th>创建时间</th>
                          <th>申请人</th>
                          <th>商户类型</th>
                          <th>商户名称</th>
                          <th>订单金额</th>
                          <th>订单状态</th>
                          <th>合同状态</th>
                          <th>放款机构</th>
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
    <%@ include file="/WEB-INF/common/footer.jsp"%>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath}/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/vendors/datatables.net/js/jquery.dataTables.js"></script> --%>
    
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/moment/locale/zh-cn.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <%-- <script src="${pageContext.request.contextPath}/vendors/datatables.net-bs/js/dataTables.bootstrap-1.0.min.js"></script> --%>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-bs/js/dataTables.bootstrap-1.0.js"></script>
    
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-bs/js/fnReloadAjax.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/jszip/dist/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
    <script type="text/javascript">
    		$(function() {
    			// 初始化时间
    			$('#reservation').val("2011-01-01" + " - " + 2019-01-01);
    			console.log($('#reservation').val());
    			// 初始化DataTables
    			var table = $('#datatable_operatorLog').dataTable({
    				autoWidth: false,  	// 禁用自动调整列宽
    				scrollX: '100%',
    	            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
    	            processing: false,  	// 隐藏加载提示,自行处理
    	            serverSide: true,  	// 启用服务器端分页
    	            searching: false,  	// 禁用原生搜索
    	            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
    	            orderMulti: false,   // 启用多列排序
    	            bPaginate : true,  //是否显示分页器 
    	            bSort : false, //是否启动各个字段的排序功能 
    	            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
    	            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
    	            ajaxSource: '${pageContext.request.contextPath}/mfq/order/listLog.do',
    	            fnServerData: function (sSource, aoData, fnCallback) {
    	            		var selectTime = $('#reservation').val();
    	            		// 往后台封装数据，json格式的字符串
    	            		aoData.push({ "name": "selectTime", "value": selectTime });
    	            		$.ajax( {
    	            			type: 'POST',
    	            			url: sSource,
    	            			data: {"aoData": JSON.stringify(aoData)},
    	            			dataType: 'json',
    	            			success: function(rs) {
    	            				fnCallback(rs);
    	            			}
    	            		});
    	            },
    	            columns: [
    	                { "data": "orderNo" ,"defaultContent": ""},
    	                { "data": "createTime" ,"defaultContent": ""},
    	                { "data": "realName" ,"defaultContent": ""},
    	                { "data": "typeName" ,"defaultContent": ""},
    	                { "data": "storeName" ,"defaultContent": ""}, //function(obj) { return dateFormateStr(obj.createTime);  }},
    	                { "data": "finallySum" ,"defaultContent": ""},
    	                { "data":  
    	                		function(obj) {
    	                	if(obj.status == null ){
    	                		return "waa";
    	                	}else{
    	                		return obj.status;
    	                	}
    	                }
    	                },
    	                { "data": function(obj){
    	                	if(obj.signState == null){
    	                		return "未签署";
    	                	}else{
    	                		return obj.signState;
    	                	}
    	                } },
    	                { "data": "lenderName" ,"defaultContent": ""}
    	            ]
    	            
    			});
    			
    			$('#reservation').daterangepicker({
    				  timePicker: true,
    				  timePicker24Hour: true,					// 	是否使用24小时制来显示时间;   timePicker12Hour: true, 是否使用124小时制来显示时间
    				  //timePickerIncrement: 30,					//  时间间隔为 num 作为间隔显示【把它去掉就会正常显示当前的时间了，按照每分钟选择】
    				  opens: 'right',
    				  locale: {
    					applyLabel: '确认',
    			        cancelLabel: '取消',
    			       	/*  format: 'MM/DD/YYYY hh:mm A' */				//  01/01/2016 12:00 凌晨 - 01/25/2016 12:00 凌晨    
    			        	/* format: 'YYYY-MM-DD HH:mm'    */ 
    			        	format: 'YYYY-MM-DD HH:mm:ss'
    				  }
    			});
    			// 选择时间后触发重新加载的方法
    			$('#reservation').on('apply.daterangepicker', function(ev, picker) {
    				table.fnReloadAjax();
    			})
    		});
    		
    		Date.prototype.format = function(format) {
			var date = {
			       "M+": this.getMonth() + 1,
			       "d+": this.getDate(),
			       "h+": this.getHours(),
			       "m+": this.getMinutes(),
			       "s+": this.getSeconds(),
			       "q+": Math.floor((this.getMonth() + 3) / 3),
			       "S+": this.getMilliseconds()
			};
			if (/(y+)/i.test(format)) {
				format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
			}
			for (var k in date) {
			       if (new RegExp("(" + k + ")").test(format)) {
			    	   format = format.replace(RegExp.$1, RegExp.$1.length == 1
			                     ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
			       }
			}
			return format;
		}
   		
   		function dateFormateStr (time) {
   			return new Date(parseInt(time)).format('yyyy-MM-dd hh:mm:ss');
   		}
   		// 获取前一小时
   		function getBeforeHours(){
   			var day = new Date().format('yyyy-MM-dd hh:mm:ss');
   			var beforeDay = new Date(new Date().getTime() - (1*60*60*1000)).format('yyyy-MM-dd hh:mm:ss');  //前一小时
   			return beforeDay;
   		}
   		// 获取当天时间
   		function getDay(){
   			var day = new Date().format('yyyy-MM-dd hh:mm:ss');							// yyyy-MM-dd hh:mm:ss【2017-08-17 12:27:30】
   			var curDay = new Date(new Date().getTime()).format('yyyy-MM-dd hh:mm:ss');   // 当天
   			return curDay;
   		}
    		
    </script>

	<!-- 各个表的初始化-->
    <script src="${pageContext.request.contextPath}/build/js/chushi.js"></script>
		<script type="text/javascript">
			$('#reservation').daterangepicker({
				locale:{
					format:'YYYY-MM-DD'
				}
			})
		</script>
  </body>
</html>