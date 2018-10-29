<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<%@ include file="/WEB-INF/views/common/loading.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.js"></script> -->
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
   #e-d-button{
          /* margin-right: 81%; */
          position: absolute; left: 0;
          margin-left: 15px;
      }
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
      #e-d-button{
          margin-right: 69%;
      }
   }
   @media (min-width : 576px) and (max-width : 767px){
      .moda {
            width: 126.25px;
            height: 150.75px;
      }
      #e-d-button{
          margin-right: 69%;
      }
   }
   @media (max-width : 575px){
      .moda {
            width: 100%;
            height: 220.75px;
      }
      /* 
      #e-d-button{
          margin-right: 68%;
      } */
   }
   /* 
   @media (min-width : 437 px) and (max-width : 460px){
      #e-d-button{
          margin-right: 63%;
      }
   }
   @media (max-width : 436px){
      #e-d-button{
          margin-right: 60%;
      }
   } */
   
</style>
<script>
	var popupGallery;
	$(document).ready(function() {
		$('.moda').click(function(e) {
			e.preventDefault();
			var sr1 = $(this).prop("src");
			$("#modal").prop("src", sr1);
			$('#photoModal').on('show.bs.modal', function(e) {
				popupGallery = new Swiper('#popupGallery', {
					// Optional parameters
					direction : 'horizontal',
					// Navigation arrows
					navigation : {
						nextEl : '.swiper-button-next',
						prevEl : '.swiper-button-prev',
						hideOnClick : true
					},
				});
			});
			$('#photoModal').on('shown.bs.modal', function(e) {
				popupGallery.update();
			});
			$('#photoModal').modal();
		});
	});
</script>
<%-- <c:set var="now" value="<%=new java.util.Date() %>" /> --%>

<div class="container">
	<div id="uploadButton" style="text-align: right;">
		<a href="<c:url value='/board/animal/bird/photo/write.aw'/>" class="btn btn-primary" style="margin-bottom: 20px;">사진 올리기</a>
	</div>
	<c:if test="${empty list}" var="result">
   		<div class="row">
   			<div class="card-group">
   				<h2 style="text-align: center;">등록된 사진이 없습니다</h2>
   			</div>
   		</div>
   	</c:if>
   	<c:if test="${not result}">
	   	<c:forEach var="dto" items="${list}" varStatus="loop">
	   		<c:if test="${loop.index mod 4 eq 0}">
				<div class="row">
					<div class="card-group">
			</c:if>
				 		<div class="card" id="card-size">
				       		<a href="#" data-target="#modalIMG" data-toggle="modal">
				            	<img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_1.jpg'/>" alt="bird_1" />
				            </a>
				            <div class="card-body">
				            	<h5 class="card-title">
				               	<a href="#" title="<c:url value='/resources/images/board/animal/bird/bird_1.jpg'/>" data-target="#modalIMG" data-toggle="modal">
				                  	${dto.photo_title}
				               	</a>
				               	<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
				               	<p class="card-text">${dto.mem_nickname}</p>
				            </div>
			     			<div class="card-footer">
			           			<small class="text-muted"><fmt:formatDate value="${dto.photo_regidate}" pattern="yyyy-MM-dd" /></small>
							</div>
						</div>
		   	<c:if test="${loop.index mod 4 eq 3}">
					</div>
		   		</div>
		   	</c:if>
	   	</c:forEach>
   	</c:if>
   	
   	<div class="row">
   		${pagingString}
   	</div>
   	
   <%-- 	<hr/>
   
   <div class="row">
      <div class="card-group">
         <div class="card" id="card-size">
            <a href="#" data-target="#modalIMG" data-toggle="modal">
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_1.jpg'/>" alt="bird_1" />
            </a>
            <div class="card-body">
            <h5 class="card-title">
               <a href="#" title="<c:url value='/resources/images/board/animal/bird/bird_1.jpg'/>" data-target="#modalIMG" data-toggle="modal">
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_2.jpg' />" alt="bird_2" />
            </a>
            <div class="card-body">
               <h5 class="card-title">
               <a href="#" title="<c:url value='/resources/images/board/animal/bird/bird_2.jpg'/>" data-target="#modalIMG" data-toggle="modal">
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
            <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_3.jpg' />" alt="bird_3" />
            </a>
            <div class="card-body">
               <h5 class="card-title">
               <a href="#" title="<c:url value='/resources/images/board/animal/bird/bird_3.jpg'/>" data-target="#modalIMG" data-toggle="modal">
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_4.jpg' />" alt="bird_4" />
            </a>
            <div class="card-body">
               <h5 class="card-title">
               <a href="#" title="<c:url value='/resources/images/board/animal/bird/bird_3.jpg'/>" data-target="#modalIMG" data-toggle="modal">
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_5.jpg' />" alt="bird_5" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_6.jpg' />" alt="bird_6" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_7.jpg' />" alt="bird_7" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_8.jpg' />" alt="bird_8" />
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

   <div class="row">
      <div class="card-group">
         <div class="card" id="card-size">
            <a href="#" data-target="#modalIMG" data-toggle="modal">
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_9.jpg' />" alt="bird_9" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_10.jpg' />" alt="bird_10" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_11.jpg' />" alt="bird_11" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_12.jpg' />" alt="bird_12" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_13.jpg' />" alt="bird_13" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_14.jpg' />" alt="bird_14" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_15.jpg' />" alt="bird_15" />
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
               <img class="card-img-top moda" src="<c:url value='/resources/images/board/animal/bird/bird_16.jpg' />" alt="bird_16" />
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
   </div> --%>
</div>
   
   
<!-- 모달 swiper -->
<!-- Modal -->
<div class="modal fade" id="photoModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="swiper-container" id="popupGallery">
					<div class="swiper-wrapper">
						<c:if test="${not empty modalData}">
							<c:forEach var="img" items="${modalData.imgs}">
								<div class="swiper-slide text-xs-center text-lg-center">
									<img class="modaru" class="img-thumbnai" id="modal" alt="사진이 없습니다."
											src="<c:url value='${img}'/>" >
								</div>
							</c:forEach>
						</c:if>
						
						<%-- <div class="swiper-slide text-xs-center text-lg-center">
							<img class="modaru" class="img-thumbnai" src="" id="modal"
								alt="사진이 없습니다.">
						</div>
						<div class="swiper-slide text-xs-center text-lg-center">
							<img class="modaru" class="img-thumbnail"
								src="<c:url value='<!-- 사진 경로 -->' />"
								alt="사진이 없습니다.">
						</div>
						<div class="swiper-slide text-xs-center text-lg-center">
							<img class="modaru" class="img-thumbnail"
								src="<c:url value='<!-- 사진 경로 -->' />"
								alt="사진이 없습니다.">
						</div> --%>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<h2 style="margin: 10px"><!-- 제목 -->${modalDatas.title}</h2>
				<p id="content" style="margin: 10px"><!-- 내용 -->${modalDatas.content}</p>
			</div>
			<div class="modal-footer">
				<div id="e-d-button">
					<a href="#" class="btn btn-primary">수정</a> <a href="#"
						class="btn btn-danger">삭제</a>
				</div>
				<div>
					<a href="#" data-dismiss="modal" class="btn btn-secondary">닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>
