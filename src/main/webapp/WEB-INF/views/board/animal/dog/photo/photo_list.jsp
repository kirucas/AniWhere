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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_1.jpg' />" alt="dog_1" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_2.jpg' />" alt="dog_2" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_3.jpg' />" alt="dog_3" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_4.jpg' />" alt="dog_4" />
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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_5.jpg' />" alt="dog_5" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_6.jpg' />" alt="dog_6" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_7.jpg' />" alt="dog_7" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_8.jpg' />" alt="dog_8" />
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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_9.jpg' />" alt="dog_9" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_10.jpg' />" alt="dog_10" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_11.jpg' />" alt="dog_11" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_12.jpg' />" alt="dog_12" />
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
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_13.jpg' />" alt="dog_13" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">13</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_14.jpg' />" alt="dog_14" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">15</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_15.jpg' />" alt="dog_15" />
				<div class="card-body">
					<h5 class="card-title">사진 제목<span title="댓글 수" class="badge badge-secondary">45</span><span title="신규 게시물 표시" class="badge badge-primary">NEW</span></h5>
					<p class="card-text">작성자</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="<c:url value='/resources/images/board/animal/dog/dog_16.jpg' />" alt="dog_16" />
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