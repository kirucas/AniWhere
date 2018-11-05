<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

	#hover{background:#fff;}                       

	#hover:hover{color:blue;}


</style>
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
	<div class="container" style="padding-left:0px;padding-right:0px;margin-bottom:15px">
		<div class="card-header" style="margin-top: 50px; margin-bottom: 50px;">
			<h2>
			공지사항
			</h2>
		</div>
			<c:if test="${empty list}" var="isEmpty">
					<span>등록된 게시물이 없어요</span>
			</c:if>
			<table class="table table-bordered table-sm m-0">
				<thead class="table-warning">
					<tr>
						<th style="width: 100px">게시번호</th>
						<th style="width: 360px">제목</th>
						<th style="width: 70px">조회수</th>
						<th style="width: 70px">등록일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="record" items="${list}">
					<tr class="public" onclick="goAjax(${record.no});" data-toggle="modal" data-target="#Modal">
						<c:if test="${not isEmpty}">
<%-- 							<a href="#" onclick="goAjax(${record.no});" data-toggle="modal" data-target="#Modal"> --%>
								<td>
									${record.no}
								</td>
								<td style="margin-top: 10px; cursor:pointer" margin-bottom: 7px;" id="hover">
									${record.title}
								</td>
<!-- 							</a> -->
								<td style="color: black; font-style: oblique;  margin-bottom: 25px;">
									조회수 : ${record.count}
								</td>
								<td style="color: black; font-style: oblique;  margin-bottom: 25px;">
									작성일 : ${record.regidate}
								</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 검색용 -->
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
				style="float: none; margin: 0 auto;">
				<form class="form-inline" method="post"
					action="<c:url value='/notice/List.aw'/>">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="searchWord" class="form-control" />
					<button type="submit" class="btn btn-primary">검색</button>
				</div>
				</form>
			</div>
		</div>
	</div>
<!-- 모달창 첫번째 -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   	<div class="modal-dialog bounceInDown animated">
      <div class="modal-content">
         <div class="modal-header">
         	<!-- 헤더 제목부분 -->
            <h2 class="modal-title" id="ModalTitle" style="margin-left: 10px"></h2>
            <br/>
            <!-- 부제목 들어가는부분 -->
            <!-- <small style="margin-left: 10px">여기에 내용 쓰면됌</small> -->
            <!-- 부제목 끝 -->
            <button type="button" class="close" data-dismiss="modal">
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
            <button type="button" data-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>
<!-- 모달창 -->

<!-- 아래는 페이징 -->
    <div class="d-flex justify-content-center" style="float: none; margin: 0 auto;" >
    	<div>
    		${pagingString}
    	</div>
    </div>
<!-- 내용 끝 -->