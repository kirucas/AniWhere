<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 메뉴 섹션 -->
    <section id="clients" class="section">
      <!-- Container Ends -->
      <div class="container">
        <h1 class="section-title" style="font-family:메이플스토리;">
        	  동물 메뉴
        </h1>
        <p class="section-subcontent">아래의 메뉴를 선택하면 해당 동물 페이지로 이동해요.</p>
        <div class="wow fadeInUpQuick" data-wow-delay=".9s">
          <!-- Row and Scroller Wrapper Starts -->
          <div class="row" id="clients-scroller">
            <div class="client-item-wrapper">
            	<span>고양이</span>
              <img src="<c:url value='/resources/images/pictures/cat-crop.jpg'/>" style="width:180px;height:122px" alt="">
            </div>
            <div class="client-item-wrapper">
            	<span>강아지</span>
              <img src="<c:url value='/resources/images/pictures/dog-crop.jpg'/>" style="width:180px;height:122px" alt="">
            </div>
            <div class="client-item-wrapper">
            	<span>기타 포유류</span>
              <img src="<c:url value='/resources/images/pictures/hamster-crop.jpg'/>" style="width:180px;height:122px" alt="">
            </div>
            <div class="client-item-wrapper">
            	<span>파충류 & 양서류</span>
              <img src="<c:url value='/resources/images/pictures/gecko2-crop.jpg'/>" style="width:180px;height:122px" alt="">
            </div>
          </div><!-- Row and Scroller Wrapper Starts -->
        </div>
      </div><!-- Container Ends -->
    </section>
    <!-- Client Section End -->        
   
       <!-- 뉴스 섹션 -->
    <section id="testimonial" class="section">
      <!-- Container Starts -->
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
          	<h1>오늘은 동물들에게 어떤 일이 있었을까요?</h1>
            <div id="testimonial-item" class="owl-carousel">
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/dog.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                      	강아지와 함께하는 세상! <br/>
                      	강아지와 함께하는 세상! <br/>
                      	강아지와 함께하는 세상! <br/>
                      	강아지와 함께하는 세상! <br/>
                      	강아지와 함께하는 세상! <br/>
                      	강아지와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                   	 김길동 기자 <br/><a href="#">출처: http://naver.com </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/cat.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                      	고양이와 함께하는 세상! <br/>
                      	고양이와 함께하는 세상! <br/>
                      	고양이와 함께하는 세상! <br/>
                      	고양이와 함께하는 세상! <br/>
                      	고양이와 함께하는 세상! <br/>
                      	고양이와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                    	 박길동 기자 <br/><a href="#">출처: http://naver.com </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/hamster.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                     	고슴도치와 함께하는 세상! <br/>
                      	고슴도치와 함께하는 세상! <br/>
                      	고슴도치와 함께하는 세상! <br/>
                      	고슴도치와 함께하는 세상! <br/>
                      	고슴도치와 함께하는 세상! <br/>
                      	고슴도치와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                   		 이길동 기자 <br/><a href="#">출처: http://daum.net </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/gecko.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                      	게코와 함께하는 세상! <br/>
                      	게코와 함께하는 세상! <br/>
                      	게코와 함께하는 세상! <br/>
                      	게코와 함께하는 세상! <br/>
                      	게코와 함께하는 세상! <br/>
                      	게코와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                   	 이길동 기자 <br/><a href="#">출처: http://dcinside.com </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/bird.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                       	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                     	이길동 기자 <br/><a href="#">출처: http://dcinside.com </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/bird.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                       	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                     	이길동 기자 <br/><a href="#">출처: http://dcinside.com </a>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/bird.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                       	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                     	이길동 기자 <br/><a href="#">출처: http://dcinside.com </a>
                  </div>
                </div>
              </div><div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/bird.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                       	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                     	이길동 기자 <br/><a href="#">출처: http://dcinside.com </a>
                  </div>
                </div>
              </div><div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img src="<c:url value='/resources/images/pictures/bird.jpg'/>" style="width:160px;height:160px">
                  </div>
                  <div class="testimonial-content">
                    <p>
                       	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상! <br/>
                      	앵무새와 함께하는 세상!
                    </p>
                  </div>
                  <div class="testimonial-footer">
                    <i class="fa fa-quote-left"></i>
                     	이길동 기자 <br/><a href="#">출처: http://dcinside.com </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div><!-- Container Ends -->
    </section>
    <!-- Testimonial Section End -->         
   
 


    <!-- 오늘의 동물 섹션 -->
    <section class="split section">
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
              <h2 class="title">오늘의 동물</h2>
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