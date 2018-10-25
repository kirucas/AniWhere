<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#tip_no{
	text-align:center;
	font-size: 1.5em;
}
</style>
<!-- 바디 -->
<div class="container" style="padding-left:0px;padding-right:0px;">
		<div class="sub-header">
			<div class="sub-header-info">
				<div>
				<h2 class="sub-header__title" style="display:inline">
					찾아요
				</h2>
				<ul class="sub-header-button">
					<li class="sub-header-button__item sub-header-button__item--search">
						<button id="search-toggle-button" class="button">
							<img src="https://talk.op.gg/images/icon-search@2x.png" alt="검색하기" width="24">
						</button>
					</li>
				</ul>
				<div class="sub-header-search">
				<a href="<c:url value='/miss/find_write.aw'/>">
					<img style="float:left;margin-top:5px;" src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기" width="24">
				</a>
                <form style="display:inline;" action="">
                    <label>
                    	<select name="target" style="margin-left:10px" class="sub-header-search__select">
                            <option value="title" >제목</option>
                            <option value="content" >내용</option>
                            <option value="title_content" >제목+내용</option>
                            <option value="user_name" >작성자</option>
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
			<c:if test="${empty requestScope.find_list }" var="isEmpty">
				   등록된 게시물이 없어요
    		</c:if>
    		<c:if test="${not isEmpty }">
    			<c:forEach var="record" items="${find_list}" varStatus="loop">
			<article class="article-list-item">
				<div class="article-list-item__content">
					<span id="animal_code">
						<c:choose>
							<c:when test="${record.animal_code eq '1'}">
								<span>[고양이]</span>
							</c:when>
							<c:when test="${record.animal_code eq '2'}">
								<span>[강아지]</span>		
							</c:when>
							<c:when test="${record.animal_code eq '3'}">
								<span>[조류]</span>
							</c:when>
							<c:when test="${record.animal_code eq '4'}">
								<span>[파충류]</span>
							</c:when>
							<c:otherwise>
								<span>[양서류]</span>
							</c:otherwise>
						</c:choose>
					</span>
					<a href="<c:url value='/miss/find_view.aw?find_no=${record.no}'/>"	class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="title">${record.title }</span> <em>[21]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="2018-09-27T05:45:00+00:00" title="">${record.regidate }</span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#" id="mem_no">${record.mem_nickname}</a>
						</div>
						<div class="article-list-item-meta__item">
							조회수 <span id="count">${record.count}</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="no" style="text-align:center">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</span></div>
				</div>
			</article>

				</c:forEach>
			</c:if>
			<!-- 페이징 부분 -->
			<section class="article-list-paging" >
				<div class="row">
					<div class="col-md-11 ">${pagingString }</div>
				</div>
			</section>
		</section>
	</div>
<!-- 바디 끝 -->
