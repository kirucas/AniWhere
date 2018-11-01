<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
   $(function() {
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
            url : "<c:url value='/miss/see_upload/Upload.aw'/>",
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
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
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
		<h2>
		
			봤어요
		</h2>
	</div>
	<div style="width:100%">
	
		<form method="post" action="<c:url value='/security/miss/see_update.aw?see_no=${record.no}'/>">
			<div class="form-group form-row">
				<input type="hidden" name="table_name" value="see">
				<input type="hidden" name="mem_no" value="#" />
                 	<select name="animal_code" style="width:53px;height:38px;margin-right:10px;">
                         <option value="1">고양이</option>
                         <option value="2">강아지</option>
                         <option value="3">조류</option>
                         <option value="4">파충류</option>
                         <option value="5">양서류</option>
                  	</select>
				<div class="form-row" style="width:87.5%;"id="titlediv">
					<input type="text" class="form-control" id="title" name="title" value="${record.title}">
				</div>
			</div>
			<script>	
				
			</script>
			<div class="form-group form-row">
				<div style="width:92.75%">
					<textarea rows="10" class="form-control" id="summernote" name="content">${record.content}</textarea>
				</div>
			</div>
			<div class="form-group form-row">
				<div class="col-sm-offset-2">
					<button type="submit" class="article-action__button button button--red button--red--border">수정</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- 내용 끝 -->
