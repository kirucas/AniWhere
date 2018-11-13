<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:choose>
	<c:when test="${error eq 'auth'}">
		<c:set var="message" value="아이디 / 비밀번호를 확인해주세요"/>
		<c:set var="url" value="/login.aw"/>
	</c:when>
	<c:when test="${error eq 'invalid'}">
		<c:set var="message" value="로그아웃되었습니다"/>
		<c:set var="url" value="/"/>
	</c:when>
	<c:otherwise>
		<c:set var="message" value="예상치 못한 오류거나 세션 만료"/>
		<c:set var="url" value="/login.aw"/>
	</c:otherwise>
</c:choose>

<script>
	alert("${message}");
	location.replace("<c:url value='${url}'/>");
</script>

