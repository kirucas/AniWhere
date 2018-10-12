<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.content {
	text-align: left;
	font-size: 16px;
}

.margin-top-7 {
	margin-top: 7px;
}

.margin-top-8 {
	margin-top: 8px;
}

.margin-top-10 {
	margin-top: 1.0em;
}

.margin-top-30 {
	margin-top: 3.0em;
}

.margin-right-10 {
	margin-right: 1.0em;
}

/* 버튼 */
.btn-primary {
	text-align: right;
	background-color: #1ABC9C;
}
</style>

<div class="container">
	<form method="post" action="#">
		<div class="form-group row">
			<label for="validationDefaultUsername" class="offset-sm-1 col-sm-1 col-form-label">게시판</label>
			<!-- 내가 지금 어느 게시판에서 쓰고 있는지를 보여주는 disabled input태그 -->
			<div class="col-sm-9">
				<input type="text" class="form-control-planintext" id="validationDefaultUsername" placeholder="예:조류게시판"><!-- required disabled -->
			</div>
		</div>
		<div class="form-group row">
			<label for="movie_title" class="offset-sm-1 col-sm-1 col-form-label">제목</label>
			<div class="col-sm-9">
				<input class="form-control" type="text" id="movie_title" name="title" placeholder="제목">
			</div>
		</div>

		<div class="form-group row">
		<!-- 섬머노트 부분 -->
			<div class="offset-sm-1 col-sm-10">
				<textarea id="summernote" name="editordata"></textarea>
			</div>
		</div>

		
		<!-- 임시 저장, 미리보기, 확인 -->
		<div class="margin-top-10 text-right">
			
			<button class="btn btn-primary border-success margin-right-10" type="button">미리보기</button>
			<button class="btn btn-primary border-success" type="submit">확인</button>
		</div>
	</form>
</div>
<script>
		/* 섬머노트 부분  */
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			width : $('#summernote').parent().css('width'),
			focus : true,
			// set focus to editable area after initializing summernote
			toolbar: [
					    // [groupName, [list of button]]
					    ['style', ['bold', 'italic', 'underline', 'clear']],
					    ['font', ['strikethrough', 'superscript', 'subscript']],
					    ['fontsize', ['fontsize']],
					    ['color', ['color']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
						['video',['video']]
					  ]
		});
		console.log();
	</script>