<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원가입이 성공하냐 마냐에 따라서 결과 조회 -->
<script>
	<c:choose>
		<c:when test="${check==1}">
			alert("애완동물 등록 성공! 프로필관리 페이지로 이동합니다.");
			location.replace("<c:url value='/member_info.aw'/>");
		</c:when>
		<c:when test="${check==0}">
			alert("애완동물 등록 실패! 애완동물 등록 페이지로 이동합니다.");
			history.back();
		</c:when>		
	</c:choose>
</script>