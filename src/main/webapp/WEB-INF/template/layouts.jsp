<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>layouts.jsp</title>	
    <link href="<c:url value='/Bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">   
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>
  	<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  </head>
  <body>
  	<div class="container">
	    <!-- 네비게이션바 시작 -->
	    <tiles:insertAttribute name="Top"/>
	    <!-- 네비게이션바 끝-->	    
	    <!-- 내용 시작 -->
	    <tiles:insertAttribute name="Body"/>
		<!-- 내용 끝 -->
		<!-- 푸터 시작 -->
    	<tiles:insertAttribute name="Footer"/>
    	<!-- 푸터 끝 -->
    </div><!-- container -->
    
  </body>
</html>