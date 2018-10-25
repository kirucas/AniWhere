<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>구매게시판</title>

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



	<div class="card mb-5" style="margin-top: 50px">

<!-- 
<a href="<c:url value='/views/market/insidebuy.aw'/>"> asdasd</a> -->

		<div class="card-header">구매게시판</div>
		
		<div class="card-block p-0">
		
	
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

						<td>90</td>

						<td>[파충류][소형][케이지]도마뱀용 유리 케이지 구매합니다 깨끗한걸로</td>
						<td>Jan_sina</td>
						<td>180</td>
						<td>20180-09-14</td>
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


		

		<!-- 검색용 UI -->

		
		
		
		</div>

		<!-- 마우스 오버시 1.사진 나오는 api필요 2.색바뀜 3.댓글수 옆에 표시 -->

	

	<div></div>

	<!-- 푸터 와야하는 자리 -->
	<div style="margin-top: 50px;"></div>


	<section></section>

</body>

