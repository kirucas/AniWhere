<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
body {
	font-family: 메이플스토리;
}
</style>

<div class="container" style="margin-top: 30px">
	<div class="row">
		<div class="col-sm-2">
			<h2>프로필</h2>
			<h5>프로필 사진</h5>
			<div>
				<img class="img-thumbnail img-fluid" alt="프로필사진을 등록"
					src="<c:url value='/resources/images/jen.jpg'/>" width="300"
					height="300"></img>
			</div>
			<h3>블로그 주소</h3>
			<p>
				<a href="#">http://????</a>
			</p>
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a class="nav-link active" href="#">Miss</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/miss/find.aw' />">찾아요</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/miss/see.aw' />">봤어요</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/miss/shelter.aw' />">보호소</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">그
						해당하는 페이지면 속성값 : Disabled</a></li>
			</ul>
			<hr class="d-sm-none">
		</div>
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-6" style="float: left">
						<button type="button" class="btn btn-info">찾아요</button><br>
						<a href="#" class="alert-link"><span>글 제목1</span></a><br>
						<a href="#"><span>글 제목2</span></a><br>
						<a href="#"><span>글 제목3</span></a><br>
						<a href="#"><span>글 제목4</span></a><br>
						<a href="#"><span>글 제목5</span></a><br>
						<a href="#"><span>글 제목6</span></a><br>
						<a href="#"><span>글 제목7</span></a><br>
						<a href="#"><span>글 제목8</span></a><br>
						<a href="#"><span>글 제목9</span></a><br>
						<a href="#"><span>글 제목10</span></a><br>
						<a href="#"><span>글이 하나도 없으면 - 등록된 게시글이 없어요.</span></a><br>
					</div>
					<div class="col-sm-6" style="float: left">
						<button type="button" class="btn btn-info">봤어요</button><br>
						<a href="#" class="alert-link"><span>글 제목1</span></a><br>
						<a href="#"><span>글 제목2</span></a><br>
						<a href="#"><span>글 제목3</span></a><br>
						<a href="#"><span>글 제목4</span></a><br>
						<a href="#"><span>글 제목5</span></a><br>
						<a href="#"><span>글 제목6</span></a><br>
						<a href="#"><span>글 제목7</span></a><br>
						<a href="#"><span>글 제목8</span></a><br>
						<a href="#"><span>글 제목9</span></a><br>
						<a href="#"><span>글 제목10</span></a><br>
						<a href="#"><span>글이 하나도 없으면 - 등록된 게시글이 없어요.</span></a><br>
					</div>
				</div>
				<div class="col-sm-12">
					<div>
						<h1>보호소</h1> 
						<img class="mx-auto d-block rounded img-fluid"
							alt="동물사진을 등록" src="<c:url value='/resources/images/owl.jpg'/>"
							width="500" height="450"></img>
					</div>
					<p>저희가 구금중입니다.보석금 10만원</p>
				</div>
			</div>
		</div>
	</div>
</div>