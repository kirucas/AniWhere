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
					예약 확인
				</h2>
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
				<div class="article-list-item__content">
					<a href="<c:url value='/security/animal/freeboard_view.aw?no=${record.rv_no}'/>" class="article-list-item__info">
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date=${record.free_regidate } title=""></span>
						</div>
						<div class="article-list-item-meta__item article-list-item-meta__item--author">
							<a href="#" id="mem_no">${record.mem_nickname} </a>
						</div>
						<div class="article-list-item-meta__item">
							조회수 <span id="free_count">${record.free_count}</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="no" style="text-align:center">${record.no}</span></div>
				</div>
			</article>
	    		</c:forEach>
    		</c:if>
			<!-- 페이징 부분
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
			 -->
			
		</section>
	</div>
	<!-- 아래는 페이징 -->
    <div class="row" style="text-aling:center">
    	<div>
    		${pagingString}
    	</div>
    </div>	
<!-- 바디 끝 -->
