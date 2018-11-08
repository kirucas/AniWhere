<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<%@ include file="/WEB-INF/views/common/loading.jsp" %>

<script src="<c:url value='/Bootstrap/js/jquery.banner.js'/>"></script>
<style>
	.images img{
		width: 400px;
		height: 400px; 
	}
	#heart img{
		float:left;
		width: 310px;
		height: 400px;
	}
	.icon-wrapper{
		 margin-bottom: 20px;
	}
	#btn_start{
		 width: 200px;
		 height: 100px;
		 font-size: 1.5em;
		 padding-top:20px;
		 margin-right: 10px;
		 font-weight: bold;
	}
</style>

<!-- 내용 시작 -->

     <div>
		<div id="image_list_1" style="float: left;">
			<div class="clsBannerScreen" style="position: relative; height: 400px; width: 400px; overflow: hidden;">
				<div class="images" style="display: block; position: absolute; top: -150px; left: 0px;" divno="0">
					<img src="<c:url value='/resources/images/mating/left_1.jpg'/>">
				</div>
				<div class="images" divno="1" style="position: absolute; top: -400px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/left_2.jpg'/>">
				</div>
				<div class="images" divno="2" style="position: absolute; top: -400px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/left_3.jpg'/>">
				</div>
				<div class="images" divno="3" style="position: absolute; top: -400px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/left_4.jpg'/>">
				</div>
				<div class="images" divno="4" style="position: absolute; top: 0px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/left_5.jpg'/>">
				</div>
			</div>
		</div>
		<div id="heart">
			<img src="<c:url value='/resources/images/mating/heart.gif'/>">
		</div>
		<div id="image_list_2" style="float: right;">
			<div class="clsBannerScreen" style="position: relative; height: 400px; width: 400px; overflow: hidden;">
				<div class="images" style="display: block; position: absolute; top: -150px; left: 0px;" divno="0">
					<img src="<c:url value='/resources/images/mating/right_1.jpg'/>">
				</div>
				<div class="images" divno="1" style="position: absolute; top: -400px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/right_2.jpg'/>">
				</div>
				<div class="images" divno="2" style="position: absolute; top: -400px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/right_3.jpg'/>">
				</div>
				<div class="images" divno="3" style="position: absolute; top: -400px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/right_4.jpg'/>">
				</div>
				<div class="images" divno="4" style="position: absolute; top: 0px; left: 0px; display: block;">
					<img src="<c:url value='/resources/images/mating/right_5.jpg'/>">
				</div>
			</div>
		</div>
	</div>
	<div style="clear: both;">
      <div class="row"><!-- #1ABC9C -->
      	<div class="col-md-12 text-center" style="color:black;margin : 30px 0px 0px 30px;">
      		<h2>아무나 만나지 않는 당신의 반려동물을 위해<br/>
      			메이팅은 <span style="font-size: 1.5em;color : blue">Ani</span><span style="font-size: 1.5em;color : #1ABC9C">Where </span>에서 시작하세요♡
      		</h2>
      	</div>
      </div>
	 <!-- 소개 섹션 -->
    <section id="service-block-main" class="section" style="margin-bottom: 30px;margin-top : 30px;">
      <!-- Container Starts -->
      <div>
        <div class="row" id="h3style">        
          <div class="col-sm-6 col-md-3">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item wow fadeInUpQuick animated" data-wow-delay=".5s">
              <div class="icon-wrapper">
                <img style="width: 200px;height: 300px;" src="<c:url value='/resources/images/mating/mating_1.jpg'/>"/>
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
                <img style="width: 200px;height: 300px;" src="<c:url value='/resources/images/mating/mating_2.jpg'/>"/>
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
                <img style="width: 200px;height: 300px;" src="<c:url value='/resources/images/mating/mating_3.jpg'/>"/>
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
                <img style="width: 200px;height: 300px;" src="<c:url value='/resources/images/mating/mating_4.jpg'/>"/>
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
    <div style="text-align: center;width: 100%;height: 100px;">
    	<a href="<c:url value='/security/mating/Login.aw'/>" class="col-md-12 text-center btn btn-primary" id="btn_start"><img src="<c:url value='/resources/images/mating/mating_btnstart.png'/>" style="width: 60px;height: 60px;">시 작 하 기</a>
    </div>
</div>
<!-- 내용 끝 -->
<script>
	$(function() {
		$("#image_list_1").jQBanner({ //롤링을 할 영역의 ID 값 
			nWidth : 400, //영역의 width 
			nHeight : 400, //영역의 height 
			nCount : 5, //돌아갈 이미지 개수 
			isActType : "up", //움직일 방향 (left, right, up, down) 
			nOrderNo : 1, //초기 이미지 
			nDelay : 1000 //롤링 시간 타임 (1000 = 1초)
		/*isBtnType:"li"*/ //라벨(버튼 타입) - 여기는 안쓰임 
		});
		$("#image_list_2").jQBanner({ //롤링을 할 영역의 ID 값 
			nWidth : 400, //영역의 width 
			nHeight : 400, //영역의 height 
			nCount : 5, //돌아갈 이미지 개수 
			isActType : "down", //움직일 방향 (left, right, up, down) 
			nOrderNo : 1, //초기 이미지 
			nDelay : 1000 //롤링 시간 타임 (1000 = 1초)
		/*isBtnType:"li"*/ //라벨(버튼 타입) - 여기는 안쓰임 
		});
	});
</script>
