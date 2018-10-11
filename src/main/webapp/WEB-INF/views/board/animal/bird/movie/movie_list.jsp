<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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

.page-link {
	color: #1ABC9C;
}
</style>

<div class="container">

	<c:if test="${empty requestScope.list }" var="isEmpty">
		<div>
			<h5 colspan="4">등록된 게시물이 없어요</h5>
		</div>
	</c:if>

	<c:if test="${not isEmpty }">
		<c:forEach var="record" items="${list}" varStatus="loop">
			<div class="row margin-top-30">
				<div class="col-sm">
					<div class="embed-responsive embed-responsive-16by9 movie-size">
						<iframe class="embed-responsive-item"
							src="${record.src }https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
							allowfullscreen></iframe>
					</div>
					<c:forEach begin="1"
							end="${record.depth}" varStatus="loopvar">
		    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    				<c:if test="${loopvar.last}"></c:if>
						</c:forEach>
						<a href="<c:url value='/animal/bird/movie/write.aw?no=${record.no}'/>">${record.title }</a>
					<div class="media-body">
						<h5 class="title">${record.title}간만에 산책나와 무척 신나긴 한데</h5>
						<p class="id">${record.id}올린 사람의 아이디</p>
					</div>
					<div class="media-footer">
						<small class="hits">${record.hits}조회수</small>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>

	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/lWjKdyWsDMI" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">사람들이 앵무새를 키우는 이유 2018 웃긴영상
				ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/jxq3F9PQ_FA" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
</div>

<div class="row margin-top-10">
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/lWjKdyWsDMI" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/jxq3F9PQ_FA" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
</div>
<!-- 중간에 라인 -->
<div class="margin-top-30">
	<hr class="line"></hr>
</div>
<div class="margin-top-30"></div>
<div class="row margin-top-10">
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/lWjKdyWsDMI" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/jxq3F9PQ_FA" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
</div>

<div class="row margin-top-10">
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/lWjKdyWsDMI" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
	<div class="col-sm">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/jxq3F9PQ_FA" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">List-based media object</h5>
			<p class="id">올린 사람의 아이디</p>
		</div>
		<div class="media-footer">
			<small class="hits">조회수</small>
		</div>
	</div>
</div>

<!-- 아래에 글쓰기 버튼 -->
<div class="text-right">
	<a class="btn btn-primary"
		href="<c:url value='/animal/bird/movie/write.aw'/>" role="button">동영상
		올리기</a>
</div>

<!-- 아래 라인 -->
<div class="margin-top-10">
	<hr class="line"></hr>
</div>

<div class="footer margin-top-20">
	<nav class="mx-auto" style="width: 450px;"
		aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">6</a></li>
			<li class="page-item"><a class="page-link" href="#">7</a></li>
			<li class="page-item"><a class="page-link" href="#">8</a></li>
			<li class="page-item"><a class="page-link" href="#">9</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</div>
</div>

