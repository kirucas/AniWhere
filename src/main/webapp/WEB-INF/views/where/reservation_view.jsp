<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var isDelete = function(){
		if(confirm("예약을 취소 하시겠습니까?"))
			location.replace("<c:url value='/security/where/reservation/delete.aw?rv_no=${dto.rv_no}'/>");
	};
</script>
<style>
/* QR / 예약정보 왼쪽정렬 */
#reservation_qrcord{
	width:50%;
	height:600px;
	float: left;
}
/* QR코드 크기 맞춰주기 */
#qr_cord img{
	text-align: center;
	width: 300px;
	height: 300px;
	
}
/* 왼쪽 div 가운데 정렬 */
#qr_cord{
	text-align: center;
}
 #reservation_view{
	text-align: left;
}
#reservation_view{
	font-size: 2em;
}
/* 나머지공간 지도로채우기 */
#map{
	height:600px;
	overflow: auto;
	margin-top:100px;
}
#reservation_view div{
	margin-top:5px;
}
/* 예약취소버튼 위에 margin좀주기 */
#btn{
	clear:both;
	margin-top: 130px;
}
#under_line{
	 text-decoration: underline;
}
</style>
<div id="reservation_qrcord">
	<div id="qr_cord">
		<img alt="QRcord" src="${dto.qr_link}">
	</div>
	<div id="reservation_view">
		<div>
			<span>예약 번호 :</span><span id="under_line"> ${dto.rv_no }</span>
		</div>
		<div>
			<span>상가 이름 :</span><span id="under_line"> ${dto.bizesnm }</span>
		</div>
		<div>
			<span>상가 주소 :</span><span id="under_line"></br> ${dto.rdnmadr }</span>
		</div>
		<div>
			<span>등록 날짜 :</span><span id="under_line"> ${dto.apply_date }</span>
		</div>
		<div>
			<span>예약 날짜 :</span><span id="under_line"> ${dto.booking_date }</span>
		</div>
		<div>
			<span>방문 시각 :</span><span id="under_line"> ${dto.visit_time }</span>
		</div>
	</div>
</div>
<div id="map">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8940a4eb3083abd07d038b8c2839831&libraries=services,clusterer,drawing"></script>
<script>
	$(document).ready(function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng('${store.lat}','${store.lon}'), // 지도의 중심좌표
		        draggable:false,
		        level: 5 // 지도의 확대 레벨.
	    	};  
			// 지도와 클러스터러를 생성하는 메소드
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng('${store.lat}','${store.lon}'); 
            // 마커를 생성합니다
            var marker = new daum.maps.Marker({
                position: markerPosition
            });
         	// 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
	});
			</script>			
</div>
<div id="btn">
	<a href="javascript:isDelete()" class="btn btn-danger">예약 취소</a>
</div>