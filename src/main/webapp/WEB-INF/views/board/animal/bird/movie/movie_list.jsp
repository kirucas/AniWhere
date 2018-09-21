<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.card-image, .card-body {
		height: 150px;
	}
	
</style>

<c:set var="now" value="<%=new java.util.Date() %>" />

<!-- 내용 시작 -->
<div class="container">
	
	<div class="row">
		<div class="card-deck">
			<div class="card">
				<div class="card-image">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe src="https://www.youtube.com/embed/lm2F7PhS_Rw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title">TOP 10 LARGEST LIVING BIRDS IN THE WORLD</h5>
					<p class="card-text">content death!1</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<div class="card-image">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe src="https://www.youtube.com/embed/Q6RakWBBcF4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title">Smart Animals Compilation</h5>
					<p class="card-text">content death!2</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<div class="card-image">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe src="https://www.youtube.com/embed/48JdwW7XG30" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title">Vom Schlüpfen bis zum ersten Flug</h5>
					<p class="card-text">content death!3</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
			<div class="card">
				<div class="card-image">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe src="https://www.youtube.com/embed/4uWldDTmSkY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title">Greifvogelshow auf der Geierlay</h5>
					<p class="card-text">content death!4</p>
				</div>
				<div class="card-footer">
					<small class="text-muted"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
				</div>
			</div>
		</div>
	</div>
	
</div>
<!-- 내용 끝 -->
