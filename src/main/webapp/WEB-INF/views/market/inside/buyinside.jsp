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
    <title>구매게시판 내부</title>
	
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
	
    
  </head>
  <body>
  
    <!-- Page Content -->
    <div class="container">

      <!-- Portfolio Item Heading -->
      <div >
      <h1 class="my-4">[관련태그]
        <small>DB연동 게시글의 제목</small>
      </h1>
</div>
      <!-- Portfolio Item Row -->
      <div class="row">
   

        <div class="col-md-8" style="border:1px solid silver">
          <h3 class="my-3">구매자 아이디</h3>
          
            <h3 class="my-3">상품종류[개][대형][사료]</h3>
        </div>

        <div class="col-md-4" style="border:1px solid silver">
        
          <h3 class="my-3">거래자 정보</h3>
          <ul>
            <li>거래 횟수</li>
            <li>만족 불만족 표시</li>
            <li>회원의 등급</li>
            <li>연락처 정보공개시에만 공개</li>
          </ul>
        </div>

      </div>
      <!-- /.row -->
      <div style="margin-top:10px">
   </div><br/>
      
     <div class="col-md-8">
     <textarea rows="" cols="" style=" border: 1px solid blue;width:1080px;height: 500px"></textarea>
       
        </div>
        
    </div>

  </body>
  </html>
  
