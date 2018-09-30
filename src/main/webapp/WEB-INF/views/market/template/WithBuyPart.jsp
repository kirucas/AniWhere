<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="ko">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>부트스트랩 템플릿</title>

<!-- 부트스트랩 -->
<link href="<c:url value='/Bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>



    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
    <style>
    
    
    </style>
    
    
    
  </head>
  <body>

    <header>
      <div>
 
      </div>
      
    </header>

    <main role="main">

      <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: 50px">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide img-responsive center-block col-xs-3 col-md-12 " src="<c:url value='/resources/images/maketimages/withbuy1.jpg' />" alt="First slide" style="width: 1600px; height: 600px"> 
				
            <div class="container-fluid">
              <div class="carousel-caption text-left">
           
                <p><a class="btn btn-lg btn-primary" href="../MaketPart/SoldOut.jsp" role="button">buy NOW!</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide col-xs-3 col-xm-6 col-md-12" src="<c:url value='/resources/images/maketimages/withbuy2.jpg'/>" alt="Second slide" style="width: 1600px; height: 600px">
            <div class="container">
              <div class="carousel-caption"> 
               
                <p><a class="btn btn-lg btn-primary" href="../MaketPart/SoldOut.jsp" role="button" >buy NOW!</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide col-xs-3 col-md-12" src="<c:url value='/resources/images/maketimages/withbuy3.jpg'/>" alt="Third slide" style="width: 1600px; height: 600px">
            <div class="container">
              <div class="carousel-caption text-right">
               
                <p><a class="btn btn-lg btn-primary" href="../MaketPart/SoldOut.jsp" role="button">buy NOW!</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
        </div>
    



    
    </main>

   
</section>
  </body>
</html>
