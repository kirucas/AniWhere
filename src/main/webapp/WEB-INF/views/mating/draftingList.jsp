<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 시작 -->
<!-- 내용 시작 -->
<div class="container">
	<section class="member-settings-layout__content">
		<div class="member-settings-layout__content-inner" style="height: 100%;">
<%-- 			<h2 class="member-settings-layout__title">${anirecord[0].mem_nickname}님의 애완동물 프로필 카드</h2> --%>
<!-- 			<div class="container" style="vertical-align:middle;"> -->
				<c:forEach var="record" items="${draftList}" varStatus="loop">
				  	<div class="card col-12 col-lg-6 col-md-12">
					  	<img class="card-img-top" src="<c:url value='${record.ani_pic}'/>" alt="애완동물 사진" id="ani_profile">
					 	<div class="card-body">
					    	<h2 class="card-title">이름 : ${record.ani_name}</h2>
						    <div style="float:left;width:50%">
							    <span>나이 : ${record.ani_age}</span>
							</div>
							<div style="display:inline;">
					    		<span>성별 : 
					    			<c:choose>
					    				<c:when test="${record.ani_gender eq 'M'}">수</c:when>
					    				<c:when test="${record.ani_gender eq 'F'}">암</c:when>
					    				<c:otherwise>기타</c:otherwise>
					    			</c:choose>
					    		</span>
						    </div>
						    <div>
					    		<span>
					    			대분류 : 
					    			<c:choose>
					    				<c:when test="${record.ani_species eq 1}">강아지</c:when>
					    				<c:when test="${record.ani_species eq 2}">고양이</c:when>
					    				<c:when test="${record.ani_species eq 3}">파충류/양서류</c:when>
					    				<c:when test="${record.ani_species eq 4}">조류</c:when>
					    				<c:otherwise>기타 포유류</c:otherwise>
					    			</c:choose>
					    		</span><br>
				    			<span>중분류 : ${record.ani_kind}</span>
			    			</div>
			    			<!-- <div style="display: inline;float: left;margin-top: 10px;">
			    				<p class="card-text">검색 위치
			    			</div> -->
			    			<div style="text-align:right;display: inline;float: right;" id="buttonPlace${record.ani_no}">
			    				<c:set var="loop_flag" value="false" />
			    				<c:forEach var="mateDto" items="${matingrecord}" varStatus="loop">
			    					<c:if test="${not loop_flag}">
				    					<c:if test="${mateDto.ani_no eq record.ani_no}" var="result">
				    						<a href="#" class="btn btn-primary match" id="">상대 보기</a>
				    						<a href="#" class="btn btn-danger mate" id="">매칭 취소</a>
				    						<c:set var="loop_flag" value="true" />
				    					</c:if>
			    					</c:if>
			    				</c:forEach>
			    				<c:if test="${!result}">
								    <a href="#" class="btn btn-primary mate" id="">매칭 시작</a>
		    					</c:if>
		    				</div>
					  	</div>
					</div>
				</c:forEach>
<!-- 			</div> -->
		</div>	
	</section>
</div>
<!-- 내용 끝 -->
<!-- 내용 끝 -->
