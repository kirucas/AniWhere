<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.esm.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.esm.bundle.js"></script>
<style>
	.card-group {
		margin-bottom: 5px;
	}
	
	/* .card-img-top {
		max-height: 180px;
	} */
	
	@media ( max-width : 319px ) {
		.card-img-top {
			height: 200px;
		}
	}
	
	@media ( min-width : 320px ) {
		.card-img-top {
			height: 240px;
		}
	}
	
	@media ( min-width : 544px ) {
		.card-img-top {
			height: 180px;
		}
	}
	
	@media ( min-width : 768px) {
		.card-img-top {
			height: 130px;
		}
	}
	
	@media ( min-width : 992px ) {
		.card-img-top {
			height: 170px;
		}
	}
	
	@media ( min-width : 1200px) {
		.card-img-top {
			height: 180px;
		}
	}
	#popupGallery div div img{
		width: 100%;
		height: 400px;	
	}
	@media (max-width : 500px){
			#popupGallery div div img{
			width: 100%;
			height: 200px;	
		}
	}
	@media (max-width : 800px){
		#popupGallery div div img{
			width: 100%;
			height: 300px;	
		}
	}
	
	@media (min-width :1200px){
			.moda {
				width: 277.5px;
				height: 180px;
		}
	}
	@media (min-width : 992px) and (max-width : 1199px){
		.moda {
				width: 231.25px;
				height: 160.75px;
		}
	}
	@media (min-width : 768px) and (max-width : 991px){
		.moda {
				width: 171.25px;
				height: 100.75px;
		}
	}
	@media (min-width : 576px) and (max-width : 767px){
		.moda {
				width: 126.25px;
				height: 150.75px;
		}
	}
	@media (max-width : 575px){
		.moda {
				width: 100%;
				height: 220.75px;
		}
	}
	
</style>
	<script>
	var popupGallery;
	$(document).ready(function () {
	  $('.moda').click(function (e) {
	    e.preventDefault();
		var sr1 = $(this).prop("src");
		$("#modal").prop("src",sr1);
	    $('#myModal').on('show.bs.modal', function (e) {
	      popupGallery = new Swiper('#popupGallery', {
	    	// Optional parameters
		      direction: 'horizontal',
		      // Navigation arrows
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		        hideOnClick : true
		      },
	      });
	    });
	    $('#myModal').on('shown.bs.modal', function (e) {
	      popupGallery.update();
	    });
	    $('#myModal').modal();
	  });
	});
	
	
// 	var mySwiper;
// 	$(document).ready(function(){
// 		$(".moda").click(function(e){
// 			e.preventDefault();
// 			console.log("클릭 발생");
// 			var sr1 = $(this).prop("src");
// 			$("#modal").prop("src",sr1);
// 			$('#modalIMG').on('show.bs.modal', function (e) {
// 		 		mySwiper = new Swiper('#popImg', {
// 		 			  // Optional parameters
// 				      direction: 'horizontal',
// 				      // Navigation arrows
// 				      navigation: {
// 				        nextEl: '.swiper-button-next',
// 				        prevEl: '.swiper-button-prev',
// 				        hideOnClick : true
// 				      },
// 		 		 });
// 		});
// 		$(".card-title").click(function(e){
// 			e.preventDefault();
// 			var sr1 = $(this).children("a").prop("title");
// 			console.log(sr1);
// 			$("#modal").prop("src",sr1);
// 			$('#modalIMG').on('show.bs.modal', function (e) {
// 		 		mySwiper = new Swiper('#popImg', {
// 		 			  // Optional parameters
// 				      direction: 'horizontal',
// 				      // Navigation arrows
// 				      navigation: {
// 				        nextEl: '.swiper-button-next',
// 				        prevEl: '.swiper-button-prev',
// 				        hideOnClick : true
// 				      },
// 		 		 });
// 		});
// 	});
		
		
		
	</script>
<c:set var="now" value="<%=new java.util.Date() %>" />

<div class="container">
	<div class="row">
		<div class="card-group">
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_1.jpg'/>" alt="etc_1" />
				</a>
				<div class="card-body">
				<h5 class="card-title">
					<a href="#" title="<c:url value='/resources/images/board/animal/etc/etc_1.jpg'/>" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_2.jpg' />" alt="etc_2" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" title="<c:url value='/resources/images/board/animal/etc/etc_2.jpg'/>" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
				<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_3.jpg' />" alt="etc_3" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" title="<c:url value='/resources/images/board/animal/etc/etc_3.jpg'/>" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_4.jpg' />" alt="etc_4" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" title="<c:url value='/resources/images/board/animal/etc/etc_3.jpg'/>" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_5.jpg' />" alt="etc_5" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
						<a href="#" data-target="#modalIMG" data-toggle="modal">
							사진 제목
						</a>
					<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_6.jpg' />" alt="etc_6" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_7.jpg' />" alt="etc_7" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_8.jpg' />" alt="etc_8" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_9.jpg' />" alt="etc_9" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_10.jpg' />" alt="etc_10" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_11.jpg' />" alt="etc_11" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_12.jpg' />" alt="etc_12" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_13.jpg' />" alt="etc_13" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_14.jpg' />" alt="etc_14" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_15.jpg' />" alt="etc_15" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card" id="card-size">
				<a href="#" data-target="#modalIMG" data-toggle="modal">
					<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/etc/etc_16.jpg' />" alt="etc_16" />
				</a>
				<div class="card-body">
					<h5 class="card-title">
					<a href="#" data-target="#modalIMG" data-toggle="modal">
						사진 제목
					</a>
					<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 swiper -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	        <div class="swiper-container" id="popupGallery">
	          <div class="swiper-wrapper">
		          <div class="swiper-slide text-xs-center text-lg-center">
					 <img class="modaru" class="img-thumbnai" src="" id="modal" alt="사진이 없습니다.">
				  </div>
				  <div class="swiper-slide text-xs-center text-lg-center">
					 <img class="modaru" class="img-thumbnail" src="<c:url value='/resources/images/board/animal/etc/etc_15.jpg' />" alt="사진이 없습니다.">
				  </div>
				  <div class="swiper-slide text-xs-center text-lg-center">
					 <img class="modaru" class="img-thumbnail" src="<c:url value='/resources/images/board/animal/etc/etc_14.jpg' />" alt="사진이 없습니다.">
				  </div>
	          </div>
	          <div class="swiper-button-prev"></div>
	          <div class="swiper-button-next"></div>
	        </div>
	        <h2 style="margin:10px">곤지의 프로필</h2>
				<p id="content" style="margin:10px">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
			</div>
			<div class="modal-footer">
				<div><a href="#" data-dismiss="modal">닫기</a></div>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
