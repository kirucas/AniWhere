<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<script>
	var isDelete = function(){
		if(confirm("글을 삭제 하시겠습니까?"))
			location.replace("<c:url value='/board/animal/rNa/tip/delete.aw?no=${record.no}'/>");
	};
	
	var data = <%=request.getParameter("no")%>;
	var hit = ${record.tip_hit};
	$(function(){
	
		var text = $("#likebtn").html();
		
	    $(document).one('click', '.like-review', function(e) {
	    	$.ajax({
	    		data : {no : data},
	    		url : "<c:url value='/animal/rNa/tip/tip_hit.aw'/>",
	    		type :"POST",
	    		success : function(){
	    			if(text == "♡"){
						hit = hit+1;
						document.getElementById("tip_hit").innerHTML = hit;
						document.getElementById("likebtn").innerHTML = "♥";
						console.log(text);
	    			}
	    			else if(text == "♥"){
	    				hit = hit-1;
	    				document.getElementById("tip_hit").innerHTML = hit;
						document.getElementById("likebtn").innerHTML = "♡";
	    				
	    			}
						
	    		},
	    		error : function(){
	    			console.log("error");
	    		}
	    	});
	    	
	    });
	});
  //해당 글번호에 대한 코멘트 목록을 가져오는 함수 
	var showComments = function(key){		
		$.ajax({
			url:"<c:url value='/Comment/List.aw'/>",
			data:{no:data},
			dataType:'json',
			type:'post',
			success: displayCommnets
				
		});
	};
	var displayComments = function(data){
		console.JSON.stringify(data);
		var commnetString="asdfsdf";
	};
	
	
	
	
    $('#btnwrite').click(function(){
    	alert("작동띠");
    });
	    
	    

</script>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#content{
	float:none;
	width:100%;
	
}
.like-content button{
	text-align: center;
}
.like-content .btn-secondary {
	text-align:center;
    margin: 40px 0px 0px 0px;
    background: #ed2553;
    border-radius: 3px;
    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    padding: 10px 17px;
    font-size: 18px;
    cursor: pointer;
    border: none;
    outline: none;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
    margin-left: 46%;
}
.like-content .btn-secondary:hover {
      transform: translateY(-3px);
}
.like-content .btn-secondary .fa {
      margin-right: 5px;
}
.animate-like {
    animation-name: likeAnimation;
    animation-iteration-count: 1;
    animation-fill-mode: forwards;
    animation-duration: 0.65s;
}
@keyframes likeAnimation {
  0%   { transform: scale(30); }
  100% { transform: scale(1); }
}
#btn_e_d_list{
	float:right;
}
</style>
<div class="container">
	<div id="content">
		<div id="view">
			<div class="article">
				<div class="article-header">
					<div class="article__title">
						${record.tip_title}
						<div id="btn_e_d_list">
							<!-- 글에 대한 버튼들(자기가 쓴 글이면 수정과 삭제 가능) -->
							<!-- a href="<c:url value='/ReplyBBS/BBS/Reply.bbs?no=${record.no}'/>" class="btn btn-success">답변</a> -->
							<c:if test="${sessionScope.mem_no==record.mem_no }">
								<a href="<c:url value='/security/board/animal/rNa/tip/edit.aw?no=${record.no}'/>" class="article-action__button button">수정</a>
								<a href="javascript:isDelete()" class="article-action__button button button--red button--red--border">삭제</a>
							</c:if>
							<a href="<c:url value='/board/animal/rNa/tip/list.aw'/>" class="article-action__button button">목록</a>	
						</div>
					</div>
					<div class="article-meta">
						<div class="article-meta-list">
							<div class="article-meta__item article-meta__item--name">
								<a
									href="https://talk.op.gg/s/lol/tip?q=%EB%9F%B0%EB%B9%8C%EB%A1%9C%EA%BE%B8%EA%BA%BC&amp;target=user_name">
									${record.mem_nickname}</a>
							</div>
							<div class="article-meta__item">
								<span data-tooltip data-date="2018-10-14T06:40:37+00:00"
									title="">${record.tip_regidate}</span>
							</div>
						</div>
							<input type="hidden" id="tip_no" value="${requestParam.no}"/>
						<div class="article-meta-list article-meta-list--right">
							<div class="article-meta__item" >
								<span id="tip_count">${record.tip_count}</span>
							</div>
							<div class="article-meta__item">
								<span>댓글 56</span>
							</div>
							<div class="article-meta__item">
								<span id="tip_hit">${record.tip_hit}</span>
							</div>
						</div>
					</div>
					<div class="btnlike">
						<div class="like-content">
							<button class="btn-secondary like-review">
							   <span aria-hidden="true" id="likebtn">♡</span>
							</button>
						</div>
					</div>
				</div>
				<div class="article-content-wrap">
					<div class="article-content">
						${record.tip_content}
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
	<form data-v-f39b78c2="" method="POST">
		<div data-v-f39b78c2="" class="comment-write-inner">
			<div data-v-f39b78c2="" class="comment-write__name">${record.mem_nickname}</div> 
				<div data-v-f39b78c2="" class="comment-write__content">
					<textarea data-v-f39b78c2="" name="content" id="writeComment" placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다." style="overflow: hidden; overflow-wrap: break-word; height: 44px;"></textarea>
				</div> 
			<div data-v-f39b78c2="" class="comment-write-footer">
				<div data-v-f39b78c2="" class="comment-write-submit">
					<button data-v-f39b78c2="" type="submit" class="button button--green" id="btnwrite">작성</button>
				</div>
			</div>
		</div>
	</form>
	<div data-v-f39b78c2="" data-post="820136">
		<div data-v-f39b78c2="" class="comment-wrap">
			<!---->
			<div data-v-f39b78c2="" class="comment-header">
				<h2 data-v-f39b78c2="" class="comment__title">댓글</h2> 
				<span data-v-f39b78c2="" class="comment__count">총 <em data-v-f39b78c2="">16</em>개</span> 
			 	<!---->
			 </div>
		</div>
			<!---->
			<div data-v-f39b78c2="">
				<div data-v-f39b78c2="" class="comment-sort">
					<ul data-v-f39b78c2="" class="comment-sort__list">
						<li data-v-f39b78c2=""
							class="comment-sort__item comment-sort__item--active"><button
								data-v-f39b78c2="" type="button">인기순</button></li>
						<li data-v-f39b78c2="" class="comment-sort__item"><button
								data-v-f39b78c2="" type="button">최신순</button></li>
					</ul>
				</div>
				<div data-v-f39b78c2="" class="comment-list">
					<div data-v-f39b78c2="" class="comment-l">
						<!---->
						<div data-v-f39b78c2="" class="comment" id="comment">
							
						</div>
						<!---->
					</div>
				</div>
				<!---->
			</div>
		</div>
		<!---->
		<!---->
	</div>
</div>