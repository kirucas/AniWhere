<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#no{
	text-align:center;
	font-size: 1.5em;
}
.sub-header-info{
	padding-bottom:0px;
}
</style>



<!-- 바디 -->
<div class="container" style="padding-left:0px;padding-right:0px;margin-bottom:15px">
		<div class="sub-header">
			<div class="sub-header-info">
				<div>
				<h2 class="sub-header__title" style="display:inline">
					자유 게시판
				</h2>
				<ul class="sub-link__list">
					<li class="sub-link__item" id="defeaultlist">
						<a href="<c:url value='/animal/freeboard.aw'/>"> <img src="https://talk.op.gg/images/icon-new@2x.png" width="24" alt=""><span>최신</span></a>
					</li>
					<li class="sub-link__item" id="countlist">
						<a href="<c:url value='/animal/freeboard_count.aw'/>"><img src="https://talk.op.gg/images/icon-hot@2x.png" width="24" alt="" ><span>인기</span></a>
					</li>
					<li class="sub-link__item" id="hitlist">
						<a href="<c:url value='/animal/freeboard_hit.aw'/>"> <img src="https://talk.op.gg/images/icon-top@2x.png" width="24" alt=""><span>TOP</span></a>
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
				<a href="<c:url value='/security/animal/freeboard/write.aw'/>">
					<img style="float:left;margin-top:5px;" src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기" width="24">
				</a>
                <form style="display:inline;" action="<c:url value='/animal/freeboard.aw'/>">
                    <label>
                    	<select name="searchColumn" style="margin-left:10px" class="sub-header-search__select">
                            <option value="free_title">제목</option>
                            <option value="free_content">내용</option>
                            <option value="mem_nickname">작성자</option>
                        </select>
                    </label>
                    <input style="float:right" type="text" name="searchWord" class="sub-header-search__input" placeholder="검색">
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
			<c:if test="${empty list }" var="isEmpty">
				   등록된 게시물이 없어요
    		</c:if>
    		<c:if test="${not isEmpty }">
    			<c:forEach var="record" items="${list}" varStatus="loop">
				<article class="article-list-item">
					<div class="article-list-item__vote">
						<div>
							<span id="free_hit">${record.dto.free_hit}</span>
						</div>
					</div>
					<div class="article-list-item__content">
						<c:choose>
							<c:when test="${record.dto.free_category eq '1'}">
								<span>[잡담]</span>
							</c:when>
							<c:when test="${record.dto.free_category eq '2'}">
								<span>[정보]</span>
							</c:when>
							<c:when test="${record.dto.free_category eq '3'}">
								<span>[유머]</span>
							</c:when>
							<c:when test="${record.dto.free_category eq '4'}">
								<span>[이슈]</span>
							</c:when>
							<c:otherwise>
								<span>[시사]</span>
							</c:otherwise>
						</c:choose>
						<a href="<c:url value='/animal/freeboard_view.aw?no=${record.dto.no}'/>" class="article-list-item__info">
							<div class="article-list-item__title">
								<span id="free_title">${record.dto.free_title}</span> <em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em>
							</div>
						</a>
						<div class="article-list-item-meta">
							<div class="article-list-item-meta__item">
								<span data-tooltip data-date="2018-09-27T05:45:00+00:00"
									title="">${record.dto.free_regidate}</span>
							</div>
							<div
								class="article-list-item-meta__item article-list-item-meta__item--author">
								<c:if test="${empty record.dto.mem_nickname}" var="member">
									<a href="#" id="mem_nickname">탈퇴회원</a>
								</c:if>
								<c:if test="${not member}">
									<a href="#" id="mem_nickname">${record.dto.mem_nickname}</a>
								</c:if>
							</div>
							<div class="article-list-item-meta__item">
								조회수 <span id="free_count">${record.dto.free_count}</span>
							</div>
						</div>
					</div>
					<div class="article-list-item__vote">
						<div>
							<span id="no" style="text-align: center">${record.dto.no}</span>
						</div>
					</div>
				</article>
			</c:forEach>
    		</c:if>
			
		</section>
		
	</div>
	<!-- 아래는 페이징 -->
    		${pagingString}
<!-- 바디 끝 -->
