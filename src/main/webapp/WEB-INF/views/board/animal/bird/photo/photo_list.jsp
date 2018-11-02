<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="/WEB-INF/views/common/IsMember.jsp" %> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.esm.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.esm.bundle.js"></script>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
<style>
	#pagingDiv{
	width: 100%;
	text-align: center;
	}
	.row nav{
		margin:0 auto;
	}
	#pagingDiv nav ul li {
		margin-right: 10px;
	}
	
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
      height: 600px;   
   }
   @media (max-width : 500px){
         #popupGallery div div img{
         width: 100%;
         height: 300px;
      }
   }
   @media (max-width : 800px){
      #popupGallery div div img{
         width: 100%;
         height: 450px;   
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
   /*
* 支持IE10，谷歌，火狐，Safari
.bottom-to-top：从下到上滑动。
.top-to-bottom：从上到下滑动。
.left-to-right：从左向右滑动。
.right-to-left：从右向左滑动。
.rotate-in：旋转进入。
.rotate-out：旋转离开。
.open-up：向上翻转。
.open-down：向下翻转。
.open-left：向左翻转。
.open-right：向右翻转。
.come-left：带倾斜效果的向左翻转。
.come-right：带倾斜效果的向右翻转。
*/
html, body, div, span, applet, object, iframe, h1, h3, h4, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
}

body {
	line-height: 1
}

ol, ul {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

html {
	height: 100%;
	width: 100%;
}

img {
	background: rgba(44, 62, 80, 0.92);
	color: #fff;
	font-size: 14px;
	font-family: 'Open Sans', sans-serif, 'trebuhet ms', HelveticaNeue,
		arial;
	height: 100%;
	line-height: 20px
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-o-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box
}

p {
	line-height: 2.0em
}

h1 {
	font-size: 3.0em;
	line-height: 40px
}

a {
	text-decoration: none;
	color: rgba(74, 92, 110, 0.92)
}

img {
	max-width: 100%
}

.pull-right {
	float: right
}

.pull-left {
	float: left
}

header {
	padding: 30px 20px;
	background: rgba(64, 82, 100, 0.92);
	color: #ffffff;
	margin-bottom: 20px
}

.btn-download {
	background: rgba(24, 42, 60, 0.92);
	color: rgba(124, 142, 160, 0.92);
	padding: 20px 50px;
	display: inline-block;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-o-border-radius: 5px;
	-ms-border-radius: 5px;
	border-radius: 5px
}

.btn-download:hover {
	background: rgba(94, 112, 130, 0.92)
}

.wrapper {
	max-width: 1000px;
	margin: 0 auto
}

.wrapper:before, .wrapper:after {
	content: '';
	display: table;
	clear: both
}

footer {
	margin-top: 30px;
	background: rgba(24, 42, 60, 0.92);
	color: rgba(124, 142, 160, 0.92);
	padding: 20px 0;
	text-align: left;
	font-size: 0.9em
}

@
keyframes anima {from { margin-top:-50px;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 0);
	-moz-opacity: 0;
	-khtml-opacity: 0;
	opacity: 0
}

to {
	margin: auto;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 100);
	-moz-opacity: 1;
	-khtml-opacity: 1;
	opacity: 1
}

}
@
-webkit-keyframes anima {from { margin-left:-20px;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 0);
	-moz-opacity: 0;
	-khtml-opacity: 0;
	opacity: 0
}

to {
	margin-left: 10px;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 100);
	-moz-opacity: 1;
	-khtml-opacity: 1;
	opacity: 1
}

}
.pic {
	max-width: 300px;
	max-height: 200px;
	position: relative;
	overflow: hidden;
	margin: 10px;
	display: inline-block;
	-webkit-animation: anima 2s;
	-moz-animation: anima 2s;
	-o-animation: anima 2s;
	-ms-animation: anima 2s;
	animation: anima 2s;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	backface-visibility: hidden;
}

.pic-3d {
	-webkit-perspective: 500;
	-moz-perspective: 500;
	-o-perspective: 500;
	-ms-perspective: 500;
	perspective: 500;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	-o-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transform-style: preserve-3d
}

.pic-caption {
	cursor: default;
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(50, 200, 99, 0.7);
	padding: 10px;
	text-align: center;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 0);
	-moz-opacity: 0;
	-khtml-opacity: 0;
	opacity: 0
}

.pic-image {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
	-ms-transform: scale(1.1);
	transform: scale(1.1)
}

.pic:hover .pic-image {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-o-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1)
}

.pic-title {
	font-size: 1.8em
}

a, a:hover, .pic .pic-image, .pic-caption, .pic:hover .pic-caption, .pic:hover img
	{
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	transition: all 0.5s ease
}

