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
       #news .card-body {
       		width:100%;
       		height : 400px;
       		text-align: center;
       		overflow: scroll;
       }
       .card-body span{
       		font-size : 1.5em;
       }
       .card-img-top{
       		height: 300px;
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
		          				<a href="<c:url value='/animal/rNa/quest.aw'/>"><img src="<c:url value='/resources/images/icon/questicon.jpg'/>" style="width: 35px;height: 35px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문 게시판</a>
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
      <div>
        <div class="row">
          <div class="col-sm-12" style="padding:0px;margin-top:30px;">
             <span style="font-weight: bold;margin-left:15%;font-size: 50px;">오늘은 동물들에게 어떤 일이 있었을까요?</span>
             <!--Carousel Wrapper-->
         <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
         
           <!--Slides-->
           <div class="carousel-inner" role="listbox" id="news">
         
             <!--First slide-->
             <div class="carousel-item active">
         
               <div class="col-md-4" style="float:left" id="card-slider">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news1.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">스타견 전문훈련사 "강성호 교수" 반려동물 행동학 책 출간 예고</h4>
                     <p class="card-text">반려동물뉴스(CABN) 다가오는 3월 9일(금)에 강성호 교수의 책이 출간된다고 다음강사모는 밝혔다. 이 책은 강사모 최경선 회장이 감수를 진행했으며 그 동안 강성호 교수가 직접 필드에서 뛰면서 체험한 지식과 이론을 기반으로 완성된 책이다. 강성호 교수는 현재 서울호서예술실용전문학교의 전임교수로 재직중이며 반려동물행동학과 반려견 훈련에 대한 체계적인 후진 양성활동에 전념하고 있다. 다음강사모 담당자는 "반려인들의 눈높이를 맞추어 체계적으로 설명해 줄 수 있는 반려동물행동학 책이 나와 기쁘다"고 말했다.
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news2.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">'스카이펫파크’와 ‘라이프앤도그’가 함께 하는 반려동물을 위한 기부 캠페인</h4>
                     <p class="card-text">
‘러브펫챌린지’는 반려동물 전용 방송 채널 ‘스카이펫파크’와 프리미엄 펫 매거진 ‘라이프앤도그’가 함께 하는 동물보호 기부 캠페인이다. 참여하는 연예인이 미션을 수행하고, 그 결과를 통해 마련된 사료를 동물 보호 단체에 전달하는 프로젝트이다. 사료는 ‘내추럴발란스’의 후원으로 동물보호 단체인 ‘케어(care)’에 기부된다.

배우 김소은에 이어 러브펫챌린지의 두 번째 도전자로 나선 공승연은 공을 던져 판넬에 붙이는 미션에 도전했다. 이번 미션은 공을 붙이는데 실패하면 공 1개당 20kg의 사료를 빼는 방식으로 진행됐다. 한 번의 실패 없이 모두 성공할 경우 총 500kg의 사료를 기부할 수 있게 된다. 300kg 기부를 목표로 미션에 나선 공승연은 12개를 성공하여 240kg 기부에 성공했으나, 러브펫챌린지 시그니처 포즈를 취해서 얻게 된 보너스 기회를 통해 총 290kg의 사료를 기부할 수 있게 되었다.  
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news3.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">중국 쓰촨 산사태 현장에서 주인을 애타게 찾는 강아지 사연 "반려견의 눈물"</h4>
                     <p class="card-text">중국 쓰촨성 산사태 피해로 백구 강아지의 주인은 실종됐다. 이번 산사태는 100여명이 숨지거나 실종된 산사태로 중국 CGTN은 25일(일) 밝혔다. 주인을 찾기 위해 마을 콘크리트 더미 위에서 축 늘어져 주인을 찾고 있는 백구 강아지 영상이 다양한 매체의 채널로 현재 보도 중이다. 영상에서 구조대원들은 이 강아지에게 "너의 주인은 어디에 있니?"라며 메세지를 전달했으나, 주인을 애타게 찾는 강아지는 움직이지 않았다. 
                       한편, CGTN은 트위터 계정을 통해 많은 메세지를 전달했으며 이를 지켜본 많은 인민들의 심금을 울리기도 했다.</p>
                     
                   </div>
                 </div>
               </div>
             </div>
             <!--/.First slide-->
         
             <!--Second slide-->
             <div class="carousel-item" id="card-slider">
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news4.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">다음카카오선정, 화제의 카페에 다음강사모 반려견 커뮤니티가 선정 됐다.</h4>
                     <p class="card-text">오늘 다음카카오는 화제의 카페에 다음강사모 카페를 선정했다. 다음강사모는 현재 반려견에 대한 소통과 다양한 반려동물 문화에 대한 콘텐츠를 통해 회원들과 소통하고 있는 반려견 커뮤니티이다.
                     다음카카오는 "초보 견주 여기 모여라! 간단한 훈련법과 노령견 관리 함께 공부하고 보듬어 주세요"라는 내용으로 강사모 카페를 소개했다. 다음세대 강사모 최경선 대표는 "강사모 카페는 특별한 것을 하는 공간이 아니라 삶의 모습이 아름다웠으면 한다"고 말하며, "앞으로 다음세대 아이들에게 반려동물 문화에 대한 메세지를 함께 느끼고 공감하는 반려동물 문화콘서트도 함께 진행한다"고 말했다.
                       </p>
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news5.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">전국 동물보호 활동가들이 한 자리에 모여 정치권에 동물보호 정책 발의 촉구</h4>
                     <p class="card-text">지난 4월 3일(월) 국내 동물보호단체 및 수의사협회 등이 모인 전국 동물보호 활동가 네트워크는 서울시 구로구 고척동에 위치한 고척 스카이돔 앞에서 기자회견을 열였다. 이번 기자회견은 “개식용 및 도살 금지법에 대한 제정과 동물보호법 강화 그리고 동물복지 선진국으로 만들어달라”는 메시지를 담고 있다.
                     이번 기자회견에 참가한 한국고양이수의사회(KSFM) 김재영 회장은 "유기견과 유기묘가 함께 살아가는 훌륭한 대통령이 선출되었으면 좋겠다"고 말했다. 또한, 전국동물보호 활동가 네트워크는 “동물학대에 잔인하고 끔찍한 일들이 많이 발생하고 있으나 수십만원의 벌금형이나 집행유예 등의 솜방망이 처벌이 반복되고 있다”면서 “동물 학대자에 대한 처벌강화가 시급하다”고 메시지를 전달했다.
                     한편, 더불어 민주당 통합연설회에는 많은 전국의 당원들이 집결되면서 전국에서 방문한 인파로 다소 혼잡하였으나, 동물보호에 열정이 있는 사람들의 많은 참여로 행사는 무사히 마무리 되었다. 지난달 22일에는 국내 주요 동물보호단체들이 더불어 민주당과 동물권 향상을 위한 정책협약을 맺었다.



이 협약은 ▶반려동물 복지향상 실현 ▶지속가능한 동물복지 축산정책 추진 ▶동물복지 확보 및 효과적인 위험관리를 위한 방역정책 수립 ▶실험동물의 복지를 위한 규제 및 실험자 의무 강화 ▶야생동물 보호 정책 강화 ▶전시동물 시설의 관리기준 강화 ▶인간과 동물의 생태적 공존 실현을 위한 기반 마련과 행정 정비 적극 검토 등의 내용으로 진행이 됐다.
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news6.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">울산남구, 큰 돌고래의 눈물을 보았는가? 동물학대 논란이 불거질 전망이다.</h4>
                     <p class="card-text">지난 13일 울산 남구는 장생포에 온 돌고래가 수입 5일만에 숨졌다고 밝혔다. 울산에서 2009년 문을 연 울산 고래생태체험관은 현재까지 6마리의 돌고래가 죽어 나가면서 동물 학대 논란이 불거질 상황에 놓였다. 울산 남구는 지난 13일 오후 9시 15분께 장생포 고래생태체험관으로 수입한 큰돌고래(4~5세·262m·184㎏·암컷)가 폐사했다고 전달했다.
                     폐사한 큰 돌고래는 지난 8일 오전 7시 일본 와카야마(和歌山)현 다이지(太地)정을 출발하여 한국에 약 32시간 만에 울산에 도착했다. 당시 뱃길 700㎞, 육로 300㎞ 등 1,000㎞를 이동하여 한국에 도착 했으며, 긴 이송 뒤 적응기를 거치던 돌고래는 13일 오전까지 별다른 이상이 없었다. 하지만, 지난 13일 오후 2시부터 먹이를 먹지 않는 이상증세를 보이며, 결국 오후 9시께부터 호흡곤란 증상을 보이다 15분 만에 사망했다고 담당자는 전달했다.
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
                   <img class="card-img-top" src="<c:url value='/resources/images/news7.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">감사! 부천시 강아지공장을 부천 유기동물 쉼터로 이전하는 블루엔젤봉사단의 리얼 행복스토리</h4>
                     <p class="card-text">지난 25일 내추럴발란스 블루엔젤 봉사단 13기, 연예인 봉사단이 함께 부천에 있는 강아지공장의 강아지를 부천 유기동물 쉼터로 이동하는 봉사를 진행했다. 블루엔젤봉사단은 유기동물 70여 마리에 대해서 직접 이동봉사, 의료봉사, 시설봉사, 목욕봉사, 사료지원에 모든 부분을 내추럴발란스 코리와 임직원과 후원사 직원, 연예인 봉사단과 함께 아름다운 유기동물 봉사를 지원했다. 경기도 부천시 소사구 송내동에 위치한 부천 유기동물 쉼터는 내추럴발란스와 협력된 유기동물단체와 함께 체계적인 유기견 입양 캠페인을 진행하기로 했으며, 이 캠페인에 다음강사모 및 강사모뉴스가 적극적으로 SNS/블로그/카페 홍보를 지원하기로 공식적으로 협의했다.
                       </p>
                     
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news8.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">개별 동물병원용 ‘맞춤형 모바일 매거진’, 「펫메이트」 출시</h4>
                     <p class="card-text">동물병원의 경쟁력을 강화 할 수 있는 고객관리(CRM) 서비스가 출시돼 일선 병원의 관심을 모으고 있다. 매월 기존 내원 고객(반려동물 보호자)에게 개별 동물병원용 ‘맞춤형 모바일 매거진’ 링크를 스마트폰으로 전송하는 「펫메이트」 서비스다. 서비스의 핵심은 동물병원에서 반려동물 보호자에게 발송하는 문자메시지의 전달력을 높이는 것에 있다. 기존 문자메세지는 텍스트를 기반으로 보내지기 때문에 큰 영향력을 발휘하지 못했다. 단순히 예약 정보나 동물병원의 기타 소식을 보내는 형태였기 때문에 보호자가 흥미를 가질 요소가 현저히 부족했기 때문이다.
										○ 개별 동물병원용 ‘맞춤형 모바일 매거진’, 「펫메이트」 출시
										   - 흥미 요소와 시각적 주목 요소를 동시에 지닌 차별화된 고객관리 서비스 –
										   - 고객 이탈 방지를 통한 개별 동물병원의 경쟁력 확보 가능해 - 
										펫메이트는 동물병원 정보와 함께 흥미로운 반려동물 정보까지 포함해 기존 문자메세지 방식의 한계를 극복했다. 실제 매거진에 사용되는 반려동물 관련 콘텐츠들은 모두 페이스북 페이지(팔팔포스트)에서 대중들에게 큰 반응을 얻었던 내용만을 선별한 것으로 흥미를 끌기에 충분하다. 구성 방식 외에도 모든 콘텐츠가 모바일 환경에 최적화된 ‘이미지 위주’로 제작돼 가독성이 높다는 점도 주목할 만하다. 이뿐만이 아니다. 간단한 링크 형식으로 누구나 전달할 수 있게 제작돼 1차 수신자들에 의한 2,3차 확산 가능성도 보유했다. 잠재 고객 창출에도 영향력을 끼칠 수 있는 강점이다. 
										다양한 강점을 보유한 펫메이트는 보호자들과의 관계를 지속시키고 다른 병원으로의 이탈을 막아 핵심 경쟁력을 갖출 수 있다는 것이 제작자의 전언이다. 개별 동물병원용 ‘맞춤형 모바일 매거진’ 펫메이트 서비스를 개발한 닥터메이트㈜ 이병철 대표는 “병원간 경쟁이 심한 개원가에서 기존 고객을 지키는 것은 신규 고객 창출에 앞선 최우선 과제다”라며 “펫메이트는 스마트폰이 상용화된 모바일 환경에 최적화된 고객관리 서비스로, 제작 비용 대비 높은 효과를 나타낼 것으로 예상한다”고 전했다. 
										제작사인 닥터메이트㈜는 지난 2001년부터 현재까지 병원홍보를 전문적으로 진행해 온 홍보대행사다. 10여년 넘게 의학회 및 대학병원, 개원가 등 100여개가 넘는 의료기관의 마케팅 성공 사례를 보유한 경험을 보유하고 있다. 또한 이를 바탕으로 최근 병원 및 동물병원의 ‘모바일 마케팅’ 분야로 사업 영역을 넓혀 주목을 받고 있다.
                       </p>
                   </div>
                 </div>
               </div>
         
               <div class="col-md-4" style="float:left">
                 <div class="card mb-2">
                   <img class="card-img-top" src="<c:url value='/resources/images/news9.jpg'/>"
                     alt="Card image cap">
                   <div class="card-body" style="text-align:center">
                     <h4 class="card-title">전국 최초 ´반려동물 친환경 장묘시설´ 조성 추진</h4>
                     <p class="card-text">창원시설공단이 공공기관으로는 전국 최초로 '반려동물 친환경 장묘시설' 조성을 추진한다. 권영균 공단 기획전략부장은 18일 시청 프레스센터에서 공단업무 브리핑을 통해 "반려동물을 키우는 가정이 급증하면서 사체 처리방식이 사회적 문제로 대두됨에 따라 반려동물 장묘시설 조성을 추진키로 했다"고 밝혔다. 현재 반려동물이 동물병원에서 죽으면 폐기물관리법에 따라 소각 처리되지만, 일반 가정에서 발생되는 동물 사체는 일반폐기물 처리법에 따라 생활쓰레기 봉투에 담아 폐기하는 실정이다. 또한 죽은 반려동물의 불법 매립과 투기 등 무분별한 사체 처리로 병원균 등 각종 질병을 옮길 수 있다는 우려가 나오고, 동물 사체의 쓰레기봉투 처리는 여름철 악취와 함께 반려동물 보호자 정서에도 맞지 않는다는 지적이 끊이지 않았다.

이에 따라 공단은 반려동물을 가족 구성원으로 인식하는 사회적 추세에 부응하고, 위생적•안정적 사후 처리로 감염병 예방 및 환경오염방지를 위해 공공 차원의 장묘시설 조성을 고려하게 됐다고 설명했다. 현재 농림축산식품부에 정식허가를 받고 동물 장례 및 화장을 하는 장묘업체는 경기도를 포함 수도권 13개, 부산권 1개 등 총 14개로 모두 민간시설이다. 이들 시설에서는 동물도 사람처럼 화장하고 납골당에 유골을 보관할 수 있지만, 동물 몸무게에 따라 최소 30만원에서 50만원이 소요된다. 거기에 값비싼 수의까지 선택하면 많게는 300만원~400만원의 비용이 들어간다. 공단은 "선진국의 경우처럼 공공기관이 적극적으로 개입해 체계적이고 위생적인 공공처리시스템을 구축, 환경•위생문제 해결은 물론 동물의 생명윤리에 관한 인식을 제고할 필요성이 있다"고 강조했다. 아울러 공공기관이 직접 관리•운영할 경우 민간 시설보다 저렴한 이용료를 통해 반려동물 보호자들의 부담도 줄일 수 있을 것이라고 덧붙였다.

공단은 동물 장묘시설 조성을 위해 각계 시민들의 의견을 수렴하는 한편, 타당성과 수요예측, 문제점 등을 면밀히 분석해 추진할 계획이다. 창원시는 지난해 말 기준으로 등록된 반려동물만 총 20,184두에 달하고, 유기동물도 1,620두에 이르는 것으로 집계됐다. 등록이 의무제가 아니기 때문에 등록하지 않은 반려동물을 합하면 전체 가구의 18%인 7만4천여 가구가 반려동물을 사육하고 있는 것으로 추산하고 있다.
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
	                    <div style="text-align: center;">
	                        <span style="font-size:2em;">${serverTime} 입양해주세요</span>
	                        <div style="float: left;width: 50%;height: 400px;">
                        		<img src="${lost_one.img_src}" alt="이미지" style="width:100%;height: 100%;">
                        	</div>
                       		<div style="overflow: auto;text-align: left;padding-left: 20px">
                       			<div style="margin-top:100px;">
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
	    </div>
      <!-- Container Ends -->
    </section>