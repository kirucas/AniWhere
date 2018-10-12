<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>쓰기게시판 내부</title>
	
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	
<!-- include summernote css/js-->

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script>

$(document).ready(function() {
     $('#summernote').summernote({
             height: 500,                 // set editor height
             minHeight: 500,             // set minimum height of editor
             maxHeight: 500,             // set maximum height of editor         
             focus: true,// set focus to editable area after initializing summernote
             lang: 'ko-KR'
     });
});

</script>

  </head>
  <body>
  <div class="container">
 
      <div style="margin-top:10px">
   </div><br/>
 
     <div class="col-md-12">
     	<label for="" class="">제목</label> <input class="form-control" type="text" id="nickname">
     
                              <p style="margin-top:30px">
									<label for="" class="">크기분류</label>
									<select id="size_listSelect" class="select_filter" onclick="">
										<option value="small">소형</option>
										<option value="middle">중형</option>
										<option value="large">대형</option>
									
									</select>
								
								   
									<label for="" class="">용도분류</label>
									<select id="use_listSelect" class="select_filter" onclick="">
										<option value="food">사료</option>
										<option value="playtoy">장난감</option>
										<option value="home">보금자리</option>
										<option value="buty">미용용품</option>
										<option value="madicen">의약품</option>
									    <option value="other">기타</option>
									</select>
							
								 
									<label for="" class="">동물분류</label>
									<select id="animal_listSelect" class="select_filter" onclick="">
										<option value="dog">개</option>
										<option value="cat">고양이</option>
										<option value="bird">조류</option>
										<option value="Reptilia">파충류</option>
										<option value="amphibia">양서류</option>
										<option value="fish">어류</option>
										<option value="insect">곤충류</option>
									    <option value="otheranimal">기타</option>
									</select>
								</p>
     
     
     
      
             <input class="form-control" type="text" id="nickname"> 
      <textarea name="content" id="summernote" style=" border: 1px solid blue;width:1080px;height: 500px"></textarea>
       
         <div style="text-align:center">
	        <input class="btn btn-info" type="button" id="enterBtn" value="취소" >
	        <input class="btn btn-danger" type="button" id="exitBtn" value="확인">
	        
	    
	       </div>
        </div>
                
    </div>
   
  </body>
  </html>
  
