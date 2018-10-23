<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container border">
<form action="/animal/dog/quest/quest_edit.aw" id="form1"></form>
<form action="/animal/dog/quest/quest_edit.aw" id="form2"></form>
	<div class="row offset-sm-10 col-sm-2">
		<p class="text-right">질문 게시판</p>
	</div>
	<div class="row">
		<h1> ${record.quest_title}</h1>
	</div>	
	<div class="row border">
		<div class="col-sm-1" >
			글쓴이
		</div>
		<div class="col-sm-1">
			 ${record.mem_nickname }
		</div>
		<div class="col-sm-1">
			작성일
		</div>
		<div class="col-sm-2">
			 ${record.quest_regidate}
		</div>
		<form>
		<div class="offset-sm-3 col-sm-4" style="text-align: right;">
			<a href="<c:url value='/animal/dog/quest/quest_edit.aw?=quest_no${record.quest_no}'/>"><input type="hidden" id="ani_category" name="ani_category" value="1" form="form1"/>수정 </a><a href="#">| 삭제 </a><a href="<c:url value='/animal/dog/quest/quest_list.aw'/>"><input type="hidden" id="ani_category" name="ani_category" value="1" form="form2"/>| 목록</a>
		</div>
		</form>
	</div>
	<div class="row border-top-0">
		<div class="offset-sm-8 col-sm-4" style="text-align: right;">
			조회수  ${record.quest_count } &nbsp;&nbsp;| &nbsp;&nbsp;댓글수  5&nbsp;&nbsp; |&nbsp;&nbsp; 추천수   ${record.quest_hit}<!-- 스페이스바 주기 -->
		</div>
	</div>
	<div class="row border">
		<div>
			${record.quest_content}
		</div>
	</div>
	<div class="row border">
		<div class="offset-sm-5 col-sm-1" style="padding: 10px">
			<i class="far fa-thumbs-up fa-4x ic"></i>
		</div><!-- 누른면 색이 꽉차고 빌수도 있게하게 hideen주기 -->
	</div>
</div>
<div class="container border" style="margin-top: 10px;margin-bottom: 10px">
	<div class="row">
		<div class="col-sm-12">
			<strong>댓글</strong> 댓글 5개
		</div>
		<div class="form-row">
			<div class="form-group offset-sm-1 col-sm-10">
				<input class="form-control" type="text" size="70" placeholder="댓글을 입력 하세요" />
			</div>
			<div class="form-group col-sm-1">
				<input type="button" class="btn btn-outline-primary" value="등록"/>
			</div>
		</div>
		<div class="col-sm-4">
			홍길동 &nbsp;&nbsp; 2018-05-05
		</div>
		<div class="offset-sm-7 col-sm-1" style="text-align:right;">
			<a href="#">삭제</a>
		</div>
		<div class="col-sm-12">
			<h4>마나트카너쟈더근무</h4>
		</div>
	</div>
</div>