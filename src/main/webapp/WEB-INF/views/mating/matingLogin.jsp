<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style>
.heart_img img:hover {
    animation: 2.0s ease 0s normal none infinite running animateHeartBeat;
    overflow: inherit;
}

.heart_img img{
    display: block;
    margin-left: auto;
    margin-right: auto
}

.card{
	margin-top:50px;
}

@keyframes animateHeartBeat {
	0% {
	    transform: scale(1);
	}
	5% {
	    transform: scale(1.2);
	}
	10% {
	    transform: scale(1.1);
	}
	15% {
	    transform: scale(1.4);
	}
	50% {
	    transform: scale(1);
	}
	100% {
	    transform: scale(1);
	}
}
@keyframes animateHeartBeat {
	0% {
	    transform: scale(1);
	}
	5% {
	    transform: scale(1.2);
	}
	10% {
	    transform: scale(1.1);
	}
	15% {
	    transform: scale(1.4);
	}
	50% {
	    transform: scale(1);
	}
	100% {
	    transform: scale(1);
	}
}

</style>
</head>

<!-- 내용 시작 -->
<div class="container">
	<!-- 프로필 카드 -->
	<div class="container" style="padding:50px;">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-lg-8 col-md-12">
                            <h2 style="text-align:center;">
                            	<span style="color:#1ABC9C;">연지</span>의 프로필
                            	<a href="#">
                            	<img src="<c:url value='/resources/images/mating/Pencil-icon.png'/>" style="width:30px;height:30px"/>
                            	</a>
                            </h2>
                            
                            <p style="text-align:center;" class="lead">고슴도치</p>
                            <p style="text-align:center;">
                                밥을 참 잘먹구 매일 발을 뜯어요. <br/>
                                발로 등에 있는 가시를 긁을 때 가장 귀여운 고슴도치랍니다.<br/>
                                꽃향기가 나는 핸드워시 냄새를 좋아하는 건강한 고슴도치입니다.
                            </p>

                        </div>
                        <div class="col-12 col-lg-4 col-md-6 text-center">
                            <img src="<c:url value='/resources/images/mating/yeonji.JPG'/>" alt="샘플" class="mx-auto img-fluid">
                            <br>
                            <ul class="list-inline ratings text-center" title="Ratings">
                                <li class="list-inline-item"><a href="#"><span class="fa fa-star"></span></a>
                                </li>
                                <li class="list-inline-item"><a href="#"><span class="fa fa-star"></span></a>
                                </li>
                                <li class="list-inline-item"><a href="#"><span class="fa fa-star"></span></a>
                                </li>
                                <li class="list-inline-item"><a href="#"><span class="fa fa-star"></span></a>
                                </li>
                                <li class="list-inline-item"><a href="#"><span class="fa fa-star"></span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-12 col-lg-4">
                            <h2 style="color:#1ABC9C;text-align:center">품종(모프)</h2>
                            <p style="text-align:center;">화이트쵸코</p>
                        </div>
                        <div class="col-12 col-lg-4">
                            <h2 style="color:#1ABC9C;text-align:center">나이</h2>
                            <p style="text-align:center;">생후 4년</p>
                        </div>
                        <div class="col-12 col-lg-4">
                            <h2 style="color:#1ABC9C;text-align:center">암/수</h2>
                            <p style="text-align:center;">암</p>
                        </div>
                    </div>
                    
                    <div class="row">
                    	 <div class="col-12 col-lg-4">
                            <h2 style="color:#1ABC9C;text-align:center">교배지역</h2>
                            <p style="text-align:center;">서울시</p>
                        </div>
                        <div class="col-12 col-lg-4">
                        	<h2 style="color:#1ABC9C;text-align:center">매칭여부</h2>
                            <p style="text-align:center;">매칭진행중</p>
                        </div>
                    </div>
                </div>
                <!--/card-block-->
                
            </div>
            
			<div class="container center">
	            <div class="heart_img col-md-offset-4 col-md-4" style="padding-top:50px;">
	            	<a href=""><img src="<c:url value='/resources/images/mating/matchButton.png'/>" style="align:center;width:100%" class="img-center"/></a>
	            </div>
            </div>
            
            <div class="container">
            	<div class="col-lg-12 text-center" style="margin-top:50px;">
            		<h2>연지를 위한 카드</h2>
            	</div>
            	<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
				<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
				<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
				<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
				<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
				<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
				<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
				<div class="card col-12 col-lg-3">
				  <img class="card-img-top" src="<c:url value='/resources/images/mating/dochiSample.jpg'/>" alt="Card image">
				  <div class="card-body">
				    <h2 class="card-title" style="color:#1ABC9C">곤지</h2>
				    <p class="card-text">고슴도치</p>
				    <a href="#" class="btn btn-primary">프로필 보기</a>
				  </div>
				</div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- 내용 끝 -->