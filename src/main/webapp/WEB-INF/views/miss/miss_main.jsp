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
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
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
</br></br>
<div class="col-sm-12">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-6" style="float: left">
				<a href="<c:url value='/miss/see.aw'/>"><button type="button" class="btn btn-info">봤어요</button></a>
				</br> 
				</br> 
				<c:if test="${empty requestScope.list }" var="isEmpty">
				   등록된 게시물이 없어요
    			</c:if>
    			<c:if test="${not isEmpty }">
    				<table style="width: 100%;">
    				<tr style="text-align: center;background-color: rgba(80, 80, 80, 0.1);">
    					<td>제목</td>
    					<td>작성자</td>
    					<td>등록일</td>
    				</tr>
    				<c:forEach var="record" items="${list}" varStatus="loop">
    					<tr>
    						<td>
							<a href="<c:url value='/miss/see_view.aw?see_no=${record.no}'/>" class="alert-link"><span style="color: black;font-weight: normal">${record.title }</span></a>
							</td>
							<td style="text-align: center">${record.mem_nickname}</td>
							<td style="text-align: center">${record.regidate}</td>
						</tr>
					</c:forEach>
					</table>
				</c:if>
			</div>
			<div class="col-sm-6" style="float: left;" >
				<a href="<c:url value='/miss/find.aw'/>"><button type="button" class="btn btn-info">찾아요</button></a>
				</br> 
				</br> 
				<c:if test="${empty requestScope.list2 }" var="isEmpty">
				   등록된 게시물이 없어요
    			</c:if>
    			<c:if test="${not isEmpty }">
    				<table style="width: 100%;">
    				<tr style="text-align: center;background-color: rgba(80, 80, 80, 0.1);">
    					<td>제목</td>
    					<td>작성자</td>
    					<td>등록일</td>
    				</tr>
    				<c:forEach var="record" items="${list2}" varStatus="loop">
    					<tr>
    						<td>
							<a href="<c:url value='/miss/find_view.aw?find_no=${record.no}'/>" class="alert-link"><span style="color: black;font-weight: normal">${record.title }</span></a>
							</td>
							<td style="text-align: center">${record.mem_nickname}</td>
							<td style="text-align: center">${record.regidate}</td>
						</tr>
					</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
		<div class="col-sm-12" style="margin-top: 30px">
			<a href="<c:url value='/miss/shelter.aw'/>"><button type="button" class="btn btn-info">보호소</button></a>
			</br>
			</br>
			<div class="row text-center text-lg-left" style="margin-top: 10px">
				<section class="article-list" style="margin-left: 50px">
				<!-- 여기서 반복문 돌려서 글 -->
				<c:if test="${empty requestScope.list}" var="isEmpty">
				   등록된 게시물이 없어요
    			</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="record" items="${list3}" varStatus="loop">
						<a href="<c:url value='/miss/shelter_view.aw?shelter_no=${record.no}'/>" class="article-list-item__info">
						<div style="margin-bottom: 10px; padding:10px;background-color: rgba(80, 80, 80, 0.1);margin-top:15px;margin-left: 15px;margin-right: 15px;float: left">
							<div style="width: 200px;height: 200px;">
								<img src="${record.img_src}" style="width: 200px; height: 200px;">
							</div>				
							<div style="width: 200px;height: 50px; font-size:0.8em;color: black;font-style: bold" >
								<p style="margin-top: 5px">보호소 이름 : ${record.careNm }</br>등록일 : ${record.start_notice }</p>
							</div>
						</div>
						</a>
					</c:forEach>
				</c:if>
				<!-- 페이징 부분 -->
			</section>
			</div>
		</div>
	</div>
</div>
