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

					<c:forEach var="record" items="${list}" varStatus="loop">
						<tr>
						<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}일련번호</td>
							<td class="text-left"><c:forEach begin="1"
									end="${record.depth}" varStatus="loopvar">
		    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:if test="${loopvar.last}">
		    					└☞
		    				</c:if>
								</c:forEach> <a
								href="<c:url value='/ReplyBBS/BBS/View.bbs?no=${record.no}'/>">${record.title }</a>
							제목</td>
							<td>${record.name} 작성자</td>
							<td>조회수   </td>
							<td>${record.postdate} 등록일</td>
						</tr>
					</c:forEach>

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

