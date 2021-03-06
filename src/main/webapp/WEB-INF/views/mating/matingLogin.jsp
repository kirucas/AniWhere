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
	<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
            	<!-- 넘어온 값이 없을 경우 ( 프로필 카드가 없는 경우 ) -->
            	<c:if test="${list eq null}" var="isNoProfile">
            		<div class="container" style="text-align:center;border:0;height:300px;line-height:300px">
	            		<h3 style="text-align: center">등록된 프로필이 없어요. 지금 바로 등록하세요!</h3>
			            <div class="col-md-offset-4 col-md-4" style="padding-top:50px;display:inline-block">
			            	<a href="<c:url value='/matingMatch.aw'/>">
			            		<span style="align:center;width:100%;margin-bottom:100px;font-size: 2em" class="img-center">
			            			프로필 카드 만들기
			            		</span>
			            	</a>
			            </div>
		            </div>
            	</c:if>
            	<!-- 넘어온 값이 없을 경우 ( 프로필 카드가 없는 경우 ) 끗-->
            	<!-- 메이팅 카드 반복  -->
            	<c:if test="!isNoProfile">
            		<c:forEach var="matingInfo" items="${list}">
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
		                            <p style="text-align:center;">서울시 ~ </p>
		                        </div>
		                        <div class="col-12 col-lg-4">
		                        	<h2 style="color:#1ABC9C;text-align:center">매칭여부</h2>
		                            <p style="text-align:center;">매칭진행중</p>
		                        </div>
		                    </div>
		                </div>
                		<!--/card-block-->
            		</c:forEach>
            	</c:if>
            	<!-- 메이팅 카드 반복 끗 -->
            	<!-- 반복 시작할 부분  -->
                <%-- <div class="card-body">
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
                            <p style="text-align:center;">서울시 ~ </p>
                        </div>
                        <div class="col-12 col-lg-4">
                        	<h2 style="color:#1ABC9C;text-align:center">매칭여부</h2>
                            <p style="text-align:center;">매칭진행중</p>
                        </div>
                    </div>
                </div> --%>
                <!--/card-block-->
                <!-- 반복 끗날 부분 부분  -->
            </div>
            
            <!-- 매치 버튼을 카드마다 넣어야 할 이유도 있을 듯 -->
            <!-- 매치 버튼 -->
			<div class="container" style="text-align:center">
	            <div class="heart_img col-md-offset-4 col-md-4" style="padding-top:50px;display:inline-block">
	            	<a href="<c:url value='/matingMatch.aw'/>"><img src="<c:url value='/resources/images/mating/matchButton.png'/>" style="align:center;width:100%;margin-bottom:100px" class="img-center"/></a>
	            </div>
            </div>
            <!-- 매치 버튼 끝 -->
        </div>
    </div>
</div>
</div>
<!-- 내용 끝 -->