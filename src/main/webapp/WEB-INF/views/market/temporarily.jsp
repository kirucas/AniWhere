<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 시작 -->
<div class="container">
	
	<div class="jumbotron">
		<h1 class="display-4">This page is market template page</h1>
		<p class="lead">그렇다고....</p>
	</div>
	
	<div class="row">
		<div class="list-group">
			<a href="<c:url value='/market/buy.aw' />" class="list-group-item list-group-item-action">buy</a>
			<a href="<c:url value='/market/sell.aw' />" class="list-group-item list-group-item-action">sell</a>
			<a href="<c:url value='/market/groupbuy.aw' />" class="list-group-item list-group-item-action">group buy</a>
		</div>
	</div>
	
</div>
<!-- 내용 끝 -->
