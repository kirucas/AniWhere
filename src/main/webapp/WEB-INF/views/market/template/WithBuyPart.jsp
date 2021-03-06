<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>공동구매 게시판</title>
	
  </head>
  <body>
   <div class="container">
   
   

   	<div class="card-header" style="margin-top: 50px" >공동구매 게시판</div>
   	
   	<div style="text-align:right"> 
		<a href="<c:url value='/market/GroupBuyWrite.aw'/>"><button style="width:65px;height:40px" type="submit" class="btn btn-primary"><img src = "<c:url value='/resources/images/maketimages/Write.png'/>" style="width:20px;height:20px"/>등록</button></a>
		</div>
		
   	<div class="row">
   	
   	
   	<c:forEach var="record" items="${list}" varStatus="loop">
				
    
         <div class="card mb-4">
            <img class="card-img-top" src="<c:url value='/resources/images/maketimages/pet.jpg'/>" style="width:300px;height:300px" alt="Card image cap">
            <div class="card-body">
            
            
            
               <h5 class="card-title"><span id="no">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)+1}</span></h5>
				
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
              
                 
  		<jsp:include page="ProgressBarsmall2.jsp" />
 
  
               <a href="<c:url value='/market/groupbuyinside.aw?groupbuy_no=${record.dto.no}'/>"> class="btn btn-outline-dark btn-sm">상세보기</a>
            														  
					<span id="title">제목:+${record.dto.title}</span><em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em> 
					<span id="mem_no">아이디:+${record.dto.mem_nickname}</span>
					<span id="count">${record.dto.count} </span> 
					<span id="regidate">${record.dto.regidate}</span>
					</div>
					</div>
									
            </c:forEach>
            
            
         
      
      
      
      
      <div class="col-md-4">
         <div class="card mb-4">
            <img class="card-img-top" src="<c:url value='/resources/images/maketimages/pet3.jpg'/>" style="width:300px;height:300px" alt="Card image cap">
            <div class="card-body">
               <h5 class="card-title">[급매!]급매 말머리가 들어간 DB 제목</h5>
               <p class="card-text">DB연동 내용</p>
              
  		<jsp:include page="ProgressBarsmall2.jsp" />
 
               <a href="http://www.jquery2dotnet.com/" class="btn btn-outline-dark btn-sm">상세보기</a>
            </div>
         </div>
      </div>
      
      
      
        <div class="col-md-4">
         <div class="card mb-4">
            <img class="card-img-top" src="<c:url value='/resources/images/maketimages/pet2.jpg'/>"  style="width:300px;height:300px" alt="Card image cap">
            <div class="card-body">
               <h5 class="card-title">[급매!]급매 말머리가 들어간 DB 제목</h5>
               <p class="card-text">DB연동 내용</p>
                 
  		<jsp:include page="ProgressBarsmall2.jsp" />
 
               <a href="http://www.jquery2dotnet.com/" class="btn btn-outline-dark btn-sm">상세보기</a>
            </div>
         </div>
      </div>
      
      </div>
   	
   <h3 class="pb-3 mb-4 font-italic border-bottom">

   </h3>
       
   </div>
  

    
  </body>
