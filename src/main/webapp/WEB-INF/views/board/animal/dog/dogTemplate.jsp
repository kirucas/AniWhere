<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 시작 -->
<div class="container">
	
	<div class="carousel slide carousel-fade" data-ride="carousel" id="carouselTest" style="height: 500px;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block  w-100" src="<c:url value='/resources/Images/board/animal/dog/dog_1.jpg' />" style="width: 100%; height: 100%;" alt="first fade" />
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="<c:url value='/resources/Images/board/animal/dog/dog_2.jpg' />" style="width: 100%; height: 100%;" alt="second fade" />
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="<c:url value='/resources/Images/board/animal/dog/dog_3.jpg' />" style="width: 100%; height: 100%;" alt="third fade" />
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
<!-- 내용 끝 -->
