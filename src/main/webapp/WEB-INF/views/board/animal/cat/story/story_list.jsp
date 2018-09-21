<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<div class="container">
	<div class="page-header">
		<h2 id="h2">
			고양이<small>이야기 게시판</small>
		</h2>
	</div>
	<div class="row">
		<!-- 테이블전체 가로폭은 테이블을 감싸는  div에 col-*-*로 조정 -->
		<div>
			<table class="table table-hover table-bordered">
				<thead id="thead">
					<tr>
						<th class="col-md-1 text-center">글번호</th>
						<th class="text-center">제목<small>(댓글)</small></th>
						<th class="col-md-1 text-center">작성자</th>
						<th class="col-md-1 text-center">작성일</th>
						<th class="col-md-1 text-center">조회수</th>
						<th class="col-md-1 text-center">좋아요</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>July</td>
						<td>Dooley <span class="badge" id="badge">2</span></td>
						<td>july@example.com</td>
						<td>Dooley</td>
						<td>Dooley</td>
						<td><i class="fas fa-heart" id="heart"></i> 2</td>
					</tr>
					<tr>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
						<td>Doe</td>
						<td>Doe</td>
						<td>Doe</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@example.com</td>
						<td>Moe</td>
						<td>Moe</td>
						<td>Doe</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
						<td>Dooley</td>
						<td>Dooley</td>
						<td>Doe</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@example.com</td>
						<td>Moe</td>
						<td>Moe</td>
						<td>Doe</td>
					</tr>
				</tbody>
				<div class="col-md-offset-11 col-md-1" style="padding-bottom:5px">
					<a href="#" class="btn btn-success"><i class="fas fa-pen-square">글쓰기</i></a>
				</div>
			</table>
		</div>

	</div>
</div>
<!-- 아래는 페이징 -->
<div class="row">
	<div class="text-center">
		<ul class="pagination text-center">
		  <li class="page-item"><a class="page-link" href="#">&lt</a></li>
		  <li class="page-item"><a class="page-link" href="#">1</a></li>
		  <li class="page-item"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">&gt</a></li>
		</ul>
	</div>
</div>
<!-- 검색용 UI -->
<div class="row">
	<div class="text-center">
		<form class="form-inline" method="post">
			<div class="form-group">
				<select name="searchColumn" class="form-control">
					<option value="title">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" name="searchWord" class="form-control" />
			</div>
			<button type="submit" class="btn btn-primary"><i class="fas fa-search">검색</i></button>
		</form>
	</div>
</div>