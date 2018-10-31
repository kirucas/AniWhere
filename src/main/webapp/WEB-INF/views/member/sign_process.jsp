<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원가입이 성공하냐 마냐에 따라서 결과 조회 -->
<script>
	<c:choose>
		<c:when test="${check==1}">
			alert("회원가입 성공! 로그인페이지로 이동합니다.");
			location.replace("<c:url value='/login.aw'/>");
		</c:when>
		<c:when test="${check==0}">
			alert("회원가입 실패! 회원가입페이지로 이동합니다.");
			history.back();
		</c:when>		
	</c:choose>
</script>