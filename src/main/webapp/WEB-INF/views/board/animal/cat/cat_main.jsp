<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<script>
	<script>
	/* Demo purposes only */
	$(".dog-main").mouseleave(
	  function () {
	    $(this).removeClass("dog-main");
	  }
	);
</script>
<style>
	@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
	.dog-main img{
		width: 277px;
		height: 277px;
		margin-right: -5px;
	}
	.dog-main img:hover{
		opacity: 0.3;
		background-color: #212121;
	}
	
	/* 사진 게시판 미리보기용 */
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
	/* 동영상 게시판 미리보기용 */
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
	/* 팁 게시판 미리보기용 */
	
	#tip_no{
		text-align:center;
		font-size: 1.5em;
	}
	.sub-header-info{
		padding-bottom:0px;
	}
	
</style>

<!-- 내용 시작 -->
	<span style="font-size: 5em;margin-left: -10px">사진 게시판 미리보기</span>
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
	
	<span style="font-size: 5em;margin-left: -10px">동영상 게시판 미리보기</span>
	<div class="row margin-top-30">
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item"
					src="https://www.youtube.com/embed/jxq3F9PQ_FA"
					frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="media-body">
				<h5 class="title">How to train my cats</h5>
				<p class="id">올린 사람의 아이디</p>
			</div>
			<div class="media-footer">
				<small class="hits">조회수</small>
			</div>
		</div>
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item" 
				src="https://www.youtube.com/embed/zcGOoDThC1E" 
				frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="media-body">
				<h5 class="title">Funny Cats 2018</h5>
				<p class="id">올린 사람의 아이디</p>
			</div>
			<div class="media-footer">
				<small class="hits">조회수</small>
			</div>
		</div>
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/69zLx7mVs5k"
				frameborder="0" allowfullscreen></iframe>
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
	<div class="row margin-top-30">
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item"
					src="https://www.youtube.com/embed/jxq3F9PQ_FA"
					frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="media-body">
				<h5 class="title">How to train my cats</h5>
				<p class="id">올린 사람의 아이디</p>
			</div>
			<div class="media-footer">
				<small class="hits">조회수</small>
			</div>
		</div>
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item" 
				src="https://www.youtube.com/embed/zcGOoDThC1E" 
				frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="media-body">
				<h5 class="title">Funny Cats 2018</h5>
				<p class="id">올린 사람의 아이디</p>
			</div>
			<div class="media-footer">
				<small class="hits">조회수</small>
			</div>
		</div>
		<div class="col-sm">
			<div class="embed-responsive embed-responsive-16by9 movie-size">
				<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/69zLx7mVs5k"
				frameborder="0" allowfullscreen></iframe>
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
	
	<span style="font-size: 5em;margin-left: -10px">팁 게시판 미리보기</span>
		<div class="container" style="padding-left:0px;padding-right:0px;">
		<!-- 내용 부분 시작  -->
		<section class="article-list article-list--fixed"></section>
		<section class="article-list">
			<!-- 여기서 반복문 돌려서 글 -->
			<article class="article-list-item">
				<div class="article-list-item__vote">
					<img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
					<div><span id="tip_hit">26</span></div>
				</div>
				<div class="article-list-item__content">
					<a href="#"	class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="tip_title">저새낀 혼자서 잘 못한다하는데</span> <em>[21]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="2018-09-27T05:45:00+00:00" title="">2	시간 전</span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#" id="mem_no">푸른빛불꽃 </a>
						</div>
						<div class="article-list-item-meta__item">
							조회수 <span id="tip_count">0</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="tip_no" style="text-align:center">1</span></div>
				</div>
			</article>
			<article class="article-list-item">
				<div class="article-list-item__vote">
					<img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
					<div><span id="tip_hit">26</span></div>
				</div>
				<div class="article-list-item__content">
					<a href="#"	class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="tip_title">저새낀 혼자서 잘 못한다하는데</span> <em>[21]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="2018-09-27T05:45:00+00:00" title="">2	시간 전</span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#" id="mem_no">푸른빛불꽃 </a>
						</div>
						<div class="article-list-item-meta__item">
							조회수 <span id="tip_count">0</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="tip_no" style="text-align:center">1</span></div>
				</div>
			</article>
			<article class="article-list-item">
				<div class="article-list-item__vote">
					<img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
					<div><span id="tip_hit">26</span></div>
				</div>
				<div class="article-list-item__content">
					<a href="#"	class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="tip_title">저새낀 혼자서 잘 못한다하는데</span> <em>[21]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="2018-09-27T05:45:00+00:00" title="">2	시간 전</span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#" id="mem_no">푸른빛불꽃 </a>
						</div>
						<div class="article-list-item-meta__item">
							조회수 <span id="tip_count">0</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="tip_no" style="text-align:center">1</span></div>
				</div>
			</article>
			<article class="article-list-item">
				<div class="article-list-item__vote">
					<img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
					<div><span id="tip_hit">26</span></div>
				</div>
				<div class="article-list-item__content">
					<a href="#"	class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="tip_title">저새낀 혼자서 잘 못한다하는데</span> <em>[21]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="2018-09-27T05:45:00+00:00" title="">2	시간 전</span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#" id="mem_no">푸른빛불꽃 </a>
						</div>
						<div class="article-list-item-meta__item">
							조회수 <span id="tip_count">0</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="tip_no" style="text-align:center">1</span></div>
				</div>
			</article>
			<article class="article-list-item">
				<div class="article-list-item__vote">
					<img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
					<div><span id="tip_hit">26</span></div>
				</div>
				<div class="article-list-item__content">
					<a href="#"	class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="tip_title">저새낀 혼자서 잘 못한다하는데</span> <em>[21]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="2018-09-27T05:45:00+00:00" title="">2	시간 전</span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#" id="mem_no">푸른빛불꽃 </a>
						</div>
						<div class="article-list-item-meta__item">
							조회수 <span id="tip_count">0</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="tip_no" style="text-align:center">1</span></div>
				</div>
			</article>
		</section>
	</div>
	
	<span style="font-size: 5em;margin-left: -10px">질문 게시판 미리보기</span>
	<div class="row">
		<!-- 테이블전체 가로폭은 테이블을 감싸는  div에 col-*-*로 조정 -->
		<table class="table table-hover table-bordered" style="text-align: center">
			<thead id="thead" class="co">
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목<small>(댓글)</small></th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
					<th scope="col">좋아요</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>가나다라마바사아자차카타파하 <span class="badge" id="badge">(2)</span></td>
					<td>홍길동</td>
					<td>2018.10.09</td>
					<td>11</td>
					<td><i class="fas fa-heart" id="heart"></i>123</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>가나다라마바사아자차카타파하</td>
					<td>홍길동</td>
					<td>2018.10.09</td>
					<td>11</td>
					<td>123</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>가나다라마바사아자차카타파하</td>
					<td>홍길동</td>
					<td>2018.10.09</td>
					<td>11</td>
					<td>123</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>가나다라마바사아자차카타파하</td>
					<td>홍길동</td>
					<td>2018.10.09</td>
					<td>11</td>
					<td>123</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td>가나다라마바사아자차카타파하</td>
					<td>홍길동</td>
					<td>2018.10.09</td>
					<td>11</td>
					<td>123</td>
				</tr>
			</tbody>
		</table>
	</div>
<!-- 내용 끝 -->