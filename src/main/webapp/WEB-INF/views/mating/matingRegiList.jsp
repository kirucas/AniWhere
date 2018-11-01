<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메이팅에 등록되지 않은 동물 프로필 등록 폼 -->
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
	padding-top:15px;
}
#ani_profile{
	height: 200px;
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
	<section class="member-settings-layout__content">
		<div class="member-settings-layout__content-inner" style="height: 100%;">
			<h2 class="member-settings-layout__title">${anirecord[0].mem_nickname}님의 애완동물 프로필 카드</h2>
			<div class="container" style="vertical-align:middle;">
				<c:forEach var="record" items="${anirecord}" varStatus="loop">
				  	<div class="card col-12 col-md-3">
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
			    			<div style="display: inline;float: left;margin-top: 10px;">
			    				<p class="card-text">상태(등록중 등)
			    			</div>
			    			<div style="display: inline;float: right;">
			    				<c:forEach var="mateDto" items="${matingrecord}">
			    					<c:if test="${mateDto.ani_no eq dto.ani_no}" var="result">
			    						<a href="#" class="btn btn-danger" data-target="#modalIMG" data-toggle="modal">매칭 취소</a>
			    					</c:if>
			    				</c:forEach>
			    				<c:if test="${!result}">
								    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">매칭 시작</a>
		    					</c:if>
		    				</div>
					  	</div>
					</div>
				</c:forEach>
			</div>
		</div>	
	</section>

	<!-- 반복 시작 -->
	<%-- <div class="card col-12 col-md-3 ">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">이름</h2>
		    <p class="card-text">종류</p>
		    <p class="card-text">상태(등록중 등)
		    <div>
			    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">매칭 시작</a>
			    <a href="#" class="btn btn-danger" data-target="#modalIMG" data-toggle="modal">매칭 취소</a>
		    </div>
		  </div>
	</div>
	<!-- 반복 끗 -->
	<div class="card col-12 col-md-3 ">
		<img class="card-img-top" src="<c:url value='/resources/images/mating/yeonji.JPG'/>" alt="Card image">
		<div class="card-body">
			<h2 class="card-title" style="color:#1ABC9C">이름</h2>
			<p class="card-text">종류</p>
		    <p class="card-text">상태(등록중 등)
		    <div>
			    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">매칭 시작</a>
			    <a href="#" class="btn btn-danger" data-target="#modalIMG" data-toggle="modal">매칭 취소</a>
		    </div>
		  </div>
	</div>
	<div class="card col-12 col-md-3 ">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">이름</h2>
		    <p class="card-text">종류</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">매칭 시작</a>
		  </div>
	</div>
	<div class="card col-12 col-md-3 ">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">이름</h2>
		    <p class="card-text">종류</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">매칭 시작</a>
		  </div>
	</div> --%>
</div>
<!-- 내용 끝 -->

<!-- modal 프로필 -->
<div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="modalIMG" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body mb-0 p-0">
				<img src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="" style="width:100%">
				<h2 style="margin:10px">곤지의 프로필</h2>
				<p style="margin:10px">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
			</div>

			<div class="modal-footer">
				<div><a href="#" target="_blank">확인</a></div>
				<div><a href="#" data-dismiss="modal">취소</a></div>
				<!-- 
				<button class="btn btn-outline-primary btn-rounded btn-md ml-4 text-center" data-dismiss="modal" type="button">닫기</button>
				 -->
			</div>
		</div>
	</div>
</div>
<!-- modal 프로필 끝 -->
