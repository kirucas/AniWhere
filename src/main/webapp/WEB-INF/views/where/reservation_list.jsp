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
					<a href="<c:url value='/security/where/reservation_view.aw?no=${record.no}'/>" class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="free_title">${record.store_no}</span>
						</div>
					</a>
					<a href="<c:url value='/security/where/reservation_view.aw?no=${record.rv_no}'/>" class="article-list-item__info">
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date="${record.booking_date}" title=""></span>
						</div>
					</div>
				</div>
	    		</c:forEach>
    		</c:if>
		</section>
	</div>
	<!-- 아래는 페이징 -->
    <div class="row" style="text-aling:center">
    	<div>
    		${pagingString}
    	</div>
    </div>	
<!-- 바디 끝 -->
