<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	/* 
	//jQuery ui의 https://jqueryui.com/effect/참조함
	$(function(){
		 $( ".container" ).effect( 'slide', {},1500 );	
	});
	 */
var isDelete = function(){	
		if(confirm("정말로 삭제 하시겠습니까?"))
			location.replace("<c:url value='/cat/movie/delete.aw?no=${dto.no}'/>");
	}; 
	
</script>

<style>

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
	text-align: right;
}




</style>

<!-- 내용 시작 -->
<div class="container">
	<div class="col margin-top-30">
		<div class="col moda" data-toggle="modal" id="popupMovie"
			data-target="bd-example-modal-lg">
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
			href="<c:url value='/security/animal/cat/movie/edit.aw?no=${dto.no}'/>"
			class="btn btn-success">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:isDelete()" class="btn btn-success">삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
	<a
		href="<c:url value='/cat/movie/List.aw?no=${dto.no}&nowPage=${param.nowPage}'/>"
		class="btn btn-success" style="margin: 0 auto;">목록</a>
</div>
<div class="text-right" style="margin-top: 50px;">
	<div class="horizontal">
		<!-- 한줄 코멘트 입력 폼-->
		<form class="form-inline" id="frm" method="post">
			<label for="inputcomment" class="col-xs-2 col-sm-1 col-md-1 control-label">${sessionScope.mem_id}</label>
			<input type="email" class="form-control col-xs-11 col-sm-9 col-md-9" id="inputcomment"
				placeholder="댓글 추가">&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/animal/cat/movie/Reply.aw?no=${dto.no}'/>"
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