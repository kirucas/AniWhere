<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<form id="fr" action="<c:url value='/signInProcess.aw'/>" method="POST">
		<input type="hidden" name="mem_id" value="${sessionScope.mem_id}" />
		<input type="hidden" name="mem_pw" value="${sessionScope.mem_pw}" />
	</form>
	<script type="text/javascript"> 
		this.document.getElementById("fr").submit(); 
	</script> 
</body>
</html>