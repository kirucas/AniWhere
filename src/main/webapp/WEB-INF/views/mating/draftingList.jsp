<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.nav-tabs {
    border-bottom: none;
}
.member-input__state {
    border-bottom: none;
}
.member-settings-layout__title{
	padding-top:10px;
	padding-top:40px;
}
*{
	font-family:메이플스토리 !important;
}
.passwordinput {
	border-bottom:0.5px solid black !important;
}
#aniwarn{
	width:50%;
	margin-top:20px;
	align:center;
}
.card{
	display:inline-block;
	margin-right:-4px;
	padding:15px;
	
}
#ani_profile{	
 	height: 200px; 
/* 	width: 250px; */
}
.card-body{
	height: 200px;
}
#plus{
	border: none;
}
#plus img{
	margin-bottom: 40px;
}
#profile-text span{
	margin-bottom: 5px;
}
</style>

<!-- 내용 시작 -->
<div class="container">
	<div>
		<h2 class="member-settings-layout__title">여기에 제목이 들어간다</h2>
	</div>
	<!-- nav부분 -->
		<div class="settings-navigator">
			<div class="settings-navigator__inner" style="width:100%">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="person-tab" data-toggle="tab" href="#send" role="tab" aria-controls="person" aria-current="true"> 
							신청한 목록
						</a>
					</li>
					<li class="nav-item">
						<a	class="nav-link" aria-current="false" id="animal-tab" data-toggle="tab" href="#receive" role="tab" aria-controls="animal">
							신청받은 목록
						</a>
					</li>
				</ul>
			</div>
		</div>
	<!-- 내용 -->
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="send" role="tabpanel" aria-labelledby="person-tab">
			<section class="member-settings-layout__content">
				<div class="member-settings-layout__content-inner">
					<c:if test="${empty sendList}" var="result">
						<h2 class="member-settings-layout__title">아직 신청한 상대가 없어요</h2>
					</c:if>
					<c:if test="${!result}">
						<c:forEach var="record" items="${sendList}" varStatus="loop">
						  	<div class="card col-12 col-lg-6 col-md-12">
						  		<div class="row">
							  		<div class="col-12 col-md-6" >
									  	<img class="card-img-top" src="<c:url value='${record.ani_pic}'/>" alt="애완동물 사진" id="ani_profile">
							  		</div>
								 	<div class="card-body col-12 col-md-5">
								    	<h2 class="card-title">${record.ani_name}</h2>
									    <div>
										    <span>나이 : ${record.ani_age}</span>
										</div>
									    <div>
								    		<span>대분류 :<c:choose>
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
										    <a href="#" class="btn btn-primary mate" id="">취소</a>
					    				</div>
								  	</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</section>
		</div>
		<div class="tab-pane fade show" id="receive" role="tabpanel" aria-labelledby="person-tab">
			<section class="member-settings-layout__content">
				<div class="member-settings-layout__content-inner">
					<c:if test="${empty receiveList}" var="result">
						<h2 class="member-settings-layout__title">만남을 신청한 상대가 없어요</h2>
					</c:if>
					<c:if test="${!result}">
						<c:forEach var="record" items="${receiveList}" varStatus="loop">
						  	<div class="card col-12 col-lg-6 col-md-12">
						  		<div class="row">
							  		<div class="col-12 col-md-6" >
									  	<img class="card-img-top" src="<c:url value='${record.ani_pic}'/>" alt="애완동물 사진" id="ani_profile">
							  		</div>
								 	<div class="card-body col-12 col-md-5">
								    	<h2 class="card-title">${record.ani_name}</h2>
									    <div>
										    <span>나이 : ${record.ani_age}</span>
										</div>
									    <div>
								    		<span>대분류 :<c:choose>
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
										    <a href="#" class="btn btn-primary mate" id="">수락</a>
										    <a href="#" class="btn btn-primary mate" id="">거절</a>
					    				</div>
								  	</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</section>
		</div>
	</div>
	
					
	<%-- <section class="member-settings-layout__content">
		<div class="member-settings-layout__content-inner" style="height: 100%;">
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
							    <a href="#" class="btn btn-primary mate" id="">수락</a>
							    <a href="#" class="btn btn-primary mate" id="">거절</a>
		    				</div>
					  	</div>
					</div>
				</c:forEach>
		</div>	
	</section> --%>
</div>
<!-- 내용 끝 -->
