<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	//jQuery ui의 https://jqueryui.com/effect/참조함
	$(function(){
		 $( ".container" ).effect( 'slide', {},1500 );	
	});
	
</script>
<script>
	
	//해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/bird/movie/List.awa'/>",
			data:{no:key},
			dataType:'json',
			type:'post',
			success:displayComments			
		});
	};
	//해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	//data는 아래 형태로 
	//[{"NO":2,"ONELINECOMMENT":"댓글2","CPOSTDATE":"2018-09-12","CNO":3,"ID":"LEE","NAME":"이길동"},{"NO":2,"ONELINECOMMENT":"댓글1","CPOSTDATE":"2018-09-12","CNO":2,"ID":"PARK","NAME":"박길동"}]
	var displayComments	 = function(data){
		console.log(JSON.stringify(data));
		var commentString="<h2>한줄 댓글 목록</h2>";
		commentString+='<table class="table table-bordered">';
		commentString+='<tr><th width="15%">작성자</th><th width="50%">코멘트</th><th width="20%">작성일</th><th>삭제</th></tr>';
		if(data.length==0){
			commentString+="<tr><td colspan='4'>등록된 댓글이 없어요</td></tr>";
		}
		$.each(data,function(index,comment){			
			commentString+='<tr><td>'+comment['NAME']+'</td>';
			if('${sessionScope.id}' != comment["ID"])
				commentString+='<td align="left">'+comment['ONELINECOMMENT']+'</td>'; 
			else
				commentString+='<td align="left"><span style="cursor:pointer" class="commentEdit" title="'+comment["CNO"]+'">'+comment['ONELINECOMMENT']+'</span></td>'; 		
			commentString+='<td>'+comment['CPOSTDATE']+'</td>';
			commentString+='<td>';
			if('${sessionScope.id}' == comment["ID"])
				commentString+='<span  class="commentDelete" title="'+comment["CNO"]+'" style="cursor: pointer; color: green; font-size: 1.4em; font-weight: bold">삭제</span>';
			else
				commentString+='<span style="color: gray; font-size: 0.7em; font-weight: bold">삭제불가</span>';
			commentString+='</td></tr>';
		});		
		commentString+='</table>';
		
		$('#comments').html(commentString);
		
		//코멘트 수정/삭제 처리
		$('.commentEdit').click(function(){
			//cno값 출력
			console.log($(this).attr("title"));
			
			$('#title').val($(this).html());
			$('#submit').val('수정');
			
			//form의 hidden속성중 name="cno"값 설정
			$('input[name=cno]').val($(this).attr("title"));
			
		});
		
		$('.commentDelete').click(function(){			
			var cno_value = $(this).attr("title");
			
			$.ajax({
				url:"<c:url value='/bird/movie/Delete.aw'/>",
				data:{cno:cno_value,no:${dto.movie_no} },
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
		showComments(${dto.movie_no});
	
		//코멘트 입력처리]
		$('#submit').click(function(){	
			
			if($(this).val()=='등록')
				var action="<c:url value='/bird/movie/Write.aw'/>";
			else
				var action="<c:url value='/bird/movie/Edit.aw'/>";	
			
			$.ajax({
				url:action,
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(key){					
					showComments(key);
					if($('#submit').val()=='수정'){						
						$('#submit').val('등록');
						$('#title').val('');
					}
					
				}		
			});		
			
		});
		
		//메모글 삭제처리]
		$('#del_memo').on('click',function(){
			if(confirm('정말로 삭제하시겠습니까?')){
				location.replace("<c:url value='bird/movie/Delete.aw?no=${dto.movie_no}'/>");				
			}
		});
		
		
};
</script>

<style>
.margin-top-10 {
	margin-top: 1.0em;
}
</style>

<!-- 내용 시작 -->
<div class="container">
	<div class="row margin-top-10">
		<div class="embed-responsive embed-responsive-16by9 movie-size">
			<iframe class="embed-responsive-item"
				src="https://www.youtube.com/embed/kuOKUP41Fkg" frameborder="0"
				allowfullscreen></iframe>
		</div>
		<div class="media-body">
			<h5 class="title">제목 : ${dto.movie_title}</h5>
			<small class="count">조회수 : ${dto.movie_count}</small>

			<!-- 중간에 라인 -->
			<div class="margin-top-10">
				<hr class="line"></hr>
			</div>
			<div class="media-body">
				<h5 class="mt-0 nickname">닉네임 : ${dto.mem_nickname}</h5>
				<h6 class="mt-0 regidate">게시일 : ${dto.movie_regidate}</h6>
				<p>내용 : ${dto.movie_content}</p>
			</div>
		</div>
	</div>

	<!-- row -->
	<div class="row">
		<div class="text-center">
			<a
				href="<c:url value='/animal/bird/movie/Reply.aw?no=${dto.movie_no}'/>"
				class="btn btn-success">답변</a>
			<c:if test="${sessionScope.id==dto.mem_nickname }">
				<a
					href="<c:url value='/bird/movie/Edit.aw?no=${dto.movie_no}'/>"
					class="btn btn-success">수정</a>
				<a href="javascript:isDelete()" class="btn btn-success">삭제</a>
			</c:if>
			<a href="<c:url value='/bird/movie/List.aw'/>"
				class="btn btn-success">목록</a>
		</div>
	</div>
</div>
<!-- 내용 끝 -->