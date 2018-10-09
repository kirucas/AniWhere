<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- Start Content -->

    <div class="row">
        <div class="col-md-12">
              <img src="<c:url value='/resources/images/main2.jpg'/>" width="100%"/>
        </div>
    </div>         
 
     <!-- End Content --> 
    <!-- 메뉴 섹션 -->
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
    </style>
    <!-- Client Section End -->
    <div class="container">
       <div style="text-align: center;">
           <h1 class="section-title" style="font-family:메이플스토리;">
                동물 메뉴
           </h1>
           <p class="section-subcontent">아래의 메뉴를 선택하면 해당 동물 페이지로 이동해요.</p>
        </div>
    </div>        
    
      <div class="mainDiv" style="margin-left: 15px;">
         <div class="card" style="width: 13.5rem;">
        <a href="<c:url value='/animal/dog/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/dog-crop.jpg'/>" alt="Card image cap"></a>
        <div class="card-body" style="text-align:center">
          <span class="card-text">강아지</span>
        </div>
      </div>
      
         <div class="card" style="width: 13.5rem;">
        <a href="<c:url value='/animal/cat/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/cat-crop.jpg'/>" alt="Card image cap"></a>
        <div class="card-body" style="text-align:center">
          <span class="card-text">고양이</span>
        </div>
      </div>
         <div class="card" style="width: 13rem;">
        <a href="<c:url value='/animal/rna/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/gecko2-crop.jpg'/>" alt="Card image cap"></a>
        <div class="card-body" style="text-align:center">
          <span class="card-text">파충류 & 양서류</span>
        </div>
      </div>
         <div class="card" style="width: 13.5rem;">
        <a href="<c:url value='/animal/bird/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/main_bird.jpg'/>" alt="Card image cap"></a>
        <div class="card-body" style="text-align:center">
          <span class="card-text">조류</span>
        </div>
      </div>
         <div class="card" style="width: 13.5rem;">
        <a href="<c:url value='/animal/etc/main.aw'/>"><img class="card-img-top" style="height: 122px" src="<c:url value='/resources/images/pictures/hamster-crop.jpg'/>" alt="Card image cap"></a>
        <div class="card-body" style="text-align:center">
          <span class="card-text">기타 포유류</span>
        </div>
      </div>
      </div>

       <!-- 뉴스 섹션 -->
    <section id="testimonial" class="section">
      <!-- Container Starts -->
      <div class="container">
        <div class="row">
          <div class="col-sm-12" style="padding:0px;">
             <span style="font-weight: bold;margin-left:15%;font-size: 50px;">오늘은 동물들에게 어떤 일이 있었을까요?</span>
             <!--Carousel Wrapper-->
         <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
         
           <!--Controls-->
           <div class="controls-top">
             <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
             <a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fa fa-chevron-right"></i></a>
           </div>
           <!--/.Controls-->
         
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
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="images">
              <img src="<c:url value='/resources/images/pictures/gecko2.jpg'/>"/>
            </div>
          </div>
          <div class="col-md-8 col-sm-6 col-xs-12">
            <div class="content-inner">
              <span class="title">오늘의 동물</span>
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
    <!-- About Us Section Ends -->   