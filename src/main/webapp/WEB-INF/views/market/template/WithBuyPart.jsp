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
    <title>공동구매 게시판</title>
	
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
   <div class="container">
   
   
   
   	<div class="card-header" style="margin-top: 50px" >공동구매 게시판</div>
   	
   	<div class="row">
      <div class="col-md-4">
         <div class="card mb-4">
            <img class="card-img-top" src="//placeimg.com/290/180/any" alt="Card image cap">
            <div class="card-body">
               <h5 class="card-title">[급매!]급매 말머리가 들어간 DB 제목</h5>
               <p class="card-text">DB연동 내용</p>
                 
  		<jsp:include page="ProgressBarsmall2.jsp" />
 
  
               <a href="http://www.jquery2dotnet.com/" class="btn btn-outline-dark btn-sm">상세보기</a>
            </div>
         </div>
      </div>
      <div class="col-md-4">
         <div class="card mb-4">
            <img class="card-img-top" src="//placeimg.com/290/180/any" alt="Card image cap">
            <div class="card-body">
               <h5 class="card-title">[급매!]급매 말머리가 들어간 DB 제목</h5>
               <p class="card-text">DB연동 내용</p>
              
  		<jsp:include page="ProgressBarsmall2.jsp" />
 
               <a href="http://www.jquery2dotnet.com/" class="btn btn-outline-dark btn-sm">상세보기</a>
            </div>
         </div>
      </div>
        <div class="col-md-4">
         <div class="card mb-4">
            <img class="card-img-top" src="//placeimg.com/290/180/any" alt="Card image cap">
            <div class="card-body">
               <h5 class="card-title">[급매!]급매 말머리가 들어간 DB 제목</h5>
               <p class="card-text">DB연동 내용</p>
                 
  		<jsp:include page="ProgressBarsmall2.jsp" />
 
               <a href="http://www.jquery2dotnet.com/" class="btn btn-outline-dark btn-sm">상세보기</a>
            </div>
         </div>
      </div>
      
      </div>
   	
   <h3 class="pb-3 mb-4 font-italic border-bottom">

   </h3>
   <div class="row">
      <div class="col-md-6">
         <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
               <strong class="d-inline-block mb-2 text-primary">DB연동제목</strong>
               <h6 class="mb-0">
                  <a class="text-dark" href="#">DB연동작성자</a>
               </h6>
               <div class="mb-1 text-muted small">DB연동작성날자</div>
               <p class="card-text mb-auto">DB연동내용</p>
                  
  		<jsp:include page="ProgressBarsmall.jsp" />
 
  	
               <a class="btn btn-outline-primary btn-sm" role="button" href="">상세보기</a>
            </div>
            <img  class="card-img-right flex-auto d-none d-lg-block" alt="Thumbnail [200x250]" src="//placeimg.com/250/250/arch" style="width: 200px; height: 250px;">
   
         </div>
      </div>
      <div class="col-md-6">
         <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
               <strong class="d-inline-block mb-2 text-success">DB연동제목</strong>
               <h6 class="mb-0">
                  <a class="text-dark" href="#">DB연동작성자</a>
               </h6>
               <div class="mb-1 text-muted small">DB연동작성날자</div>
               <p class="card-text mb-auto">DB연동내용</p>
            
  		<jsp:include page="ProgressBarsmall.jsp" />
 
  	
               <a class="btn btn-outline-success btn-sm" href="">상세보기</a>
            </div>
            <img class="card-img-right flex-auto d-none d-lg-block" alt="Thumbnail [200x250]" src="//placeimg.com/250/250/nature" style="width: 200px; height: 250px;">
         </div>
      </div>
   </div>
   
      
   </div>
  

    
  </body>
</html>