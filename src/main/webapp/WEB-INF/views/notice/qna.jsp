<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 파일명은 이곳에 -->
<title>qna.jsp</title>
<!-- script는 이쪽 아래에 -->

<!-- body는 아래에 -->

<div class="page-header">
	<h1>
		1대1문의<small>목록 페이지</small>
	</h1>
</div>
<div class="row" style="margin-bottom: 10px">
	<div class="col-md-11 text-right">
		<a href="<c:url value='/notice/Write.aw'/>" class="btn btn-success">등록</a>
	</div>
</div>

<div class="container">
	<!-- 테이블전체 가로폭은 테이블을 감싸는  div에 col-*-*로 조정 -->
	<div class="col-md-12 center">

		<table class="table table-hover table-bordered text-center">
			<tr class="d-flex">
				<!-- 각 컬럼의 폭은 <td>계열에 class="col-*-*"추가 -->
				<th class="col-1">번호</th>
				<th class="col-5">제목</th>
				<th class="col-4">작성자</th>
				<th class="col-2">등록일</th>
			</tr>


			<c:if test="${empty requestScope.list }" var="isEmpty">
				<tr>
					<td colspan="6">등록된 게시물이 없어요</td>
				</tr>
			</c:if>
			<c:if test="${not isEmpty }">
				<c:forEach var="record" items="${list}" varStatus="loop">
					<tr>
						<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>

						<td class="text-center"><a
							href="<c:url value='/notice/View.kosmo?no=${record.no}'/>">${record.title }</a></td>
						<td>${record.name}</td>

					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>

</div>
</div>