.pic:hover .bottom-to-top, .pic:hover .top-to-bottom, .pic:hover .left-to-right,
	.pic:hover .right-to-left, .pic:hover .rotate-in, .pic:hover .rotate-out,
	.pic:hover .open-up, .pic:hover .open-down, .pic:hover .open-left, .pic:hover .open-right,
	.pic:hover .come-left, .pic:hover .come-right {
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 100);
	-moz-opacity: 1;
	-khtml-opacity: 1;
	opacity: 1;
	-webkit-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-touch-callout: none;
	-moz-touch-callout: none;
	-o-touch-callout: none;
	-ms-touch-callout: none;
	touch-callout: none;
	-webkit-tap-highlight-color: transparent;
	-moz-tap-highlight-color: transparent;
	-o-tap-highlight-color: transparent;
	-ms-tap-highlight-color: transparent;
	tap-highlight-color: transparent
}

.bottom-to-top {
	top: 50%;
	left: 0
}

.pic:hover .bottom-to-top {
	top: 0;
	left: 0
}

.top-to-bottom {
	bottom: 50%;
	left: 0
}

.pic:hover .top-to-bottom {
	left: 0;
	bottom: 0
}


.open-up {
	-webkit-transform: rotateX(180deg);
	-moz-transform: rotateX(180deg);
	-o-transform: rotateX(180deg);
	-ms-transform: rotateX(180deg);
	transform: rotateX(180deg);
	top: 0;
	left: 0
}

.pic:hover .open-up {
	-webkit-transform: rotateX(0);
	-moz-transform: rotateX(0);
	-o-transform: rotateX(0);
	-ms-transform: rotateX(0);
	transform: rotateX(0)
}


@media screen and (max-width: 560px) {
	.pic {
		max-width: 400px;
		max-height: 300px;
		display: block;
		-webkit-animation: none;
		-moz-animation: none;
		-o-animation: none;
		-ms-animation: none;
		animation: none;
		margin: 10px auto
	}
}
.pic span{
	font-size: 10em;
	color : white;
}
</style>
<script>
	var popupGallery;
	var photoNo;
	$(document).ready(function() {
		$(".pic-caption").click(function(e){
			e.preventDefault();
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
			$.ajax({
	        	url:"<c:url value='/bird/photo/modalContent.awa'/>",
	       		type:"POST",
				data:{no:photoNo},
	       		dataType:"json", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	       		success : function(data) {
	        	 	document.getElementById("title").innerHTML=data['photo_title'];
	        	 	document.getElementById("content").innerHTML=data['photo_content'];
	        	 	if(data['mem_no'] == data['user']) {
	        	 		document.getElementById("e-d-button").innerHTML='<a href="#" class="btn btn-primary">수정</a>'
						+'<a id="delete" href="#" class="btn btn-danger">삭제</a>';
						$("#delete").click(function(){
	        				var index=document.getElementById("modalNo").innerHTML;
	        				location.replace("<c:url value='/bird/photo/delete.aw?no="+index+"'/>");
	        			});
	        	 	 }else {
	        	 		document.getElementById("e-d-button").innerHTML="";
	        	 	} 
        	 		
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
</script><!-- 이거 지워질때까지 컨젯 -->
<c:set var="now" value="<%=new java.util.Date() %>" />

<div class="container">
	<div id="uploadButton" style="text-align: right;">
		<a href="<c:url value='/security/bird/photo/write.aw'/>" class="btn btn-primary" style="margin-bottom: 20px;">사진 올리기</a>
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
				       		<a href="#" data-target="#modalIMG" data-toggle="modal" id="imgSize">
				       		<article class="htmleaf-container">
								<section class="wrapper cl">
									<div class="pic pic-3d">
				            			<img class="card-img-top moda" src="<c:url value='${photoList[loop.index][0][\'LINK\']}'/>" alt="bird_missile" />
				            			<span id="${dto.no}" class="pic-caption open-up">
											+${dto.totalImgCount}
										</span>
				            		</div>
				            	</section>
							</article>
				            </a>
				            <div class="card-body">
				            	<h5 class="card-title">
					                  	${dto.photo_title}
					               	<span title="댓글 수" class="badge badge-secondary">0</span>
				               		<c:if test="${dto.photo_regidate eq serverTime}">
						               	<span title="신규 게시물 표시" class="badge badge-primary">
					               			NEW
						               	</span>
				               		</c:if>
				               	</h5>
				               	<p class="card-text">
				               		<c:if test="${empty dto.mem_no}" var="result">
				               			탈퇴한 자의 온기가 남아있습니다...
				               		</c:if>
				               		<c:if test="${not result}">
				               			${dto.mem_nickname}
				               		</c:if>
				               	</p>
				            </div>
			     			<div class="card-footer">
			           			<small class="text-muted"><fmt:formatDate value="${dto.photo_regidate}" pattern="yyyy-MM-dd" /></small>
							</div>
						</div>
		   	<c:if test="${loop.index mod 4 eq 3 or fn:length(list)-1 eq loop.index}">
					</div>
		   		</div>
		   	</c:if>
	   	</c:forEach>
   	</c:if>
   	
   	<div class="row" id="pagingDiv">
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
					<!-- 수정 삭제 버튼 -->
				</div>
				<div>
					<a href="#" data-dismiss="modal" class="btn btn-secondary">닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>
