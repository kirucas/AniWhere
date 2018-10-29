<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<%@ include file="/WEB-INF/views/common/loading.jsp" %>
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

.margin-top-60 {
	margin-top: 6.0em;
}

/* 라인 긋기 */
.line {
	text-align: center;
}
/* 아이디, 조회수, 아래 페이지네이션에 메인 칼라 추가 */
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
	<div class="row margin-top-30">
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item" 
				src="https://www.youtube.com/embed/h0WpHRqMaTI"
				frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="media-body">
				<h5 class="title">원빈도마뱀 "블랙나이트" 정말 비싸지만 너무 이쁜 도마뱀입니다.</h5>
				<p class="id">올린 사람의 아이디</p>
			</div>
			<div class="media-footer">
				<small class="hits">조회수</small>
			</div>
		</div>
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item" 
				src="https://www.youtube.com/embed/fLIE1Pw0r4o"
				frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="media-body">
				<h5 class="title">초거대뱀이 왔습니다. 몸을 휘감아버렸는데...</h5>
				<p class="id">올린 사람의 아이디</p>
			</div>
			<div class="media-footer">
				<small class="hits">조회수</small>
			</div>
		</div>
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item" 
				src="https://www.youtube.com/embed/-LE1pOt16DE"
				frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="media-body">
				<h5 class="title">피규어같은 최강비쥬얼 개구리 아마존 밀키프록</h5>
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
	</div>>
</div>

