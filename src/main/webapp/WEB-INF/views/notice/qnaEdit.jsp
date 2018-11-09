<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



 <body>
  	<div class="container">
	
	 <div class="page-header">
		  		<h1>1대1문의<small>수정폼</small></h1>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!--		
					폼의 가로폭은 <div >로 감싼후 col-*-*계열로 설정
					폼의 세로폭는 .input-lg 또는 .input-sm 선택자를 .form-control 선택자와 함께 입력
					 -->
					<form class="form-horizontal" method="post" action="<c:url value='/notice/Edit.aw'/>" enctype="multipart/form-data">
						  <input type="hidden" name="no" value="${record.no}"/>
						  
						  <div class="form-group">
						    <label for="name" class="col-sm-2  control-label">작성자</label>
						   	<div class="col-sm-3">
						      <input type="text" value="${record.name}" class="form-control" name="name" id="name" placeholder="작성자를 입력하세요">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="title" class="col-sm-2  control-label">제목</label>
						   	<div class="col-sm-5">
						      <input type="text" value="${record.title}" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
						    </div>
						  </div>
						 
						 
						  <div class="form-group">
						    <label for="content" class="col-sm-2  control-label">내용</label>
						    </div>
						
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-danger">수정</button>
						    </div>
						  </div>
					</form>
					
					
				</div>			
			</div>
			
	    </div>
    	 <!-- 내용 끝 -->
 </body>
</html>