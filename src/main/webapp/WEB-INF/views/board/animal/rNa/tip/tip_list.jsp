<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#tip_no{
	text-align:center;
	font-size: 1.5em;
}
.sub-header-info{
	padding-bottom:0px;
}
</style>
<!-- 바디 -->
<!-- 헤더쪽 메뉴들 -->
<div class="container" style="padding-left:0px;padding-right:0px;">
		<div class="sub-header">
			<div class="sub-header-info">
				<div>
				<h2 class="sub-header__title" style="display:inline">
					파충류&양서류 팁
				</h2>
				<ul class="sub-link__list">
					<li class="sub-link__item sub-link__item--active">
						<a href="#"><img src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"	alt=""><span>인기</span></a>
					</li>
					<li class="sub-link__item ">
						<a href="#"><img src="https://talk.op.gg/images/icon-new@2x.png" width="24" alt=""><span>최신</span></a>
					</li>
					<li class="sub-link__item ">
						<a href="#"><img src="https://talk.op.gg/images/icon-top@2x.png" width="24" alt=""><span>TOP</span></a>
					</li>
				</ul>		
				<ul class="sub-header-button">
					<li class="sub-header-button__item sub-header-button__item--search">
						<button id="search-toggle-button" class="button">
							<img src="https://talk.op.gg/images/icon-search@2x.png" alt="검색하기" width="24">
						</button>
					</li>
				</ul>
				<div class="sub-header-search" style="margin-bottom:5px">
				<a href="/animal/freeboard/write.aw">
					<img style="float:left;margin-top:5px;" src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기" width="24">
				</a>
                <form style="display:inline;" action="">
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

			<!-- 페이징 부분 -->
			<section class="article-list-paging" >
				<div class="article-list-paging-content">
					<ul class="article-list-paging-list">
						<li class="article-list-paging__item article-list-paging__item--prev">
                        <a href="https://talk.op.gg/s/lol/all?page=9" class="article-list-paging__button button">
                            <img src="https://talk.op.gg/images/icon-arrow-left@2x.png" width="24" alt=""><span>이전</span>
                        </a>
						<li class="article-list-paging__item article-list-paging__item--current">
							<span class="article-list-paging__link">1</span></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">2</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">3</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">4</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">5</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">6</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">7</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">8</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">9</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">10</a></li>
						<li	class="article-list-paging__item article-list-paging__item--next">
							<a href="#"	class="article-list-paging__button button"> 
								<span>다음</span>
								<img src="https://talk.op.gg/images/icon-arrow-right@2x.png" width="24" alt="">
							</a>
						</li>
					</ul>
				</div>
			</section>
		</section>
	</div>
<!-- 바디 끝 -->
