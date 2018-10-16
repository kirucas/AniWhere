<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩  템플릿</title>
	
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
    



</head>
<body>
<div class="container">

<!-- top 와야하는 자리 -->
<div class="card mb-5" style="margin-top: 50px" >
		
		<jsp:include page="../market/template/MaketTop.jsp" />
	
		</div>


	<div class="card mb-5" style="margin-top: 50px" >
		
		<jsp:include page="../market/template/BuyPartMain.jsp" />
	
		</div>


<div class="card mb-5" style="margin-top: 50px">
	
	<jsp:include page="../market/template/SellPartMain.jsp" />
	
	</div>
	
	<div class="card mb-12" style="margin-top: 50px">
	
	<jsp:include page="../market/template/WithBuyMain.jsp"/>
	

	
	<!-- 푸터 와야하는 자리 -->
	<div style="margin-top: 50px;">
	
	</div>
	
	

</div>

</body>


</html>
<!--  수정중 
	<div class="row">
		<div class="list-group">
			<a href="<c:url value='/market/buy.aw' />" class="list-group-item list-group-item-action">buy</a>
			<a href="<c:url value='/market/sell.aw' />" class="list-group-item list-group-item-action">sell</a>
			<a href="<c:url value='/market/groupbuy.aw' />" class="list-group-item list-group-item-action">group buy</a>
		</div>
	</div>
	-->

<!-- 내용 끝 -->
