<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script>
	$(function() {
		$("#tabMenu a").click(function() {
			$(this).tab('show');
			if ($(this).html() == "수정") {
				console.log("수정 클릭");
				$("input[name=mode]").val('UPDATE');
				$(".modal-title").html("수정용 비밀번호 입력창");
			} else if ($(this).html() == "삭제") {
				console.log("삭제 클릭");
				if (confirm("정말로 삭제 하시겠습니까?")) {
					$(".modal-title").html("삭제용 비밀번호 입력창");
					$("input[name=mode]").val('DELETE');
					$("#passwordModal").modal("show");
				}////			
			}////
		});
	});
</script>


<!-- 내용 시작 -->
<div class="container">
	<div class="page-header">
		<h1>
			1대1문의<small>상세보기 페이지</small>
		</h1>
	</div>

	<div class="row">
		<!-- 테이블전체 가로폭은 테이블을 감싸는  div에 col-*-*로 조정 -->
		<div class="col-md-1">
			<table class="table table-hover table-striped table-bordered">
				<tr>
					<th colspan="2" class="text-center">번호</th>
					<td>${record.no}</td>
				</tr>
				<tr>
					<th colspan="2" class="text-center">제목</th>
					<td>${record.title}</td>
				</tr>
				<tr>
					<th colspan="2" class="text-center">작성자</th>
					<td>${record.name}</td>
				</tr>

				<tr>
					<th colspan="2" class="text-center">등록일</th>
					<td>${record.postdate}</td>
				</tr>
				<tr>
					<th colspan="2" class="text-center">내용</th>
					<td colspan="2">${record.content}</td>
				</tr>


			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-11">
			<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
			<ul id="tabMenu" class="nav nav-pills center-block"
				style="width: 195px;">
				<li><a href="#" data-toggle="modal"
					data-target="#passwordModal">수정</a></li>
				<!-- 삭제 취소시에는 모달창이 뜨지 않도록 자스로 제어하기 의해:data-toggle="modal" 제거 -->
				<li><a href="#" data-target="#passwordModal">삭제</a></li>

				<li><a href=" <c:url value='/notice/qna.aw'/>">목록</a></li>
			</ul>
		</div>
	</div>

</div>
<!-- 내용 끝 -->

</html>