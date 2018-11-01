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
				<div class="title col-xs-12 col-sm-6 col-md-8">${dto.movie_title}</div>
				<div class="nickname col-xs-6 col-md-4">닉네임 ${dto.mem_nickname}</div>
				<div class="count col-xs-12 col-sm-6 col-md-8">조회수
					${dto.movie_count}</div>
				<div class="postdate col-xs-6 col-md-4">등록일 ${dto.movie_regidate}</div>
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
	<div class="text-right margin-top-10">
		<div>
			<a
				href="<c:url value='/cat/movie/Reply.aw?no=${dto.no}'/>"
				class="btn btn-success">댓글</a>
			<c:if test="${sessionScope.mem_no == dto.mem_no}">
				<a
					href="<c:url value='/security/animal/cat/movie/edit.aw?no=${dto.no}'/>"
					class="btn btn-success">수정</a>
				<a href="javascript:isDelete()" class="btn btn-success">삭제</a>
			</c:if>
			<a href="<c:url value='/cat/movie/List.aw?no=${dto.no}&nowPage=${param.nowPage}'/>"
				class="btn btn-success">목록</a>
		</div>
	</div>

<!-- 내용 끝 -->