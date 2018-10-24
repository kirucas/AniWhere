<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.text-right {
	text-align: right;
}

.title {
	/* 일정 글자 수 이상은 안보이게 하는 효과 */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	line-height: 1.2em;
	height: 2.4em;
}

/* 행 사이 공간 주기 */
.margin-top-10 {
	margin-top: 1.0em;
}

.margin-top-20 {
	margin-top: 2.0em;
}

.margin-top-30 {
	margin-top: 3.0em;
}

/* 라인 긋기 */
.line {
	text-align: center;
}

/* 아이디, 조회수, 아래 페이지네이션에 메인 칼라 추가 */
.btn-primary {
	background-color: #1ABC9C;
	border-color: #1ABC9C;
}

.id {
	color: #1ABC9C;
}

.hits {
	color: #1ABC9C;
}

.pagination {
	margin-left: 150px;
}
</style>

<div class="row">

	<c:if test="${empty requestScope.list}" var="isEmpty">
		<div class="col-xs-12">
			<h5 colspan="4">등록된 게시물이 없어요</h5>
		</div>
	</c:if>

	<c:if test="${not isEmpty}">
		<c:forEach var="dto" items="${list}" varStatus="loop">
			<div class="col col-xs-12 col-sm-4 margin-top-30">
				<div class="col-sm">
					<div class="embed-responsive embed-responsive-16by9 movie-size">
						${dto.movie_tempsrc}
						<!-- 
						<iframe class="embed-responsive-item"
							src="https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
							allowfullscreen></iframe> -->
					</div>
					<a
						href="<c:url value='/animal/bird/movie/Write.aw?no=${dto.movie_no }'/>">${dto.movie_title }</a>
					<div class="media-body">
						<h5 class="title">${dto.movie_title}</h5>
						<p class="nickname">${dto.mem_nickname}</p>
					</div>
					<div class="media-footer">
						<small class="count">조회수: ${dto.movie_count}</small>
					</div>
				</div>
			</div>
			<!-- 중간에 라인 -->
			<c:if test="${(loop.index+1) % 6==0}">
				<div class="col-xs-12 col-sm-12"
					style="border: 1px solid gray; margin-top: 10px"></div>
			</c:if>
		</c:forEach>
	</c:if>
</div>

<div>
	<!-- 페이지네이션 -->
	<div class="margin-top-20 pagination">
		<nav class="mx-auto" style="width: 450px;"
			aria-label="Page navigation example">
			<div class="row">
				<div>${pagingString}</div>
			</div>
		</nav>
	</div>

	<!-- 아래에 동영상 올리기 버튼 -->
	<div class="text-right">
		<a class="btn btn-primary"
			href="<c:url value='/animal/bird/movie/Write.aw'/>" role="button">동영상
			올리기</a>
	</div>
</div>