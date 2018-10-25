<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function(){
		  $("#Modal1").on("click",function(){
			  
		  });
	  });
</script>
<!-- 내용 시작 -->
<form>
	<div class="container">
		<div>
			<h1>
				<img style="width: 150px; height: 150px;" src="<c:url value='/resources/images/NoticeTitle.jpg'/>"></img>
				공지사항
			</h1>
		</div>
		<hr/>
		<a href="#" data-toggle="modal" data-target="#Modal1">
		<table>
			<th rowspan="2" style="width: 100px;">
				<img style="width: 70px; height: 70px;" src="<c:url value='/resources/images/Notice.jpg'/>"></img>
			</th>
				<td style="font-size: 1.2em">
				</td>
				<tr>
					<td>내용</td>
				</tr>
		</table>
		</a>
		<hr/>
		<a href="#" data-toggle="modal" data-target="#Modal2">
		<table>
			<th rowspan="2" style="width: 100px;">
				<img style="width: 70px; height: 70px;" src="<c:url value='/resources/images/Notice.jpg'/>"></img>
			</th>
				<td style="font-size: 1.2em">제목</td>
				<tr>
					<td>내용</td>
				</tr>
		</table>
		</a>
		<hr/>
		<a href="#" data-toggle="modal" data-target="#Modal3">
		<table>
			<th rowspan="2" style="width: 100px;">
				<img style="width: 70px; height: 70px;" src="<c:url value='/resources/images/Notice.jpg'/>"></img>
			</th>
				<td style="font-size: 1.2em">제목</td>
				<tr>
					<td>내용</td>
				</tr>
		</table>
		</a>
		<hr/>
		<a href="#" data-toggle="modal" data-target="#Modal4">
		<table>
			<th rowspan="2" style="width: 100px;">
				<img style="width: 70px; height: 70px;" src="<c:url value='/resources/images/Notice.jpg'/>"></img>
			</th>
				<td style="font-size: 1.2em">제목</td>
				<tr>
					<td>내용</td>
				</tr>
		</table>
		</a>
		<hr/>
		<a href="#" data-toggle="modal" data-target="#Modal5">
		<table>
			<th rowspan="2" style="width: 100px;">
				<img style="width: 70px; height: 70px;" src="<c:url value='/resources/images/Notice.jpg'/>"></img>
			</th>
				<td style="font-size: 1.2em">제목</td>
				<tr>
					<td>내용</td>
				</tr>
		</table>
		</a>
		<hr/>
		
		
		
	</div>
</form>
<!-- 내용 끝 -->
<!-- 모달창 첫번째 -->
<div class="modal fade" id="Modal1" tabindex="-1" role="dialog"
   aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
         	<!-- 헤더 제목부분 -->
            <h2 class="modal-title" id="ModalTitle" style="margin-left: 10px">제목부분</h2>
            <br/>
            <small style="margin-left: 10px">부제목? 같은거 필요하면 넣으셈</small>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <!-- 헤더 끝 -->
               <span aria-hidden="false">&times;</span>
            </button>
            </br>
         </div>
         </br>
         <div class="modal-body text-center">
         <!-- 내용 넣는 곳-->
         	아무거나 내용 넣어주심ㄴ댐
            </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>
<!-- 모달창 -->


