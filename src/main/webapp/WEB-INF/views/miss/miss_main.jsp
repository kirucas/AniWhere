<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.esm.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.esm.bundle.js"></script>
<style>
@import
	url("https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.css")
	;

@import
	url("https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css")
	;

.swiper-container {
	width: 1000px;
	height: 500px;
}
</style>
<script>
  $(document).ready(function () {
	    //initialize swiper when document ready
	    var mySwiper = new Swiper ('.swiper-container', {
	      // Optional parameters
	      direction: 'horizontal',
	      loop: true,
	      autoplay: {
	  		delay: 3000,
	  	  },
	      // Navigation arrows
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	        hideOnClick : true
	      },
	      fadeEffect: {
	        crossFade: true
	      },

	      // And if we need scrollbar
	      scrollbar: {
	        el: '.swiper-scrollbar',
	      },
	    });
	  });
  </script>
<!-- Slider main container -->
<div class="swiper-container">
	<!-- Additional required wrapper -->
	<div class="swiper-wrapper">
		<!-- Slides -->
		<div class="swiper-slide text-xs-center text-lg-center">
			<a href="<c:url value='/miss/find.aw'/>"> 
			<img class="img-thumbnail img-fluid" style="align: center; margin-bottom: 5px; height: 100%"
				src="<c:url value='/resources/images/miss/find.jpg'/>" />
			</a>
		</div>
		<div class="swiper-slide text-xs-center text-lg-center">
			<a href="<c:url value='/miss/see.aw'/>"> <img class="img-thumbnail img-fluid"
				style="align: center; margin-bottom: 5px; height: 100%"
				src="<c:url value='/resources/images/miss/sample.jpg'/>" />
			</a>
		</div>
		<div class="swiper-slide text-xs-center text-lg-center">
			<a href="<c:url value='/miss/shelter.aw'/>"> <img class="img-thumbnail img-fluid"
				style="align: center; margin-bottom: 5px; height: 100%"
				src="<c:url value='/resources/images/miss/dogNBoy.jpg'/>" />
			</a>
		</div>
	</div>
	<!-- If we need navigation buttons -->
	<div class="swiper-button-prev"></div>
	<div class="swiper-button-next"></div>

	<!-- If we need scrollbar -->
	<div class="swiper-scrollbar-drag"></div>
</div>
<div class="col-sm-12">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-6" style="float: left">
				<a href="<c:url value='/miss/see.aw'/>"><button type="button" class="btn btn-info">봤어요</button></a>
				<br> 
				<a href="#" class="alert-link"><span>글 제목1</span></a><br>
				<a href="#"><span>글 제목2</span></a><br> 
				<a href="#"><span>글	제목3</span></a><br> 
				<a href="#"><span>글 제목4</span></a><br> 
				<a href="#"><span>글 제목5</span></a><br> 
				<a href="#"><span>글	제목6</span></a><br> 
				<a href="#"><span>글 제목7</span></a><br> 
				<a href="#"><span>글 제목8</span></a><br> 
				<a href="#"><span>글	제목9</span></a><br> 
				<a href="#"><span>글 제목10</span></a><br> 
				<a href="#"><span>글이 하나도 없으면 - 등록된 게시글이 없어요.</span></a><br>
			</div>
			<div class="col-sm-6" style="float: left">
				<a href="<c:url value='/miss/find.aw'/>"><button type="button" class="btn btn-info">찾아요</button></a><br> 
				<a href="#" class="alert-link"><span>글 제목1</span></a><br>
				<a href="#"><span>글 제목2</span></a><br> 
				<a href="#"><span>글	제목3</span></a><br> 
				<a href="#"><span>글 제목4</span></a><br> 
				<a href="#"><span>글 제목5</span></a><br> 
				<a href="#"><span>글	제목6</span></a><br> 
				<a href="#"><span>글 제목7</span></a><br> 
				<a href="#"><span>글 제목8</span></a><br> 
				<a href="#"><span>글	제목9</span></a><br> 
				<a href="#"><span>글 제목10</span></a><br> 
				<a href="#"><span>글이 하나도 없으면 - 등록된 게시글이 없어요.</span></a><br>
			</div>
		</div>
		<div class="col-sm-12">
			<a href="<c:url value='/miss/shelter.aw'/>"><button type="button" class="btn btn-info">보호소</button></a>

			<div class="row text-center text-lg-left">

				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/owl.jpg'/>"
						alt="no picture"> <span>XX 보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/1.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/2.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/3.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/4.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/1.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/2.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/3.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/4.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/1.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/2.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-xs-6">	
					<a href="#" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="<c:url value='/resources/images/etc/3.JPG'/>" alt=""> <span>XX
							보호소 - 지역</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
