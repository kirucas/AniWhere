<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.nav-item {
	width: 66.6px;
	text-align: center;
}

#list-view {
	overflow: scroll;
	width: 100%;
	height: 591px;
}

#where-list {
	float: left;
	width: 36%;
	height: 500px;
}

#map {
	height: 700px;
	overflow: auto;
}

@media ( min-width : 992px ) and (max-width : 1199px) {
	#list-select ul li {
		width: 111.6px;
		height: 50px;
	}
	#list-view {
		width: 100%;
		height: 559px;
		margin-left: -20px;
	}
}

@media ( min-width : 768px ) and (max-width : 991px) {
	#list-select ul li {
		width: 71.7px;
		height: 80px;
		margin-left: 5px;
	}
	#list-view {
		width: 100%;
		height: 500px;
	}
}

@media ( min-width : 640px) and(max-width : 767px ) {
	#where-main {
		margin-bottom: 30px;
	}
	#where-list {
		float: none;
	}
	#list-select ul {
		width: 510px;
	}
	#list-select ul li {
		width: 66px;
		margin-left: 16px;
	}
	#list-view {
		width: 510px;
		height: 350px;
		margin-left: 66px;
	}
	#map {
		height: 300px;
	}
	#where-main {
		width: 100%
	}
	#span-tag {
		width: 510px;
		text-align: center;
	}
}

@media ( min-width :529px ) and (max-width : 639px ) {
	#where-main {
		margin-bottom: 30px;
	}
	#where-list {
		float: none;
	}
	#list-select ul {
		width: 540px;
	}
	#list-select ul li {
		width: 66px;
		margin-left: 18px;
	}
	#list-view {
		width: 540px;
		height: 350px;
		margin-left: 66px;
	}
	#map {
		background-color: blue;
		height: 300px;
	}
	#where-main {
		width: 100%
	}
	#span-tag {
		width: 540px;
		text-align: center;
	}
}

@media ( min-width :360px ) and (max-width : 528px ) {
	#where-main {
		margin-bottom: 30px;
	}
	#where-list {
		float: none;
	}
	#list-select ul {
		width: 540px;
	}
	#list-select ul li {
		width: 66px;
		margin-left: 18px;
	}
	#list-view {
		width: 540px;
		height: 350px;
		margin-left: 66px;
	}
	#map {
		background-color: blue;
		height: 300px;
	}
	#where-main {
		width: 100%
	}
	#span-tag {
		width: 540px;
		text-align: center;
	}
}
</style>

<div id="where-main" style="margin-top: 30px;">
	<div id="where-list">
		<div id="list-select">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="#">애견카페</a></li>
				<li class="nav-item"><a class="nav-link" href="#">애완미용</a></li>
				<li class="nav-item"><a class="nav-link" href="#">동물병원</a></li>
				<li class="nav-item"><a class="nav-link" href="#">동물약국</a></li>
				<li class="nav-item"><a class="nav-link" id="ip" href="#" title="1">동물기타</a>
				</li>
			</ul>
		</div>
		<div style="text-align: center;">
			<div id="span-tag">
				<span style="font-size: 1.8em; text-align: center;">주변 리스트</span>
			</div>
			<div id="list-view">
				<ul style="list-style: none;">
					<!-- 리스트 목록 반복 -->
					<li>
						<div style="padding: 10px; float: left;">
							<div style="float: left; width: 10%; height: 100px;">
								<div style="width: 18px; height: 28px;">
									<img
										src="https://ssl.pstatic.net/static/maps/img/icons/pins_n_a_over.png">
								</div>
							</div>
							<dl style="margin-left: 40px; margin-right: 8px;">
								<dt>
									<a href="#">동물병원이름</a>
								</dt>
								<dd>경기도 광명동 오리로 39-2 102호</dd>
								<dd>010-8191-4693</dd>
								<dd>건강 , 의료 > 동물병원</dd>
							</dl>
						</div>
					</li>
					<!-- 리스트 목록 반복 끝-->
				</ul>
			</div>
		</div>
	</div>
	<div id="map"></div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8940a4eb3083abd07d038b8c2839831"></script>
<script>
		$(document).ready(function() {
         	var space = /\+/g; //" "을 의미하는 값
			
			var strdata = $("#ip").prop("title");
			console.log(strdata);
			$('#ip').click(function(){
		         $.ajax({
		        	data : {strdata:strdata},
		            type: "POST",
		            url : "<c:url value='/where/map/D09A01.aw'/>",
		            success: function(str) {
		            	var space = /\+/g;
		            	str=decodeURIComponent(str.replace(space," "));
		            	console.log("성공:"+str);
		            	infoParsing(str);
		            },
		            error : function() {
		               console.log("error");
		            }
		         });
			})
			//Xml파싱 하는 방법
// 			function infoParsing(result){
// 				if (window.DOMParser)
// 				{
// 				    parser = new DOMParser();
// 				    xmlDoc = parser.parseFromString(result, "text/xml");
// 				}
// 				else // Internet Explorer
// 				{
// 				    xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
// 				    xmlDoc.async = false;
// 				    xmlDoc.loadXML(result);
// 				}
// 				for(var i=0; i<xmlDoc.getElementsByTagName("item").length;i++){
// 					var lat = xmlDoc.getElementsByTagName("lat")[i].childNodes[0].nodeValue;
// 					var lng = xmlDoc.getElementsByTagName("lon")[i].childNodes[0].nodeValue;
// 					mapMaker(lat,lng);
// 				}
// 			};
			
			function mapMaker(lat,lng){
				// 마커가 표시될 위치입니다 
				var markerPosition  = new daum.maps.LatLng(lat, lng); 

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
			};
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 

			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {

				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation
						.getCurrentPosition(function(position) {

							lat = position.coords.latitude, // 위도
							lon = position.coords.longitude; // 경도
							var locPosition = new daum.maps.LatLng(
									lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
							message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

							// 마커와 인포윈도우를 표시합니다
							displayMarker(locPosition, message);
							test(lat,lon);
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
			
			function test(lat1,lon1){
				$.ajax({
		        	data : {code:"D09A01/D09A02/D25A16/Q12A07/S04A03/S04A01/S04A02",'lat':lat1,'lon':lon1},
		            type: "POST",
		            dataType : "json",
		            url : "<c:url value='/where/map/radius.awa'/>",
		            success: function(jsonObj) {
						var codes = ["D09A01","D09A02","D25A16","Q12A07","S04A03","S04A01","S04A02"];
		            	$.each(jsonObj, function(code, co_val){
		            		$.each(JSON.parse(co_val), function(tag, tag_val){
		            			if(tag=='body'){
		            				$.each(tag_val,function(key,val){
					            		if(key=='items'){
				            				$.each(val,function(k,v){
				            					mapMaker(v.lat,v.lon);
				            				});
					            		}
		            				});
		            			}
		            		});
		            	});
		            },
		            error : function() {
		               console.log("error");
		            }
		         });
			};
		});
</script>