<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.10/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.10/summernote-bs4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.10/lang/summernote-ko-KR.js"></script>
<script>
	$(function(){
		$("#summernote").summernote({
			placeholder: "내용을 입력하세요",
			height: 300,
			maxHeight: null,
			minHeight: null,
			lang : 'ko-KR',
			width: 1200
		})
	});
	
</script>
<div class="container border">
	<div class="row col-sm-2" >
		강아지 질문 게시판
	</div>
	<form class="form-horizontal" method="post">
		<div class="form-row">
			<input class="form-control" type="text" placeholder="제목을 입력해주세요" />
		</div>
		<div class="form-row pad">
			<textarea id="summernote" class="form-control" rows="30"></textarea>
		</div>
		<div class="form-row">
			<div class="form-group offset-sm-5 col-sm-1">
				<a href="javascript:history.back()"><input type="button" class="btn btn-lg btn-outline-danger" value="취소"/></a>
			</div>
			<div class="form-group col-sm-1">
				<button type="submit" class="btn btn-lg btn-outline-primary" >수정</button>
			</div>
		</div>
	</form>
</div>