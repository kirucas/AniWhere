<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script>
function check() {			
  
	console.log("여기까지 오나?1");
	var content="\r\n=============상세사항================\r\n";
    content+='제목:'+$('#title').val()+'\r\n';
    content+='판매물품명:'+$('#name').val()+'\r\n';
    content+='희망가:'+$('#price').val()+'원\r\n';
    content+='거래기간:'+$('#time').val()+'일 까지\r\n';	       
    content+='연락처:'+$('#phone').val()+'\r\n'; 
    content+='====================================\r\n';
       
         $('#summernote').summernote('editor.insertText', content);
        	console.log("여기까지 오나?2");
 fr.action="<c:url value='/security/market/groupbuyupdate.aw?groupbuy_no=${record.no}'/>"; 
 return true;
}
    


</script>

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script>

   $(function() {
	   var count = 0;
	  
	  
	      
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
    	 if(count>3){
           	 alert('사진은 최대 4장까지 가능합니다')
           	 return false;
         }
             
         var form_data = new FormData();
         form_data.append('file', file);
         $.ajax({
            data: form_data,
            type: "POST",
            url : "<c:url value='/market/sell/Upload.aw'/>",
            cache: false,
            contentType: false,
            processData: false,
                       
                success: function(url) {
            	 //$('#summernote').summernote('insertImage', "<c:url value='"+url+"' />");
            	 $('#summernote').summernote('insertImage', "<c:url value='"+url+"' />", function (image) {
            		  image.css('width',150);
            		  image.css('height',150);
					  image.attr('name', 'sellpic');
				});
            	 $('img[name=product]').eq(count).attr("src","<c:url value='"+url+"' />");
                 count++;
                 console.log("success");
            },
            error : function() {
               console.log("error");
            }
                   
         });
      }   
   });
     
</script>

</head>

<body>                                                      
 <form name="fr" id="fr" method="post" action="<c:url value='/security/market/groupbuyupdate.aw?groupbuy_no=${record.no}'/>"   accept-charset="utf-8" class="form-horizontal">
	
		<!--   <div class="container"> -->


                 <input type="hidden" name="table_name" value="groupbuy"/>
				 <input type="hidden" name="mem_no" value="${mem_no }">
				 
				 
			<div style="margin-top: 10px"></div>
			

		<!-- 	<div class="col-md-12">  -->
				<label for="title" class="col-sm-2 control-label">제목</label> 
					
						
					<input
						class="form-control" type="text" id="title" name="title" value="${record.title}"
						placeholder="제목을 입력하세요">
						
						
				

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

				<div style="border: 1px silver solid">
					<div class="row" style="text-align: center; margin-left: 20px">
					
					<div class="my-2" style="margin-right:30 px">
						<span >판매제품명</span>
						<input
							style="text-align:right"
							class="form-control" type="text" id="name" required />
					</div>
					
						<div class="my-2" style="margin-right:30 px">
						<span >희망가</span>
						<input
							style="text-align:right"
							class="form-control" type="number" id="price" required />
					</div>
					
						<div class="my-2">
						<span>거래기간</span> 
						<input type="date" min="2018-11-05" style="text-align: right;padding-left: px"
							max="2020-01-01"  class="form-control" type="date" name="deadline" id="time"
							 required />
													
					</div>

						<div class="my-2">
						<span>연락처</span> <input class="form-control" type="number"
							placeholder="집전화,휴대폰번호" style="text-align: right;padding-left:px" id="phone" required/>
					</div>
					</div>
				</div>		
				<p>
					<label for="" class="" style="margin-top: 30px">프로그래스바
						설정:목표수량</label> <input type="text" id="nickname" required  name="goal">개 
					
				<h3 class="my-4">판매자가 올린 사진 3개이상필요</h3> 
				<div class="col-md-12 container">
					<textarea id="summernote" name="content"
							class="col-md-12 form-control"
							style="border: 1px solid blue; height: 500px" 
							maxlength="2048">${record.content}</textarea>
				</div>
				
				<div style="text-align: center">
					<a href="<c:url value='/market/groupbuy.aw'/>">
					<input class="btn btn-info" type="button" id="exitBtn" value="취소"></a>					
					
					<input class="btn btn-danger" type="submit"  value="수정" id="enterBtn" >
				</div>
							
			</form>		
			<div style="margin-bottom: 50px"></div> 
			
			
		<!-- 	<input class="btn btn-danger" type="submit"  value="확인" id="enterBtn" >
-->
		
	

</body>
