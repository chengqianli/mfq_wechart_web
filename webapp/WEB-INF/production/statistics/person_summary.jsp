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
							<li>个人统计</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_content">

							<!--审核通过率圆饼图-->

							<div class="col-md-12 col-xs-12" style="margin-top: 10px;">
								<div class="x_panel">
									<div class="x_title">
										<h2 style="line-height: 1; font-size: 18px;">审核通过率圆饼图</h2>
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
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<div class="form-group" style="height: 254px;" id="pieId">
													</div>
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid"
															style="border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;"></div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">审核总数</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid" id="count" 
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;"></div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">审核通过
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid" id="success"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;">
															</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">审核失败
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid" id="defeated" 
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;"></div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">审核通过率
													</label>
													<div class="col-md-9 col-sm-9 col-xs-12">
														<div class="ln_solid" id="probability"
															style="border-bottom: 1px solid #e5e5e5; border-top: 0; width: 80%; height: 30px; line-height: 30px; margin-top: 0; color: inherit; font-size: 14px; margin-bottom: 10px;"></div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!--每日审核统计折线图-->
							<div class="col-md-12 col-xs-12" style="margin-top: 10px;">
								<div class="x_panel">
									<div class="x_title">
										<h2 style="line-height: 1; font-size: 18px;">每日审核统计折线图</h2>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<form class="form-horizontal form-label-left"
											style="height: 254px;">
											<div class="form-group" style="height: 254px;" id="lineId" ></div>
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
	<script
		src="${pageContext.request.contextPath}/build/js/echarts.min.js"></script>

	<script type="text/javascript">
		$(function() {
			initDate();
			initPie();
			loadLine();
		});

		// 初始化时间控件
		function initDate() {
			var beginTimeStore = '';
			var endTimeStore = '';
			$('#reservation_table').daterangepicker(
					{
						"linkedCalendars" : false,
						"autoUpdateInput" : false,
						"locale" : {
							format : 'YYYY-MM-DD',
							separator : ' ~ ',
							applyLabel : "应用",
							cancelLabel : "清除",
						},
					},
					function(start, end, label) {
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
						initPie();
						loadLine();
					});

		};

		//饼图
		var pie = echarts.init(document.getElementById('pieId'));
		var pieOption = {
		    title : {
		        text: '每日审核圆饼图',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    color:['#1abb9c','#2a3f54'],
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['审核通过','审核失败']
		    },
		    series : [
		        {
		            name: '每日审核',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:0, name:'审核通过'},
		                {value:0, name:'审核失败'}
		               
		            ]
		        }
		    ]
		};



		//折线图
		var line = echarts.init(document.getElementById('lineId'));
		var lineOption = {
			tooltip : {
				trigger : 'axis',
				axisPointer : {
					type : 'cross',
					crossStyle : {
						color : '#1abb9c'
					}
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
				data : [ '通过金额', '审核总量', '审核通过', '审核失败' ]
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
				max : 1000000,
				interval : 50000,
				axisLabel : {
					formatter : '{value}'
				}
			}, {
				type : 'value',
				name : '审核数量',
				min : 0,
				max : 40,
				interval : 10,
				axisLabel : {
					formatter : '{value}'
				}
			} ],
			series : [{
				name : '通过金额',
				type : 'bar',
				data : [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,]
			},
					 {
						name : '审核总量',
						type : 'line',
						yAxisIndex : 1,
						data : [ 6, 21, 15, 1, 32, 11, 9, 20, 13, 0, 0, 0, 0, 0, 0 ]
					}, {
						name : '审核通过',
						type : 'line',
						yAxisIndex : 1,
						data : [ 4, 1, 2, 1, 32, 11, 9, 20, 13, 0, 0, 0, 0, 0, 0 ]
					}, {
						name : '审核失败',
						type : 'line',
						yAxisIndex : 1,
						data : [ 2, 20, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
					}

			]
		};

		// 获取饼图数据
		function initPie(){
			var params = {
					date:$('#reservation_table').val()
			}
			var url="${pageContext.request.contextPath}/mfq/statistics/selectUserCheckCount.do";
		    $.ajax({
				type: "POST",
				url:url,
				data:params,
				dataType:"json",
				// 请求成功
				success:function(data){
					initPieParams(data);
				}
			});
		};
		// 初始化饼图
		function initPieParams(data) {
			var defeated = parseInt(data.defeated) - parseInt(data.pass);
			pieOption.series[0].data[0].value =data.pass;
			pieOption.series[0].data[1].value =defeated;
			var count =data.defeated
			$("#count").html(count);
			$("#success").html(data.pass);
			$("#defeated").html(defeated);
			var probability;
			if(data.pass + data.defeated != 0){
				probability =data.pass/data.defeated *100;
			}else{
				probability=0
			}
			$("#probability").html(doubleToFixed(probability)+"%");
			pie.setOption(pieOption);
		};
		// 加载折现图数据
		function loadLine(){
			var url="${pageContext.request.contextPath}/mfq/statistics/userCheckByDay.do";
		    $.ajax({
				type: "POST",
				url:url,
				dataType:"json",
				// 请求成功
				success:function(data){
					initLine(data);
				}
			});
		};


		//折现图
		function initLine(data) {
			lineOption.xAxis[0].data=data.dayList;
			if(data.timeType ==1){
				lineOption.series[0].data=data.successSumList;
			}
			lineOption.series[1].data=data.defeatedList;
			lineOption.series[2].data=data.successCountList;
			lineOption.series[3].data=data.totalChecklList;
			
			var maxNum = data.defeatedList.max()
			lineOption.yAxis[1].max = maxNum ;
			lineOption.yAxis[1].interval = maxNum / 4;
			
			var maxSum = data.successSumList.max()
			lineOption.yAxis[0].max = maxSum;
			lineOption.yAxis[0].interval = maxSum / 4;
			
			
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
		function doubleToFixed(a){
			var b = parseFloat(a).toFixed(3);
			var result = b.substring(0,b.toString().length - 1);  //这里先将a转换为float类型再保留三位小数，最后截取字符串前b.length - 1位
			return result;
		}
	</script>

</body>
</html>