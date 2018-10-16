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
<title>구매게시판</title>

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js">


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

.public {
	color: red;
	font-weight: bold;
}
</style>

<!-- 팝니다 게시판의 swiper 로직 -->



</head>
<body>


	<!-- top 와야하는 자리 -->



	<header> </header>





	<div class="card mb-5" style="margin-top: 50px">

<!-- 
<a href="<c:url value='/views/market/insidebuy.aw'/>"> asdasd</a> -->

		<div class="card-header">구매게시판</div>
		
		<div class="card-block p-0">
		
		<div style="text-align:right"> 
	<a href="<c:url value='/market/buyWrite.aw'/>">	<button style="width:65px;height:40px" type="submit" class="btn btn-primary"><img src = "<c:url value='/resources/images/maketimages/Write.png'/>" style="width:20px;height:20px"/>
		등록</button></a>
		</div>
			<table class="table table-bordered table-sm m-0">
				<thead class="table-warning">
					<tr>

						<th style="width: 50px">게시번호</th>
						<th style="width: 400px">제목</th>
						<th style="width: 50px">작성자</th>
						<th style="width: 50px">조회수</th>
						<th style="width: 50px">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr class="public">

						<td>1</td>
						<td>[공지사항]민사상 법률 팁 사기예방 공지사항</td>
						<td>관리자</td>
						<td>557</td>
						<td>20180-08-17</td>
					</tr>


					<tr>

						<td>95</td>

						<td><a href="<c:url value='/market/buyinside.aw'/>">[조류][소형][새장]카나리아 넣어서키울만한 새장 사요</a>
					
						 </td>
						<td>Jan_sina</td>
						<td>180</td>
						<td>20180-09-14</td>
					</tr>

					<tr>

						<td></td>

						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

					<tr>

						<td>67</td>

						<td>[개][대형][사료]골든리트리버 사료 구매합니다 완전 새거! [2]</td>
						<td>Jan_sina</td>
						<td>200</td>
						<td>20180-09-14</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="row col-lg-4 col-md-4 col-sm-4 col-xs-4"
			style="float: none; margin: 0 auto;">

			<nav aria-label="...">
				<ul class="pagination justify-content-end mt-3 mr-3">




					<li class="page-item disabled"><span class="page-link">Previous</span>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><span class="page-link">2<span
							class="sr-only">(current)</span>
					</span></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">6</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>


			</nav>
		</div>

		<!-- 검색용 UI -->

		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
				style="float: none; margin: 0 auto;">
				<form class="form-inline" method="post"
					action="<c:url value='/ReplyBBS/BBS/List.bbs'/>">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" name="searchWord" class="form-control" />
					</div>
					<button type="submit" class="btn btn-primary">검색</button>

				</form>
			</div>
		</div>
		
		
		</div>

		<!-- 마우스 오버시 1.사진 나오는 api필요 2.색바뀜 3.댓글수 옆에 표시 -->

	

	<div></div>

	<!-- 푸터 와야하는 자리 -->
	<div style="margin-top: 50px;"></div>


	<section></section>

</body>
</html>
