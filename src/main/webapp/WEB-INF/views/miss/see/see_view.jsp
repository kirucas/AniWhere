<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script>
	var isDelete = function(){
		if(confirm("글을 삭제 하시겠습니까?"))
			location.replace("<c:url value='/miss/see_delete.aw?see_no=${record.no}'/>");
	};
</script>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#content{
	float:none;
	width:100%;
}
</style>

<script>
   //해당 글번호에 대한 코멘트 목록을 뿌려주는 함수
   var showComments = function(key){
      $.ajax({
         url:"<c:url value='/miss/see/cmt_list.awa'/>",
         data:{no:key},
         dataType:'json',
         type:'post',
         success:displayComments
      });
   };
   
   //해당 글번호에 대한 코멘트 목록을 뿌려주는 함수
   //data;
   //[{"NO":2,"ONELINECOMMENT":}]
    var displayComments = function(data){
      console.log(JSON.stringify(data));
    
      var commentString = '<h2 data-v-f39b78c2="" class="comment__title" style="margin-left: 15px;margin-bottom: 15px;">댓글 목록</h2>&nbsp';
      commentString+='<table class="table table-bordered" style="width: 95%; margin-left: 25px">';
      commentString+='<tr><th width="15%">작성자</th><th width="50%">내용</th><th width="20%">등록일</th><th>삭제</th></tr>'
      	if(data.length==0){
        	 commentString+="<tr><td colspan='4' style='text-align: center'>등록된글이 없어요</td></tr>";
    	}  
      
      $.each(data,function(index,comment){
          commentString+='<tr><td>'+comment['mem_nickname']+'</td>';
          if('${sessionScope.mem_no}'!=comment["mem_no"])
             commentString+='<td align="left">'+comment['cmt_content']+'</td>';
          else
             commentString+='<td align="left"><span style="cursor: pointer" title="'+comment['cmt_no']+'" class="commentEdit">'+comment['cmt_content']+'</span></td>';
            
          commentString+='<td>'+comment['regidate']+'</td>';
          commentString+='<td>';
          if('${sessionScope.mem_no}'==comment["mem_no"])
             commentString+='<span class="commentDelete" title="'+comment['cmt_no']+'" style="cursor: pointer; color: green; font-size: 1.4em; font-weight: bold">삭제</span>';

             commentString+='</td></tr>'
       }); 
   
      commentString+='</table>';
      $('#comments').html(commentString);
      
      //코멘트 수정/삭제 처리
      $('.commentEdit').click(function() {
         console.log($(this).attr("title"));
            $("#title").val($(this).html());
            $("#submit").val('수정');
            $('input[mem_nickname=cmt_no]').val($(this).attr("title"));
      });
      $('.commentDelete').click(function() {
            var cno_value = $(this).attr("title");
            $.ajax({
                url:'<c:url value="/miss/see/cmt_delete.awa"/>',
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
      
      //코맨트 입력처리
      $('#submit').click(function(){
         if($(this).val()=='등록')
            var action = "<c:url value='/miss/see/cmt_write.awa'/>";
         else
            var action = "<c:url value='/miss/see/cmt_edit.awa'/>";
         
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


<div class="container">
	<div id="content">
		<div id="view">
			<div class="article">
				<div class="article-header">
					<div class="article__title">
						<c:choose>
							<c:when test="${record.animal_code eq '1'}">
								<span>[고양이]</span>
							</c:when>
							<c:when test="${record.animal_code eq '2'}">
								<span>[강아지]</span>
							</c:when>
							<c:when test="${record.animal_code eq '3'}">
								<span>[조류]</span>
							</c:when>
							<c:when test="${record.animal_code eq '4'}">
								<span>[파충류]</span>
							</c:when>
							<c:otherwise>
								<span>[양서류]</span>
							</c:otherwise>
						</c:choose>
						<span>[${record.addr}]</span>
						${record.title}
						<div style="float: right;">
							<!-- 글에 대한 버튼들(자기가 쓴 글이면 수정과 삭제 가능) -->
							<!-- a href="<c:url value='/ReplyBBS/BBS/Reply.bbs?free_no=${record.no}'/>" class="btn btn-success">답변</a> -->
							<c:if test="${sessionScope.mem_no==record.mem_no }">
								<a href="<c:url value='/security/miss/see_edit.aw?see_no=${record.no}'/>"
									class="article-action__button button">수정</a>
								<a href="javascript:isDelete()"
									class="article-action__button button button--red button--red--border">삭제</a>
							</c:if>
							<a href="<c:url value='/miss/see.aw'/>"
								class="article-action__button button">목록</a>
						</div>
					</div>
					<div class="article-meta">

						<div class="article-meta-list">
							<div class="article-meta__item article-meta__item--name">
								${record.mem_nickname}</div>
							<div class="article-meta__item">
								<span data-tooltip data-date="2018-10-14T06:40:37+00:00"
									title="">${record.regidate}</span>
							</div>
						</div>
						<div class="article-meta-list article-meta-list--right">
							<div class="article-meta__item">
								<span>조회수 ${record.count}</span>
							</div>
							<div class="article-meta__item">
								<span>글번호 ${record.no}</span>
							</div>
						</div>
					</div>
				</div>
				<div class="article-content-wrap">
					<div class="article-content">${record.content}</div>
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
	<div data-v-f39b78c2="" data-post="820136">
		<div data-v-f39b78c2="" class="comment-wrap">
			<!---->
			<div data-v-f39b78c2="" class="comment-header">
				<h2 data-v-f39b78c2="" class="comment__title">댓글 입력</h2>
				<!---->
				<form id="frm" method="post">
					<input type="hidden" name="no" value="${record.no}" />
					<input type="hidden" name="cmt_no"/> 
					<input placeholder="댓글을 입력하세요"class="form-control" style="margin-left:10px;margin-top: 10px; width: 900px; float: left;" id="title" name="cmt_content" /> 
					<input type="button" id="submit" style="float: left; margin-left: 20px; margin-top: 10px" class="btn btn-success" value="등록" /> 
					</br>
					</br>
				</form>
				</br>
				<div class="row" id="comments">
				<!-- 한줄 코멘트 목록-->
				<!-- ajax로 코멘트 목록뿌리기 -->
				</div>
			</div>	
		</div>
	</div>
</div>
</div>