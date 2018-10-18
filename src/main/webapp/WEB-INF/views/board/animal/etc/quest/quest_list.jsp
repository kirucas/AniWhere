<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<div class="container">
	<div class="page-header" style="border:2px solid white">
		<h2>
			기타 포유류&nbsp;<small>질문 게시판</small>
		</h2>
	</div>
	<div class="wr offset-sm-9 col-sm-3">
		<div align="right" >
			<a href="#" class="btn btn-success"><i class="fas fa-pen-square" >글쓰기</i></a>
		</div>
	</div>
	<div class="row">
		<!-- 테이블전체 가로폭은 테이블을 감싸는  div에 col-*-*로 조정 -->
		<table class="table table-hover table-bordered">
			<thead id="thead" class="co">
				<tr>
					<th scope="col" style="width:8%" class="text-center">글번호</th>
					<th class="text-center" scope="col" >제목<small>(댓글)</small></th>
					<th class="text-center" scope="col" style="width:8%">작성자</th>
					<th class="text-center" scope="col" style="width:8%">조회수</th>
					<th class="text-center" scope="col" style="width:8%">추천수</th>
					<th class="text-center" scope="col" style="width:12%">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="text-center" scope="row">July</th>
					<td><a href="#">july@example.com <span class="badge badge-info">2</span></a></td>
					<td class="text-center">Dooley</td>
					<td class="text-center">Dooley</td>
					<td class="text-center"> 2</td>
					<td class="text-center">2018-05-05</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 페이징 시작 -->
	<div class="row offset-sm-5 col-sm-4">
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
	<!-- 페이징 끝 -->
	<div class="row offset-sm-3 col-sm-7">
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

