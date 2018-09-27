<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.card-group {
		margin-bottom: 5px;
	}
	
	/* .card-img-top {
		max-height: 180px;
	} */
	
	@media ( max-width : 319px ) {
		.card-img-top {
			height: 200px;
		}
	}
	
	@media ( min-width : 320px ) {
		.card-img-top {
			height: 240px;
		}
	}
	
	@media ( min-width : 544px ) {
		.card-img-top {
			height: 180px;
		}
	}
	
	@media ( min-width : 768px) {
		.card-img-top {
			height: 130px;
		}
	}
	
	@media ( min-width : 992px ) {
		.card-img-top {
			height: 170px;
		}
	}
	
	@media ( min-width : 1200px) {
		.card-img-top {
			height: 180px;
		}
	}
	
</style>

<c:set var="now" value="<%=new java.util.Date() %>" />

<div class="container">

	<div class="row">
		<div class="card-group">
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_1.jpg' />" alt="rNa_1" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_2.jpg' />" alt="rNa_2" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_3.jpg' />" alt="rNa_3" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_4.jpg' />" alt="rNa_4" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_5.jpg' />" alt="rNa_5" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_6.jpg' />" alt="rNa_6" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_7.jpg' />" alt="rNa_7" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_8.jpg' />" alt="rNa_8" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_9.jpg' />" alt="rNa_9" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_10.jpg' />" alt="rNa_10" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_11.jpg' />" alt="rNa_11" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_12.jpg' />" alt="rNa_12" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_13.jpg' />" alt="rNa_13" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_14.jpg' />" alt="rNa_14" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_15.jpg' />" alt="rNa_15" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/rNa/rNa_16.jpg' />" alt="rNa_16" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">작성 시간</small>
				</div>
			</div>
		</div>
	</div>

</div>