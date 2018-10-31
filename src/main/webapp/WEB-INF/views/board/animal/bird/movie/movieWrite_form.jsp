<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty mem_no }">
<script>
	alert("${mem_no}");
</script>
</c:if>
<style>

.margin-top-10 {
	margin-top: 1.0em;
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

<script>

	function pre_view() {
		var ntWin;
		ntWin = window.open('', 'popup', 'width=600,height=500');
		ntWin.document.getElementsByTagName("body")[0].innerHTML = '';
		
		/* 제목 */
		ntWin.document.write("<br/>" + document.forms[0].movie_title.value + "<br/>");
		
		/* 내용 컨텐츠 */
		ntWin.document.write("<br/>" + document.forms[0].movie_content.value + "<br/>");
	}
	
	
	function check() {
		var isAttached = $('#summernote').summernote('code');
		if (fr.movie_title.value == "") {

			alert("제목을 입력해 주세요.");

			fr.movie_title.focus();

			return false;

		} 
		
		else if (fr.movie_title.value.length > 50) {

			alert("제목은 50자 이내로 입력해주세요.");

			fr.movie_title.focus();

			return false;

		} 
		
		else if (fr.movie_content.value == "") {
			alert('내용을 입력하세요.');
			return false;
		}
 	
		else if (isAttached.indexOf('</iframe>') == -1) {
			alert('영상을 첨부하세요.');
			return false;
		}
		
		/* 영상을 두 개 이상 올리는 것을 막는 루트이나 일단 쓰지 않고 넣어만 둠.
		else if (isAttached.match(/<\/iframe>/gi).length >= 2) {
			alert('영상은 하나만 첨부하세요.');
			return false;
		}
 */		
		 else {
			 return true;
		 }
	}
</script>

<div class="container">
	<form name="fr" method="post" onsubmit="return check()" action="<c:url value='/animal/bird/movie/Write.aw'/>">
		<input type="hidden" name="mem_no" value="${mem_no }">
		<input type="hidden" name="ani_category" value="4">
		<div class="form-group row">
			<label for="validationDefaultUsername"
				class="offset-sm-1 col-sm-1 col-form-label">게시판</label>
			<!-- 내가 지금 어느 게시판에서 쓰고 있는지를 보여주는 disabled input태그 -->
			<div class="col-sm-9">
				<input type="text" class="form-control-planintext"
					id="validationDefaultUsername" disabled="disabled"
					placeholder="예:조류게시판">
				<!-- required disabled -->
			</div>
		</div>
		<div class="form-group row">
			<label for="title" class="offset-sm-1 col-sm-1 col-form-label">제목</label>
			<div class="col-sm-9">
				<input class="form-control" type="text" id="title"
					name="movie_title" placeholder="제목은 50자 이내로 작성해주세요">
			</div>
		</div>

		<div class="form-group row">
			<!-- 섬머노트 부분 -->
			<div class="offset-sm-1 col-sm-10">
				<textarea id="summernote" name="movie_content"></textarea>
			</div>
		</div>

		<!-- 미리보기, 확인 -->
		<div class="margin-top-10 text-right">
			<button class="btn btn-primary border-success margin-right-10"
				name="view" onclick="pre_view()" type="button">미리보기</button>
			<button class="btn btn-primary"
				type="submit" role="button">확인</button>
		</div>
	</form>
</div>

<script>
	/* 섬머노트 부분  */
	$('#summernote').summernote(
			{
				height : 600, // set editor height
				width : $('#summernote').parent().css('width'),
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				/* airMode: true, */
				focus : true,
				placeholder: '영상을 첨부해주시고 내용을 반드시 작성해주세요.',
				// set focus to editable area after initializing summernote
				toolbar : [
				// [groupName, [list of button]]
				[ 'style', [ 'bold', 'italic', 'underline', 'clear' ] ],
						[ 'font', [ 'strikethrough' ] ],
						[ 'fontsize', [ 'fontsize' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'height', [ 'height' ] ], [ 'video', [ 'video' ] ] ]	
			});
</script>