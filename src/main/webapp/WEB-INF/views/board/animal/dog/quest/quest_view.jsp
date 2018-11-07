<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<style>
	.fa {font-family : 'FontAwesome'! important; } 
	.fa {font-family : 'FontAwesome'! important; } 
</style>
<script>
	//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/dog/quest/cmtList.awa'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:displayComments			
		});
	};
	
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	var displayComments	 = function(data){
		
		var commentString='<div class="row border-top" style="padding-left:10px;padding-right: 10px">';
		if(data.length==0){
			commentString+="<h3 class='text-center' style='padding-top:10px;width:100%'>등록된 댓글이 없습니다</h3>";
		}
		$.each(data,function(index,cmt){			
			commentString+='<div class="col-md-5" style="padding-top: 10px;padding-right: 0px">';
			commentString+='<strong style="font-size:20px;color:#1fcfcc">'+cmt["mem_nickname"]+'</strong>&nbsp;&nbsp; '+cmt["regidate"];
			commentString+='</div>';
			commentString+='<div class="offset-md-5 col-md-2" style="text-align:right;padding-top: 10px">';
			if('${sessionScope.mem_no}' == cmt["mem_no"])
				commentString+='<span class="commentDelete" title="'+cmt['cmt_no']+'" style="cursor: pointer; color: #1fcfcc; font-size: 1.4em; font-weight: bold">삭제</span>';
			commentString+='</div>';
			commentString+='<div class="border-bottom" style="width:100%">';
			commentString+='<h4 title="'+cmt["cmt_no"]+'" style="margin-left:13px">'+cmt["cmt_content"]+'</h4>';
			commentString+='</div>';
		});		
		commentString+='</div>';
		$('#comments').html(commentString);
		
		//댓글 삭제 처리	
		$('.commentDelete').click(function(){			
			var cno_value = $(this).attr("title");
			$.ajax({
				url:"<c:url value='/dog/quest/cmtDelete.awa'/>",
				data:{cmt_no:cno_value,no:${record.no}},
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
				var action="<c:url value='/security/dog/quest/cmtWrite.awa'/>";
			$.ajax({
				url:action,
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);
					if($('#submit').val()=='등록'){	
						$('#cmt_content').val('');
					}
				}		
			});			
		});
	});
</script>
<script>
	$(function(){
		$(function(){
			//메모글 삭제처리]
			$('#delete').on('click',function(){
				if(confirm('삭제 하시겠습니까')){
					location.replace("<c:url value='/animal/dog/quest/quest_delete.aw?checking=${record.checking}&no=${record.no}'/>");
				}
			});
		});
		
		var data = <%=request.getParameter("no")%>
		var hit = ${record.quest_hit};
		$('#fa1').on('click',function(){
			$.ajax({
				data : {no:data},
				url : "<c:url value='/animal/dog/quest/quest_hit.aw'/>",
				type : 'post',
				success: function(){
					hit = hit+1;
					document.getElementById("quest_hit").innerHTML = hit;
					document.getElementById("quest_hit1").innerHTML = hit;
					$('#fa2').css('display','inline');
					$('#fa1').css('display','none');
				},
				error : function(){
	    			console.log("error");
	    		}
			});
		});
		
		$("#comments").removeAttr("href")
		
	});
</script>
<div class="container border">
	<div class="row border-bottom" style="padding-left:23px;padding-top: 10px;margin-bottom: 0px">
		<h4>질문 게시판</h4>
	</div>
	<div class="row" style="padding-left:20px;padding-top: 5px;margin-bottom: 0px;height:45px">
		<h1>${record.quest_title}</h1>
	</div>	
	<div class="row" style="padding: 10px;padding-bottom: 0px;text-align:left;padding-right:0px" >
		<div class="col-md-1" style="text-align:left;padding-right:0px;" >
			 &nbsp; &nbsp;글쓴이 &nbsp;&nbsp;|
		</div>
		<div class="col-md-2" style="text-align:left">
			<c:if test="${record.mem_no != null}">
				${record.mem_nickname}
			</c:if>
			<c:if test="${record.mem_no == null}">
				탈퇴한 회원
			</c:if>
		</div>
		<div class="col-md-1" style="text-align:left;padding-right:0px;">
			 &nbsp; 작성일 &nbsp; |
		</div>
		<div class="col-md-2"  style="text-align:left;">
			${record.quest_regidate}
		</div>
		<div class="offset-md-3 col-md-3" style="text-align:right">
			<c:if test="${sessionScope.mem_no == record.mem_no}">
				<a class="text-right" href="<c:url value='/security/animal/dog/quest/quest_edit.aw?no=${record.no}&checking=${record.checking}'/>">수정 &nbsp;</a>
				<a id="delete" href="#">| &nbsp;삭제 |</a>
			</c:if>
			<a href="<c:url value='/animal/dog/quest/quest_list.aw'/>"> &nbsp;&nbsp;목록</a>
			<a href="<c:url value='/security/animal/dog/quest/quest_reply.aw?no=${record.no }'/>">|&nbsp;&nbsp;답변</a>
		</div>
	</div>
	<div class="row border-bottom">
		<div class="offset-md-8 col-md-4" style="text-align: right;padding-bottom: 10px">
			조회수 ${record.quest_count } &nbsp;&nbsp;| &nbsp;&nbsp; 추천수&nbsp;  <a id="quest_hit">${record.quest_hit}</a><!-- 스페이스바 주기 -->
		</div>
	</div>
	<div class="text-center row" style="padding-left:15px;padding-top:10px">
		${record.quest_content}
	</div>
	<div class="row">
		<div class="offset-md-5 col-md-1" style="padding: 10px">
			<i id="fa1" class="fa fa-thumbs-o-up fa-3x btn" style="color:#1fcfcc;text-align:center;"></i>
			<i id="fa2" class="fa fa-thumbs-up fa-3x btn" style="display:none;color: #1fcfcc;text-align:center;"></i>
			<p style="text-align:center;" id="quest_hit1">${record.quest_hit}</p>
		</div><!-- 누른면 색이 꽉차고 빌수도 있게하게 hideen주기 -->
	</div>
</div>
<!-- 댓글 부분 -->
<div class="container border" style="margin-top: 10px;margin-bottom: 10px">
	<div class="row">
		<div class="col-md-12">
			<strong style="font-size: 3em">댓글</strong>
		</div>
		<form id="frm" method="post">
			<input type="hidden" id="no" name="no" value="${record.no}"/>
			<input type="hidden" id="cmt_no" name="cmt_no"/>
			<div class="form-row" style="width:100%">
				<input style="margin-bottom:10px ;width:92%;margin-left: 20px" class="form-control" id="cmt_content" name="cmt_content"  type="text" size="200" placeholder="댓글을 입력 하세요" />
				<input style="margin-bottom:10px ;margin-left:10px;width:5%" type="button" id="submit" class="btn btn-outline-primary" value="등록"/>
			</div>
		</form>
	</div>
	<a id="comments">
	</a>
</div>
