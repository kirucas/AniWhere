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

<script>
	$(function(){
		$(document).on('click','.permit',function(){
			var dft_no=$(this).prop("id");
			var ani_no=$(this).parent().prop("id");
			$("#dftNo").html(dft_no);
			$("#aniNo").html(ani_no);
			$("#telModal").modal("show");
		});
		
		$(document).on('click','.send',function(){
			doApply($("#dftNo").html(),$("#tel").val(),$("#aniNo").html());
		});
		
		$(document).on('click','.dismiss',function(){
			var dft_no=$(this).prop("id");
			$("#dftNo").html(dft_no);
			doApply($("#dftNo").html(),null,null);
		});
	});
	
	

	function doApply(dft_no,tel,ani_no){
		$.ajax({
			url:"<c:url value='/mating/draftApply.awa'/>",
       		type:"POST",
			data:{"dft_no":dft_no,"tel":tel,"ani_no":ani_no},
       		dataType: "text",
       		success : function(data) {
       			$('#'+dft_no).closest('.card').remove();
       			if(data.indexOf("ok")!=-1) {
       				alert("만남을 수락했습니다. 목록으로 이동합니다.");
       				location.href="<c:url value='/security/mating/main.aw'/>";
       			}
           	},
           	error : function(error) {
           		console.log("에러발생",error);
	       	}
		});
	}
</script>

<!-- 내용 시작 -->
<div class="container">
	<div>
		<h2 class="member-settings-layout__title">${animal.ani_name}의 신청 페이지</h2>
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
										    <a href="#" class="btn btn-primary permit" id="ok${dftNoList[loop.index]}">수락</a>
										    <a href="#" class="btn btn-primary dismiss" id="no${dftNoList[loop.index]}">거절</a>
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
</div>
<!-- 내용 끝 -->

<div class="modal fade" id="telModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<label id="dftNo" hidden="true"></label>
				<label id="aniNo" hidden="true"></label>
				<input type="text" id="tel" style="margin: 10px" placeholder="전화번호를 입력해주세요"/>
			</div>
			<div class="modal-footer">
				<div>
					<a href="#" class="send" data-dismiss="modal" class="btn btn-secondary">보내기</a>
					<a href="#" data-dismiss="modal" class="btn btn-danger">닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>
