<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
$(function() {
	$('#.sel'.option).each(function(){
	    if($(this).val()=='${record.ani_category}'){
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
          url : "<c:url value='board/animal/cat/tip/Upload.aw'/>",
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
#tip_edit{
	width:100%;
}
#edit_title{
	width:100%;
	margin-left: 1px;
}
#edit_content{
	width:100%;
}
</style>
<div>
	<div id="tip_edit">
		<form method="post" action="<c:url value='/security/board/animal/cat/tip/edit.aw'/>">
			<div class="form-group form-row">
				<input type="hidden" name="no" value="${param.no}" />
				<input type="hidden" name="mem_no" value="${mem_no}" />
				<input type="hidden" name="ani_category" value="2"/>
				<div class="form-row" id="edit_title">
					<input type="text" class="form-control" id="title" name="tip_title" placeholder="제목을 입력하세요" value="${record.tip_title }"/>
				</div>
			</div>
			<div class="form-group form-row">
				<div id="edit_content">
					<textarea rows="10" class="form-control" id="summernote" name="tip_content">${record.tip_content}</textarea>
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