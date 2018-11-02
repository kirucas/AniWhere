<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script>
	var isDelete = function(){
		if(confirm("글을 삭제 하시겠습니까?"))
			location.replace("<c:url value='/animal/freeboard/delete.aw?no=${record.no}'/>");
	};
</script>

<script>
//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/animal/freeboard/cmt_list.awa'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:displayComments			
		});
	};
	
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	var displayComments	 = function(data){
		console.log(JSON.stringify(data));
		var commentString='<h2 data-v-f39b78c2="" class="comment__title" style="margin-top: 20px;margin-bottom: 15px;">댓글 목록</h2>';
			commentString+='<div class="row border-top">';
		if(data.length==0){
			commentString+="<h3 class='text-center' style='padding-top:10px;width:100%'>등록된 댓글이 없습니다</h3>";
		}
		$.each(data,function(index,cmt){			
			commentString+='<div class="col-sm-5" style="margin-top: 10px">';
			commentString+=cmt["mem_nickname"]+'&nbsp;&nbsp; '+cmt["regidate"];
			commentString+='</div>';
			commentString+='<div class="offset-sm-5 col-sm-2" style="text-align:right;padding-top: 10px">';
			if('${sessionScope.mem_no}' == cmt["mem_no"])
				commentString+='<span title="'+cmt["cmt_no"]+'" class="commentDelete" style="cursor: pointer; color: orange; font-weight: bold">삭제</span>';
			else
				commentString+='';
			commentString+='</div>';
			commentString+='<div class="col-sm-12">';
			commentString+='<h4 class="commentEdit" style="cursor: pointer;" title="'+cmt["cmt_no"]+'">'+cmt["cmt_content"]+'</h4>';
			commentString+='</div>';
		});		
		commentString+='</div>';
		$('#comments').html(commentString);
		
		//코멘트 수정/삭제 처리
	      $('.commentEdit').click(function() {
	    	  console.log($(this).attr("title"));
	    	  console.log($('input[name=cmt_no]'));
	            $("#title").val($(this).html());
	            $("#submit").val('수정');
	            $('input[name=cmt_no]').val($(this).attr("title"));
	      });
		
		//댓글 삭제 처리
		$('.commentDelete').click(function(){			
			var cno_value = $(this).attr("title");
			$.ajax({
				url:"<c:url value='/animal/freeboard/cmt_delete.awa'/>",
				data:{cno:cno_value,no:${record.no}},
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);					
				}		
			});
		});
	};
	
	$(function(){
		//페이지 로드시 코멘트 목록 뿌려주기
		showComments(${record.no});
		//코멘트 입력처리]
		$('#submit').click(function(){	
			if($(this).val()=='등록')
				var action="<c:url value='/animal/freeboard/cmt_write.awa'/>";
			else
			    var action = "<c:url value='/animal/freeboard/cmt_edit.awa'/>";
			    
			$.ajax({
				url:action,
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);
					if($('#submit').val()=='등록'){
		            	   $("#title").val('');
		            }
		            if($('#submit').val()=='수정'){
		                $("#submit").val('등록');
		                $("#title").val('');
		            }
				}		
			});			
		});
	});
</script>

<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#content{
	float:none;
	width:100%;
}
</style>
<div class="container">
	<div id="content">
		<div id="view">
			<div class="article">
				<div class="article-header">
					<div class="article__title">
					<c:choose>
							<c:when test="${record.free_category eq '1'}">
								<span>[잡담]</span>
							</c:when>
							<c:when test="${record.free_category eq '2'}">
								<span>[정보]</span>		
							</c:when>
							<c:when test="${record.free_category eq '3'}">
								<span>[유머]</span>
							</c:when>
							<c:when test="${record.free_category eq '4'}">
								<span>[이슈]</span>
							</c:when>
							<c:otherwise>
								<span>[시사]</span>
							</c:otherwise>
						</c:choose>
						${record.free_title}
						<div style="float:right;">
							<!-- 글에 대한 버튼들(자기가 쓴 글이면 수정과 삭제 가능) -->
							<!-- a href="<c:url value='/ReplyBBS/BBS/Reply.bbs?no=${record.no}'/>" class="btn btn-success">답변</a> -->
							<c:if test="${sessionScope.mem_no==record.mem_no }">
								<a href="<c:url value='/security/animal/freeboard/edit.aw?no=${record.no}'/>" class="article-action__button button">수정</a>
								<a href="javascript:isDelete()" class="article-action__button button button--red button--red--border">삭제</a>
							</c:if>
							<a href="<c:url value='/animal/freeboard.aw'/>" class="article-action__button button">목록</a>	
							</div>
					</div>
					<div class="article-meta">
								
						<div class="article-meta-list">
							<div class="article-meta__item article-meta__item--name">
								<a
									href="https://talk.op.gg/s/lol/free?q=%EB%9F%B0%EB%B9%8C%EB%A1%9C%EA%BE%B8%EA%BA%BC&amp;target=user_name">
									${record.mem_nickname} </a>
							</div>
							<div class="article-meta__item">
								<span data-tooltip data-date="2018-10-14T06:40:37+00:00"
									title="">${record.free_regidate}</span>
							</div>
						</div>
						<div class="article-meta-list article-meta-list--right">
							<div class="article-meta__item">
								<span>조회수 ${record.free_count}</span>
							</div>
							<div class="article-meta__item">
								<span>글번호 ${record.no}</span>
							</div>
						</div>
					</div>
				</div>
				<div class="article-content-wrap">
					<div class="article-content">
						${record.free_content}
					</div>
				</div>
				<post-vote data-my_vote_score="0" data-downvote_score="3"
					data-upvote_score="71"></post-vote>
				<div class="article-footer">
					<ul class="article-footer__list">
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 부분 -->
<div class="container border" style="margin-top: 15px;margin-bottom: 10px">
	<div class="row">
		<div class="col-sm-12" style="margin-top: 15px">
			<h2 data-v-f39b78c2="" class="comment__title">댓글 입력</h2>
		</div>
		<form id="frm" method="post">
			<input type="hidden" id="cmt_no" name="cmt_no" value="${cmt_no}"/>
			<input type="hidden" id="no" name="no" value="${record.no}"/>
			<div class="form-row" style="width:100%">
				<input style="margin-bottom:10px ;width:83%;margin-left: 20px;margin-top: 10px;" class="form-control" id="title" name="cmt_content"  type="text" size="180" placeholder="댓글을 입력 하세요" />
				<input style="margin-top:10px;margin-left:10px;width:7%; height: 38px" type="button" id="submit" class="btn btn-outline-primary" value="등록"/>
			</div>
		</form>
	</div>
	<div id="comments">
		
	</div>
</div>
</div>