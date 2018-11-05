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
		<section class="article-list article-list--fixed">
			<!-- 여기서 반복문 돌려서 글 -->
			<article class="article-list-item">
               	<div class="article-list-item__vote">
           			<img src="https://talk.op.gg/images/icon_notice@2x.png" alt="" width="24" height="24">
       			</div>
       			<div class="article-list-item__content">
                    <div class="article-list-item__info text-center">
                        <span>예약 가게 이름</span>
                    </div>
	                <div class="article-list-item-meta">
	                    <div class="article-list-item-meta__item article-list-item-meta__item--date text-center"><span data-tooltip="" data-date="2018-10-19T05:43:37+00:00" title="2018년 10월 19일 금요일 오후 2:43">등록 날짜</span>
	                    </div>
	                    <div class="article-list-item-meta__item article-list-item-meta__item--date text-center"><span data-tooltip="" data-date="2018-10-19T05:43:37+00:00" title="2018년 10월 19일 금요일 오후 2:43">예약 날짜</span>
	                    </div>
	                </div>
	            </div>
	        </article>
        </section>
		<c:if test="${empty list }" var="isEmpty">
			   등록된 예약이 없어요
   		</c:if>
   		<c:if test="${not isEmpty }">
   			<c:forEach var="record" items="${list}" varStatus="loop">
	   			<section class="article-list article-list--compact">
	   				<article class="article-list-item ">
			            <div class="article-list-item__vote">
			                <div>${record.rv_no}</div>
			            </div>
			            <div class="article-list-item__content">
			                <div class="article-list-item__info text-center">
			                    <a href="<c:url value='/security/where/reservation_view.aw?rv_no=${record.rv_no}'/>" class="article-list-item__info">
									<div class="article-list-item__title">
										<span>${record.bizesnm}</span>
									</div>
								</a>
		                	</div>
			                <div class="article-list-item-meta">
			                    <div class="article-list-item-meta__item article-list-item-meta__item--date"><span data-tooltip="" data-date="2018-11-04T13:17:22+00:00" title="">${record.apply_date}</span>
			                    </div>
			                    <div class="article-list-item-meta__item article-list-item-meta__item--date"><span data-tooltip="" data-date="2018-11-04T13:17:22+00:00" title="">${record.booking_date }</span>
			                    </div>
			                </div>
		                </div>
		        	</article>
	        	</section>
    		</c:forEach>
   		</c:if>
	</div>
	<!-- 아래는 페이징 -->
    <!-- 아래는 페이징 -->
    <div class="row" id="pagingDiv">
    	${pagingString}
    </div>	
<!-- 바디 끝 -->
