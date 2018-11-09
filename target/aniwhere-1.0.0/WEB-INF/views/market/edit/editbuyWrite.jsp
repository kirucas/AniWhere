<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script>


</script>

<!-- include summernote css/js-->
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
     
</script>

</head>

<body>

 <form name="fr" id="fr" method="post" action="<c:url value='/security/market/buyupdate.aw?buy_no=${record.no}'/>"  accept-charset="utf-8" 
				class="form-horizontal">
	
		<!--   <div class="container"> -->


                 <input type="hidden" name="table_name" value="groupbuy"/>
				 <input type="hidden" name="mem_no" value="${mem_no }">
				 
				 
			<div style="margin-top: 10px"></div>
			

		<!-- 	<div class="col-md-12">  -->
				<label for="" class="" >제목</label> 
			<input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력하세요" required value="${record.title}"/>

									

				<p style="margin-top: 30px;">
				<label for="" class="">동물분류</label> 
					 <select
						class="select_filter" 
						name="animal_code">
					
					
						<option value="1" ${record.animal_code == 1 ? "selected" : "" }>개</option>
						<option value="2" ${record.animal_code == 2 ? "selected" : "" }>고양이</option>
						<option value="3" ${record.animal_code == 3 ? "selected" : "" }>파충류</option>
						<option value="4" ${record.animal_code == 4 ? "selected" : "" }>조류</option>
						<option value="5" ${record.animal_code == 5 ? "selected" : "" }>기타 포유류</option>
											
					</select>
					
				</p>
								
   
				<div class="col-md-12 container">
					<textarea id="summernote" name="content"
							class="col-md-12 form-control"
							style="border: 1px solid blue; height: 500px" 
							maxlength="2048">${record.content}</textarea>
				</div>
				
				<div style="text-align: center">
					<a href="<c:url value='/market/groupbuy.aw'/>">
					<input class="btn btn-info" type="button" id="exitBtn" value="취소"></a>					
					
					<input class="btn btn-danger" type="submit"  value="확인" id="enterBtn" >
				</div>
				
			
			
			</form>
			
			<div style="margin-bottom: 50px"></div> 
			
					

</body>

					
					 
					

