<%@ page language="java" contentType="text/javascript; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		$("#dog_main").click(function(){
			location.href = "<c:url value='/animal/dog/main.aw'/>";
		});
		$("#cat_main").click(function(){
			location.href = "<c:url value='/animal/cat/main.aw'/>";
		});
		$("#rna_main").click(function(){
			location.href = "<c:url value='/animal/rna/main.aw'/>";
		});
		$("#bird_main").click(function(){
			location.href = "<c:url value='/animal/bird/main.aw'/>";
		});
		$("#etc_main").click(function(){
			location.href = "<c:url value='/animal/etc/main.aw'/>";
		});
		$("#market_main").click(function(){
			location.href = "<c:url value='/market/main.aw'/>";
		});
		$("#miss_main").click(function(){
			location.replace("<c:url value='/miss/miss_main.aw' />");
		});
		$("#mating_main").click(function(){
			location.href = "<c:url value='/mating/main.aw' />";
		});
		$("#login").click(function(){
			location.href = "<c:url value='/login.aw' />";
		});
		$("#logout").click(function(){
			location.href = "<c:url value='/signout.aw' />";
		});
		
	});
</script>