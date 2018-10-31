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
	var photoNo;
	$(document).ready(function() {
		$("#delete").click(function(){
			var index=document.getElementById("modalNo").innerHTML;
			location.replace("<c:url value='/bird/photo/delete.aw?no="+index+"'/>");
		});
		
		$(".moda").click(function(e){			e.preventDefault();
			//$("#modal").prop("src", $(this).prop("src"));
			photoNo=$(this).prop("id");
			$("#modalNo").html(photoNo);
			
			$.ajax({
	        	url:"<c:url value='/bird/photo/modalView.awa'/>",
	       		type:"POST",
				data:{no:photoNo},
	       		dataType:"json", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	       		success : function(data) {
	       			var imgString="";
	        	 	$.each(data, function(index,element){
	        	 		imgString+='<div class="swiper-slide text-xs-center text-lg-center">';
	    				imgString+='<img class="modaru" class="img-thumbnai" id="modal" alt="사진이 없습니다."';
	    				imgString+='src="<c:url value="'+data[index]['LINK']+'"/>">';
	    				imgString+='</div>';
	        	   	});
	        	 	document.getElementById("popup").innerHTML=imgString;
	           	},
	           	error : function(error) {
	                 alert("에러발생");
		       	}
		    });
			
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
		<a href="<c:url value='/bird/photo/write.aw'/>" class="btn btn-primary" style="margin-bottom: 20px;">사진 올리기</a>
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
				            	<img id="${dto.no}" class="card-img-top moda" src="<c:url value='${photoList[loop.index][0][\'LINK\']}'/>" alt="bird_missile" />
				            </a>
				            <div class="card-body">
				            	<h5 class="card-title">
				               	<a href="#" data-target="#modalIMG" data-toggle="modal">
				                  	${dto.photo_title}
				               	</a>
				               	<span title="댓글 수" class="badge badge-secondary">13</span>
				               	<span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
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
</div>



<!-- 모달 swiper -->
<!-- Modal -->
<div class="modal fade" id="photoModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="swiper-container" id="popupGallery">
					<!-- 글번호 저장용 -->
					<label id="modalNo" hidden="true"></label>
					<div class="swiper-wrapper" id="popup">
						<%-- <div class="swiper-slide text-xs-center text-lg-center">
							<img class="modaru" class="img-thumbnail"
								src="<c:url value='<!-- 사진 경로 -->' />"
								alt="사진이 없습니다.">
						</div>--%>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<h2 id="title" style="margin: 10px"><!-- 제목 --></h2>
				<p id="content" style="margin: 10px"><!-- 내용 --></p>
			</div>
			<div class="modal-footer">
				<div id="e-d-button">
					<a href="#" class="btn btn-primary">수정</a> 
					<a id="delete" href="#" class="btn btn-danger">삭제</a>
				</div>
				<div>
					<a href="#" data-dismiss="modal" class="btn btn-secondary">닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>
