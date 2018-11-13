<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원가입이 성공하냐 마냐에 따라서 결과 조회 -->
<script>
	<c:choose>
		<c:when test="${edit==1}">
			alert("회원정보 수정 성공! 프로필 페이지로 이동합니다.");
			location.replace("<c:url value='/member_info.aw'/>");
		</c:when>
		<c:when test="${edit==0}">
			alert("회원정보 수정 실패! 수정페이지로 이동합니다.");
			location.replace("<c:url value='/member_info.aw'/>");
		</c:when>		
	</c:choose>
</script>