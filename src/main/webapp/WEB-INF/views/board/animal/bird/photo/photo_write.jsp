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
		<form class="form-horizontal" method="POST" action="/animal/bird/photo.aw" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title" class="col-md-2 control-label">제목</label>
				<div class="col-md-12">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
				</div>
			</div>

			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-12">
					<textarea rows="10" placeholder="내용을 입력해주세요" id="summernote" name="content" class="form-control" style="height: 300px;"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="form-group"">
					<a href="javascript:" onclick="fileUploadAction();"	class="btn btn-primary">사진 업로드</a> 
					<a href="javascript:" id="imgdelete" class="btn btn-danger">되돌리기</a> 
					<input id="files" type="file" multiple name="files" style="display:none;"/>
					<div id="hiddenInput">
						<!-- 인풋 태그 동적 생성용 -->
						
					</div>
				</div>
				<div style="float:right;">
					<input id="uploadButton" type="button" class="btn btn-primary" value="등록"/>
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
	$('#summernote').summernote({
			height : 600, // set editor height
			width : $('#summernote').parent().css('width'),
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			/* airMode: true, */
			focus : true,
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

	/* 바꾼 파일올리기 버튼 설정 */
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#files").trigger('click');
	}/// fileUploadAction
	
	window.onload = function() {
		var filelength = 0;
		// 전체 파일 저장용 변수
		var allFiles=new Array();
		//Check File API support
		if (window.File && window.FileList && window.FileReader) {
			var filesInput = document.getElementById("files");
			filesInput.addEventListener("change",function(event) {
				// 현재 입력에서 들어온 파일을 저장
				var files=event.target.files; //FileList object
				// 파일 최대 갯수 지정
				if (files.length >= 6 || filelength>=6 || allFiles.length>=6) {
					alert('사진은 최대 5장 까지만 가능합니다');
					return;
				}
				// 배열에 들어온 파일들을 저장
				for(var i = 0; i < files.length; i++)
					allFiles.push(files[i]); 
				// 결과 이미지들을 출력할 div
				var output = document.getElementById("result");
				// 이번에 들어온 파일의 길이
				filelength=files.length;
				// 이번에 들어온 파일들을 result div에 출력시킨다
				for (var i=0;i<files.length;i++) {
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
					//Read the image
					picReader.readAsDataURL(file);
				}
			});
		} else {
			alert("이미지 파일만 가능합니다");
		}
		$('#imgdelete').click(function() {
			if (validatePhoto()) {
				console.log('삭제ㄸ ㅣ : ', allFiles.length);
				filelength-=1;
				allFiles.pop();
				$(".thumbnail:last").remove();
			}
		});
		
		$('#uploadButton').click(function() {
			if (validatePhoto()) upload(allFiles);
		});
		
		// 사진을 등록했다면 true
		function validatePhoto() {
			if (allFiles.length==0) {
				alert('사진을 등록해주세요');
				return false;
			}
			return true;
		}/// checkImg
	}/// window.onload = function()
	
	function upload(data){
		var formData=new FormData($("form")[0]);
		formData.append("files",data);
		$.ajax({
			url : "<c:url value='/board/animal/bird/photo/write.aw'/>",
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success:function(url){
				console.log("success");
	        },
	        error:function(){
	            console.log("error");
	        }
		});
	}/// upload
</script>