<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<script>
	<%--$(function() {

		if ($("#content").val() == "") {
			alert("내용을 입력하세요");
			$("#content").focus();
			return false;
		}

	});--%>
</script>




<!-- 내용 시작 -->
<div class="container">

	<div class="page-header">
		<h1>
			1대1문의<small>입력폼</small>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<!--		
					폼의 가로폭은 <div >로 감싼후 col-*-*계열로 설정
					폼의 세로폭는 .input-lg 또는 .input-sm 선택자를 .form-control 선택자와 함께 입력
					 -->
			<form class="form-horizontal" method="post"
				action="<c:url value='/notice/View.aw'/>"
				enctype="multipart/form-data">


				<div class="form-group">
					<label for="title" class="col-sm-2  control-label">제목</label>

				</div>
				<div class="form-group">
				<div class="col-sm-5">
						<input type="text" class="form-control" id="title" name="title"
							placeholder="제목을 입력하세요">
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="col-sm-2  control-label">내용</label>
					<div class="col-sm-5">
					
						<textarea name="content" class="form-control" rows="5" placeholder="내용을 입력하세요"></textarea>

					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-danger">등록</button>
					</div>
				</div>
			</form>


		</div>
	</div>

</div>
<!-- 내용 끝 -->


</html>
