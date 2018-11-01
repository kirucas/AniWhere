<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	/* 삭제 시 확인 질문  */
	var isDelete = function(){	
		if(confirm("정말로 삭제 하시겠습니까?"))
			location.replace("<c:url value='/bird/movie/delete.aw?no=${dto.no}'/>");
	}; 
	
	//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/Comment/List.awa'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:displayComments
		});
	};
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	//data는 아래 형태로 
	//[{"NO":2,"ONELINECOMMENT":"댓글2","CPOSTDATE":"2018-09-12","CNO":3,"ID":"LEE","NAME":"이길동"},{"NO":2,"ONELINECOMMENT":"댓글1","CPOSTDATE":"2018-09-12","CNO":2,"ID":"PARK","NAME":"박길동"}]
	var displayComments	 = function(data){
		console.log(JSON.stringify(data));
		var commentString="<h4>댓글</h4><br/>";
		commentString+='<label for="" class="col-sm-2 control-label">Email</label>';
		commentString+='<tr><th width="15%">작성자</th><th width="50%">코멘트</th><th width="20%">작성일</th><th>삭제</th></tr>';
		if(data.length==0){
			commentString+="<tr><td colspan='4'>등록된 댓글이 없어요</td></tr>";
		}
		$.each(data,function(index,comment){			
			commentString+='<tr><td>'+comment['NAME']+'</td>';
			if('${sessionScope.mem_no}' != comment["ID"])
				commentString+='<td align="left">'+comment['ONELINECOMMENT']+'</td>'; 
			else
				commentString+='<td align="left"><span style="cursor:pointer" class="commentEdit" title="'+comment["cmtdto.cmt_no"]+'">'+comment['ONELINECOMMENT']+'</span></td>'; 		
			commentString+='<td>'+comment['cmtdto.regidate']+'</td>';
			commentString+='<td>';
			if('${sessionScope.mem_no}' == comment["ID"])
				commentString+='<span class="commentDelete" title="'+comment["cmtdto.cmt_no"]+'" style="cursor: pointer; color: green; font-size: 1.4em; font-weight: bold">삭제</span>';
			else
				commentString+='<span style="color: gray; font-size: 0.7em; font-weight: bold">삭제불가</span>';
			commentString+='</td></tr>';
		});		
		commentString+='</table>';
		
		$('#comments').html(commentString);
		
		//코멘트 수정/삭제 처리
		$('.commentEdit').click(function(){
			//cno값 출력
			console.log($(this).attr("title"));
			
			$('#title').val($(this).html());
			$('#submit').val('수정');
			
			//form의 hidden속성중 name="cno"값 설정
			$('input[name=cmtdto.cmt_no]').val($(this).attr("title"));
			
		});
		
		$('.commentDelete').click(function(){			
			var cno_value = $(this).attr("title");
			
			$.ajax({
				url:"<c:url value='/Comment/Delete.bbs'/>",
				data:{cno:cno_value, no:"${cmtdto.cmt_no}"},
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);					
				}		
			});		
		});
	};
	
	$(function(){
		//페이지 로드시 코멘트 목록 뿌려주기
		showComments("${cmtdto.cmt_no}");
	
		//코멘트 입력처리]
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
			if(confirm('정말로 삭제할래?')){
				location.replace("<c:url value='/board/animal/bird/movie/delete.aw?no=${cmtdto.cmt_no}'/>");				
			}
		});
});
	
</script>

<style>
a:link { color:white; text-decoration: none;}
a:visited { color:white; text-decoration: none;}


.title {
	/* 일정 글자 수 이상은 안보이게 하는 효과 */
	font-size: x-large;
}

.nickname {
	font-size: large;
}

/* 행 사이 공간 주기 */
.margin-top-10 {
	margin-top: 1.0em;
}

.margin-top-20 {
	margin-top: 2.0em;
}

.margin-top-30 {
	margin-top: 3.0em;
}

/* 우측 공간 줘서 맞추기  */
.margin-right-10 {
	margin-left: 1.0em;
}

/* 아이디, 조회수, 아래 페이지네이션에 메인 칼라 추가 */
.btn {
	background-color: #1ABC9C;
	border-color: #1ABC9C;
}


</style>

<!-- 내용 시작 -->
<div class="container">
	<div class="col margin-top-30">
		<div class="col" id="popupMovie">
			<div class="col media-header">
				<div class="horizontal" style="text-align: justify;">
				<div class="title col-xs-12 col-sm-6 col-md-8">${dto.movie_title}</div>
				<div class="postdate col-xs-6 col-md-4">등록일 ${dto.movie_regidate}</div>
				</div>
				<c:if test="${empty dto.mem_no}">
				<div class="nickname col-xs-6 col-md-4">탈퇴한 회원</div>
				</c:if>
				<c:if test="${not empty dto.mem_no}">
				<div class="nickname col-xs-6 col-md-4">닉네임 : ${dto.mem_nickname}</div>
				</c:if>
				<div class="count col-xs-12 col-sm-6 col-md-8">조회수 ${dto.movie_count}</div>
			</div>
			<hr />
			<div class="media-body">
				<div class="content">${dto.movie_content}</div>
			</div>
		</div>
	</div>
</div>

<div class="col-xs-12 col-sm-12"
					style="border: 1px solid gray; margin-top: 10px"></div>
	<!-- row -->
<div class="horizontal" style="margin-top: 20px; text-align: right;">
	<c:if test="${sessionScope.mem_no == dto.mem_no}">
		<a
			href="<c:url value='/security/animal/bird/movie/edit.aw?no=${dto.no}'/>"
			class="btn btn-success">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:isDelete()" class="btn btn-success">삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
	<a
		href="<c:url value='/bird/movie/List.aw?no=${dto.no}&nowPage=${param.nowPage}'/>"
		class="btn btn-success" style="margin: 0 auto;">목록</a>
</div>
<div class="text-right" style="margin-top: 50px;">
	<div class="horizontal">
		<!-- 한줄 코멘트 입력 폼-->
		<form class="form-inline" id="frm" method="post">
			<label for="inputcomment" class="col-xs-2 col-sm-1 col-md-1 control-label">${sessionScope.mem_id}</label>
			<input type="email" class="form-control col-xs-11 col-sm-9 col-md-9" id="inputcomment"
				placeholder="댓글 추가">&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/animal/bird/movie/Reply.aw?no=${dto.no}'/>"
			class="btn btn-success col-xs-2 col-sm-1 col-md-1">댓글</a>
		</form>
	</div>
</div>
<br/>

<%-- 		
			<div>${sessionScope.mem_id}</div>&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="hidden" value="${table_name}"/>
			<input type="hidden" value="${dto.mem_no}"/>
			
			<input type="hidden" name="no" value="${cmtdto.cmt_no}" />
				<!-- 수정 및 삭제용 파라미터 -->
			<input type="hidden" name="cmt_no" />
			<input placeholder="댓글을 입력하세요" id="title" value="${cmtdto.cmt_content}" class="form-control" type="text" size="50" name="onelinecomment" />&nbsp;&nbsp;
			<input class="btn btn-success" id="submit" type="button" value="등록" /><hr/>
			 --%>
	<div class="row" id="comments">
		<!-- 한줄 코멘트 목록-->		
		<!-- ajax로 아래에 코멘트 목록 뿌리기 -->	
	</div>
<!-- 내용 끝 -->