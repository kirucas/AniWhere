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
			location.replace("<c:url value='/bird/movie/delete.aw?no=${dto.no}'/>");
	}; 
	
</script>

<style>

.title {
	/* 일정 글자 수 이상은 안보이게 하는 효과 */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	line-height: 1.2em;
	height: 2.4em;
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

/* 라인 긋기 */
.line {
	text-align: center;
}

/* 아이디, 조회수, 아래 페이지네이션에 메인 칼라 추가 */
.btn-primary {
	background-color: #1ABC9C;
	border-color: #1ABC9C;
}

.id {
	color: #1ABC9C;
}

.hits {
	color: #1ABC9C;
}

.pagination {
	margin-left: 150px;
}
</style>

<!-- 내용 시작 -->
<div class="container">
			<div class="col col-xs-12 col-sm-4 margin-top-30">
				<div class="col-sm moda" data-toggle="modal" id="popupMovie" data-target=".bd-example-modal-lg">
					<div class="embed-responsive embed-responsive-16by9 movie-size">
						${dto.movie_tempsrc}
					</div>
					<div class="media-body">
						<h5 class="title">${dto.movie_title}</h5>
						<h6 class="nickname">${dto.mem_nickname}</h6>
						<small class="count">조회수 ${dto.movie_count}</small>
						<small class="postdate">${dto.movie_regidate}</small>
					</div>
				</div>
			</div>
</div>

<div class="col-xs-12 col-sm-12"
					style="border: 1px solid gray; margin-top: 10px"></div>
	<!-- row -->
	<div class="row margin-top-10">
		<div class="text-center">
			<a
				href="<c:url value='/bird/movie/Reply.aw?no=${dto.no}'/>"
				class="btn btn-success">답변</a>
			<c:if test="${sessionScope.mem_no == dto.mem_no}">
				<a
					href="<c:url value='/bird/movie/Edit.aw?no=${dto.no}'/>"
					class="btn btn-success">수정</a>
				<a href="javascript:isDelete()" class="btn btn-success">삭제</a>
			</c:if>
			<a href="<c:url value='/bird/movie/List.aw?no=${dto.no}&nowPage=${param.nowPage}'/>"
				class="btn btn-success">목록</a>
		</div>
	</div>

<!-- 내용 끝 -->