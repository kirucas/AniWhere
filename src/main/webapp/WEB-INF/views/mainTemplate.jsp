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
    
      <div class="mainDiv">
	      <div class="card" style="width: 13.6rem;">
	        <a href="<c:url value='#'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_dog.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">강아지</span>
		        </div>
	        </a>
	      </div>
	      <div class="card" style="width: 13.6rem;">
	        <a href="<c:url value='/animal/cat/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_cat.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">고양이</span>
		        </div>
	        </a>
	      </div>
	         <div class="card" style="width: 13.6rem;">
	        <a href="<c:url value='/animal/rna/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_rNa.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">파충류 & 양서류</span>
		        </div>
	        </a>
	      </div>
	         <div class="card" style="width: 13.6rem;">
	        <a href="<c:url value='/animal/bird/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_bird1.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">조류</span>
		        </div>
	        </a>
	      </div>
	         <div class="card" style="width: 13.6rem;">
	        <a href="<c:url value='/animal/etc/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_etc.jpg'/>" alt="Card image cap">
		        <div class="card-body">
		          <span class="card-text">기타 포유류</span>
		        </div>
	        </a>
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
      <div>
        <div class="row">
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="images">
              <img src="<c:url value='/resources/images/pictures/gecko2.jpg'/>"/>
            </div>
          </div>
          <div class="col-md-8 col-sm-6 col-xs-12">
            <div class="content-inner">
              <h3 class="title">오늘의 동물</h3>
              <p class="lead">크레스티드 게코를 만나보세요!</p>
              <div class="details-list">
                <div class="row">
                  <div class="col-sm-6 col-xs-12">
                    <h3>특징</h3>
                    <p>크레스티드 게코는 속눈썹 도마뱀이라는 뜻으로, 속눈썹을 가지고 있는 것이 특징입니다.</p>
                  </div>
                  <div class="col-sm-6 col-xs-12">
                    <h3>케어시트</h3>
                    <p>26도의 온도와 60%의 습도를 필요로 합니다.<br/>
                       곤충과 과일 모두 먹는 잡식성 게코이며, 슈퍼푸드를 급여할 수 있습니다.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Container Ends -->
    </section>