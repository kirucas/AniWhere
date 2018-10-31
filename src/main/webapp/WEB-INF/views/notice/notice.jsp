<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function goAjax(no) {
		$.ajax({
			url: "<c:url value='/notice/View.awa?no="+no+"'/>",
			type: "POST",
			dataType: "json",
			success:function(data){
				document.getElementById('ModalContent').innerHTML=data['content'];
				document.getElementById('ModalTitle').innerHTML=data['title'];
			},
			error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return; 
					}
		});
	}

</script>
<!-- 내용 시작 -->
<form>
	<div class="container">
		<div>
			<h1>
				공지사항
			</h1>
		</div>
		<hr/>
			
			<div>
				<c:if test="${empty list}" var="isEmpty">
					<span>등록된 게시물이 없어요</span>
				</c:if>
				
					<c:if test="${not isEmpty }">
						<c:forEach var="record" items="${list}">
							<a href="#" onclick="goAjax(${record.no});" data-toggle="modal" data-target="#Modal" id="ModalSpace">
							<div>
									${record.title}
							</div>
								<div>
									${record.regidate}
								</div>
							</a>
							<hr/>
					</c:forEach>
				</c:if>
			</div>
		<hr/>
	</div>
</form>
<!-- 모달창 첫번째 -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
         	<!-- 헤더 제목부분 -->
            <h2 class="modal-title" id="ModalTitle" style="margin-left: 10px"></h2>
            <br/>
            <!-- 부제목 들어가는부분 -->
            <!-- <small style="margin-left: 10px">여기에 내용 쓰면됌</small> -->
            <!-- 부제목 끝 -->
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <!-- 헤더 끝 -->
               <span aria-hidden="false">&times;</span>
            </button>
            <br/>
         </div>
         <br/>
         <div class="modal-body text-center" id="ModalContent">
         <!-- 내용 넣는 곳-->
         	
            </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>
<!-- 모달창 -->


<!-- 아래는 페이징 -->
    <div class="row" style="text-align: center; margin: 0px; auto;" >
    	<div>
    		${pagingString}
    	</div>
    </div>
<!-- 내용 끝 -->