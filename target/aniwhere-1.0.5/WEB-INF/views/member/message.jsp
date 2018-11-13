<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원가입이 성공하냐 마냐에 따라서 결과 조회 -->
<script>
	<c:choose>
		<c:when test="${change==1}">
			alert("비밀번호 변경 성공! 로그인페이지로 이동합니다.");
			${sessionScope.invalidate};
			location.replace("<c:url value='/login.aw'/>");
		</c:when>
		<c:when test="${change==0}">
			alert("비밀번호 변경 실패!");
			history.back();
		</c:when>
	</c:choose>
</script>