<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>

<head>
<script>
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
        
    else if (fr.name.value=="") {
        alert("제품명 을 입력해주세요.");
        fr.name.focus();
        return false;
     } 
    
   else if (fr.price.value=="") {
        alert("희망가 를 입력해주세요.");
        fr.price.focus();
        return false;
     } 
   else if (fr.time.value=="") {
        alert("거래기간 을 입력해주세요.");
        fr.time.focus();
         return false;
     } 
   else if (fr.way.value=="") {
         alert("거래방법을  입력해주세요.");
         fr.way.focus();
         return false;

      } 
    
     else if (fr.phone.value=="") {
         alert("연락처 를 입력해주세요.");
         fr.phone.focus();
         return false;

      } 
    
    
   
    else if (fr.content.value == "") {
       alert('내용을 입력하세요.');
       return false;
    }	    
   
else {
	
 fr.action="<c:url value='/security/market/sellinsert.aw'/>"; 
 return true;
}
    
}

</script>

<script>

   $(function() {
	   var count = 0;
	  
	   $('#enterBtn').click(function(){	 
	 /*   var content="=============상세사항================\r\n";
	   content+='제목:'+$('#title').val()+'\r\n';
	   content+='판매물품명:'+$('#name').val()+'\r\n';
		   content+='희망가:'+$('#price').val()+'원\r\n';
		   content+='거래기간:'+$('#time').val()+'일 까지\r\n';
	   content+='거래방법:'+$('#way').val()+'\r\n'; 
          content+='연락처:'+$('#phone').val()+'\r\n'; 
          content+='====================================\r\n';
          $('#summernote').append(content); */
          if(count<3){
        	  alert("사진은 최소 3장 이상 올려야 합니다");
        	 
          }else{
        	  if(check()){
	        	  console.log("성공");
	        	  $('#fr').submit();
        	  }
          }
          return false;
           	 
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
            		  image.css('width',1);
            		  image.css('height',1);
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

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>쓰기게시판 내부</title>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
</head>
<body>
	<div class="container">
	

		<div style="margin-top: 10px"></div>
		<br/>

		<div class="col-md-12">
        <form name="fr" id="fr" method="post" accept-charset="utf-8" 
				class="form-horizontal">
				<div class="form-row">
				<input type="hidden" name="table_name" value="sell"/>
				 <input type="hidden" name="mem_no" value="${mem_no }">
			
					
			<label for="" class="" >제목</label>
			<input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력하세요" required />

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
					
					 <label for="" class="">용도분류</label> 
					 <select id="use_listSelect"
					class="select_filter" >
					
					<option value="사료및간식">사료및간식</option>
					<option value="장난감">장난감</option>
					<option value="보금자리">보금자리</option>
					<option value="미용용품">미용용품</option>
					<option value="의약품">의약품</option>
					<option value="other">기타</option>
				</select>


			</p>
			</div>
		
			
				<div class="row" style="text-align: center; border: 1px silver solid; margin-left: px">
					<div class="my-2" style="margin-right:30 px">
						<span  >제품명</span>
						<input 
							 style="text-align: right;margin-left:px"
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
						<input type="date" min="2018-11-01" style="text-align: right;padding-left: px"
							max="2020-01-01"  class="form-control" type="date"
							id="time" required />
							
							<!--  거래기간 넣어주고 제한 걸어주는 로직 만들어야 함  -->
							
					</div>

					<!--  도로명 주소 인증키:	U01TX0FVVEgyMDE4MTAxNTIxMzIwODEwODIzNjM= -->

					<div class="my-2">
						<span>거래방법</span> <input class="form-control" type="text"
							placeholder="예)직거래,택배등" style="text-align: right;padding-left:px" id="way" required />
					</div>
					<div class="my-2">
						<span>연락처</span> <input class="form-control" type="number"
							placeholder="집전화,휴대폰번호" style="text-align: right;padding-left:px" id="phone" required/>
					</div>

				</div>
										
		     <br/>
							
								
				<!--사진 로직 끝 -->

				
				<div class="col-md-12 container">
<textarea id="summernote" name="content" class="col-md-12 container" style="border: 1px solid blue; height: 500px"
				class="output"		maxlength="2048" required >
										
					
</textarea>
				</div>
				<div style="text-align: center">
					<a href="<c:url value='/market/sell.aw'/>">
					<input class="btn btn-info" type="button" id="exitBtn" value="취소"></a>
					
					<!-- <input class="btn btn-information" type="button" id="enterBtn" value="선택한 내용적용하기"  onclick="showContent(); this.disabled=true;this.value='내용적용완료....';">
					-->
					<input class="btn btn-danger" type="submit"  value="확인" id="enterBtn" >
				</div>	 										
			</form>
			<div style="margin-bottom: 50px"></div>

		</div>
	</div>

	

</body>

