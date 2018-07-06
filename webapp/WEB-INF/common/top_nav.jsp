<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- top navigation -->
<div class="top_nav">
  <div class="nav_menu">
    <nav>
      <div class="nav toggle">
        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
      </div>

      <ul class="nav navbar-nav navbar-right">
        <li class="">
          <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
          	<c:if test="${user.user.sex == '0'}">
    				<img src="${pageContext.request.contextPath}/build/images/default-head-girl.png" alt="Profile Image">
    			</c:if>
    			<c:if test="${user.user.sex == '1'}">
    				<img src="${pageContext.request.contextPath}/build/images/default-head-boy.png" alt="Profile Image">
    			</c:if>
            ${user.userAccount.realName }
            <span class=" fa fa-angle-down"></span>
          </a>
          <ul class="dropdown-menu dropdown-usermenu pull-right">
            <li><a href="javascript:void(0);" onclick="$('#fc_simple_introduction').click();">简介</a></li>
            <li>
              <a href="javascript:void(0);">
                <span class="badge bg-red pull-right">50%</span>
                <span>设置</span>
              </a>
            </li>
            <li><a href="javascript:void(0);" onclick="$('#fc_simple_introduction').click();">帮助</a></li>
            <li><a href="${pageContext.request.contextPath}/logout.do"><i class="fa fa-sign-out pull-right"></i>注销</a></li>
          </ul>
        </li>
        <li role="presentation" class="dropdown">
        	  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
            <i class="fa fa-envelope-o"></i>
            <span class="badge bg-green">6</span>
          </a>
          <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
            <li>
              <a>
                <span class="image">
		    			<img src="${pageContext.request.contextPath}/build/images/default-head-girl.png" alt="Profile Image">
                </span>
                <span>
                  <span>美美</span>
                  <span class="time">3分钟前</span>
                </span>
                <span class="message">
                  您有新的来单提醒，前往点击查看${pageContext.request.contextPath}.
                </span>
              </a>
            </li>
            <li>
              <a>
                <span class="image">
		    			<img src="${pageContext.request.contextPath}/build/images/default-head-girl.png" alt="Profile Image">
                </span>
                <span>
                  <span>美美</span>
                  <span class="time">3分钟前</span>
                </span>
                <span class="message">
                  您有新的来单提醒，前往点击查看${pageContext.request.contextPath}.
                </span>
              </a>
            </li>
            <li>
              <a>
                <span class="image">
		    			<img src="${pageContext.request.contextPath}/build/images/default-head-girl.png" alt="Profile Image">
                </span>
                <span>
                  <span>美美</span>
                  <span class="time">3分钟前</span>
                </span>
                <span class="message">
                  您有新的来单提醒，前往点击查看${pageContext.request.contextPath}.
                </span>
              </a>
            </li>
            <li>
              <a>
                <span class="image">
		    			<img src="${pageContext.request.contextPath}/build/images/default-head-girl.png" alt="Profile Image">
                	</span>
                <span>
                  <span>美美</span>
                  <span class="time">3分钟前</span>
                </span>
                <span class="message">
                  您有新的来单提醒，前往点击查看${pageContext.request.contextPath}.
                </span>
              </a>
            </li>
            <li>
              <div class="text-center">
                <a>
                  <strong>查看全部提醒</strong>
                  <i class="fa fa-angle-right"></i>
                </a>
              </div>
            </li>
          </ul>
        </li>
        <li role="presentation" class="dropdown">
        	  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
            <i class="fa fa fa-bell-o"></i> <!-- <i class="fa fa fa-bell-slash-o"></i> -->
            <span class="badge bg-red">2</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div>
<!-- /top navigation -->

<!-- top navigation 简介 -->
<div id="introduction_modal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="topModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="topModalLabel">系统概要</h4>
			</div>
			<div class="modal-body">
				<div id="testmodal" style="padding: 5px 20px;">
					<div class="" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
							<li role="presentation" class="active"><a
								href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
								aria-expanded="true">简介</a></li>
							<li role="presentation" class=""><a href="#tab_content2"
								role="tab" id="profile-tab" data-toggle="tab"
								aria-expanded="false">文化</a></li>
							<li role="presentation" class=""><a href="#tab_content3"
								role="tab" id="profile-tab2" data-toggle="tab"
								aria-expanded="false">帮助</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in"
								id="tab_content1" aria-labelledby="home-tab">
								<p>美分期科技有限公司是中国知名的互联网医疗健康消费分期服务平台，
								   通过互联网、移动互联网和大数据技术创新为都市白领人群提供快速、便捷、安全的个人消费分期服务。
								   美分期创建于2015年，注册资本1亿元人民币，总部位于北京，上海、广州成立了分公司。
								   公司自成立以来坚持模式创新、技术创新和理念创新，积极布局消费金融，
								   创造性的构建了消费金融与医疗健康相融合的医疗健康消费分期服务平台，
								   以"0首付、0费用、0利息"的理念服务于社会大众。</p>
								<p>网站口号：美丽人生，从美分期开始！</p>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab_content2"
								aria-labelledby="profile-tab">
								<p>美分期核心团队主要来自金融行业，互联网行业，医疗健康行业，即具备互联网思维，
								   又拥有足够的金融行业及医疗健康行业的从业经验。美分期团队响应时代要求，顺应大众消费信贷趋势，
								   服务于有消费信贷理念的人群，服务于医疗机构，助力于金融机构，致力于成为互联网消费金融的领军公司。
								   美分期团队积极响应国家消费金融政策，秉承社会责任，针对于有医疗健康需求的人群，
								   创新性提出了应用于医疗健康行业的消费分期服务解决方案。志在助力社会保障体系，
								   扩大医疗内需，促进行业健康、和谐发展。</p>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab_content3"
								aria-labelledby="profile-tab">
								<h5>美分期后台管理系统</h5>
								<p>版本：1.0</p>
								<p>客服电话：010-86488983</p>
								<p>技术支持：010-86488983</p>
								<p><i class="fa fa-copyright"></i>2018 MFQ Inc.保留一切权利。</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default antoclose"
					data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<div id="fc_simple_introduction" data-toggle="modal" data-target="#introduction_modal"></div>
