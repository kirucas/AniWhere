<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>

<div class="container">
	
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




	<!-- top 와야하는 자리 -->

	

	<div class="card mb-5" style="margin-top: 50px">


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
						<td>2018-08-17</td>
					</tr>
					
					<c:forEach var="record" items="${list}" varStatus="loop">
				
						<tr>
						<td>
						<span id="no">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)+1}</span></td>
							
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
																																						 
								<a href="<c:url value='/market/buyinside.aw?buy_no=${record.no}'/>">
																  
								<span id="title">${record.title}</span><em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em></a>
							
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


<!-- 검색용  -->
<div style="margin-top: 20px;">
	
	</div>

${pagingString}


		<!-- 검색용 UI -->

		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
				style="float: none; margin: 0 auto;">
				<form class="form-inline" method="post"
					action="<c:url value='/market/buy/temporarily.aw'/>">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="mem_nickname">작성자</option>
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

	<!-- 푸터 와야하는 자리 -->
	<div style="margin-top: 50px;">
	
	</div>
	
	
</div>
	
</body>

