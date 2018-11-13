<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>

#aniFooter {
   background: url("<c:url value='/resources/images/footer1.png'/>");
   /* background:rgba(255,255,255, 0.5); */
   background-position: center;
   background-repeat: no-repeat;
   background-size: 100%;
   padding-top:90px;
   padding-bottom:90px;
}
.footul{
   font-weight:bold;
   font-size:20px;   
}
.footul li{
   list-style:none;
   margin-left:4px;
   font-size:13px;   
   margin-top:5px;
}
.footul li a{
   color:#08088A;
}
.footul a{
   color:black;
}
</style>

<!-- footer -->
<div class="container" id="aniFooter" style="margin-top:15px;clear:both">
		<div class="row">
			<div class="mbr-footer-content col-xs-12 col-md-2">
				<ul class="footul">
				<span>동물</span>
					<li><a href="#">강아지</a></li>
					<li><a href="#">고양이</a></li>
					<li><a href="#">파충류&양서류</a></li>
					<li><a href="#">조류</a></li>
					<li><a href="#">기타 포유류</a></li>
					<li><a href="<c:url value='/animal/freeboard.aw'/>">자유 게시판</a></li>
				</ul>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-2">
					<ul class="footul"><a href="#">
					<span>장터</span></a>
						<li><a href="#">팔아요</a></li>
						<li><a href="#">사요</a></li>
						<li><a href="#">같이 싸게 사요</a></li>
					</ul>
					<ul class="footul"><a href="#"><span>♡만나요</span></a>
					</ul>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-2">
					<ul class="footul"><a href="<c:url value='/miss/miss.aw'/>">
					<span>유기동물</span></a>
						<li><a href="<c:url value='/miss/see.aw'/>">봤어요</a></li>
						<li><a href="<c:url value='/miss/find.aw'/>">찾아요</a></li>
						<li><a href="<c:url value='/miss/shelter.aw'/>">보호소</a></li>
					</ul>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-3">
					<ul class="footul">
						<a href="#"><span>위치</span></a>
						<li><a href="#">우리 아이가 아플때</a></li>
						<li><a href="#">아이를 맡겨야 할때</a></li>
						<li><a href="#">용품을 사고 싶을때</a></li>
						<li><a href="#">입양을 하고 싶을때</a></li>
						<li><a href="#">산책을 하고 싶을때</a></li>
					</ul>
			</div>
			<div class="mbr-footer-content col-xs-12 col-md-3">
					<ul class="footul">
						<a href="#" id="notice"><span>공지사항</span></a>
					</ul>
					<ul class="footul">
						<span>주소</span>
						<li>서울시 금천구 가산동 </li>
						<li>한국소프트웨어인재개발원</li>
					</ul>
					<ul class="footul">
						<span>연락처</span>
						<li>Email: cres87@me.com</li>
						<li>Phone: +82 010-8957-3287</li>
					</ul>
			</div>
	</div>
</div>