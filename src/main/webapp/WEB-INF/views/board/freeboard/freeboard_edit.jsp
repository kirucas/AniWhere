<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
  <!-- 내용 시작 -->  
	    <div class="container">
	    	<div class="page-header">
		  		<h1>One Line Comment Project<small>수정 페이지</small></h1>
			</div>			
			<div class="row">					
					<form class="form-horizontal" method="post" action="<c:url value='/BBS/Edit.bbs'/>">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						 <input type="hidden" name="no" value="${record.no}"/>
						  <div class="form-group">
						    <label for="title" class="col-sm-2  control-label">제목</label>
						   	<div class="col-sm-5">
						      <input value="${record.title}" type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="content" class="col-sm-2  control-label">내용</label>
						    <div class="col-sm-5">
						    	<textarea rows="10" placeholder="내용을 입력하세요" class="form-control"  id="content" name="content">${record.content}</textarea>						    	
						    </div>
						  </div>
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-danger">수정</button>
						    </div>
						  </div>
					</form>
						
			</div>
</div><!-- 내용 끝 -->