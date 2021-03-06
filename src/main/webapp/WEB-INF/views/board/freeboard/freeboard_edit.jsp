<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script>
$(function() {
	$('#.sel'.option).each(function(){
	    if($(this).val()=='${record.free_category}'){
	      $(this).prop("selected","selected"); // attr적용안될경우 prop으로 
	    }
	  });
    $('#summernote').summernote({
  	 maxHeight:null,
  	 minHeight:null,
  	 height:630,
       callbacks : {
          onImageUpload : function(files, editor, welEditable) {
             for (var i = files.length - 1; i >= 0; i--) {
                sendFile(files[i], this);	
             }
          }
       }
    });
    function sendFile(file, el, wel) {
       var form_data = new FormData();
       form_data.append('file', file);
       $.ajax({
          data: form_data,
          type: "POST",
          url : "<c:url value='/animal/freeboard/Upload.aw'/>",
          cache: false,
          contentType: false,
          processData: false,
          success: function(url) {
               $('#summernote').summernote('insertImage', "<c:url value='/"+url+"' />");
          },
          error : function() {
             console.log("error");
          }
       });
    }
 });
</script>

<style>
@media (max-width: 575.98px) {
	#titlediv {
		margin-top:16px;
		margin-left:1px;
		
	}
	#title{
		width:468.7px;
	}
}
</style>

<!-- 내용 시작 -->
<div class="container">
	<div class="page-header">
		<h2>자유 게시판</h2>
	</div>
	<div style="width: 100%">
		<form method="post"
			action="<c:url value='/security/animal/freeboard/edit.aw'/>">
			<div class="form-group form-row">
				<input type="hidden" name="no" value="${record.no}" /> <input
					type="hidden" name="mem_no" value="${mem_no}" /> <select id="sel"
					name="free_category"
					style="width: 53px; height: 38px; margin-right: 10px;">
					<option selected value="1">잡담</option>
					<option value="2">정보</option>
					<option value="3">유머</option>
					<option value="4">이슈</option>
					<option value="5">시사</option>
				</select>
				<div class="form-row" style="width: 87.5%;" id="titlediv">
					<input type="text" class="form-control" id="title"
						name="free_title" placeholder="제목을 입력하세요"
						value=${record.free_title }>
				</div>
			</div>
			<script>	
				
			</script>
			<div class="form-group form-row">
				<div style="width: 92.75%">
					<textarea rows="10" class="form-control" id="summernote"
						name="free_content">${record.free_content}</textarea>
				</div>
			</div>
			<div class="form-group form-row">
				<div class="col-sm-offset-2">
					<button type="submit" class="btn btn-success">수정</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- 내용 끝 -->