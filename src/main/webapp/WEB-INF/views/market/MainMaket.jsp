<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩  템플릿</title>
	

    



</head>
<body>
<div class="container">

<!-- top 와야하는 자리 -->
	
		<jsp:include page="../market/template/MaketTop.jsp" />
		
	
	<!-- 푸터 와야하는 자리 -->
	<div style="margin-top: 50px;">
	
	</div>
	
	

</div>
</body>


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
