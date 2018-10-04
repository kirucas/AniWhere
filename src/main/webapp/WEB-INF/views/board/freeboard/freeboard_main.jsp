<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#free_no{
	text-align:center;
	font-size: 1.5em;
}
</style>
<!-- 바디 -->
<div class="container" style="padding-left:0px;padding-right:0px">
		<div class="sub-header">
			<div class="sub-header-info">
				<div>
				<h2 class="sub-header__title" style="display:inline">
					<a href="<c:url value='/miss/find.aw'/>">자유 게시판</a>
				</h2>		
				<ul class="sub-header-button">
					<li class="sub-header-button__item sub-header-button__item--search">
						<button id="search-toggle-button" class="button">
							<img src="https://talk.op.gg/images/icon-search@2x.png" alt="검색하기" width="24">
						</button>
					</li>
				</ul>
				<div class="sub-header-search">
				<a href="/animal/freeboard/write.aw">
					<img style="float:left;margin-top:5px;" src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기" width="24">
					</a>
                <form style="display:inline;" action="">
                	<label>
                    	<select name="target" style="margin-left:10px" class="sub-header-search__select">
                            <option value="total">전체</option>
                            <option value="gab">잡담</option>
                            <option value="info">정보</option>
                            <option value="humor">유머</option>
                            <option value="issue">이슈</option>
                            <option value="current_affairs">시사</option>
                        </select>
                    </label>
                    <label>
                    	<select name="target" style="margin-left:10px" class="sub-header-search__select">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="title_content">제목+내용</option>
                            <option value="user_name">작성자</option>
                        </select>
                    </label>
                    <input style="float:right" type="text" name="q" class="sub-header-search__input" placeholder="검색">
                    <button class="sub-header-search__button"><img src="https://talk.op.gg/images/icon-search@2x.png" width="24" alt="검색"></button>
                </form>
            </div>
				</div>
			</div>
		</div>

		<!-- 내용 부분 시작 -->
		<section class="article-list article-list--fixed"></section>
		<section class="article-list">
			<article class="article-list-item ">
				<div class="article-list-item__vote">
					<img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
					<div><span id="free_hit">26</span></div>
				</div>
				<div class="article-list-item__content">
					<span id="free_category">[유머]</span>
					<a href="#"	class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="free_title">저새낀 혼자서 잘 못한다하는데</span> <em><span id="free_count">[21]</span></em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="2018-09-27T05:45:00+00:00" title="">2
								시간 전</span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#">푸른빛불꽃 </a>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="free_no" style="text-align:center">1</span></div>
				</div>
			</article>


			<!-- 페이징 부분 -->
			<section class="article-list-paging">
				<div class="article-list-paging-content">
					<ul class="article-list-paging-list">
						<li
							class="article-list-paging__item article-list-paging__item--current">
							<span class="article-list-paging__link">1</span>
						</li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=2"
							class="article-list-paging__link">2</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=3"
							class="article-list-paging__link">3</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=4"
							class="article-list-paging__link">4</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=5"
							class="article-list-paging__link">5</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=6"
							class="article-list-paging__link">6</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=7"
							class="article-list-paging__link">7</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=8"
							class="article-list-paging__link">8</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=9"
							class="article-list-paging__link">9</a></li>
						<li class="article-list-paging__item "><a
							href="https://talk.op.gg/s/lol/all?page=10"
							class="article-list-paging__link">10</a></li>
						<li
							class="article-list-paging__item article-list-paging__item--next">
							<a href="https://talk.op.gg/s/lol/all?page=2"
							class="article-list-paging__button button"> <span>다음</span><img
								src="https://talk.op.gg/images/icon-arrow-right@2x.png"
								width="24" alt="">
						</a>
						</li>
					</ul>
				</div>
			</section>
		</section>
	</div>
<!-- 바디 끝 -->
