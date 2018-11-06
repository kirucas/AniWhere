<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>공동구매 게시판</title>
		
  </head>
  <body>
  <h1>입력상황 확인을 위한 표</h1>
  
  <div class="card-block p-0">
		
		<div style="text-align:right">
		 
		<div style="text-align:right"> 
		<a href="<c:url value='/market/GroupBuyWrite.aw'/>"><button style="width:65px;height:40px" type="submit" class="btn btn-primary"><img src = "<c:url value='/resources/images/maketimages/Write.png'/>" style="width:20px;height:20px"/>등록</button></a>
		</div>
		
		</div>
			<table class="table table-bordered table-sm m-0">
				<thead class="table-warning">
					<tr>
						<th style="width: 50px">게시번호</th>
						<th style="width: 400px">제목</th>
						<th style="width: 50px">작성자</th>
						<th style="width: 50px">조회수</th>
						<th style="width: 50px">등록일</th>
					</tr>
				</thead>
				
				<tbody>
					<tr class="public">
						<td>1</td>
						<td>[공지사항]민사상 법률 팁 사기예방 공지사항</td>
						<td>관리자</td>
						<td>557</td>
						<td>2018-08-17</td>
					</tr>					
					<c:forEach var="record" items="${list}" varStatus="loop">
				
						<tr>
						<td>
						<span id="no">상품일련번호:${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)+1}</span></td>
						<span id="title">${record.dto.title}</span><em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em> 	
						<!-- 타이틀 로직 -->
							
							<td class="text-left">
				
							<span id="animal_code">관련태그:
						<c:choose>
							<c:when test="${record.animal_code eq '1'}">
								<span>[개]</span>
							</c:when>
							<c:when test="${record.animal_code eq '2'}">
								<span>[고양이]</span>		
							</c:when>
							<c:when test="${record.animal_code eq '3'}">
								<span>[파충류]</span>
							</c:when>
							<c:when test="${record.animal_code eq '4'}">
								<span>[조류]</span>
							</c:when>
							<c:otherwise>
								<span>[기타포유류]</span>
							</c:otherwise>
						</c:choose>
					</span>
																																						 
								<a href="<c:url value='/market/groupbuy.aw?groupbuy_no=${record.dto.no}'/>">
																  
								</a>
							
						        </td>
						        <!--  타이틀 끝 -->
							
							<td><span id="mem_no">${record.dto.mem_nickname}</span></td>
							<td><span id="count">${record.dto.count} </span> </td>
							<td><span id="regidate">${record.dto.regidate}</span></td>
						</tr>
						
					</c:forEach>

					
				</tbody>
			</table>
		</div>
		<!-- 확인용 표 끝 -->
		
		<!--  본내용 시작 -->
   <div class="container">
   	<div class="card-header" style="margin-top: 50px" >공동구매 게시판</div>
   	
   	<div style="text-align:right"> 
		<a href="<c:url value='/market/GroupBuyWrite.aw'/>"><button style="width:65px;height:40px" type="submit" class="btn btn-primary"><img src = "<c:url value='/resources/images/maketimages/Write.png'/>" style="width:20px;height:20px"/>등록</button></a>
		</div>
		
   	<div class="row">
   	
   	
   	<c:forEach var="record" items="${list}" varStatus="loop">
				
    
         <div class="card mb-4" style="margin-left:90px">
            <img class="card-img-top" src="<c:url value='/resources/images/maketimages/pet.jpg'/>" style="width:400px;height:400px" alt="Card image cap">
            <div class="card-body">
            
            
            
               <h5 class="card-title"><span id="no">상품일련번호:${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)+1}</span></h5>
				<span id="title">제목:${record.dto.title}</span><em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em> 
					
				<span id="animal_code">관련태그:
						<c:choose>
							<c:when test="${record.dto.animal_code eq '1'}">
								<span>[개]</span>
							</c:when>
							<c:when test="${record.dto.animal_code eq '2'}">
								<span>[고양이]</span>		
							</c:when>
							<c:when test="${record.dto.animal_code eq '3'}">
								<span>[파충류]</span>
							</c:when>
							<c:when test="${record.dto.animal_code eq '4'}">
								<span>[조류]</span>
							</c:when>
							<c:otherwise>
								<span>[기타포유류]</span>
							</c:otherwise>
						</c:choose>
					</span>		
              
                 
  		<jsp:include page="../template/ProgressBarsmall2.jsp" />
 
  <a class="btn btn-outline-dark btn-sm" href="<c:url value='/market/groupbuyinside.aw?buy_no=${record.dto.no}'/>">상세보기</a>
                       														  
					<span id="mem_no">아이디:${record.dto.mem_nickname}</span>
					<span id="count">조횟수:${record.dto.count} </span> 
					<span id="regidate">등록일:${record.dto.regidate}</span>
					</div>
					</div>
									
            </c:forEach>
                   
     <%--  <div class="col-md-4">
         <div class="card mb-4">
            <img class="card-img-top" src="<c:url value='/resources/images/maketimages/pet3.jpg'/>" style="width:300px;height:300px" alt="Card image cap">
            <div class="card-body">
               <h5 class="card-title">[급매!]급매 말머리가 들어간 DB 제목</h5>
               <p class="card-text">DB연동 내용</p>
              
  		<jsp:include page="../template/ProgressBarsmall2.jsp" />
        <a class="btn btn-outline-dark btn-sm" href="<c:url value='/market/groupbuyinside.aw?groupbuy_no=${record.dto.no}'/>">상세보기</a>
               
            </div>
         </div>
      </div> --%>
      
      
         
      </div>
   	
   <h3 class="pb-3 mb-4 font-italic border-bottom">

   </h3>
       
   </div>
   
${pagingString}   
   
   <!-- 검색용 UI -->

		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
				style="float: none; margin: 0 auto;">
				<form class="form-inline" method="post"
					action="<c:url value='/market/buy/temporarily.aw'/>">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="mem_nickname">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" name="searchWord" class="form-control" />
					</div>
					<button type="submit" class="btn btn-primary">검색</button>

				</form>
			</div>
		</div>
 
    <div style="margin-top: 50px">
    </div>
     
  </body>