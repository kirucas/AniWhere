<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<%@ include file="/WEB-INF/views/common/loading.jsp" %>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
</style>
<!-- 내용 시작 -->
<div class="container" style="padding-left: 0px; padding-right: 0px;">
	<div class="col-sm-12">
		<h1 class="my-4 text-center text-lg-left">
			보호소 </br> <small style="font-size: 0.4em">※ 여러 지역의 유기동물보호소와 연동하여
				유기동물들이 다시 가족의 품으로 돌아갈 수있도록 돕고 있습니다</small>
		</h1>

		<div class="row text-center text-lg-left">
			<!-- 내용 부분 시작  -->
			<section class="article-list">
				<!-- 여기서 반복문 돌려서 글 -->
				<c:if test="${empty requestScope.list}" var="isEmpty">
				   등록된 게시물이 없어요
    			</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="record" items="${list}" varStatus="loop">
						<a href="<c:url value='/miss/shelter_view.aw?shelter_no=${record.no}'/>" class="article-list-item__info">
						<div style="margin-bottom: 10px; padding:10px;background-color: rgba(80, 80, 80, 0.1);margin-top:15px;margin-left: 15px;margin-right: 15px;float: left">
							<div style="width: 320px;height: 320px;">
								<img src="${record.img_src}" style="width: 320px; height: 320px;">
							</div>				
							<div style="width: 300px;height: 100px;" >
								<p style="margin-top: 5px">품종 : ${record.kind }</p>
								<p style="margin-top: 5px">발견 장소 : ${record.place }</p>
								<p style="margin-top: 5px">성별 : ${record.gender }</p>
								<p style="margin-top: 5px">보호소 이름 : ${record.careNm }</p>
								<p style="margin-top: 5px">등록일 : ${record.start_notice }</p>
							</div>
						</div>
						</a>
					</c:forEach>
				</c:if>
				<!-- 페이징 부분 -->
			</section>
		</div>
		<div class="row">
			<div class="col-md-11 ">${pagingString }</div>
		</div>
		<!-- 내용 끝 -->