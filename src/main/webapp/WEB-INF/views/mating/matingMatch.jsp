<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.card{
	display:inline-block;
	margin-right:-4px;
}

</style>
<!-- 내용 시작 -->
<div class="container">
	<div class="col-lg-12 text-center" style="margin-top:50px;">
		<h2>연지를 위한 카드</h2>
		<span>이곳에 스피너 같은걸 넣어서 이미 매칭중인 다른 동물로 바꿀 수 있도록 해둔다</span>
	</div>
	<!-- 프로필카드 -->
	<div class="card col-12 col-md-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
	<div class="card col-12 col-md-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
	<div class="card col-12 col-md-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
	<div class="card col-12 col-md-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
	<div class="card col-12 col-md-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
	<div class="card col-12 col-md-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
	<div class="card col-12 col-md-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
	<div class="card col-12 col-lg-3">
		  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
		  <div class="card-body">
		    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
		    <p class="card-text">고슴도치</p>
		    <a href="#" class="btn btn-primary" data-target="#modalIMG" data-toggle="modal">프로필 보기</a>
		  </div>
	</div>
</div>
<!-- div container 프로필카드끝 -->

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
				<div><a href="#" target="_blank">메이팅 신청</a></div>
				<div><a href="#" data-dismiss="modal">닫기</a></div>
				<!-- 
				<button class="btn btn-outline-primary btn-rounded btn-md ml-4 text-center" data-dismiss="modal" type="button">닫기</button>
				 -->
			</div>
		</div>
	</div>
</div>
<!-- modal 프로필 끝 -->

<!-- 내용 끝 -->
