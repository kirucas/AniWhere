<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>
<script>
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수
	var showComments = function(key){
		$.ajax({
			url:"<c:url value='/Comment/List.bbs'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:displayComments
		});
	};
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수
	//data;
	//[{"NO":2,"ONELINECOMMENT":}]
	var displayComments = function(data){
		console.log(JSON.stringify(data));
		var commentString = "<h2>한줄 댓글 목록</h2>";
		commentString='<table class="table table-bordered">';
		commentString+='<tr><th width="15%">Writer</th><th width="50%">Comment</th><th width="20%">Date</th><th>삭제</th></tr>'
		if(data.length==0){
			commentString+="<tr><td>저장된 댓글이 없수다</td></tr>";
		}
		$.each(data,function(index,comment){
			commentString+='<tr><td>'+comment['NAME']+'</td>';
			if('${sessionScope.id}'!=comment["ID"])
				commentString+='<td align="left">'+comment['ONELINECOMMENT']+'</td>';
			else
				commentString+='<td align="left"><span style="cursor:pointer;" class="commentEdit" title="'+comment['CNO']+'">'+comment['ONELINECOMMENT']+'</span></td>';
			commentString+='<td>'+comment['CPOSTDATE']+'</td>';
			if('${sessionScope.id}'==comment["ID"])
				commentString+='<td><span class="commentDelete" title="'+comment['CNO']+'" style="cursor: pointer; color: green; font-size: 1.4em; font-weight: bold">삭제</span>'
			else
				commentString+='<td><span style="color: gray; font-size: 0.7em; font-weight: bold">삭제불가</span>'
			commentString+='</td></tr>';	
		});
		commentString+='</table>';
		$('#comments').html(commentString);
		
		//코멘트 수정/삭제 처리
		$('.commentEdit').click(function(){
			$('#title').val($(this).html());
			$('#submit').val('수정');
			
			//form의 hidden 속성 중 name="cno"값 설정
			$('input[name=cno]').val($(this).prop("title"));
		});	
		//코멘트 수정/삭제 처리
		$('.commentDelete').click(function(){
			var cno_value = $(this).prop("title");
			$.ajax({
				url:"<c:url value='/Comment/Delete.bbs'/>",
				data:{cno:cno_value,no:${record.no}},
				dataType:'text',
				type:'post',
				success:
					showComments
			});
		});	
	};
	
	$(function(){
		//페이지 로드시 코멘트 목록 뿌려주기
		showComments(${record.no});
		
		//코멘트 입력
		$('#submit').click(function(){
			
			if($(this).val()=='등록')
				var action="<c:url value='/Comment/Write.bbs'/>";
			else
				var action="<c:url value='/Comment/Edit.bbs'/>";
			
			$.ajax({
				url:action,
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(key){
					showComments(key);
					if($('#submit').val()=='수정'){
						$('#submit').val('등록');
						$('#title').val('');
					}
				}
			});
		});
		
		//메모글 삭제처리]
		$('#del_memo').on('click',function(){
			if(confirm('정말로 삭제각?')){
				location.replace("<c:url value='/BBS/Delete.bbs?no=${record.no}'/>");
			}
		});
		
	});
</script>
<!-- 내용 시작 -->
<div class="container">
	<div class="page-header">
		<h1>
			답변형 게시판 프로젝트<small>상세보기 페이지</small>
		</h1>
	</div>

	<div class="row">
		<!-- 테이블전체 가로폭은 테이블을 감싸는  div에 col-*-*로 조정 -->
		<div>
			<table class="table table-hover table-striped table-bordered">
				<tr>
					<th class="col-md-2 text-center">번호</th>
					<td>${record.no}</td>
				</tr>
				<tr>
					<th class="col-md-2 text-center">제목</th>
					<td>${record.title}</td>
				</tr>
				<tr>
					<th class="col-md-2 text-center">작성자</th>
					<td>${record.name}</td>
				</tr>

				<tr>
					<th class="col-md-2 text-center">등록일</th>
					<td>${record.postdate}</td>
				</tr>
				<tr>
					<th colspan="2" class="text-center">내용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content}</td>
				</tr>

			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="text-center">

			<c:if test="${sessionScope.id==record.id }">
				<a href="<c:url value='/BBS/Edit.bbs?no=${record.no}'/>"
					class="btn btn-success">수정</a>
				<a id="del_memo" href="#" class="btn btn-success">삭제</a>
			</c:if>
			<a href="<c:url value='/BBS/List.bbs'/>" class="btn btn-success">목록</a>

		</div>
	</div>
	<div class="row">
		<!-- 한줄 코멘트 입력 폼-->
		<fieldset>
			<legend>한줄 코멘트 입력 폼</legend>

			<form class="form-inline" id="frm" >
				<input type="hidden" name="no" value="${record.no}" />
				<!-- 수정 및 삭제용 파라미터 -->
				<input type="hidden" name="cno" />
                <input placeholder="댓글을 입력하세요" class="form-control" id="title" type="text" size="50" name="onelinecomment" />
                <input class="btn btn-info"id="submit" type="button" value="등록" />
			</form>
		</fieldset>
		<!-- 한줄 코멘트 입력폼 끝 -->
		<div class="row" id="comments">
			<!-- 한줄 코멘트 목록-->
			<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
		</div>
		
	</div>
</div>
<!-- 내용 끝 -->