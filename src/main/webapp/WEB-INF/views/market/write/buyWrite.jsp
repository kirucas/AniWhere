<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>쓰기게시판 내부</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script>
   $(function() {
	   var count=0;
	   
	   $('#enterBtn').click(function(){	
		   title+='['+$('#use_listSelect').val()+']';
		   $('#title').append(title);
		   console.log("성공")
		   
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
            url : "<c:url value='/market/buy/Upload.aw'/>",
            cache: false,
            contentType: false,
            processData: false,
            success: function(url) {
                 $('#summernote').summernote('insertImage', "<c:url value='"+url+"' />");},
            error : function() {
               console.log("error");
            }
         });
      }
   });
   
       	   	   
	   function check() {
	      var isAttached = $('#summernote').summernote('code');
	      if (fr.title.value == "") {

	         alert("제목을 입력해 주세요.");

	         fr.title.focus();

	         return false;

	      } 
	      
	      else if (fr.title.value.length > 50) {

	         alert("제목은 50자 이내로 입력해주세요.");

	         fr.title.focus();

	         return false;

	      } 
	      
	      else if (fr.content.value == "") {
	         alert('내용을 입력하세요.');
	         return false;
	      }	    
	     
   else {
	   
       return true;
    }
}
</script>

</head>
<body>

	<div class="container">

		<div style="margin-top: 10px"></div>
		<br />

		<div class="col-md-12">

			<form name="fr" method="post"  accept-charset="utf-8" 
				class="form-horizontal" action="<c:url value='/security/market/buyinsert.aw'/>">		
				<div class="form-row">
				
				<input type="hidden" name="table_name" value="buy"/>
				 <input type="hidden" name="mem_no" value="${mem_no }">
<!-- 	<input type="hidden" name="mem_no" value="#" /> -->
				
					<label for="title" class="col-sm-2 control-label">제목</label> 
					<input
						class="form-control" type="text" id="title" name="title"
						placeholder="제목을 입력하세요">
				</div>
				
				<p style="margin-top: 30px">


					<label for="" class="">동물분류</label> 
					 <select
						class="select_filter" 
						name="animal_code">
						
						<option value="1">개</option>
						<option value="2">고양이</option>
						<option value="3">파충류</option>
						<option value="4">조류</option>
						<option value="5">기타 포유류</option>
					</select>

				</p>

				<div class="form-group form-row">
					<div class="col-md-12 container">
						<textarea id="summernote" name="content"
							class="col-md-12 form-control"
							style="border: 1px solid blue; height: 500px" 
							maxlength="2048"></textarea>

					</div>
				</div>

				<!-- 여기부터 버튼 -->
				<div style="text-align: center" class="form-group">

					<a href="<c:url value='/market/buy.aw'/>"> 
					<input class="btn btn-info" type="button" id="exitBtn" value="취소"></a>

				<button class="btn btn-primary" type="submit" role="button" id="enterBtn">확인</button>
				
				</div>
				
			</form>
			
			<div style="margin-bottom: 50px"></div>
		</div>
	</div>

</body>


