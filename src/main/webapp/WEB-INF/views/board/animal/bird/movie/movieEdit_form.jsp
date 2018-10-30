<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.center_div {
	margin: 0 auto;
	width: 80% /* value of your choice which suits your alignment */
}

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

.margin-right-10{
	margin-right: 1.0em;
}

/* 버튼 */
.btn-primary {
	text-align: right;
	background-color: #1ABC9C;
}
</style>
	<div class="container">
		<div class="center_div">
			<div class="form-row margin-top-30">
				<div class="id col-md-1 mb-3 margin-top-7">
					<label for="validationDefault03">게시판</label>
				</div>
				<!-- 내가 지금 어느 게시판에서 쓰고 있는지를 보여주는 disabled input태그 -->
				<div class="col-md-5 mb-3">
					<div class="input-group">
						<div class="input-group-prepend"></div>
						<input type="text" class="form-control"
							id="validationDefaultUsername" placeholder="예:조류게시판"
							aria-describedby="inputGroupPrepend2" required disabled>
					</div>
				</div>
				
			</div>
			<div class="content-form form-row">
				<div class="content col-md-1 mb-3 margin-top-7">
					<label for="validationDefault03">제목</label>
				</div>
				<div class="content-text col-md-11 mb-3">
					<input class="form-control" type="text" placeholder="제목">
				</div>
			</div>


			<!-- 섬머노트 부분 -->
			<div id="summernote"></div>

			<!-- 공개 라디오 버튼 -->
			<div class="radio text-center">
				<div class="radio margin-top-10 text-right">
					<label class="margin-right-10"><input type="radio" class="margin-top-8" name="optionsRadios"
						id="optionsRadios1" value="option1" checked>전체 공개 </label>
						<label><input type="radio" class="margin-top-8" name="optionsRadios" 
						id="optionsRadios2" value="option2">회원 공개 </label>
				</div>
			</div>
			<!-- 임시 저장, 미리보기, 확인 -->
				<div class="margin-top-10 text-right">
					<button class="btn btn-primary border-success margin-right-10" type="button1">임시저장</button>
					<button class="btn btn-primary border-success margin-right-10" type="button2">미리보기</button>
					<button class="btn btn-primary border-success" type="submit">확인</button>
				</div>
		</div>
	</div>
	<script>
		/* 섬머노트 부분  */
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
	</script>