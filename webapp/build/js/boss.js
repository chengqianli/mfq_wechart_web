
// 正整数、2位小数的正浮点数 (不包括0 、0.0、 0.00)
var reg1 = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^[0-9]\.[0-9]([1-9])?$)/;
// 正整数、2位小数的正浮点数 (包括 0 、 0.0、0.00)
var reg2 = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;

/**
 * 校验字符串非空和特殊字符
 * @param str
 * @returns
 */
function strCheck(str) {
    if (str == null || str == ''){
        return false
    }
    var pattern = /^[\w\u4e00-\u9fa5\a-zA-Z\d,\.\，\。\、\-\-\（\）\-\(\)\,\.]+$/gi;
    if (!pattern.test(str)){
        return false;
    }
    return true;
}

/**
 * 日期格式化成字符串
 * 例：
 * 1、new Date().format('yyyy-MM-dd')
 * 2、new Date(parseInt(obj)).format('yyyy-MM-dd hh:mm:ss')
 */
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

/**
 * 全屏显示
 * element = document.documentElement 网页全屏
 * element = document.getElementById('id') 部分全屏
 */
function launchFullscreen(element) {
	if (element.requestFullscreen) {
		element.requestFullscreen();
	} else if (element.mozRequestFullScreen) {
		element.mozRequestFullScreen();
	} else if (element.webkitRequestFullscreen) {
		element.webkitRequestFullscreen();
	} else if (element.msRequestFullscreen) {
		element.msRequestFullscreen();
	}
}

/**
 * 退出全屏
 * @returns
 */
function exitFullscreen() {
	if (document.exitFullscreen) {
		document.exitFullscreen();
	} else if (document.mozCancelFullScreen) {
		document.mozCancelFullScreen();
	} else if (document.webkitExitFullscreen) {
		document.webkitExitFullscreen();
	}
}

/**
 * sidebar_menu 「风控订单」角标数量刷新
 * @param content
 * @returns
 */
function fnFlushOrderNum(content) {
	var jsonObj = JSON.parse(content);
		var count1 = jsonObj.count1;
		var count2 = jsonObj.count2;
		var news = jsonObj.news;
		if(count1 != "0"){
			if(count1 > 99){
				$('#num1').html("99");
				$('#num').html("99");
			}else{
				$('#num1').html(count1);
				$('#num').html(count1);
			};
		}else{
			$('#num1').hide();
			$('#num').hide();
		};
		if(count2 != "0"){
			if(count2 > 99){
				$('#num2').html("99");
				$('#count').html("99");
			}else{
				$('#num2').html(count2);
				$('#count').html(count2);
			};
		}else{
			$('#num2').hide();
			$('#count').hide();
		};
		if(news == 'TRUE'){
			$('#news').show();
		}
}

/**
 * 
 * @returns
 */
function fnGetStatus(url) {
		$.ajax({
    			type: "POST",
    			url:url,
    			data:null,
    			dataType:"text",
    			success:function(data){
    				var jsonObj = JSON.parse(data);
    				if(jsonObj.code == '0'){
    					var count1 = jsonObj.count1;
    					var count2 = jsonObj.count2;
    					if(count1 != "0"){
    						if(count1 > 99){
    							$('#num1').html("99");
    							$('#num').html("99");
    						}else{
    							$('#num1').html(count1);
    							$('#num').html(count1);
    						};
    					}else{
    						$('#num1').hide();
    						$('#num').hide();
    					};
    					if(count2 != "0"){
    						if(count2 > 99){
    							$('#num2').html("99");
    							$('#count').html("99");
    						}else{
    							$('#num2').html(count2);
    							$('#count').html(count2);
    						};
    					}else{
    						$('#num2').hide();
    						$('#count').hide();
    					};
    				}
    			}
    		});
}

/**
 * 封装消息提醒Pnotify插件，以便全局调用
 * @param title
 * @param type
 * @param text
 * @param time
 * @param color
 * @returns
 */ 
function fnPNotify(title, type, text, time, color) {
	new PNotify({
        title: title,
        type: type,
        text: text,
        delay: time,
        nonblock: {
            nonblock: false
        },
        addclass: color,
        styling: 'bootstrap3',
        hide: true,
        buttons: {
            closer: true,
            closer_hover: false,
            sticker: false,
            sticker_hover: false,
        },
    });
}

$(function(){
	
	// sidebar-footer 超链接 点击事件
	$('.sidebar-footer > a:nth-child(1)').click(function() {
		$.confirm({
   			title: '系统提示',
	        text: '暂不支持该功能，敬请期待！',
	        confirmButton:'确认',
	        cancelButton: false,
   		}); 
	})
	
	// 全屏显示
	$('.sidebar-footer > a:nth-child(2)').click(function() {
		$FULL_SCREEN_A = $(this);
		$FULL_SCREEN_SPAN = $(this).find('span');
		if ($FULL_SCREEN_SPAN.is('.glyphicon-gift')) {
			$FULL_SCREEN_SPAN.removeClass('glyphicon-gift').addClass('glyphicon-fullscreen');
			$FULL_SCREEN_A.attr('data-original-title', '全屏')
			exitFullscreen();
		} else {
			$FULL_SCREEN_SPAN.removeClass('glyphicon-fullscreen').addClass('glyphicon-gift');
			$FULL_SCREEN_A.attr('data-original-title', '退出全屏')
			launchFullscreen(document.documentElement);
		}
	})
	
	// 锁屏
	$('.sidebar-footer > a:nth-child(3)').click(function() {
		$('.sidebar-footer > a:nth-child(3)').find('span').removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
		$('.lock-overlay').show();
	})
	
	// 取消锁屏
	$(document).keydown(function(event){
		// ESC 对应的 ascII码
		if (event.keyCode === 27) {
			var $LOCK_SCREEN_SPAN = $('.sidebar-footer > a:nth-child(3)').find('span');
			if ($LOCK_SCREEN_SPAN.is('.glyphicon-eye-open')) {
				$LOCK_SCREEN_SPAN.removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
				$('.lock-overlay').hide();
			}
		}

	});
	
})


