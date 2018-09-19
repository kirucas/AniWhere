<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-dark bg-dark fixed-top navbar-expand-lg">

	<a href="#" class="navbar-brand">
		<img src="<c:url value='/resources/Images/logo.png' />" />
		LOGO Image
	</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTop">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarTop">
		<ul class="navbar-nav nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="#">main</a>
			</li>
			<li>
				<a class="nav-link" href="#">recommend</a>
			</li>
			<li>
				<a class="nav-link" href="#">target</a>
			</li>
			<li>
				<a class="nav-link" href="#">real-time</a>
			</li>
			<li>
				<a class="nav-link" href="#">hot topic</a>
			</li>
		</ul>
		<ul class="navbar-nav navbar-right">
			<li class="nav-item dropdown">
				<button class="btn btn-secondary dropdown-toggle" id="DropdownBtn" data-toggle="dropdown">Login</button>
				<div class="dropdown-menu dropdown-menu-right">
					<a href="#" class="dropdown-item">Sign In</a>
					<a href="#" class="dropdown-item">Sign Up</a>
					<a href="#" class="dropdown-item">Sing Out</a>
					<a href="#" class="dropdown-item">My Profile</a>
				</div>
			</li>
		</ul>
	</div>
</nav>