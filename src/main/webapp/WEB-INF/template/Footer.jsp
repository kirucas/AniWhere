<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Footer -->
<!-- 
https://mdbootstrap.com/components/bootstrap-footer/
 -->
<style>
nav {
	font-family: 메이플스토리;
}

p {
	font-family: 메이플스토리;
}

h2 {
	font-family: 메이플스토리;
}

h1 {
	font-family: 메이플스토리;
}

body {
	font-family: 메이플스토리;
}

#aniFooter {
	background: url("<c:url value='/resources/images/footer1.png'/>");
	/* background:rgba(255,255,255, 0.5); */
	background-position: center;
	background-repeat: no-repeat;
	background-size: 100%;
}

div .mbr-footer-content {
	color: black;
	font-weight: bold;
	/* background-color:pink; */
}

.mbr-footer-content p a {
	color: black;
}


</style>

<!-- footer -->
<section class="mbr-section mbr-section-md-padding mbr-footer footer1"
	 style="padding-top: 90px; padding-bottom: 90px;" id="aniFooter">
	<div class="container">
		<div class="row" style="margin-left:50px">
			<div class="mbr-footer-content col-xs-12 col-md-2">
				<p style="margin-left:10px">
					<strong>동물</strong><br> 
					<a class="text-black" href="#">강아지</a><br>
					<a class="text-black" href="#">고양이</a><br> 
					<a class="text-black" href="#">파충류 & 양서류</a><br> 
					<a class="text-black" href="#">조류</a><br> 
					<a class="text-black" href="#">기타 포유류</a><br> 
					<a class="text-black" href="#">자유 게시판</a>
				</p>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-2">
				<p style="margin-left:10px">
					<strong>장터</strong><br> 
					<a class="text-black" href="#">팔아요</a><br>
					<a class="text-black" href="#">사요</a><br> 
					<a class="text-black" href="#">같이 싸게 사요</a><br> 
				</p>
				<p style="margin-left:10px">
					<strong>♡ 만나요</strong><br> 
					<a class="text-black" href="#">만나요!</a><br>
					<a class="text-black" href="#">프로필 카드 등록해요</a><br> 
					
				</p>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-2">
				<p style="margin-left:10px">
					<strong>유기동물</strong><br> 
					<a class="text-black" href="#">봤어요</a><br>
					<a class="text-black" href="#">찾아요</a><br> 
					<a class="text-black" href="#">보호소</a><br> 
				</p>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-2">
				<p style="margin-left:10px">
					<strong>위치</strong><br> 
					<a class="text-black" href="#">우리 아이가 아플때</a><br>
					<a class="text-black" href="#">아이를 맡겨야 할때</a><br> 
					<a class="text-black" href="#">용품을 사고 싶을때</a><br> 
					<a class="text-black" href="#">입양을 하고 싶을때</a><br> 
					<a class="text-black" href="#">산책을 하고 싶을때</a><br> 
				</p>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-3">
				<p style="margin-left:10px">
					<strong class="footerP">주소</strong><br> 서울시 금천구 가산동<br>
					한국소프트웨어인재개발원
				</p>
				<p style="margin-left:10px">
					<strong>연락처</strong><br> Email: cres87@me.com<br> Phone:
					+82 010-8957-3287
				</p>
			</div>
			
		</div>
	</div>
</section>
<!-- Go To Top Link -->
<a href="#" class="back-to-top"> <i class="fa fa-angle-up"> </i>
</a>

<div class="bottom">
	<a href="#" class="settings"></a>
</div>