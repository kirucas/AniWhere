<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>공동구매 게시판</title>
	
  
    
  </head>
  <body>
   <div class="container">
   
   <div class="card-header">공동구매 게시판</div>
   
   
  
   	<div class="row">
      <div class="col-md-4">
         <div class="card mb-4">
            <img class="card-img-top" src="//placeimg.com/290/180/any" alt="Card image cap">
            <div class="card-body">
               <h5 class="card-title">[급매!]급매 말머리가 들어간 DB 제목</h5>
               <p class="card-text">DB연동 내용</p>
                 
  		<jsp:include page="ProgressBarsmall2.jsp" />
 
  	
               <a  href="<c:url value='/market/groupbuyinside.aw'/>" class="btn btn-outline-dark btn-sm">상세보기</a>
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
   
      </div>
    
  </body>
