<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<style>
       .mainDiv div{
          display: inline-block;
       }
       .card span{
          text-align: center;
       }
       #card-slider{
          float: left;
       }
       .card-body {
       		width:100%;
       		text-align: center;
       }
       .card-body span{
       		font-size : 1.5em;
       }
       /* //////////////////// */
       	.drawsvg,
	svg {
	    width: 100%;
	    height: 400px;
	
	}
	
	.stroke {
	    stroke: white;
	    stroke-width: 1px;
	    stroke-dasharray: 0 250;
	    stroke-opacity: 1;
	    fill: none;
	    -webkit-animation: stroke_offset 5s infinite;
	    animation: stroke_offset 8s infinite;
	    -webkit-animation-timing-function: cubic-bezier(.25, .46, .45, .94);
	    animation-timing-function: cubic-bezier(.25, .46, .45, .94)
	}
	
	@-webkit-keyframes stroke_offset {
	    100%,
	    25% {
	        stroke-dasharray: 0 250;
	        stroke-opacity: 1
	    }
	    50%,
	    75% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: .75
	    }
	    55%,
	    70% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: 0
	    }
	}
	
	@keyframes stroke_offset {
	    100%,
	    25% {
	        stroke-dasharray: 0 250;
	        stroke-opacity: 1
	    }
	    50%,
	    75% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: .75
	    }
	    55%,
	    70% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: 0
	    }
	}
	
	.fill {
	    fill: white;
	    fill-opacity: 0;
	    -webkit-animation: fill_offset 8s infinite;
	    animation: fill_offset 8s infinite;
	    -webkit-animation-timing-function: cubic-bezier(.25, .46, .45, .94);
	    animation-timing-function: cubic-bezier(.25, .46, .45, .94)
	}
	
	@-webkit-keyframes fill_offset {
	    100%,
	    25%,
	    35%,
	    90% {
	        fill-opacity: 0
	    }
	    50%,
	    70% {
	        fill-opacity: 1
	    }
	}
	
	@keyframes fill_offset {
	    100%,
	    25%,
	    35%,
	    90% {
	        fill-opacity: 0
	    }
	    50%,
	    70% {
	        fill-opacity: 1
	    }
	}
	
	#fade-text {
	    font-family: 'Alex Brush', cursive;
	    font-size: 4em
	    
	}
	
	svg {
	    position: absolute
	    
	}
	#logo-image{
		background: url("<c:url value='/resources/images/test.jpg'/>");
		background-position: center;
		background-repeat: no-repeat;
		background-size: 100%;
	}
	/* 메인페이지에 icon 용 */
	#icon div div{
		height:  200px;
	}
	 #icon ul li a:hover{
	 	text-decoration: none;	
	 }
	 #icon ul li a{
	 	color:#9d85ff;
	 	
	 }
