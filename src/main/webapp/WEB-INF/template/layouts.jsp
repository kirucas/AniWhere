<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>AniWhere</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<!-- jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="/resources/js/move_dropdowns.jsp"/>
<!-- 아이콘 사용을 위한 fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.4/css/all.css">
<link rel="stylesheet" href="<c:url value='/resources/css/button.css'/>">
<!-- summernote 사용을 위한 설정 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<style>
*{
	font-family: 메이플스토리 !important;
}
#page-fade{display:none;}
</style>
<script>
	jQuery(document).ready(function () {
	jQuery('#page-fade').fadeIn(2000);
	}); 
</script>
</head>
<body>
	<div class="container" id="page-fade">
		<!-- navigation bar start -->
		<tiles:insertAttribute name="Top" />
		<!-- navigation bar end -->
		<!-- content start -->
		<tiles:insertAttribute name="Body" />
		<!-- content end -->
		<!-- footer start -->
		<tiles:insertAttribute name="Footer" />
		<!-- footer end -->
	</div>
	<!-- container -->
</body>
</html>