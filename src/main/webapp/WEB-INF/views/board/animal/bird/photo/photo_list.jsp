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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_1.jpg' />" alt="bird_1" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_2.jpg' />" alt="bird_2" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_3.jpg' />" alt="bird_3" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_4.jpg' />" alt="bird_4" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_5.jpg' />" alt="bird_5" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_6.jpg' />" alt="bird_6" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_7.jpg' />" alt="bird_7" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_8.jpg' />" alt="bird_8" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_9.jpg' />" alt="bird_9" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_10.jpg' />" alt="bird_10" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_11.jpg' />" alt="bird_11" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_12.jpg' />" alt="bird_12" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-group">
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_13.jpg' />" alt="bird_13" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_14.jpg' />" alt="bird_14" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_15.jpg' />" alt="bird_15" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/bird/bird_16.jpg' />" alt="bird_16" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">50</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>

</div>