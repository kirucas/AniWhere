<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script>
	var isDelete = function(){
		if(confirm("글을 삭제 하시겠습니까?"))
			location.replace("<c:url value='/board/animal/dog/tip/delete.aw?tip_no=${record.tip_no}'/>");
	};
</script>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#content{
	float:none;
	width:100%;
}
</style>
<div class="container">
	<div id="content">
		<div id="view">
			<div class="article">
				<div class="article-header">
					<div class="article__title">
						${record.tip_title}
						<div style="float:right;">
							<!-- 글에 대한 버튼들(자기가 쓴 글이면 수정과 삭제 가능) -->
							<!-- a href="<c:url value='/ReplyBBS/BBS/Reply.bbs?tip_no=${record.tip_no}'/>" class="btn btn-success">답변</a> -->
							<c:if test="${sessionScope.mem_no==record.mem_no }">
								<a href="<c:url value='/board/animal/dog/tip/edit.aw?tip_no=${record.tip_no}'/>" class="article-action__button button">수정</a>
								<a href="javascript:isDelete()" class="article-action__button button button--red button--red--border">삭제</a>
							</c:if>
							<a href="<c:url value='/board/animal/dog/tip/list.aw'/>" class="article-action__button button">목록</a>	
							</div>
					</div>
					<div class="article-meta">
								
						<div class="article-meta-list">
							<div class="article-meta__item article-meta__item--name">
								<a
									href="https://talk.op.gg/s/lol/tip?q=%EB%9F%B0%EB%B9%8C%EB%A1%9C%EA%BE%B8%EA%BA%BC&amp;target=user_name">
									${record.mem_no}</a>
							</div>
							<div class="article-meta__item">
								<span data-tooltip data-date="2018-10-14T06:40:37+00:00"
									title="">${record.tip_regidate}</span>
							</div>
						</div>
						<div class="article-meta-list article-meta-list--right">
							<div class="article-meta__item">
								<span>${record.tip_count}</span>
							</div>
							<div class="article-meta__item">
								<span>댓글 56</span>
							</div>
							<div class="article-meta__item">
								<span>${record.tip_hit}</span>
							</div>
						</div>
					</div>
				</div>
				<div class="article-content-wrap">
					<div class="article-content">
						${record.tip_content}
					</div>
				</div>
				<post-vote data-my_vote_score="0" data-downvote_score="3"
					data-upvote_score="71"></post-vote>
				<div class="article-footer">
					<ul class="article-footer__list">
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div data-v-f39b78c2="" data-post="820136">
		<div data-v-f39b78c2="" class="comment-wrap">
			<!---->
			<div data-v-f39b78c2="" class="comment-header">
				<h2 data-v-f39b78c2="" class="comment__title">댓글</h2>
				<span data-v-f39b78c2="" class="comment__count">총 <em
					data-v-f39b78c2="">2</em>개
				</span>
				<button data-v-f39b78c2="" type="button" class="comment__reflash">
					<img data-v-f39b78c2="" src="/images/icon-refresh@2x.png"
						width="16" alt=""> <span data-v-f39b78c2="">새로고침</span>
				</button>
				<!---->
			</div>
			<!---->
			<div data-v-f39b78c2="">
				<div data-v-f39b78c2="" class="comment-sort">
					<ul data-v-f39b78c2="" class="comment-sort__list">
						<li data-v-f39b78c2=""
							class="comment-sort__item comment-sort__item--active"><button
								data-v-f39b78c2="" type="button">인기순</button></li>
						<li data-v-f39b78c2="" class="comment-sort__item"><button
								data-v-f39b78c2="" type="button">최신순</button></li>
					</ul>
				</div>
				<div data-v-f39b78c2="" class="comment-list">
					<div data-v-f39b78c2="" class="comment-l">
						<!---->
						<div data-v-f39b78c2="" class="comment">
							<div data-v-f39b78c2="" class="comment-vote">
								<form data-v-f39b78c2="" method="POST">
									<input data-v-f39b78c2="" type="hidden" name="comment"
										value="3731685"> <input data-v-f39b78c2=""
										type="hidden" name="type" value="popular"> <input
										data-v-f39b78c2="" type="hidden" name="index" value="0">
									<button data-v-f39b78c2="" type="submit"
										class="comment-vote__up-button">추천</button>
								</form>
								<div data-v-f39b78c2="" class="comment-vote__count">0</div>
								<form data-v-f39b78c2="" method="POST">
									<input data-v-f39b78c2="" type="hidden" name="comment"
										value="3731685"> <input data-v-f39b78c2=""
										type="hidden" name="type" value="popular"> <input
										data-v-f39b78c2="" type="hidden" name="index" value="0">
									<button data-v-f39b78c2="" type="submit"
										class="comment-vote__down-button">비추천</button>
								</form>
							</div>
							<div data-v-f39b78c2="" class="comment-meta">
								<span data-v-f39b78c2="" class="comment__name"><a
									data-v-f39b78c2=""
									href="//talk.op.gg/s/lol/tip?target=user_name&amp;q=다이애나">다이애나</a></span>
								<span data-v-f39b78c2="" data-tooltip=""
									title="2018년 9월 18일 화요일 오전 10:59" class="comment__date">한
									달 전</span>
							</div>
							<div data-v-f39b78c2="" class="comment-content">
								<div data-v-f39b78c2="">
									<p>끄덕</p>
								</div>
								<!---->
							</div>
							<div data-v-f39b78c2="" class="comment-button">
								<ul data-v-f39b78c2="">
									<!---->
									<li data-v-f39b78c2=""><button data-v-f39b78c2=""
											class="comment__button">신고</button></li>
									<li data-v-f39b78c2=""><button data-v-f39b78c2=""
											class="comment__button">
											<img data-v-f39b78c2="" src="/images/icon-reply@2x.png"
												width="16" alt="">답글쓰기
										</button></li>
								</ul>
							</div>
						</div>
						<!---->
					</div>
					<div data-v-f39b78c2="" class="comment-l">
						<!---->
						<div data-v-f39b78c2="" class="comment">
							<div data-v-f39b78c2="" class="comment-vote">
								<form data-v-f39b78c2="" method="POST">
									<input data-v-f39b78c2="" type="hidden" name="comment"
										value="3731790"> <input data-v-f39b78c2=""
										type="hidden" name="type" value="popular"> <input
										data-v-f39b78c2="" type="hidden" name="index" value="1">
									<button data-v-f39b78c2="" type="submit"
										class="comment-vote__up-button">추천</button>
								</form>
								<div data-v-f39b78c2="" class="comment-vote__count">0</div>
								<form data-v-f39b78c2="" method="POST">
									<input data-v-f39b78c2="" type="hidden" name="comment"
										value="3731790"> <input data-v-f39b78c2=""
										type="hidden" name="type" value="popular"> <input
										data-v-f39b78c2="" type="hidden" name="index" value="1">
									<button data-v-f39b78c2="" type="submit"
										class="comment-vote__down-button">비추천</button>
								</form>
							</div>
							<div data-v-f39b78c2="" class="comment-meta">
								<span data-v-f39b78c2="" class="comment__name"><a
									data-v-f39b78c2=""
									href="//talk.op.gg/s/lol/free?target=user_name&amp;q=부쉬공포증">부쉬공포증</a></span>
								<span data-v-f39b78c2="" data-tooltip=""
									title="2018년 9월 18일 화요일 오전 11:46" class="comment__date">한
									달 전</span>
							</div>
							<div data-v-f39b78c2="" class="comment-content">
								<div data-v-f39b78c2="">
									<p>미안해오 ㅠㅠ</p>
								</div>
								<!---->
							</div>
							<div data-v-f39b78c2="" class="comment-button">
								<ul data-v-f39b78c2="">
									<!---->
									<li data-v-f39b78c2=""><button data-v-f39b78c2=""
											class="comment__button">신고</button></li>
									<li data-v-f39b78c2=""><button data-v-f39b78c2=""
											class="comment__button">
											<img data-v-f39b78c2="" src="/images/icon-reply@2x.png"
												width="16" alt="">답글쓰기
										</button></li>
								</ul>
							</div>
						</div>
						<!---->
					</div>
				</div>
				<!---->
			</div>
		</div>
		<!---->
		<!---->
	</div>
</div>