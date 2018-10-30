<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>

<script>
	var isDelete = function() {
		if (confirm("글을 삭제 하시겠습니까?"))
			location
					.replace("<c:url value='/market/buy/buydelete.aw?no=${record.no}'/>");
	};
</script>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>구매게시판 내부</title>



</head>
<body>

	<!-- Page Content -->
	<div class="container">

		<!-- Portfolio Item Heading -->
		<div>
			<h1 class="my-4">
				<c:choose>
					<c:when test="${record.animal_code eq '1'}">
						<span>[개]</span>
					</c:when>
					<c:when test="${record.animal_code eq '2'}">
						<span>[고양이]</span>
					</c:when>
					<c:when test="${record.animal_code eq '3'}">
						<span>[파충류]</span>
					</c:when>
					<c:when test="${record.animal_code eq '4'}">
						<span>[조류]</span>
					</c:when>
					<c:otherwise>
						<span>[기타포유류]</span>
					</c:otherwise>
				</c:choose>
				<small>${record.title}</small>
			</h1>

		</div>
		<!-- Portfolio Item Row -->
		<div class="row">


			<div class="col-md-8" style="border: 1px solid silver">

				<span id="animal_code"> </span>

				<h3 class="my-3">구매자 아이디: ${record.mem_nickname}</h3>

				<h3 class="my-3" id="animal_code">
					관련태그:
					<c:choose>
						<c:when test="${record.animal_code eq '1'}">
							<span>[개]</span>
						</c:when>
						<c:when test="${record.animal_code eq '2'}">
							<span>[고양이]</span>
						</c:when>
						<c:when test="${record.animal_code eq '3'}">
							<span>[파충류]</span>
						</c:when>
						<c:when test="${record.animal_code eq '4'}">
							<span>[조류]</span>
						</c:when>
						<c:otherwise>
							<span>[기타포유류]</span>
						</c:otherwise>
					</c:choose>

				</h3>
			</div>

			<div class="col-md-4" style="border: 1px solid silver">
				<h3 class="my-3">조회수 : ${record.count}</h3>
				<h3 class="my-3">등록일: ${record.regidate}</h3>
				<ul>
					<li>거래 횟수</li>
					<li>만족 불만족 표시</li>
					<li>회원의 등급</li>
					<li>연락처 정보공개시에만 공개</li>
				</ul>

			</div>

		</div>
		<!-- /.row -->
		<div style="margin-top: 10px"></div>
		<br />

		<div class="col-md-12 container">

			<table class="table table-hover table-striped table-bordered">
				<tr>
					<th colspan="2" class="text-center">내용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content}<br />



					</td>
				</tr>

			</table>
		</div>

		<div style="text-align: center">
			<a href="<c:url value='/market/buy.aw'/>"> 
			<input name="reset" class="btn btn-info" type="button" value="목록"></a> 
			
			<c:if test="${sessionScope.mem_no==record.mem_no }">
			<input	name="submit" class="btn btn-danger" type="button" id="fix"value="수정">
			</c:if>
			 <input name="reset" class="btn btn-suceess" style="background-color: #4CAF50;" type="button" id="repl"
	value="답글"> 
				
				<c:if test="${sessionScope.mem_no==record.mem_no }">
				<input name="submit" class="btn " type="button"	id="del" value="삭제">
				</c:if>
				
		</div>
		<div style="margin-bottom: 50px"></div>


	</div>

</body>


