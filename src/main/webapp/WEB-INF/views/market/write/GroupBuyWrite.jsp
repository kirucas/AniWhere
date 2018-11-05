<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	
 fr.action="<c:url value='/security/market/groupbuyinsert.aw'/>"; 
 return true;
}
    
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
         var form_data = new FormData();
         form_data.append('file', file);
         
         $.ajax({
            data: form_data,
            type: "POST",
            url : "<c:url value='/market/groupbuy/Upload.aw'/>",
            cache: false,
            contentType: false,
            processData: false,
                       
                success: function(url) {
            	 //$('#summernote').summernote('insertImage', "<c:url value='"+url+"' />");
            	 $('#summernote').summernote('insertImage', "<c:url value='"+url+"' />", function (image) {
            		 width: 100,
					  image.attr('name', 'grouppic');
				});
            	 $('img[name=product]').eq(count).attr("src","<c:url value='"+url+"' />");
                 count++;
                 console.log("success");
            },
            error : function() {
               console.log("error");
            }
                   
         //   if(file.length>=5||file.length<=2){
         //  	 alert('사진의 최소3장 이상 최대 4장까지 가능합니다')
         //  	 return;
          //  }
            
         });
      }
          
   });
     
</script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>


</head>
<body>
 <form name="fr" id="fr" method="post" onsubmit="return check()"  accept-charset="utf-8" 
				class="form-horizontal">
	
		<div class="container">


                 <input type="hidden" name="table_name" value="groupbuy"/>
				 <input type="hidden" name="mem_no" value="${mem_no }">
				 
				 
			<div style="margin-top: 10px"></div>
			<br />

			<div class="col-md-12">
				<label for="title" class="col-sm-2 control-label">제목</label> 
					<input
						class="form-control" type="text" id="title" name="title"
						placeholder="제목을 입력하세요">

				<p style="margin-top: 30px;">
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
						<option value="0">-----</option>
						<option value="food">사료및간식</option>
						<option value="playtoy">장난감</option>
						<option value="home">보금자리</option>
						<option value="buty">미용용품</option>
						<option value="medicine">의약품</option>
						<option value="other">기타</option>
					</select> 
				</p>

				<div style="border: 1px silver solid">
					<div class="row" style="text-align: center; margin-left: 20px">
						<div class="my-2" style="margin-right:30 px">
						<span >희망가</span>
						<input
							style="text-align:right"
							class="form-control" type="number" id="price" required />
					</div>
					
						<div class="my-2">
						<span>거래기간</span> 
						<input type="date" min="2018-11-05" style="text-align: right;padding-left: px"
							max="2020-01-01"  class="form-control" type="date" name="deadline"
							 required />
							
							<!--  거래기간 넣어주고 제한 걸어주는 로직 만들어야 함  -->
							
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
						<label for=""class=""> 해택종류</label>
						 <select id="use_listSelect"
						class="select_filter" onclick="">
						<option value="nopoint">혜택없음</option>
						<option value="bonus">사은품추가</option>
						<option value="point">포인트 추가</option>
						<option value="other">기타</option>
						
					</select> 
					<label for="" class="">해택상세설명</label> 
					<input type="text" id="nickname">

					<!-- Related Projects Row -->
				<h3 class="my-4">판매자가 올린 사진 3개이상필요</h3>

				<div class="row">

					<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

						<img id="product1" onclick="javascript:changeimage1()"
							class="img-fluid shadow scale"
							src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
							alt="" style="width: 300px; height: 200px;">

					</div>

					<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

						<img id="product2" onclick="javascript:changeimage2()"
							class="img-fluid shadow scale"
							src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
							alt="" style="width: 300px; height: 200px;">

					</div>

					<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

						<img id="product3" onclick="javascript:changeimage3()"
							class="img-fluid shadow scale"
							src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
							alt="" style="width: 300px; height: 200px;">

					</div>

					<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

						<img id="product4" onclick="javascript:changeimage4()"
							class="img-fluid shadow scale"
							src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
							alt="" style="width: 300px; height: 200px;">

					</div>

				</div>
				<!-- /.row -->

				<div class="col-md-12 container">
					<textarea id="summernote" name="content"
							class="col-md-12 form-control"
							style="border: 1px solid blue; height: 500px" 
							maxlength="2048"></textarea>
				</div>
				
				<div style="text-align: center">
					<a href="<c:url value='/market/groupbuy.aw'/>">
					<input class="btn btn-info" type="button" id="exitBtn" value="취소"></a>
					
					<!-- <input class="btn btn-information" type="button" id="enterBtn" value="선택한 내용적용하기"  onclick="showContent(); this.disabled=true;this.value='내용적용완료....';">
					-->
					<input class="btn btn-danger" type="submit"  value="확인" id="enterBtn" >
				</div>
				
				
			</div>
			<div style="margin-bottom: 50px"></div>

		</div>
	</form>

</body>
