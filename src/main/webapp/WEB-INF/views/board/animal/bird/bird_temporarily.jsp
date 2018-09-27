<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.carousel-item img {
		width: 100% !important;
		height: 500px !important;
	}
</style>

<!-- 내용 시작 -->
<div class="container">
	
	<div class="row">
		<div class="carousel slide carousel-fade" data-ride="carousel" id="carouselTest" style="height: 500px; width: 100%;">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="<c:url value='/resources/images/board/animal/bird/bird_1.jpg' />" alt="first fade" />
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="<c:url value='/resources/images/board/animal/bird/bird_2.jpg' />" alt="second fade" />
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="<c:url value='/resources/images/board/animal/bird/bird_3.jpg' />" alt="third fade" />
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselTest" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselTest" role="button" data-slide="next">
				<span class="carousel-control-next-icon"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	
	<div class="row">
		<div class="list-group">
			<a href="<c:url value='/animal/bird/photo.aw' />" class="list-group-item list-group-item-action">photo</a>
			<a href="<c:url value='/animal/bird/movie.aw' />" class="list-group-item list-group-item-action">movie</a>
			<a href="<c:url value='/animal/bird/story.aw' />" class="list-group-item list-group-item-action">story</a>
			<a href="<c:url value='/animal/bird/tip.aw' />" class="list-group-item list-group-item-action">tip</a>
		</div>
	</div>
	
</div>
<!-- 내용 끝 -->
