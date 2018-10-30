<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<%--<%@ include file="/WEB-INF/views/common/loading.jsp" %>--%>

<div class="container">
	<div class="page-header">
		<h2>
			강아지&nbsp;<small>질문 게시판</small>
		</h2>
	</div>
	<div>
		<form action='<c:url value="/animal/dog/quest/quest_write.aw"/>'>
			<div class="offset-sm-9 col-sm-3" style="padding: 5px;padding-right: 0px">	
				<div align="right">
					<a href="<c:url value='/animal/dog/quest/quest_write.aw'/>"class="btn btn-success">
						<i class="fas fa-pen-square" >글쓰기</i><!-- 아이콘 -->
					</a>
				</div>
			</div>
		</form>
	</div>
	<div class="row">
		<table class="table table-hover table-bordered">
			<thead id="thead"style="background-color:#1ABC9C">
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
							<td class="text-center" scope="row">${record.no}</td>
							<td>
								<a style="color:black;" href="<c:url value='/animal/dog/quest/quest_view.aw?no=${record.no}'/>">${record.quest_title}
									<span class="badge badge-info">${record.quest_hit}</span>
								</a>
							</td>
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
		<div class="offset-sm-5 col-sm-2">${pagingString}</div>
	</div>
	<!-- 페이징 끝 -->
	<div class="row offset-sm-3 col-sm-7">
		<div class="form-row">
			<form class="form-inline" style="padding-bottom: 10px" method="post"
				action="<c:url value='/animal/dog/quest/quest_list.aw'/>">
				<div class="form-group">
					<select name="searchColumn" class="form-control ">
						<option value="quest_title">제목</option>
						<option value="mem_nickname">작성자</option>
						<option value="quest_content">내용</option>
					</select>
				</div>
				<div class="form-group" style="padding-left:5px">
					<input type="text" class="form-control" name="searchWord" />
				</div>
				<div class="form-group" style="padding-left:5px">
					<button type="submit" class="btn btn-outline-primary btn-sm" style="padding-left:10px;font-size:20px">
						<i class="fas fa-search"></i>검색
					</button>
				</div>
			</form>
		</div>
	</div>
</div>