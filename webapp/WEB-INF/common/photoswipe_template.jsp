<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Root element of PhotoSwipe. Must have class pswp. -->
<!-- <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

    Background of PhotoSwipe. 
         It's a separate element as animating opacity is faster than rgba().
    <div class="pswp__bg"></div>

    Slides wrapper with overflow:hidden.
    <div class="pswp__scroll-wrap">

        Container that holds slides. 
            PhotoSwipe keeps only 3 of them in the DOM to save memory.
            Don't modify these 3 pswp__item elements, data is added later on.
        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed.
        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                 Controls are self-explanatory. Order can be changed.

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="关闭"></button>

                <button class="pswp__button pswp__button--share" title="分享"></button>

                <button class="pswp__button pswp__button--fs" title="全屏"></button>

                <button class="pswp__button pswp__button--zoom" title="放大缩小"></button>
                
                <button class="pswp__button " id="pswp_button--btn" title="旋转" style="background:none;font-size:20px;color:#fff;"><span class="fa fa-rotate-right"></span></button>

                Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR
                element will get class pswp__preloader--active when preloader is running
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                      <div class="pswp__preloader__cut">
                        <div class="pswp__preloader__donut"></div>
                      </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div> 
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
            </button>

            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
            </button>

            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>

        </div>

    </div>

</div> -->

<!-- 点击图片全屏显示 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendors/jQueryViewer/css/viewer.min.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendors/photoswipe/dist/default-skin/default-skin.css"> --%>
<script src="${pageContext.request.contextPath}/vendors/jQueryViewer/js/viewer.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/vendors/photoswipe/dist/photoswipe-ui-default.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/photoswipe/dist/initialization-photoswipe.js"></script> --%>


