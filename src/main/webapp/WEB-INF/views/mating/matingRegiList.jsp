<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메이팅에 등록되지 않은 동물 프로필 등록 폼 -->
<style>
.card {
	display:inline-block;
	margin-right:-4px;
	padding-top:15px;
}
/* .profile-card > img {
	width:100%;
	height:100%;
} */

</style>
<!-- 내용 시작 -->
<div class="container">
	<!-- 반복 시작 -->
	<div class="card col-12 col-md-3 ">
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
	</div>
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
