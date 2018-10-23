<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.margin-top-10 {
	margin-top: 1.0em;
}
</style>

<script>
	var isDelete = function() {

		if (confirm("정말로 삭제 하시겠습니까?"))
			location
					.replace("<c:url value='/animal/bird/movie/write.aw?no=${record.movie_no}'/>");
	};
</script>

<!-- 내용 시작 -->
<div class="container">
	<div class="row margin-top-10">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">제목 : ${record.title}</h5>
			<small class="hits">조회수 : ${record.hits}</small>

			<!-- 중간에 라인 -->
			<div class="margin-top-10">
				<hr class="line"></hr>
			</div>
			<div class="media-body">
				<h5 class="mt-0 mem_nickname">닉네임 : ${record.mem_nickname}</h5>
				<h6 class="mt-0 movie_regidate">게시일 : ${record.movie_regidate}</h6>
				<p>내용 : ${record.content}</p>
			</div>
		</div>
	</div>

	<!-- row -->
	<div class="row">
		<div class="text-center">
			<a
				href="<c:url value='/animal/bird/movie/Reply.aw?no=${record.movie_no}'/>"
				class="btn btn-success">답변</a>
			<c:if test="${sessionScope.id==record.id }">
				<a
					href="<c:url value='/animal/bird/movie/Edit.aw?no=${record.movie_no}'/>"
					class="btn btn-success">수정</a>
				<a href="javascript:isDelete()" class="btn btn-success">삭제</a>
			</c:if>
			<a href="<c:url value='/animal/bird/movie/List.aw'/>"
				class="btn btn-success">목록</a>
		</div>
	</div>
</div>
<!-- 내용 끝 -->