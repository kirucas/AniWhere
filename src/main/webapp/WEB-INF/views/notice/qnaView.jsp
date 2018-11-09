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
		<div class="col-md-12">
			<table class="table table-condensed">
				<thead>

					<tr>
						<th>번호</th>
						<td>${record.no}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${record.title}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${record.name}</td>
					</tr>

					<tr>
						<th>등록일</th>
						<td>${record.postdate}</td>
					</tr>
					<tr>
						<th colspan="2">내용</th>
					</tr>
					<tr>
						<td colspan="2">${record.content}</td>
					</tr>
				</thead>

			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-sm-11" style="text-align: center;">
			<button class="btn btn-default" type="submit">수정</button>
			<button class="btn btn-default" type="submit">삭제</button>
			<button class="btn btn-default" type="submit">목록</button>

		</div>
		
	</div>

</div>
<!-- 내용 끝 -->

</html>