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

<script>
	var popupGallery;
	var photoNo;
	$(document).ready(function() {
		$(document).on("click",".moda",function(){
			photoNo=$(this).prop("id");
			$("#modalNo").html(photoNo);
			
			$.ajax({
	        	url:"<c:url value='/bird/photo/modalContent.awa'/>",
	       		type:"POST",
				data:{no:photoNo},
	       		dataType:"json", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	       		success : function(data) {
	        	 	document.getElementById("title").innerHTML=data['photo_title'];
	        	 	document.getElementById("content").innerHTML=data['photo_content'];
	        	 	if(data['mem_no'] == data['user']) {
	        	 		document.getElementById("e-d-button").innerHTML='<a href="#" class="btn btn-primary">수정</a>'
						+'<a id="delete" href="#" class="btn btn-danger">삭제</a>';
						$("#delete").click(function(){
	        				var index=document.getElementById("modalNo").innerHTML;
	        				location.replace("<c:url value='/bird/photo/delete.aw?no="+index+"'/>");
	        			});
	        	 	 }else {
	        	 		document.getElementById("e-d-button").innerHTML="";
	        	 	} 
	    	 		
	           	},
	           	error : function(error) {
	                 alert("에러발생");
		       	}
		    });
		});
	});
</script>

<!-- 내용 시작 -->
<div class="container">
	<div class="col-lg-12 text-center" style="margin-top:50px;">
		<h2>${animal.ani_name}의 매칭 카드</h2>
		<span>이곳에 스피너 같은걸 넣어서 이미 매칭중인 다른 동물로 바꿀 수 있도록 해둔다</span>
		
	</div>
	<c:if test='${empty list}' var='result'>
		<div class="col-lg-12 text-center" style="margin-top:50px;">
			<h1>등록된 카드가 없어요</h1>
		</div>
	</c:if>
	<!-- 프로필카드 -->
	<c:if test='${!result}'>
		<c:forEach var="dto" items="${list}">
			<div class="card col-12 col-md-3">
				<img class="card-img-top" src="<c:url value='${dto.ani_pic}'/>" alt="Card image">
				<div class="card-body">
					<h2 class="card-title" style="color:#1ABC9C">${dto.ani_name}</h2>
					<p class="card-text">${ani_species} ${dto.ani_kind}</p>
					<a href="#" class="btn btn-primary moda" data-target="#modalIMG" data-toggle="modal" id="${dto.mating_no}">프로필 보기</a>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>
<!-- div container 프로필카드끝 -->

<!-- modal 프로필 -->
<div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="modalIMG" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body mb-0 p-0">
				<!-- 글번호 저장용 -->
				<label id="modalNo" hidden="true"></label>
				<img src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="" style="width:100%">
				<h2 id="title" style="margin:10px"><!-- 제목 --></h2>
				<p id="content" style="margin:10px"><!-- 내용 --></p>
			</div>

			<div class="modal-footer">
				<div><a href="#" class="btn btn-success" target="_blank">메이팅 신청</a></div>
				<div><a href="#" class="btn btn-danger" data-dismiss="modal">닫기</a></div>
				<!-- 
				<button class="btn btn-outline-primary btn-rounded btn-md ml-4 text-center" data-dismiss="modal" type="button">닫기</button>
				 -->
			</div>
		</div>
	</div>
</div>
<!-- modal 프로필 끝 -->

<!-- 내용 끝 -->