</style>
   <!-- Start Content -->

    <div class="row">
        <div class="col-md-12" id="logo-image">
        	<div class="drawsvg">
				<svg version="1.1" viewBox="0 0 700 300">
				  <symbol id="fade-text">
				    <text x="45%" y="40%" text-anchor="middle">Welcome to</text>
				    <text x="55%" y="65%" text-anchor="middle">☆ AniWhere ☆</text>
				  </symbol>
				  <g>
				    <use class="stroke" xlink:href="#fade-text"/>
				    <use class="fill" xlink:href="#fade-text"/>
				  </g>
				</svg>                  
			</div>
        </div>
    </div>         
 
     <!-- End Content --> 
    <!-- 메뉴 섹션 -->
    
    <!-- Client Section End -->
    <div style="margin-top: 20px;">
       <div style="text-align: center;">
           <h1 class="section-title" style="font-family:메이플스토리;">
                동물 게시판 메뉴
           </h1>
           <p class="section-subcontent" style="font-size: 1.8em;">아래의 메뉴를 선택하면 해당 동물 페이지로 이동해요.</p>
        </div>
    
      <div class="mainDiv" id="icon">
	      <div class="card" style="width: 13.6rem;">
	        <img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_dog.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">강아지</span>
		          	<div id="main_board">
		          		<ul style="list-style: none;padding-left:0px;">
		          			<li>
		          				<a href="<c:url value='/animal/dog/photo.aw'/>">
		          				<img src="<c:url value='/resources/images/icon/photoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/dog/movie.aw'/>">
		          				<img src="<c:url value='/resources/images/icon/videoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;동영상 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/security/animal/dog/quest/quest_list.aw'/>">
		          				<img src="<c:url value='/resources/images/icon/questicon.jpg'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/board/animal/dog/tip/list.aw'/>">
		          				<img src="<c:url value='/resources/images/icon/tipicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팁 게시판</a>
		          			</li>
		          		</ul>
		          	</div>
		        </div>
	      </div>
	      <div class="card" style="width: 13.6rem;">
	        <img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_cat.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">고양이</span>
		          <div id="main_board">
		          		<ul style="list-style: none;padding-left:0px;">
		          			<li>
		          				<a href="<c:url value='/animal/cat/photo.aw'/>"><img src="<c:url value='/resources/images/icon/photoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/cat/movie.aw'/>"><img src="<c:url value='/resources/images/icon/videoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;동영상 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/cat/quest.aw'/>"><img src="<c:url value='/resources/images/icon/questicon.jpg'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/board/animal/cat/tip/list.aw'/>"><img src="<c:url value='/resources/images/icon/tipicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팁 게시판</a>
		          			</li>
		          		</ul>
		          	</div>
		        </div>
	      </div>
	         <div class="card" style="width: 13.6rem;">
	         <img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_rNa.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">파충류 & 양서류</span>
		          <div id="main_board">
		          		<ul style="list-style: none;padding-left:0px;">
		          			<li>
		          				<a href="<c:url value='/animal/rna/photo.aw'/>"><img src="<c:url value='/resources/images/icon/photoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/rna/movie.aw'/>"><img src="<c:url value='/resources/images/icon/videoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;동영상 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/rna/quest.aw'/>"><img src="<c:url value='/resources/images/icon/questicon.jpg'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/board/animal/rNa/tip/list.aw'/>"><img src="<c:url value='/resources/images/icon/tipicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팁 게시판</a>
		          			</li>
		          		</ul>
		          	</div>
		        </div>
	      	 </div>
	         <div class="card" style="width: 13.6rem;">
	         <img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_bird1.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">&nbsp;조류&nbsp;</span>
		          <div>
		          		<ul style="list-style: none;padding-left:0px;">
		          			<li>
		          				<a href="<c:url value='/animal/bird/photo.aw'/>"><img src="<c:url value='/resources/images/icon/photoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/bird/movie/List.aw'/>"><img src="<c:url value='/resources/images/icon/videoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;동영상 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/bird/quest.aw'/>"><img src="<c:url value='/resources/images/icon/questicon.jpg'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/board/animal/bird/tip/list.aw'/>"><img src="<c:url value='/resources/images/icon/tipicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팁 게시판</a>
		          			</li>
		          		</ul>
		          	</div>
		        </div>
	      	</div>
	         <div class="card" style="width: 13.6rem;">
	         <img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_etc.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">기타 포유류</span>
		          <div id="main_board">
		          		<ul style="list-style: none;padding-left:0px;">
		          			<li>
		          				<a href="<c:url value='/animal/etc/photo.aw'/>"><img src="<c:url value='/resources/images/icon/photoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/etc/movie.aw'/>"><img src="<c:url value='/resources/images/icon/videoicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;동영상 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/animal/etc/quest.aw'/>"><img src="<c:url value='/resources/images/icon/questicon.jpg'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문 게시판</a>
		          			</li>
		          			<li>
		          				<a href="<c:url value='/board/animal/etc/tip/list.aw'/>"><img src="<c:url value='/resources/images/icon/tipicon.png'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팁 게시판</a>
		          			</li>
		          		</ul>
		          	</div>
		        </div>
	      </div>
      </div>
	</div>
       <!-- 뉴스 섹션 -->
    <section id="testimonial" class="section">
      <!-- Container Starts -->
      <div >
        <div class="row">
          <div class="col-sm-12" style="padding:0px;">
             <span style="font-weight: bold;margin-left:15%;font-size: 50px;">오늘은 동물들에게 어떤 일이 있었을까요?</span>
             <!--Carousel Wrapper-->
         <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
         
           <!--Slides-->
           <div class="carousel-inner" role="listbox">
         
             <!--First slide-->
             <div class="carousel-item active">
         
               <div class="col-md-4" style="float:left" id="card-slider">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
             </div>
             <!--/.First slide-->
         
             <!--Second slide-->
             <div class="carousel-item" id="card-slider">
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
             </div>
             <!--/.Second slide-->
         
             <!--Third slide-->
             <div class="carousel-item" id="card-slider">
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/pictures/hamster.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">고슴도치</h4>
                     <p class="card-text">고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!<br>고슴도치다!!!
                       </p>
                     
                   </div>
                 </div>
               </div>
         
             </div>
             <!--/.Third slide-->
         
           </div>
           <!--/.Slides-->
         
         </div>
         <!--/.Carousel Wrapper-->
          </div>
        </div>
      </div><!-- Container Ends -->
    </section>
    <!-- Testimonial Section End -->         
   
 


    <!-- 오늘의 동물 섹션 -->
    <section class="split section" style="margin-top:20px;margin-bottom:20px;">
	      <!-- Container Starts -->
	      <div class="col-md-12 grid-margin">
	        <div class="row">
	            <div class="col-md-12">
	                <div class="card">
	                    <div class="card-body">
	                        <p class="text-gray">${serverTime} 입양해주세요</p>
	                        <div class="col-md-12">
                        		<img src="${lost_one.img_src}" alt="이미지" style="width:100%">
            	                <h4 style="margin-top:20px">품종: ${lost_one.kind}</h4>
								<h4>기관주소: ${lost_one.addr}</h4>
								<h4>기관명: ${lost_one.carenm }</h4>
								<h4>기관전화번호: ${lost_one.caretel }</h4>
								<h4>공고 종료일: ${lost_one.end_notice }</h4>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
      <!-- Container Ends -->
    </section>