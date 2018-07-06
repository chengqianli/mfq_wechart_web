<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/resource_jstl.jsp"%>

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
<%@ include file="/WEB-INF/common/resource_css.jsp"%>
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
</style>
</head>
<body class="nav-md">
	<%-- menu profile --%>
	<%@ include file="/WEB-INF/common/menu_profile.jsp"%>
	<%-- sidebar menu --%>
	<%@ include file="/WEB-INF/common/sidebar_menu.jsp"%>
	<%-- sidebar footer --%>
	<%@ include file="/WEB-INF/common/sidebar_footer.jsp"%>
	<%-- top navigation --%>
	<%@ include file="/WEB-INF/common/top_nav.jsp"%>

	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="row title_left" style="width: 100%;">
					<div class="span6">
						<ul class="breadcrumb">
							<li>风控管理</li>
							<li>汇总统计</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_content">

							<!--风控成员通过率-->

							<div class="col-md-12 col-xs-12" style="margin-top: 10px;">
								<div class="x_panel">
									<div class="x_title">
										<h2 style="line-height: 1; font-size: 18px;">风控成员通过率</h2>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<form class="form-horizontal form-label-left">
											<div class="form-group">
												<div class="col-md-4 col-sm-4 col-xs-12"
													style="padding-left: 0px;">
													<fieldset>
														<div class="control-group">
															<div class="controls">
																<div class="input-prepend input-group">
																	<span class="add-on input-group-addon"
																		style="border-radius: 0;"><i
																		class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
																	<input type="text" name="reservation"
																		id="reservation_table" class="form-control"
																		value="${startTime} ~ ${startTime}" />
																</div>
															</div>
														</div>
													</fieldset>
												</div>
											</div>
											<div class="form-group">
												<table id="datatable_List"
													class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>姓名</th>
															<th>审核总数</th>
															<th>审核通过</th>
															<th>审核失败</th>
															<th>审核通过率</th>
															<th>平均审核时长</th>
															<th>通过总金额</th>
														</tr>
													</thead>
												</table>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!--通过金额&审核通过率-->

							<div class="col-md-12 col-xs-12" style="margin-top: 10px;">
								<div class="x_panel">
									<div class="x_title">
										<h2 style="line-height: 1; font-size: 18px;">通过金额&审核通过率</h2>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<form class="form-horizontal form-label-left"
											style="height: 254px;">
											<div class="form-group" style="height:254px" id="pillarId"></div>
										</form>
									</div>
								</div>
							</div>

							<!--进件总量&通过总量-->

							<div class="col-md-12 col-xs-12" style="margin-top: 10px;">
								<div class="x_panel">
									<div class="x_title">
										<h2 style="line-height: 1; font-size: 18px;">进件总量&通过总量</h2>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<form class="form-horizontal form-label-left"
											style="height: 254px;">
											<div class="form-group" style="height:254px" id="lineId"></div>
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

	<!-- /page content -->

	<%-- footer --%>
	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<%-- resource js --%>
	<%@ include file="/WEB-INF/common/resource_js.jsp"%>
	<script src="${pageContext.request.contextPath}/build/js/echarts.min.js"></script>

	<script type="text/javascript"> 
    		$(function() {
    			//initDate();
    			initTable();
    			initChart();
    		});

    		// 初始化DataTables
    		function initTable(){
    			var table = $('#datatable_List').dataTable({
    				autoWidth: false,  	// 禁用自动调整列宽
    				/* scrollX: '100%', */
    	            stripeClasses: ['odd', 'even'],  // 为奇偶行加上样式，兼容不支持CSS伪类的场合
    	            processing: false,  	// 隐藏加载提示,自行处理
    	            serverSide: true,  	// 启用服务器端分页
    	            searching: false,  	// 禁用原生搜索
    	            deferRender: true,	// 当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
    	            orderMulti: false,   // 启用多列排序
    	            bPaginate : true,  //是否显示分页器 
    	            aLengthMenu: [25, 50, 100],
    	            bSort : true, //是否启动各个字段的排序功能 
    	            order: [],  			// 取消默认排序查询,否则复选框一列会出现小箭头
    	            renderer: 'bootstrap',		// 渲染样式：Bootstrap和jquery-ui
    	            ajaxSource: '${pageContext.request.contextPath}/mfq/statistics/selectUserCheck.do',
    	            fnServerData: function (sSource, aoData, fnCallback) {
    	            		var reservation_table = $('#reservation_table').val();
    	            		// 往后台封装数据，json格式的字符串
    	            		aoData.push({ "name": "reservation_table", "value": reservation_table });
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
    	                { "data": "name","defaultContent": ""},
    	                { "data": "checkCount" ,"defaultContent": ""},
    	                { "data": "successCount" ,"defaultContent": ""},
    	                { "data": "defeatedCount" ,"defaultContent": ""},
    	                { "data": "probability" ,"defaultContent": ""},
    	                { "data": "avgTime" ,"defaultContent": ""},
    	                { "data": "sum" ,"defaultContent": ""},
    	            ]
    			});
    			var beginTimeStore = '';
    	        var endTimeStore = '';
    	        $('#reservation_table').daterangepicker(
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
    	                if (!this.startDate) {
    	                    this.element.val('');
    	                } else {
    	                    this.element.val(this.startDate
    	                            .format(this.locale.format)
    	                        + this.locale.separator
    	                        + this.endDate.format(this.locale.format));
    	                }
    	                table.fnReloadAjax();
    	    			initChart();
    	            });
    			
    		};
    		
    		function initChart(){
    			var url="${pageContext.request.contextPath}/mfq/statistics/getOrderCheck.do";
    			var reservation_table = $('#reservation_table').val();
    			$.ajax({
    				type: "POST",
    				url:url,
    		        data:{
						"date" : reservation_table
					},
    				dataType:"json",
    				// 请求成功
    				success:function(data){
    					loadpillarOption(data);
    					loadlineOption(data);
    				}
    			});
    		};
    		
    		var pillar = echarts.init(document.getElementById('pillarId'));
    		var line = echarts.init(document.getElementById('lineId'));
    		// 通过金额&审核通过率 图表参数
    		var pillarOption = {
    		    /* tooltip : {
    		        trigger : 'axis',
    		        axisPointer : {
    		            type : 'cross',
    		            crossStyle : {
    		                color : '#999'
    		            }
    		        }
    		    }, */
    		    tooltip: {
    		        trigger: 'axis',
    		        
    		        formatter: function (params) {

    		        	var res='<p>'+params[0].name+'</p>'
    		        	res+='<p>'+params[0].seriesName+':'+params[0].data+'W</p>'
    		        	res+='<p>'+params[1].seriesName+':'+params[1].data+'%</p>'
    		        	
    		        	return res;
    		        	} 
    		    },
    		    toolbox : {
    		        feature : {
    		            dataView : {
    		                show : true,
    		                readOnly : false
    		            },
    		            magicType : {
    		                show : true,
    		                type : [ 'line', 'bar' ]
    		            },
    		            restore : {
    		                show : true
    		            },
    		            saveAsImage : {
    		                show : true
    		            }
    		        }
    		    },
    		    legend : {
    		        data : [ '通过金额(W)', '审核通过率(%)' ]
    		    },
    		    xAxis : [ {
    		        type : 'category',
    		        data : [ '16日', '17日', '18日', '19日', '20日', '21日', '22日', '23日', '24日',
    		            '25日', '26日', '27日', '28日', '29日', '30日' ],
    		        axisPointer : {
    		            type : 'shadow'
    		        }
    		    } ],
    		    yAxis : [ {
    		        type : 'value',
    		        name : '通过金额',
    		        min : 0,
    		        max : 200,
    		        interval : 70,
    		        axisLabel : {
    		            formatter : '{value}w'
    		        }
    		    }, {
    		        type : 'value',
    		        name : '审核通过率',
    		        min : 0,
    		        max : 120,
    		        interval : 30,
    		        axisLabel : {
    		            formatter : '{value}%'
    		        }
    		    } ],
    		    series : [{
    		        name : '通过金额',
    		        type : 'bar',
    		        data : [ 12,56,65,21,58,32,52,45,36,85,1,4,85,6,12]
					}, {
						name : '审核通过率',
						type : 'line',
						yAxisIndex : 1,
						data : []
					}

			]
		};

		// 进件总量和通过总量 图表参数
		var lineOption = {
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '进件总量', '通过总量' ]
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				}
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [

			{
				name : '进件总量',
				type : 'line',
				data : [ 320, 332, 301, 334, 390, 330, 320 ]
			}, {
				name : '通过总量',
				type : 'line',
				data : [ 820, 932, 901, 934, 1290, 1330, 1320 ]
			} ]
		};

		function loadpillarOption(data) {
			pillarOption.xAxis[0].data = data.dayList;

			var array = new Array();
			for (var i = 0; i < data.probabilityList.length; i++) {
				array.push(data.probabilityList[i]);
			}
			
			pillarOption.series[0].data = data.succeedSumList;
			pillarOption.series[1].data = array;

			// 计算最大值
			var sumMax = data.succeedSumList.max();
			pillarOption.yAxis[0].max = 200;
			pillarOption.yAxis[0].interval = 200 / 4;

			pillar.setOption(pillarOption);

		};
		function loadlineOption(data) {
			lineOption.xAxis.data = data.dayList;
			lineOption.series[0].data = data.totalCountList;
			lineOption.series[1].data = data.succeedCountList;
			line.setOption(lineOption);
		};

		// 计算数组最大值
		Array.prototype.max = function() {
			// 将数组第一个元素的值赋给max
			var max = this[0];
			// 使用for 循环从数组第一个值开始做遍历
			for (var i = 1; i < this.length; i++) {
				// 如果元素当前值大于max,就把这个当前值赋值给max
				if (parseFloat(this[i]) > parseFloat(max)) {
					max = this[i];
				}
			}
			// 返回最大的值
			return max * 1.25;
		};
	</script>

</body>
</html>