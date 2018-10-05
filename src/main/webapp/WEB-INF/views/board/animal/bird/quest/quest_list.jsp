<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<div class="container">
	<div class="page-header">
		<h2>
			조류&nbsp;<small>질문 게시판</small>
		</h2>
	</div>
	<div class="wr offset-md-9 col-md-3">
		<div align="right" >
			<a href="#" class="btn btn-success"><i class="fas fa-pen-square" >글쓰기</i></a>
		</div>
	</div>
	<div class="row">
		<!-- 테이블전체 가로폭은 테이블을 감싸는  div에 col-*-*로 조정 -->
		<table class="table table-hover table-bordered">
			<thead id="thead" class="co">
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목<small>(댓글)</small></th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
					<th scope="col">좋아요</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">July</th>
					<td>Dooley <span class="badge" id="badge">2</span></td>
					<td>july@example.com</td>
					<td>Dooley</td>
					<td>Dooley</td>
					<td><i class="fas fa-heart" id="heart"></i> 2</td>
				</tr>
				<tr>
					<th scope="row">July</th>
					<td>Doe</td>
					<td>john@example.com</td>
					<td>Doe</td>
					<td>Doe</td>
					<td>Doe</td>
				</tr>
				<tr>
					<th scope="row">July</th>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>Moe</td>
					<td>Moe</td>
					<td>Doe</td>
				</tr>
				<tr>
					<th scope="row">July</th>
					<td>Dooley</td>
					<td>july@example.com</td>
					<td>Dooley</td>
					<td>Dooley</td>
					<td>Doe</td>
				</tr>
				<tr>
					<th scope="row">July</th>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>Moe</td>
					<td>Moe</td>
					<td>Doe</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row offset-md-5 col-md-4">
		<div class="text-center">
			<ul class="pagination text-center">
			  <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
			</ul>
		</div>
	</div>
	<div class="row offset-md-3 col-md-7">
		<div class="form-row">
				<div class="form-group">
					<select name="searchColumn" class="form-control ">
						<option value="title">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" name="searchWord" class="form-control" />
				</div>
				<div class="form-group">
					<a href="#" class="si"><i class="fas fa-search"></i>검색</a>
				</div>
		</div>
	</div>
</div>

