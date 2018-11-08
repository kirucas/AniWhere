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
#pagingDiv{
	width: 100%;
	text-align: center;
}
.row nav{
	margin:0 auto;
}
#pagingDiv nav ul li {
	margin-right: 10px;
}
.prev_next a img {
	width: 100px;
	height: 100px;
}
#list_container{
	padding-left:0px;
	padding-right:0px;
	margin-bottom:15px;
}
#btn_img{
	float:left;
	margin-top:5px;
}
.sub-header-search{
	margin-bottom:5px;
}
#select_form{
	display:inline;
}
#select_form label select{
	margin-left:10px;
}
#select_form input{
	float: right;
}
#tip_no{
	text-align: center;
}
#tip_hit_text{
	font-size: 1.5em;
}
#tip_hit{
	font-size: 1.5em;
	color:#30e0a0;
}
</style>
<!-- 바디 -->
<div class="container" id="list_container">
		<div class="sub-header">
			<h2 class="sub-header__title" style="display:inline">
					[강아지] 팁 게시판
			</h2>
			<div class="sub-header-info">
				<div>
					<ul class="sub-link__list">
						<li class="sub-link__item sub-link__item--active">
							<a href="#"><img src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"	alt=""><span>인기</span></a>
						</li>
						<li class="sub-link__item ">
							<a href="#"> <img src="https://talk.op.gg/images/icon-new@2x.png" width="24" alt=""><span>최신</span></a>
						</li>
						<li class="sub-link__item ">
							<a href="#"> <img src="https://talk.op.gg/images/icon-top@2x.png" width="24" alt=""><span>TOP</span></a>
						</li>
					</ul>		
					<ul class="sub-header-button">
						<li class="sub-header-button__item sub-header-button__item--search">
							<button id="search-toggle-button" class="button">
								<img src="https://talk.op.gg/images/icon-search@2x.png" alt="검색하기" width="24">
							</button>
						</li>
					</ul>
					<div class="sub-header-search" >
						<a href="<c:url value='/security/animal/dog/tip/write.aw'/>">
							<img id="btn_img" src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기" width="24">
						</a>
		                <form id="select_form" action="">
		                    <label>
		                    	<select name="searchColumn" class="sub-header-search__select">
		                            <option value="tip_title">제목</option>
		                            <option value="tip_content">내용</option>
		                            <option value="mem_nickname">작성자</option>
		                        </select>
		                    </label>
		                    <input type="text" name="searchWord" class="sub-header-search__input" placeholder="검색">
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
			<c:if test="${empty requestScope.list}" var="isEmpty">
				   등록된 게시물이 없어요
    		</c:if>
    		<c:if test="${not isEmpty}">
    			<c:forEach var="record" items="${list}" varStatus="loop">
		    		<article class="article-list-item">
					<div class="article-list-item__vote">
						<div><span id="tip_no">${record.dto.no}</span></div>
					</div>
				<div class="article-list-item__content">
					<a href="<c:url value='/animal/dog/tip/tip_view.aw?no=${record.dto.no}'/>" class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="tip_title">${record.dto.tip_title}</span> <em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="" title="">${record.dto.tip_regidate }</span>
						</div>
						<c:if test="${record.dto.mem_nickname eq null}" var="result">
							<div class="article-list-item-meta__item article-list-item-meta__item--author">
								<span>탈퇴 회원</span>
							</div>
						</c:if>
						<c:if test="${not result}">
							<div class="article-list-item-meta__item article-list-item-meta__item--author">
								<span id="mem_no">${record.dto.mem_nickname} </span>
							</div>
						</c:if>
						<div class="article-list-item-meta__item">
							조회수 <span id="tip_count">${record.dto.tip_count}</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div>
						<div style="margin-bottom: 10px;">
							<span id="tip_hit_text">추천수</span></br>
						</div>
						<div>
							<span id="tip_hit">${record.dto.tip_hit}</span>
						</div>
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
