<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>쓰기게시판 내부</title>
		
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
     <form action ="<c:url value='/market/buy/write.aw'/>" accept-charset="utf-8" name = "buy_info" method = "post" class="form-horizontal"  
     	action="<c:url value='/market/buyWrite.aw'/>">
     	<div class="form-group">
     	<label for="title" class="col-sm-2 control-label">제목</label>
     	 <input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력하세요">
     </div>
                              <p style="margin-top:30px">
									<label for="" class="">크기분류</label>
									<select id="size_listSelect" class="select_filter" onclick="" name="size">
										<option value="">-----</option>
										<option value="small">소형</option>
										<option value="middle">중형</option>
										<option value="large">대형</option>
									
									</select>
								
								   
									<label for="" class="">용도분류</label>
									<select id="use_listSelect" class="select_filter" onclick="" name="use">
									    <option value="">-----</option>
										<option value="food">사료및간식</option>
										<option value="playtoy">장난감</option>
										<option value="home">보금자리</option>
										<option value="buty">미용용품</option>
										<option value="medicine">의약품</option>
									    <option value="other">기타</option>
									</select>
							
								 
									<label for="" class="">동물분류</label>
									<select id="animal_listSelect" class="select_filter" onclick="" name="animal">
									    <option value="">-----</option>
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
     
     
     
      
       <div class="form-group">   
     <div class="col-md-12 container">
     <textarea id="summernote" name="content" class="col-md-12 form-control"  style=" border: 1px solid blue;height: 500px" name="body" maxlength="2048"></textarea>
       
        </div>
        </div>
        
        <!-- 여기부터 버튼 -->
         <div style="text-align:center">
	    <a href="<c:url value='/market/buy.aw'/>"><input name="reset" class="btn btn-info" type="button" id="exitBtn" value="취소" ></a>
	        <div class="form-group">
	        <input name="submit" class="btn btn-danger" type="submit" id="enterBtn" value="확인">
	        </div>
	  
	       </div>
	       
	       </form>
	       
	       <div style="margin-bottom: 50px" ></div>
        </div>
  </div>
  
  </form>
   
  </body>

  
