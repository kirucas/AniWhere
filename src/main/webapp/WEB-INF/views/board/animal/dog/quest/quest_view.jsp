<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function(){
		//메모글 삭제처리]
		$('#delete').on('click',function(){
			if(confirm('삭제 하시겠습니까')){
				location.replace("<c:url value='/animal/dog/quest/quest_delete.aw?no=${record.no}'/>");				
			}
		});
	});
	
	$(function(){
		$('i').on('click',function(){
			$('i').toggle();
		})
	})
</script>
<div class="container border">
	<div class="row border-bottom" style="padding-left:23px;padding-top: 10px;margin-bottom: 0px">
		<p>질문 게시판</p>
	</div>
	<div class="row" style="padding-left:20px;padding-top: 5px;margin-bottom: 0px;height:45px">
		<h1>${record.quest_title}</h1>
	</div>	
	<div class="row" style="padding: 10px;padding-bottom: 0px;text-align:right;padding-right:0px" >
		<div class="col-sm-1" style="text-align:left;padding-right:0px;" >
			글쓴이 &nbsp; &nbsp;|
		</div>
		<div class="col-sm-1" style="text-align:left">
			${record.mem_nickname}
		</div>
		<div class="col-sm-1" style="text-align:left;padding-right:0px;">
			작성일 &nbsp; |
		</div>
		<div class="col-sm-2"  style="text-align:left;">
			${record.quest_regidate}
		</div>
		<div class="offset-sm-4 col-sm-3" style="text-align:right">
			<c:if test="${sessionScope.mem_no == record.mem_no}">
				<a class="text-right" href="<c:url value='/animal/dog/quest/quest_edit.aw?no=${record.no}'/>">수정 &nbsp;</a>
				<a id="delete" href="#">| &nbsp;삭제 |</a>
			</c:if>
			<a href="<c:url value='/animal/dog/quest/quest_list.aw'/>"> &nbsp;&nbsp;목록</a>
			<a href="<c:url value='/animal/dog/quest/quest_reply.aw'/>">|&nbsp;&nbsp;답변</a>
		</div>
	</div>
	<div class="row border-bottom">
		<div class="offset-sm-8 col-sm-4" style="text-align: right;padding-bottom: 10px">
			조회수 ${record.quest_count } &nbsp;&nbsp;| &nbsp;&nbsp;댓글수  5&nbsp;&nbsp; |&nbsp;&nbsp; 추천수   ${record.quest_hit}<!-- 스페이스바 주기 -->
		</div>
	</div>
	<div class="text-center row" style="padding:5px">
		${record.quest_content}
	</div>
	<div class="row">
		<div class="offset-sm-5 col-sm-1" style="padding: 10px">
			<i id="empty" class="far fa-thumbs-up fa-3x btn" style="color:#1fcfcc"></i>
			<i id="full" class="fas fa-thumbs-up fa-3x btn" style="color:#1fcfcc;display:none"></i>
			<p style="text-align:center;"> ${record.quest_hit }</p>
		</div><!-- 누른면 색이 꽉차고 빌수도 있게하게 hideen주기 -->
	</div>
</div>
<!-- 댓글 부분 -->
<div class="container border" style="margin-top: 10px;margin-bottom: 10px">
	<div class="row">
		<div class="col-sm-12">
			<strong style="font-size: 3em">댓글</strong> 댓글 5개
		</div>
		<form id="cmt" method="post">
			<div class="form-row">
				<div class="form-group col-sm-11" style="padding-left: 20px">
					<input class="form-control" type="text" size="200" placeholder="댓글을 입력 하세요" />
				</div>
				<div class="form-group col-sm-1" style="padding-left: 15px">
					<input type="button" class="btn btn-outline-primary" value="등록"/>
				</div>
			</div>
		</form>
	</div>
	<div class="row border-top" style="padding-left:10px;padding-right: 10px">
		<div class="col-sm-5" style="padding-top: 10px;padding-right: 0px">
			홍길동 &nbsp;&nbsp; 2018-05-05
		</div>
		<div class="offset-sm-5 col-sm-2" style="text-align:right;padding-top: 10px">
			<a class="text-right" href="#">삭제</a>
		</div>
		<div class="col-sm-12">
			<h4>마나트카너쟈더근무</h4>
	</div>
	</div>
</div>
