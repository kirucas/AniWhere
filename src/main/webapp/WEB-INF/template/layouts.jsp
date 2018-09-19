<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>AniWhere</title>
	
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/css/bootstrap.min.css'/>">
    <%-- <link rel="styleSheet" href="<c:url value='/resources/css/update.css' />"> --%>
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/css/main.css'/>">
    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/css/responsive.css'/>">
    <!--Fonts-->
    <link rel="stylesheet" media="screen" href="<c:url value='/resources/assets/fonts/font-awesome/font-awesome.min.css'/>">
    <link rel="stylesheet" media="screen" href="<c:url value='/resources/assets/fonts/simple-line-icons.css'/>">    
     
    <!-- Extras -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/extras/owl/owl.carousel.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/extras/owl/owl.theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/extras/animate.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/extras/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/extras/settings.css'/>">

    <!-- Color CSS Styles  -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/assets/css/colors/greensea.css'/>" media="screen" />       
	
</head>
<body>
	<div class="container">
		<!-- navigation bar start -->
		<tiles:insertAttribute name="Top" />
		<!-- navigation bar end -->
		
		<!-- content start -->
		<tiles:insertAttribute name="Body" />
		<!-- content end -->
		
		<!-- footer start -->
		<tiles:insertAttribute name="Footer" />
		<!-- footer end -->
	</div><!-- container -->
</body>
	<!-- JavaScript & jQuery Plugins -->
	<!-- jQuery Load -->
	<script src="<c:url value='/resources/assets/js/jquery-min.js'/>"></script>
	<!-- <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script> -->
	<!-- Bootstrap JS -->
	<script src="<c:url value='/resources/assets/js/bootstrap.min.js'/>"></script>
	<!--Text Rotator-->
	<script src="<c:url value='/resources/assets/js/jquery.mixitup.js'/>"></script>
	<!--WOW Scroll Spy-->
	<script src="<c:url value='/resources/assets/js/wow.js'/>"></script>
	<!-- OWL Carousel -->
	<script src="<c:url value='/resources/assets/js/owl.carousel.js'/>"></script>
	
	<!-- WayPoint -->
	<script src="<c:url value='/resources/assets/js/waypoints.min.js'/>"></script>
	<!-- CounterUp -->
	<script src="<c:url value='/resources/assets/js/jquery.counterup.min.js'/>"></script>
	<!-- ScrollTop -->
	<script src="<c:url value='/resources/assets/js/scroll-top.js'/>"></script>
	<!-- Appear -->
	<script src="<c:url value='/resources/assets/js/jquery.appear.js'/>"></script>
	<script src="<c:url value='/resources/assets/js/jquery.vide.js'/>"></script>
	 <!-- All JS plugin Triggers -->
	<script src="<c:url value='/resources/assets/js/main.js'/>"></script>

</html>