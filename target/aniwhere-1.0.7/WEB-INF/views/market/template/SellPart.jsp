<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>판매게시판</title>


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




		<div class="card-header">판매게시판</div>
		<div class="card-block p-0">
		
		<div style="text-align:right"> 
		<a href="<c:url value='/market/SellWrite.aw'/>"><button style="width:65px;height:40px" type="submit" class="btn btn-primary"><img src = "<c:url value='/resources/images/maketimages/Write.png'/>" style="width:20px;height:20px"/>등록</button></a>
		</div>
			<table class="table table-bordered table-sm m-0">
				<thead class="table" style="background-Color: CYAN">
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
						<td>2018-08-17</td>
					</tr>
					
					<c:forEach var="record" items="${list}" varStatus="loop">
				
						<tr>
						<td>
						<span id="no">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</span></td>
							
						<!-- 타이틀 로직 -->
							
							<td class="text-left">
				
							<span id="animal_code">
						<c:choose>
							<c:when test="${record.animal_code eq '1'}">
								<span>[개]</span>
							</c:when>
							<c:when test="${record.animal_code eq '2'}">
								<span>[고양이]</span>		
							</c:when>
							<c:when test="${record.animal_code eq '3'}">
								<span>[파충류]</span>
							</c:when>
							<c:when test="${record.animal_code eq '4'}">
								<span>[조류]</span>
							</c:when>
							<c:otherwise>
								<span>[기타포유류]</span>
							</c:otherwise>
						</c:choose>
					</span>
																																						 
								<a href="<c:url value='/market/sellinside.aw?no=${record.no}'/>">
								
								<span id="title">${record.title }</span></a>
							
						        </td>
						        <!--  타이틀 끝 -->
							
							<td><span id="mem_no">${record.mem_nickname}</span></td>
							<td><span id="count">${record.count} </span> </td>
							<td><span id="regidate">${record.regidate}</span></td>
						</tr>
						
					</c:forEach>

					
			
				</tbody>
			</table>
		</div>


		<div class="row col-lg-4 col-md-4 col-sm-4 col-xs-4"
			style="float: none; margin: 0 auto;">

			<nav aria-label="...">
				<ul class="pagination justify-content-end mt-3 mr-3">




					<li class="page-item disabled"><span class="page-link">Previous</span>
					</li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><span class="page-link">2<span
							class="sr-only"></span>
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

		<!-- 마우스 오버시 1.사진 나오는 api필요 2.색바뀜 3.댓글수 옆에 표시 -->

	</div>

	<div></div>

	<!-- 푸터 와야하는 자리 -->
	<div style="margin-top: 50px;"></div>


	<section></section>

</body>

