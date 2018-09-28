<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>


<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>거래 게시판 통합 페이지</title>

<!-- 부트스트랩 -->
<link href="<c:url value='/Bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>
   <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js">

  
<style>

html {
	font-family: Lato, 'Helvetica Neue', Arial, Helvetica, sans-serif;
	font-size: 14px;
}

.table {
	border: none;
}

.table-definition thead th:first-child {
	pointer-events: none;
	background: white;
	border: none;
}

.table td {
	vertical-align: middle;
}

.page-item>* {
	border: none;
}

.custom-checkbox {
	min-height: 1rem;
	padding-left: 0;
	margin-right: 0;
	cursor: pointer;
}

.custom-checkbox .custom-control-indicator {
	content: "";
	display: inline-block;
	position: relative;
	width: 30px;
	height: 10px;
	background-color: #818181;
	border-radius: 15px;
	margin-right: 10px;
	-webkit-transition: background .3s ease;
	transition: background .3s ease;
	vertical-align: middle;
	margin: 0 16px;
	box-shadow: none;
}

.custom-checkbox .custom-control-indicator:after {
	content: "";
	position: absolute;
	display: inline-block;
	width: 18px;
	height: 18px;
	background-color: #f1f1f1;
	border-radius: 21px;
	box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.4);
	left: -2px;
	top: -4px;
	-webkit-transition: left .3s ease, background .3s ease, box-shadow .1s
		ease;
	transition: left .3s ease, background .3s ease, box-shadow .1s ease;
}

.custom-checkbox .custom-control-input:checked ~
	.custom-control-indicator {
	background-color: #84c7c1;
	background-image: none;
	box-shadow: none !important;
}

.custom-checkbox .custom-control-input:checked ~
	.custom-control-indicator:after {
	background-color: #84c7c1;
	left: 15px;
}

.custom-checkbox .custom-control-input:focus ~ .custom-control-indicator
	{
	box-shadow: none !important;
}

.public{ color:red;
font-weight: bold;



}
</style>

<!-- 팝니다 게시판의 swiper 로직 -->
 <script>
    var swiper = new Swiper('.swiper-container', {
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 'auto',
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows : true,
      },
      pagination: {
        el: '.swiper-pagination',
      },
    });
  </script>
  
   <style>
    body {
      background: #fff;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      padding-top: 50px;
      padding-bottom: 50px;
    }
    .swiper-slide {
      background-position: center;
      background-size: cover;
      width: 300px;
      height: 300px;
    }
  </style>
  
</head>
<body>


<!-- top 와야하는 자리 -->



	<header> </header>

	<main class="container pt-5">
	
		<jsp:include page="../template/MaketTop.jsp" />
	
	<div class="card mb-5" style="margin-top: 50px" >
	
	
		<jsp:include page="../template/BuyPart.jsp" />
	
		</div>

<div>
<div class="card mb-5" style="margin-top: 50px">
		<div class="card-header" class="border border-primary">판매게시판</div>
	<jsp:include page="../template/SellPart.jsp" />
	
	
	
	</div>

	</div>
	
	<div class="card mb-12" style="margin-top: 50px">
		<div class="card-header" class="border border-primary">공동구매게시판</div>
	<jsp:include page="../template/WithBuyPart.jsp" />
	</div>

	
	<!-- 푸터 와야하는 자리 -->
	<div style="margin-top: 50px;">
	
	</div>
	
	
	
	</main>
	<section></section>



</body>
</html>
