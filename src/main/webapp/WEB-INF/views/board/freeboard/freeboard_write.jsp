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
    	 width: 1000,
    	 height:350,
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
<div class="container">
	<div class="page-header">
		<h2>
			자유 게시판
		</h2>
	</div>
	<div class="form-row">
		<form method="post" action="<c:url value='/animal/freeboard/write.aw'/>">
			<div class="form-group form-row">
				<input type="hidden" id="mem_no" name="mem_no" />
                 	<select name="free_category" id="free_category">
                         <option value="1">잡담</option>
                         <option value="2">정보</option>
                         <option value="3">유머</option>
                         <option value="4">이슈</option>
                         <option value="5">시사</option>
                  	</select>
				<div class="form-row">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" style="margin-left:20px">
				</div>
			</div>
			<script>	
				
			</script>
			<div class="form-group form-row">
				<div>
					<textarea rows="10" placeholder="내용을 입력하세요" class="form-control" style="width:100%;height:100%"
						id="summernote" name="content"></textarea>
				</div>
			</div>
			<div class="form-group form-row">
				<div class="col-sm-offset-2">
					<button type="submit" class="btn btn-danger">등록</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- 내용 끝 -->