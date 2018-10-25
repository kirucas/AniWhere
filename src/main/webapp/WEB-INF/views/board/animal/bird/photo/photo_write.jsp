<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>
   /* 뿌려진 사진 크기 조정 */
   .thumbnail{
       width:210px;
       height:200px;
       margin: 5px;  
       float: left;
   }
   /* 파일선택 버튼 숨길때 */
   #files{
      opacity: 0;
   }
</style>

<!-- 내용 시작 -->
<div>
	<div class="page-header">
		<h1>
			사진 게시판<small>글쓰기</small>
		</h1>
	</div>
	<div>
		<!-- 입력 폼 시작 -->
		<form class="form-horizontal" method="POST" action="<c:url value='/board/animal/bird/photo/write.aw'/>" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title" class="col-md-2 control-label">제목</label>
				<div class="col-md-12">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
				</div>
			</div>

			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-12">
					<textarea rows="10" placeholder="내용을 입력해주세요" id="content" name="content" class="form-control" style="height: 300px;"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="form-group" style="display: flex;justify-content: left;">
					<a href="javascript:" onclick="fileUploadAction();"	class="btn btn-primary">사진 업로드</a> 
					<a href="javascript:" id="imgdelete" class="btn btn-danger">되돌리기</a> 
					<input id="files" type="file" multiple name="files" style="display:none;"/>
				</div>
				<div style="float:right; display: flex;justify-content: right;">
					<input type="submit" class="btn btn-primary" value="등록"/>
<!-- 					<a href="#" class="btn btn-primary">등록</a> -->
				</div>
			</div>
			<div id="result">
				<!-- 사진 업로드 결과가 나오는 div 인듯 -->			
			</div>

			
		</form>
		<!-- 입력 폼 종료 -->
	</div>
</div>
<!-- 내용 끝 -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	/* 바꾼 파일올리기 버튼 설정 */
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#files").trigger('click');
	}
	
	// 어따넣어야되냐..
	/* var formData = new FormData($('#files')[0]);
	$.ajax({
		url : "<c:url value='/Upload.aw'/>",
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST'
	}); */
	
	window.onload = function() {
		var filelength = 0;
		//Check File API support
		if (window.File && window.FileList && window.FileReader) {
			var filesInput = document.getElementById("files");
			filesInput.addEventListener("change",function(event) {
				var files = event.target.files; //FileList object
				var output = document.getElementById("result");
				filelength += files.length;
				console.log(filelength);
				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					//Only pics
					if (!file.type.match('image'))
						continue;
					var picReader = new FileReader();

					picReader.addEventListener("load",function(event) {
						var picFile = event.target;
						var div = document.createElement("div");
						div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +"title='" + picFile.name + "'/>";
						output.insertBefore(div, null);
					});
					if (files.length >= 6) {
						alert('사진은 최대 5장 까지만 가능합니다');
						break;
					}
					//Read the image
					picReader.readAsDataURL(file);
				}
			});
		} else {
			alert("이미지 파일만 가능합니다");
		}
		$('#imgdelete').click(function() {
			console.log('삭제ㄸ ㅣ : ', filelength);
			filelength.pop();
		});
	}
</script>