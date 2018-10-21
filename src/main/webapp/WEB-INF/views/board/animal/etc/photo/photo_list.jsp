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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_1.jpg' />" alt="etc_1" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_2.jpg' />" alt="etc_2" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_3.jpg' />" alt="etc_3" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_4.jpg' />" alt="etc_4" />
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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_5.jpg' />" alt="etc_5" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_6.jpg' />" alt="etc_6" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_7.jpg' />" alt="etc_7" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_8.jpg' />" alt="etc_8" />
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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_9.jpg' />" alt="etc_9" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_10.jpg' />" alt="etc_10" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_11.jpg' />" alt="etc_11" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_12.jpg' />" alt="etc_12" />
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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_13.jpg' />" alt="etc_13" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_14.jpg' />" alt="etc_14" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_15.jpg' />" alt="etc_15" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/etc/etc_16.jpg' />" alt="etc_16" />
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