<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/animal/quest/questcmt/list.aw'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:discmt			
		});
	};
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	//data는 아래 형태로 
	//[{"NO":2,"ONELINECOMMENT":"댓글2","CPOSTDATE":"2018-09-12","CNO":3,"ID":"LEE","NAME":"이길동"},{"NO":2,"ONELINECOMMENT":"댓글1","CPOSTDATE":"2018-09-12","CNO":2,"ID":"PARK","NAME":"박길동"}]
	var discmt	= function(data){
		var cmtStr='<div class="row border-top" style="padding-left:10px;padding-right: 10px">';
		if(data.length==0){
			cmtStr+='<h3>등록된 댓글이 없습니다</h3>';
		}
		$.each(data,function(index,comment){			
			cmtStr+='<div class="col-sm-5" style="padding-top: 10px;padding-right: 0px">';
			if('${sessionScope.mem_no}' == comment["mem_no"])
				cmtStr+='<a class="cmtdelete text-right" title="'+comment["cmt_no"]+'" href="#">삭제</a>';
			else
				cmtStr+='';
			cmtStr+='</div>';
			cmtStr+='<div class="col-sm-12">';
			if('${sessionScope.mem_no}' != comment["mem_no"])
				cmtStr+='<h4>'+comment['cmt_content']+'</h4>';
			else
				cmtStr+=''; 		
			cmtStr+='</div>';
		});		
		cmtStr+='</div>';		
		$('#comments').html(cmtStr);		
		//댓글 삭제 처리	
		$('.cmtdelete').click(function(){			
			var cmt_no = $(this).attr("title");			
			$.ajax({
				url:"<c:url value='/animal/quest/questcmt/delete.aw'/>",
				data:{cno:cmt_no,no:${record.no} },
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
				var action="<c:url value='/animal/quest/questcmt/write.aw'/>";
			$.ajax({
				url:action,
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);
				}		
			});		
		});
		
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
			});
		});
		
	});
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
			<a href="<c:url value='/animal/dog/quest/quest_reply.aw?no=${record.no }'/>">|&nbsp;&nbsp;답변</a>
		</div>
	</div>
	<div class="row border-bottom">
		<div class="offset-sm-8 col-sm-4" style="text-align: right;padding-bottom: 10px">
			조회수 ${record.quest_count } &nbsp;&nbsp;| &nbsp;&nbsp;댓글수  5&nbsp;&nbsp; |&nbsp;&nbsp; 추천수   ${record.quest_hit}<!-- 스페이스바 주기 -->
		</div>
	</div>
	<div class="text-center row" style="padding-left:15px;padding-top:10px">
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
			<strong style="font-size: 3em">댓글</strong> 댓글 0개
		</div>
		<form id="frm" method="post">
			<div class="form-row">
				<input type="hidden" name="no" id="no" value="${record.no}" />
				<div class="form-group col-sm-11" style="padding-left: 20px">
					<input type="hidden">
					<input class="form-control" id="content" name="cmt"  type="text" size="200" placeholder="댓글을 입력 하세요" />
				</div>
				<div class="form-group col-sm-1" style="padding-left: 15px">
					<input type="button" id="submit" class="btn btn-outline-primary" value="등록"/>
				</div>
			</div>
		</form>
	</div>
	<div class="row" id="comments">
	</div>
	
</div>
