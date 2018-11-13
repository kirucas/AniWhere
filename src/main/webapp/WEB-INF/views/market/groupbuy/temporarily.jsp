<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>공동구매 게시판</title>
		<!--  작은 프로그래스바 로직 시작-->
		<style>
        .progress-bar {
            background-color: White;
            height: 15px;
            padding: 5px;
            width: 250px;
            margin: 10px 0 10px 0;			
            -moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			border-radius: 5px;
            -moz-box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;
			-webkit-box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;
			box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;           
        }
        
        .progress-bar span {
            display: inline-block;
            height: 100%;
			background-color: #777;
            -moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			border-radius: 3px;
            -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
			-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
			box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
			-webkit-transition: width .4s ease-in-out;
			-moz-transition: width .4s ease-in-out;
			-ms-transition: width .4s ease-in-out;
			-o-transition: width .4s ease-in-out;
			transition: width .4s ease-in-out;		
        }
		
		/*---------------------------*/			
		
        .blue span {
            background-color:RED;   
        }		
		/*---------------------------*/		
		
		.stripes span {
            -webkit-background-size: 30px 30px;
            -moz-background-size: 30px 30px;
            background-size: 30px 30px;			
			background-image: -webkit-gradient(linear, left top, right bottom,
								color-stop(.25, rgba(255, 255, 255, .15)), color-stop(.25, transparent),
								color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .15)),
								color-stop(.75, rgba(255, 255, 255, .15)), color-stop(.75, transparent),
								to(transparent));
            background-image: -webkit-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: -moz-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: -ms-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: -o-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);            
            
            -webkit-animation: animate-stripes 3s linear infinite;
            -moz-animation: animate-stripes 3s linear infinite;       		
		}
        
        @-webkit-keyframes animate-stripes { 
			0% {background-position: 0 0;} 100% {background-position: 60px 0;}
        }
        
        
        @-moz-keyframes animate-stripes {
			0% {background-position: 0 0;} 100% {background-position: 60px 0;}
        }
		
		/*---------------------------*/	 

		.shine span {
			position: relative;
		}
		
		.shine span::after {
			content: '';
			opacity: 0;
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			background: #fff;
            -moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			border-radius: 3px;			
			
            -webkit-animation: animate-shine 2s ease-out infinite;
            -moz-animation: animate-shine 2s ease-out infinite; 			
		}

        @-webkit-keyframes animate-shine { 
			0% {opacity: 0; width: 0;}
			50% {opacity: .5;}
			100% {opacity: 0; width: 95%;}
        }
        
        
        @-moz-keyframes animate-shine {
			0% {opacity: 0; width: 0;}
			50% {opacity: .5;}
			100% {opacity: 0; width: 95%;}
        }

		/*---------------------------*/	 
		
		.glow span {
            -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
			-webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
			box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
			
            -webkit-animation: animate-glow 1s ease-out infinite;
            -moz-animation: animate-glow 1s ease-out infinite; 			
		}
		 
    </style>		
	<!-- 	프로그래스바 로직끝 -->
  </head>
  <body>
  
  <div class="card-block p-0">
		 <h1>입력상황 확인을 위한 표</h1>
				 
		<div style="text-align:right"> 
		<a href="<c:url value='/market/GroupBuyWrite.aw'/>"><button style="width:65px;height:40px" type="submit" class="btn btn-primary"><img src = "<c:url value='/resources/images/maketimages/Write.png'/>" style="width:20px;height:20px"/>등록</button></a>
		</div>
		
			<table class="table table-bordered table-sm m-0">
				<thead class="table-warning">
					<tr>
						<th style="width: 50px">게시번호</th>
						<th style="width: 400px">제목</th>
						<th style="width: 50px">작성자</th>
						<th style="width: 50px">조회수</th>
						<th style="width: 50px">등록일</th>
						<th style="width: 50px">목표수 </th>
						<th style="width: 50px">데드라인</th>
					</tr>
				</thead>
				
				<tbody>
					<tr class="public">
						<td>1</td>
						<td>[공지사항]민사상 법률 팁 사기예방 공지사항</td>
						<td>관리자</td>
						<td>557</td>
						<td>2018-08-17</td>
						<td>목표수</td>
						<td>데드라인</td>
					</tr>					
					<c:forEach var="record" items="${list}" varStatus="loop">
				
						<tr>
						<td>
						<span id="no">상품일련번호:${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)+1}</span></td>
					
						<%-- <em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em>  --%>	
						<!-- 타이틀 로직 -->
							
							<td class="text-left">
				
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
						<span id="title">${record.dto.title}</span>																													 
								<a href="<c:url value='/market/groupbuy.aw?groupbuy_no=${record.dto.no}'/>">															  
								</a>
						        </td>
						        <!--  타이틀 끝 -->
							
							<td><span id="mem_no">${record.dto.mem_nickname}</span></td>
							<td><span id="count">${record.dto.count} </span> </td>
							<td><span id="regidate">${record.dto.regidate}</span></td>
							<td><span id="goal">${record.dto.goal}</span></td>
							<td><span id="deadline">${record.dto.deadline}</span></td>
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
            <img class="card-img-top" src="${fn:substring(record.dto.content,fn:indexOf(record.dto.content,'img src=\"')+9,fn:indexOf(record.dto.content,'\" name='))}" style="width:400px;height:400px" alt="Card image cap">
            <div class="card-body">
            <script>
            	console.log('${record.dto.content}');
            </script>
               <h5 class="card-title"><span id="no">상품일련번호:${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</span></h5>
				<span id="title">제목:${record.dto.title}</span><em>[${record.cmtCount != null ? record.cmtCount : 0 }]</em> 
					<br/>
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
              
       <div style="border:1px solid silver;">
<p>%%개 달성시<br/> 공동구매 성공입니다!   </p>
    <p style="text-align:center;">현재 몇 60% 달성중 입니다</p>
    <div class="col-md-12 col-sm-12 ">

<div  style="magin-left:30px;" class="progress-bar blue stripes">
    <span style="width: 60%"></span>
</div>

</div>
</div>
 
  <a class="btn btn-outline-dark btn-sm" href="<c:url value='/groupbuy/groupbuyinside.aw?buy_no=${record.dto.no}'/>">상세보기</a>
                       														  
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
			<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5"
				style="float: none; margin: 0 auto;">
				<form class="form-inline" method="post" action="<c:url value='/market/groupbuy/temporarily.aw'/>">
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