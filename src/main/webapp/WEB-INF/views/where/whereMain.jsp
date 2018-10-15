<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* 체크박스 설정 */
#pain, #entrust, #goods, #adopt, #walk {
	float: left;
	margin-right: 1px;
	width: 50px;
	height: 50px;
	margin-top: 10px;
	margin-right: 7px;
	position: relative;
}

#li-font {
	font-size: 50px;
	list-style: none;
	text-align: center;
}

img {
	width: 100%;
	height: 500px;
}

@media ( max-width : 993px) {
	#checkList, #review {
		clear: both;
		width: 100%;
	}
}

@media ( max-width : 500px) {
	#li-font input[type="checkbox"] {
		width: 20px;
		height: 20px;
		margin-bottom: 10px;
	}
	#li-font li {
		font-size: 30px;
		margin-left: -200px;
	}
}

span {
	style ="font-size: 2em;
	font-family: 메이플스토리;
	"
}

#review {
	vertical-align: middle;
}

#check-box {
	width: 100%;
	height: 50%;
	padding-top: 50px;
}
</style>
<!-- 내용 시작 -->
<div class="container">
	<div id="map" style="width: 600px; height: 500px"></div>
	<!-- daum 지도 API 불러오기 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8940a4eb3083abd07d038b8c2839831"></script>
	<script>
		$(document)
				.ready(
						function() {
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new daum.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 4
							// 지도의 확대 레벨 
							};

							var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

							// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
							if (navigator.geolocation) {

								// GeoLocation을 이용해서 접속 위치를 얻어옵니다
								navigator.geolocation
										.getCurrentPosition(function(position) {

											var lat = position.coords.latitude, // 위도
											lon = position.coords.longitude; // 경도

											var locPosition = new daum.maps.LatLng(
													lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
											message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

											// 마커와 인포윈도우를 표시합니다
											displayMarker(locPosition, message);

										});

							} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

								var locPosition = new daum.maps.LatLng(33.450701, 126.570667),
										 message = 'geolocation을 사용할수 없어요..'

								displayMarker(locPosition, message);
							}

							// 지도에 마커와 인포윈도우를 표시하는 함수입니다
							function displayMarker(locPosition, message) {

								// 마커를 생성합니다
								var marker = new daum.maps.Marker({
									map : map,
									position : locPosition
								});

								var iwContent = message, // 인포윈도우에 표시할 내용
								iwRemoveable = true;


								// 지도 중심좌표를 접속위치로 변경합니다
								map.setCenter(locPosition);
							}

							function setMapType(maptype) {
								var roadmapControl = document
										.getElementById('btnRoadmap');
								var skyviewControl = document
										.getElementById('btnSkyview');
								if (maptype === 'roadmap') {
									map
											.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
									roadmapControl.className = 'selected_btn';
									skyviewControl.className = 'btn';
								} else {
									map
											.setMapTypeId(daum.maps.MapTypeId.HYBRID);
									skyviewControl.className = 'selected_btn';
									roadmapControl.className = 'btn';
								}
							}

							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
							var mapTypeControl = new daum.maps.MapTypeControl();

							// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
							// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
							map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

							// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
							var zoomControl = new daum.maps.ZoomControl();
							map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						});
	</script>
	<div>
		<div class="check-box" id="checkList">
			<ul id="li-font">
				<input type="checkbox" id="pain">
				<li>우리 아이가 아플때</li>
				<input type="checkbox" id="entrust">
				<li>아이를 맡겨야 할때</li>
				<input type="checkbox" id="goods">
				<li>용품을 사고 싶을때</li>
				<input type="checkbox" id="adopt">
				<li>입양을 하고 싶을때</li>
				<input type="checkbox" id="walk">
				<li>산책을 하고 싶을때</li>
			</ul>
		</div>
		<span>선택한 리스트</span>
		<div id="review" style="width:150px;height:150px">
			<img alt="" src="<c:url value='/resources/images/map.jpg'/>" />
		</div>
	</div>
</div>
<!-- 내용 끝 -->