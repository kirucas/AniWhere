<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원가입이 성공하냐 마냐에 따라서 결과 조회 -->
<script>
	<c:choose>
		<c:when test="${check==1}">
			alert("예약 완료! 예약확인 페이지로 이동합니다.");
			location.replace("<c:url value='/security/where/reservation_check.aw'/>");
		</c:when>
		<c:when test="${check==0}">
			alert("예약 실패! 예약페이지로 이동합니다.");
			history.back();
		</c:when>	
		<c:when test="${del==1}">
			alert("예약 취소 완료!!! 예약 확인 페이지로 이동합니다.");
			location.replace("<c:url value='/security/where/reservation_check.aw'/>");
		</c:when>
		<c:when test="${del==0}">
			alert("예약 취소 실패... 예약 확인 페이지로 이동합니다.");
			location.replace("<c:url value='/security/where/reservation_check.aw'/>");
		</c:when>	
	</c:choose>
</script>