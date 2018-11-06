<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<%@ include file="/WEB-INF/views/common/loading.jsp" %>
<style>

a:link { color:black; text-decoration: none;}
a:visited { color:black; text-decoration: none;}

 .movie-write {
	text-align: right;
	color:white!important;
	
}

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

<script>	 


$(function(){
	$(".link-click").click(function(){
		location.href="<c:url value='/bird/movie/view.aw?no="+$(this).attr("name")+"&nowPage="+${nowPage}+"'/>";
	});
});

history.pushState(null, null, '');

window.onpopstate = function(event) {

  var prevUrl = document.referrer;

  if(prevUrl.indexOf('view.aw?no="+$(this).attr("name")+"&nowPage="+${nowPage}+"') < 0){  //뒤로가기를 한 페이지가 test.do 페이지가 아니면 뒤로가기, test.do 페이지면 새로고침합니다.

    history.back();

  }
  else{

    location.href= prevUrl;

  }

};

</script>

<div class="row">
	<c:if test="${empty requestScope.list}" var="isEmpty">
		<div class="col-xs-12">
			<h5 colspan="4">등록된 게시물이 없어요</h5>
		</div>
	</c:if>

	<c:if test="${not isEmpty}">
		<c:forEach var="dto" items="${list}" varStatus="loop">
			<div class="col col-xs-12 col-md-4 margin-top-30">
				<div class="col-sm link-click" style="cursor:pointer;" name="${dto.no}" title="${dto.movie_title}">
					 <div class="embed-responsive embed-responsive-16by9 movie-size">
					  ${dto.movie_tempsrc}
						<!-- 
						<iframe class="embed-responsive-item"
							src="https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
							allowfullscreen></iframe>
					  -->
					</div> 
					
					<div class="media-body">
						 <h5 class="title">${dto.movie_title}</h5>
						 <c:if test="${empty dto.mem_no}">
						<h6 class="nickname">탈퇴한 회원</h6>
						</c:if>
						<c:if test="${not empty dto.mem_no}">
						<h6 class="nickname">${dto.mem_nickname}</h6>
						</c:if>
						<small class="count">조회수 ${dto.movie_count}</small>
						<small class="postdate">${dto.movie_regidate}</small>
					</div>
				</div>
				
			</div>
			<!-- 중간에 라인 -->
			<c:if test="${(loop.index+1) % 6==0}">
				<div class="col-xs-12 col-sm-12"
					style="border: 1px solid gray; margin-top: 10px"></div>
			</c:if>
		</c:forEach>
	</c:if>
		
</div>
   
	<div>
		<!-- 페이지네이션 -->
		<div class="margin-top-20 pagination">
			<nav class="mx-auto" style="width: 450px;"
				aria-label="Page navigation example">
				<div class="row">
					<div>${pagingString}</div>
				</div>
			</nav>
		</div>

		<!-- 아래에 동영상 올리기 버튼 -->
		<div class="text-right">
			<a class="btn btn-primary movie-write"
			href="<c:url value='/security/animal/bird/movie/Write.aw'/>" role="button">동영상
				올리기 </a>
		</div>
	</div>