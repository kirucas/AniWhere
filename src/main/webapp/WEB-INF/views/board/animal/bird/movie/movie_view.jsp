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
	
	
	/*댓글 입력 시 한 글자 이상 입력하도록.  */
	function check() {
		if (fr.inputcomment.value == "") {

			alert("댓글을 한글자 이상 입력해 주세요.");

			fr.inputcomment.focus();

			return false;
		} 
		 else {
			 return true;
		 }
	}
	
	
	//댓글
	//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/board/animal/bird/movie/commentList.awa'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:function(data){
				displayComments(data);
			}
		});
	};
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	//data는 아래 형태로 
	//[{"NO":2,"ONELINECOMMENT":"댓글2","CPOSTDATE":"2018-09-12","CNO":3,"ID":"LEE","NAME":"이길동"},{"NO":2,"ONELINECOMMENT":"댓글1","CPOSTDATE":"2018-09-12","CNO":2,"ID":"PARK","NAME":"박길동"}]
	function displayComments(data){
		console.log("data :"+data);
		var commentString="<div class='form-group'>";
		 	if(data.length==0){
			commentString+="<label>등록된 댓글이 없어요</label>";
		}
	
		 $.each(data,function(index,comment){
			 /*로그인한 사용자가 먼저 댓글한 사용자가 아닐 때는 삭제 수정이 불가능함  */
			//if('${sessionScope.mem_no}' != '${dto.mem_no}')
				commentString+="<label>"+comment['nickname']+"</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//else
				commentString+="<label style='color: gray;'>"+comment['regidate']+"</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			/* 로그인한 사용자가 선댓글한 사용자일 때 삭제 수정이 가능해야 함 */
			if('${sessionScope.mem_no}' == '${dto.mem_no}')
				commentString+='<span class="commentDelete" cmt_content="'+comment['nickname']+'" style="cursor: pointer; color: green; font-size: 1.2em; font-weight: bold">삭제</span><br/>';
			else
				commentString+='<span style="color: gray; font-size: 0.7em; font-weight: bold">삭제불가</span><br/>';
				commentString+='<label>'+comment['comment_content']+'</label><br/><br/>';
		
			});		
		 		commentString+="</div>";
		console.log("commentString :"+commentString);
		
		
		$('#comments').html(commentString);
		
		//코멘트 수정/삭제 처리
		$('.commentEdit').click(function(){
			//cno값 출력
			console.log($(this).attr("cmt_content"));
			
			$('#cmt_content').val($(this).html());
			$('#submit').html('수정');
			
			//form의 hidden속성중 name="cno"값 설정
			$('input[name=nickname]').val($(this).attr("cmt_content"));
			
		});
		
		$('.commentDelete').click(function(){			
			var cno_value = $(this).attr("cmt_content");
			
			$.ajax({
				url:"<c:url value='/board/animal/bird/movie/commentDelete.awa'/>",
				data:{cno:cno_value, no:"${cmtdto.cmt_no}"},
				dataType:'json',
				type:'post',
				success:function(key){					
					showComments(key);					
				}		
			});		
		});
	};
	
	$(function(){
		//페이지 로드시 코멘트 목록 뿌려주기
		showComments("${dto.no}");
	
		//코멘트 입력처리]
		$('#submit').click(function(){
			if($(this).html()=='댓글')
				var action="<c:url value='/security/animal/bird/movie/commentWrite.awa'/>";
			else
				var action="<c:url value='/security/animal/bird/movie/commentEdit.awa'/>";
			
			$.ajax({
				url:action,
				data: {cmt_content: $('#inputcomment').val(), no : '${dto.no}'},
				dataType:'text',
				type:'post',
				success:function(key){
					console.log('come');
					showComments(key);
					if($('#submit').html()=='수정'){						
						$('#submit').html('등록');
						$('#cmt_content').val('');
					}
				},
				error : function(request, status, error){
		            console.log("code : %s\r\nmessage : %s\r\nerror : %s\r\nstatus : %s", request.status, request.responseText, error, status);
		         }
			});		
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
<div class="text-right" style="margin-top: 20px;">
	<div class="horizontal">
		<!-- 한줄 코멘트 입력 폼-->
		<form class="form-inline" onsubmit="return check()" id="frm" name="fr" method="post" style="margin: 0px auto;">
			<label for="inputcomment" class="col-xs-2 col-sm-1 col-md-1 control-label">${sessionScope.mem_id}</label>
			<input type="text" id="cmt_content" class="form-control col-xs-11 col-sm-9 col-md-9" name="inputcomment"
				placeholder="댓글 추가">&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-success col-xs-1 col-sm-1" id="submit">댓글</a>
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
			<input placeholder="댓글을 입력하세요" id="cmt_content" value="${cmtdto.cmt_content}" class="form-control" type="text" size="50" name="inputcomment" />&nbsp;&nbsp;
			<input class="btn btn-success" id="submit" type="button" value="등록" /><hr/>
			 --%>
<form id="comments">
	<!-- 한줄 코멘트 목록-->
	<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
<%-- 	
	<div class="form-group">
		<label>닉네임 : ${dto.mem_nickname }</label>
		<label>댓글 날짜 : ${cmtdto.regidate}</label> <br/>
		<p>댓글 내용 ${cmtdto.cmt_content}</p>
	</div><br/>
 --%>
</form>
<!-- 내용 끝 -->