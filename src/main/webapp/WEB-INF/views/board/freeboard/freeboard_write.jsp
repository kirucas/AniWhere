<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
	$(function() {
		$('#summernote').summernote(
				{
					height : 350,
					fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
							'Comic Sans MS', 'Courier New', ],
					fontNamesIgnoreCheck : [ '맑은고딕' ],
					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							for (var i = files.length - 1; i >= 0; i--) {
								sendFile(files[i], this);
							}
						}
					}
				});
	});
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : "<c:url value='/animal/freeboard/Upload.aw'/>",
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				$(el).summernote('editor.insertImage',
						"<c:url value='/"+img_name+"'/>");
				$('#summernote').append('<img src="'+url+'" width="480" height="auto"/>');
			},
			error : function(code) {
				console.log("에러가 났다");
			}
		});
	}
</script>
<div class="container">
	<div class="page-header">
		<h2>
			자유 게시판<small>글쓰기</small>
		</h2>
	</div>
	<div class="row">
		<form class="form-horizontal" method="post"
			action="<c:url value='/animal/freeboard/write.aw'/>">
			<div class="form-group">
				<label for="title" class="col-sm-2  control-label">제목</label>
				<div class="col-sm-12">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력하세요">
				</div>
			</div>
			<script>
				
			</script>
			<div class="form-group">
				<label for="summernote" class="col-sm-2  control-label">내용</label>
				<div class="col-sm-12">
					<textarea rows="10" placeholder="내용을 입력하세요" class="form-control"
						id="summernote" name="content"></textarea>
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
<!-- 내용 끝 -->