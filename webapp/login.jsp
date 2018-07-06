<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>美分期后台管理系统</title>
    
    <!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- NProgress -->
	<link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
	
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
    <!-- Boss Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/boss.css" rel="stylesheet">
    <style type="text/css">
		#parsley-id-5 > li { position: relative; left: -58px;}
    </style>
</head>
<body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
      	<!-- 登录 -->
        <div class="animate form login_form" style="text-align:center;">
          <!-- logo -->
        	  <div class="logo logo-login"></div>
          <section class="login_content">
            <form method="post" action="login.do" id="login-form" data-parsley-validate>
              <h1>美分期管理系统</h1>
              <div>
                <input type="text" class="form-control" id="mobileNo" name="mobileNo" placeholder="手机号" required="required" maxlength="11"
                			data-parsley-trigger="change" data-parsley-length="[11, 11]"/>
              </div>
              <div>
	              <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0; padding-right: 0; margin-bottom=-1px;">
	                <input type="text" class="form-control" name="verifyCode" placeholder="图片验证码" required="required" maxlength="4"
	                			data-parsley-trigger="change" data-parsley-length="[4, 6]"/>
	              </div>
	              <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left:0; padding-right: 0; margin-bottom=-1px;">
	              	<img type="image" src="getAuthCode.do" id="authCode" onclick="changeCode();" title="图片看不清？点击重新得到验证码"
	              				style="height: 34px; width: 96px; float:right; cursor: pointer;" >
	              </div>
              </div>
              <div style="display: none;">
	              <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left:0; padding-right: 0; margin-bottom=-1px;">
	                <input type="text" class="form-control" id="smsCode" name="smsCode" placeholder="短信验证码" maxlength="6" />
	              </div>
	              <div class="col-md-4 col-sm-4 col-xs-4" style="padding-left:0; padding-right: 0; margin-bottom=-1px;">
	                <button type="button" class="btn btn-success" id="sendSmsCode" style="float:right; margin:0; width: 96px">发送验证码</button>
	              </div>
              </div>
              <div>
	              <div class="col-md-12 col-sm-12 col-xs-12">
	              	 <div class="invalid-form-error-message" style="height: 34px; position: relative; left: -15px;"></div>
	              </div>
	          </div>
	          <div>
	              <div class="col-md-12 col-sm-12 col-xs-12">
	                <button type="submit" class="btn btn-default" href="javascript:void(0);">登 录</button>
	                <a class="reset_pass" href="javascript:void(0);">忘记密码？</a>
	              </div>
	          </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">是否需要一个新的账号？
                  <a href="javascript:void(0);" class="to_register"> 联系管理员 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                    <!-- <h1><i class="fa fa-paw"></i> 美分期</h1> -->
					<!-- <div class="logo logo-login"></div> -->
					<p>Copyright © MFQ All Rights Reserved. 美分期科技 版权所有</p>
                </div>
              </div>
            </form>
          </section>
        </div>
		<!-- /登录 -->
		<!-- 注册 -->
        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form>
              <h1>注册账号</h1>
              <div>
                <input type="text" class="form-control" placeholder="用户名" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="邮箱" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="密码" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="javascript(0);"> 注 册 </a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">已经有一个账号？
                  <a href="javascript:void(0);" class="to_register"> 登 录 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> 美分期</h1>
                  <p>Copyright © MFQ All Rights Reserved. 美分期科技 版权所有</p>
                </div>
              </div>
            </form>
          </section>
        </div>
        <!-- /注册 -->
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath}/vendors/parsleyjs/dist/parsley.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/parsleyjs/dist/i18n/zh_cn.js"></script>
    <script type="text/javascript">
    
	   	$(function (){
	   		
	   		// 登录验证提示
	   		$('.invalid-form-error-message').html('${ empty loginError ? "" : loginError }').css('color', '#E74C3C');
	   		
	   		// 登录表单提交
	   		$('.submit').bind('click', function() {
	   			$(this).parents('form').submit();
	   		});
	   		
	   		// 用户名或密码change事件
	   		$('input').change(function () {
	   			$('.invalid-form-error-message').html('').css('color', '#E74C3C');
	   		})
	   		
	   		// 手机号
	   		$('#mobileNo').blur(function() {
	   			verifyCodeCheck();
	   		})
	   		
	   		// 验证码输入框 change事件
	   		$('input[name="verifyCode"]').keyup(function() {
	   			verifyCodeCheck();
	   		});
	   		
	   		// 发送短信 btn
	   		$('#sendSmsCode').click(function() {
	   			var mobileNo = $("#mobileNo").val();
	   			var $SEND_SMS_BTN = $(this);
	   			$.ajax({
	   			 	 type: 'post',
					 url: 'sendSms.do',
					 data: { mobileNo : mobileNo, codeType : '07' },
					 success: function(rs) {
						var result = eval('(' + rs + ')');
 						if (result.errorMsg) {
 							$('.invalid-form-error-message').html(result.errorMsg).css('color', '#E74C3C');
 						} else {
 							$SEND_SMS_BTN.addClass('disabled').prop('disabled', true);
 							$('#smsCode').attr('required', 'required');
 							$('#smsCode').attr('data-parsley-trigger', 'change');
 							$('#smsCode').attr('data-parsley-length', '[4, 6]');
 							load($SEND_SMS_BTN);
 						} 
					}
	   			})
	   		})
	   	});
	   	
	   	// 校验手机号和图片验证码
	   	function verifyCodeCheck() {
	   		var mobileNo = $("#mobileNo").val();
   			var verifyCode = $('input[name="verifyCode"]').val();
   			if (mobileNo.length >= 11 && verifyCode.length >= 4 ) {
   				$('.invalid-form-error-message').html('');
   				$.ajax({
   					 type: 'POST',
   					 url: '${pageContext.request.contextPath}/verifyCodeCheck.do',
   					 data: { mobileNo : mobileNo, verifyCode : verifyCode },
   					 success: function(rs) {
   						var result = eval('(' + rs + ')');
	    					if (result.errorMsg) {
	    						$('.invalid-form-error-message').html(result.errorMsg).css('color', '#E74C3C');
	    					} else {
	    						$('#login-form > div:nth-child(3)').hide();
	    						$('#login-form > div:nth-child(4)').show();
	    						$('#smsCode').focus();
	    					}	
   					 }
   				});
   			}
	   	}
	   	
	   	// 更换验证码
	   	function changeCode() {
	   		$('#authCode').attr('src', 'getAuthCode.do?time='+new Date().getTime());
	   	}
    		
	   	// btn 加载秒数
		function load(obj) {
			var obj = $(obj);
			var time = 120;
			var set = setInterval(function() {
				obj.html(--time + '秒');
			}, 1000);
			setTimeout(function() {
				obj.removeClass('disabled').prop('disabled', false).html('发送验证码');
				clearInterval(set);
			}, 120000);
		}
	                			
    </script>
  </body>
</html>