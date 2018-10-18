<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% session.setAttribute("table_name","dog_quest"); %>
<style>
@import("https://use.fontawesome.com/releases/v5.3.1/css/all.css" )
</style>
<!-- 내용 시작 -->
<div class="container">
	<div class="page-header" style="border:2px solid white">
		<h2>
			강아지&nbsp;<small>질문 게시판</small>
		</h2>
	</div>
	<input type="hidden" name="table_name" value="dog_quest" />
	<div class="wr offset-sm-9 col-sm-3">	
		<div align="right" >
			<a href="<c:url value='/animal/dog/quest/quest_write.aw'/>" 
			class="btn btn-success"><i class="fas fa-pen-square" >글쓰기</i></a>
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
				<c:if test="${empty requestScope.list }" var="isEmpty">
					<tr>
						<td colspan="6" class="text-center">등록된 게시물이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="record" items="${list}" varStatus="loop">
						<tr>
							<td class="text-center" scope="row">${record.quest_no}</td>
							<td><a  href="<c:url value='/animal/dog/quest/quest_view.aw?no=${record.no}'/>">${record.quest_title}<span class="badge badge-info">${record.quest_hit}</span></a></td>
							<td class="text-center">${record.mem_nickname}</td>
							<td class="text-center">${record.quest_count}</td>
							<td class="text-center">${record.quest_hit}</td>
							<td class="text-center">${record.quest_regidate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<!-- 페이징 시작 -->
	<div class="form-row">
		<div>${pagingString}</div>
	</div>
	<!-- 페이징 끝 -->
	<div class="row offset-sm-3 col-sm-7">
		<div class="form-row">
			<form class="form-inline" style="padding-bottom: 10px"
				action="<c:url value='/animal/dog/quest/quest_list.aw'/>">
				<div class="form-group">
					<select name="searchColumn" class="form-control ">
						<option value="title">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" />
				</div>
				<div class="form-group">
					<a type="submit" href="<c:url value='/animal/dog/quest/quest_list.aw'/>" class="si"><i class="fas fa-search"></i>검색</a>
				</div>
			</form>
		</div>
	</div>
</div>