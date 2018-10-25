<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.10/lang/summernote-ko-KR.js"></script>
<script>
$(function(){
	$("#quest_content").summernote({
		placeholder: "내용을 입력하세요",
		height: 300,
		maxHeight: null,
		minHeight: null,
		lang : 'ko-KR',
		width: 1200,
		toolbar : [
			['style',['style']],
			['style', ['bold', 'underline', 'clear']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['link','picture','table']],
		    ['style',['height']]
		],
		
	})
});
</script>
<div class="container border">
	<div class="row col-sm-4">
		<h2>강아지 질문 게시판</h2>
	</div>
	<form class="form-horizontal" method="post"
		action='<c:url value="/animal/dog/quest/quest_edit.aw"/>'>
		<div class="form-row">
			<label for="quest_title" class="col-sm-2 control-label" style="font-size:20px">제목</label>
			<input class="form-control" autofocus="autofocus" type="text" name="quest_title" id="quest_title" placeholder="제목을 입력해주세요" value="${record.quest_title}"/>
		</div>
		<div class="form-row pad">
			<label for="quest_content" class="col-sm-2 control-label" style="font-size:20px">내용</label>
			<textarea class="form-control" name="quest_content" id="quest_content" rows="30" placeholder="내용을 입력해주세요">${record.quest_content}</textarea>
		</div>
		<div class="form-row">
			<div class="form-group offset-sm-5 col-sm-1">
				<a href="javascript:history.back()">
					<input type="button" class="btn btn-lg btn-outline-danger" value="취소"/>
				</a>
			</div>
			<input type="hidden" name="quest_no" value="${record.quest_no}" />
			<div class="form-group col-sm-1">
				<button type="submit" class="btn btn-lg btn-outline-primary">수정</button>
			</div>
		</div>
	</form>
</div>