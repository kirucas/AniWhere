<%@ page language="java" contentType="text/javascript; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		$("#market_main").click(function(){
			location.href = "<c:url value='/market/main.aw'/>";
		});
		$("#mating_main").click(function(){
			location.href = "<c:url value='/mating/main.aw' />";
		});
		$("#where_main").click(function(){
			location.href = "<c:url value='/where/main.aw' />";
		});
		$("#login").click(function(){
			location.href = "<c:url value='/login.aw' />";
		});
		$("#logout").click(function(){
			location.href = "<c:url value='/signout.aw' />";
		});
		$("#profile_main").click(function(){
			location.href = "<c:url value='/member_info.aw' />";
		});
		$("#bye").click(function(){
			if(confirm('탈퇴 하시겠습니까?')){
				location.href = "<c:url value='/member_bye.aw' />";
			}
		});
		$("#notice").click(function(){
			location.href = "<c:url value='/notice/List.aw'/>";
		});
		
	});
</script>