<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<%@ include file="/WEB-INF/views/common/loading.jsp" %>
<!-- 내용 시작 -->
<div class="container">
      <div class="row">
          <div class="col-md-12">
                <img src="<c:url value='/resources/images/mating/matingMain.jpg'/>" width="100%"/>
          </div>
      </div>   
      <div class="row">
      	<div class="col-md-12 text-center" style="margin-top:50px;color:#1ABC9C;">
      		<h2>아무나 만나지 않는 당신의 반려동물을 위해<br/><br/>
      			메이팅은 AniWhere에서 시작하세요♡
      		</h2>
      	</div>
      </div>
	 <!-- 소개 섹션 -->
    <section id="service-block-main" class="section">
      <!-- Container Starts -->
      <div class="container">
        <div class="row">        
          <div class="col-sm-6 col-md-3">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item wow fadeInUpQuick animated" data-wow-delay=".5s">
              <div class="icon-wrapper">
                <i class="icon-layers pulse-shrink">
                </i>
              </div>
              <h3>
                	프로필 카드
              </h3>
              <p>
                	만나요♡ 에서는 동물들간의 <br/>
                	만남을 주선해요.<br/> 
                	모든 동물이 등록 가능해요.
              </p>
            </div>
            <!-- Service-Block-1 Item Ends -->
          </div>

          <div class="col-sm-6 col-md-3">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item wow fadeInUpQuick animated" data-wow-delay=".8s">
              <div class="icon-wrapper">
                <i class="icon-heart pulse-shrink">
                </i>
              </div>
              <h3>
                	아무나 만나지 않아요
              </h3>
              <p>
                	여러분의 소중한 반려동물들 <br/>
                	아무 동물이나 만날 수는 없지요! <br/>
                	프로필카드를 선택하여 만날 수 있어요!
              </p>
            </div>
            <!-- Service-Block-1 Item Ends -->
          </div>
          
          <div class="col-sm-6 col-md-3">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item wow fadeInUpQuick animated" data-wow-delay="1.1s">
              <div class="icon-wrapper">
                <i class="icon-user pulse-shrink">
                </i>
              </div>
              <h3>
                	거리별 추천
              </h3>
              <p>
               	가까운 동물들을 우선 추천해줘요.<br/>
               	내 주변에 만날 동물이 있는지 찾아봐요!
              </p>
            </div>
            <!-- Service-Block-1 Item Ends -->
          </div>

          <div class="col-sm-6 col-md-3">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item  wow fadeInUpQuick animated" data-wow-delay="1.4s">
              <div class="icon-wrapper">
                <i class="icon-cup pulse-shrink">
                </i>
              </div>
              <h3>
              		  신청 & 거절
              </h3>
              <p>
               	마음에 드는 동물을 만났다면 <br/>
               	메이팅을 신청해요!<br/>
               	하지만 상대방이 거절할 수 있어요.
              </p>
            </div>
          </div><!-- Service-Block-1 Item Ends -->
        </div>
      </div><!-- Container Ends -->
    </section><!-- Service Main Section Ends -->
    <div class="row">
    	<a href="<c:url value='/matingLogin.aw'/>" class="col-md-12 text-center" style="font-size:4em;margin-top:50px;margin-bottom:200px">시작하기</a>
    </div>
</div>
<!-- 내용 끝 -->
