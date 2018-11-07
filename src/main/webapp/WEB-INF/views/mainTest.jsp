<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="<c:url value='/Bootstrap/js/jquery.banner.js'/>"></script>
<style>
	.images img{
		width: 400px;
		height: 400px;
	}
	#heart img{
		float:left;
		width: 300px;
		height: 400px;
	}
</style>
<%-- 
<div id="image_list_1" style="float: left;">
	<div class="clsBannerScreen" style="position: relative; height: 300px; width: 300px; overflow: hidden;">
		<div class="images" style="display: block; position: absolute; top: 0px; left: 0px;" divno="0">
			<img src="<c:url value='/resources/images/mating/left_1.jpg'/>">
		</div>
		<div class="images" divno="1" style="position: absolute; top: -300px; left: 0px; display: block;">
			<img src="<c:url value='/resources/images/mating/left_2.jpg'/>">
		</div>
		<div class="images" divno="2" style="position: absolute; top: -300px; left: 0px; display: block;">
			<img src="<c:url value='/resources/images/mating/left_3.jpg'/>">
		</div>
		<div class="images" divno="3" style="position: absolute; top: -300px; left: 0px; display: block;">
			<img src="<c:url value='/resources/images/mating/left_4.jpg'/>">
		</div>
		<div class="images" divno="4" style="position: absolute; top: 0px; left: 0px; display: block;">
			<img src="<c:url value='/resources/images/mating/left_5.jpg'/>">
		</div>
	</div>
</div> 
--%>
<div>
	<div id="image_list_1" style="float: left;">
		<div class="clsBannerScreen" style="position: relative; height: 400px; width: 400px; overflow: hidden;">
			<div class="images" style="display: block; position: absolute; top: -150px; left: 0px;" divno="0">
				<img src="<c:url value='/resources/images/mating/left_1.jpg'/>">
			</div>
			<div class="images" divno="1" style="position: absolute; top: -400px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/left_2.jpg'/>">
			</div>
			<div class="images" divno="2" style="position: absolute; top: -400px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/left_3.jpg'/>">
			</div>
			<div class="images" divno="3" style="position: absolute; top: -400px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/left_4.jpg'/>">
			</div>
			<div class="images" divno="4" style="position: absolute; top: 0px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/left_5.jpg'/>">
			</div>
		</div>
	</div>
	<div id="heart">
		<img src="<c:url value='/resources/images/mating/heart.jpg'/>">
	</div>
	<div id="image_list_2" style="float: right;">
		<div class="clsBannerScreen" style="position: relative; height: 400px; width: 400px; overflow: hidden;">
			<div class="images" style="display: block; position: absolute; top: -150px; left: 0px;" divno="0">
				<img src="<c:url value='/resources/images/mating/right_1.jpg'/>">
			</div>
			<div class="images" divno="1" style="position: absolute; top: -400px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/right_2.jpg'/>">
			</div>
			<div class="images" divno="2" style="position: absolute; top: -400px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/right_3.jpg'/>">
			</div>
			<div class="images" divno="3" style="position: absolute; top: -400px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/right_4.jpg'/>">
			</div>
			<div class="images" divno="4" style="position: absolute; top: 0px; left: 0px; display: block;">
				<img src="<c:url value='/resources/images/mating/right_5.jpg'/>">
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$("#image_list_1").jQBanner({ //롤링을 할 영역의 ID 값 
			nWidth : 400, //영역의 width 
			nHeight : 400, //영역의 height 
			nCount : 5, //돌아갈 이미지 개수 
			isActType : "up", //움직일 방향 (left, right, up, down) 
			nOrderNo : 1, //초기 이미지 
			nDelay : 1000 //롤링 시간 타임 (1000 = 1초)
		/*isBtnType:"li"*/ //라벨(버튼 타입) - 여기는 안쓰임 
		});
		$("#image_list_2").jQBanner({ //롤링을 할 영역의 ID 값 
			nWidth : 400, //영역의 width 
			nHeight : 400, //영역의 height 
			nCount : 5, //돌아갈 이미지 개수 
			isActType : "down", //움직일 방향 (left, right, up, down) 
			nOrderNo : 1, //초기 이미지 
			nDelay : 1000 //롤링 시간 타임 (1000 = 1초)
		/*isBtnType:"li"*/ //라벨(버튼 타입) - 여기는 안쓰임 
		});
	});
	
</script>