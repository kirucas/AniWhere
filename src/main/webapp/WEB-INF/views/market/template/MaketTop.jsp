<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩  템플릿</title>
	
  </head>
  
  
  <body>

    <div class="container">
    	 <div class="row" style="margin-top: 50px" >
          <div class="col-lg-4" style="border: 1px solid gray">
       
            <img class="rounded-circle" src="<c:url value='/resources/images/maketimages/dog.jpg'/>" alt="Generic placeholder image" width="200" height="200" style="margin-top: 20px;margin-left: 70px">
            <h2>이용하시는건<br /> 처음이신가요?</h2>
            <p>애완 동물을 사랑하는 이땅의 모든<br/> 집사님들을 위해 오픈했습니다<br/> 구매게시판은 이쪽입니다</p>
            <p><a class="btn btn-secondary" href="<c:url value='/market/buy.aw' />" role="button" style="text-align: justify;">View details &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4" style="border: 1px solid gray;">
            <img class="rounded-circle" src="<c:url value='/resources/images/maketimages/cutecat.jpg'/>" width="200" height="200" style="margin-top: 20px;margin-left: 70px">
            <h2>판매게시판으로<br /> 안내해드립니다</h2>
            <p>장터에서 물건을 올릴떄에는 <br /> 3장이상 사진을 올려주시고 <br />
								 상품설명을 자세히 부탁드립니다</p>
            <p><a class="btn btn-secondary" href="<c:url value='/market/sell.aw' />" role="button">View details &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
         <%--  <div class="col-lg-4" style="border: 1px solid gray;">
            <img class="rounded-circle" src="<c:url value='/resources/images/maketimages/babydog.jpg' />" alt="Generic placeholder image" width="200" height="200" style="margin-top: 20px;margin-left: 70px">
            <h2>공동구매게시판은<br /> 이쪽입니다</h2> 
            <p>	초보 집사님인 당신을 위해 준비했습니다<br />
								 첫 훈련과 필요한 모든 요소들을 담아 
						 	    <br /> 최상의 가격과 품질로 선물해 드립니다</p>
							    
            <p><a class="btn btn-secondary" href="<c:url value='/market/groupbuy.aw' />" role="button">View details &raquo;</a></p>
          </div><!-- /.col-lg-4 --> --%>
        </div><!-- /.row -->
    
    </div>

    
  </body>
