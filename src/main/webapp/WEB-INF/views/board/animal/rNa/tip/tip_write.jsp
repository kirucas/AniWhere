<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
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
            url : "<c:url value='/animal/rNa/tip/Upload.aw'/>",
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
#tip_write{
	width:100%;
}
#write_title{
	width:100%;
	margin-left: 1px;
}
#write_content{
	width:100%;
}
</style>
<div>
	<div id="tip_write">
		<form method="post" action="<c:url value='/security/animal/rNa/tip/write.aw'/>">
			<div class="form-group form-row">
				<input type="hidden" name="mem_no" value="${mem_no}" />
                <input type="hidden" name="ani_category" value="3"/>
				<div class="form-row" id="write_title">
					<input type="text" class="form-control" id="title" name="tip_title" placeholder="제목을 입력하세요">
				</div>
			</div>
			<div class="form-group form-row">
				<div id="write_content">
					<textarea rows="10" class="form-control" id="summernote" name="tip_content"></textarea>
				</div>
			</div>
			<div class="form-group form-row">
				<div class="col-sm-offset-2">
					<button type="submit" class="article-action__button button button--red button--red--border">등록</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- 내용 끝 -->