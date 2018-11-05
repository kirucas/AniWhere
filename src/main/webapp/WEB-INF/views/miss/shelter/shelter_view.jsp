<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>
<!-- 내용 지작 -->
<div id="tabs">
	<div id="tabs-1">
		<div class="row">
			<!-- View  -->
			<div id="totalsize" class="col col-sm-12" style="height: 430px;">
				<!-- View(image)  -->
				<div style=" width: 480px; height: 400px; margin-top: 15px; float: left">					
					<div class="item">
						<img src="${record.img_src }" style="width: 480px; height: 400px;">
					</div>
				</div>
				<!-- Info Table -->
				<div style=" margin-top: 15px; margin-left: 16px; float: right">
					<h3 style="margin-top: 5px; margin-left: 20px;">유기동물 정보</h3>
					<table class="table table-bordered" style=" margin-top:10px; margin-left: 18px; width: 590px;">
						<tr>
							<td  style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">품종</td>
							<td  style="padding-top: 15px; width: 70%">${record.kind}</td>
						</tr>
						<tr>
							<td
								 style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">성별</td>
							<td>
								<div style="vertical-align: middle;">${record.gender}</div>
							</td>
						</tr>
						<tr>
							<td
								style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">발견 장소</td>
							<td>
								<div style="vertical-align: middle;">${record.place}</div>
							</td>
						</tr>
						<tr>
							<td
								style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">공고 시작 / 종료일</td>
							<td>
								<div style="vertical-align: middle;">${record.start_notice} / ${record.end_notice}</div>
							</td>
						</tr>
						<tr>
							<td
								style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">보호소 위치</td>
							<td>
								<div style="vertical-align: middle; font-size: 0.9em">${record.addr}</div>
							</td>
						</tr>
						<tr>
							<td
								style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">보호소 이름</td>
							<td>
								<div style="vertical-align: middle;">${record.carenm}</div>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">보호소 전화번호</td>
							<td>
								<div style="vertical-align: middle;">${record.caretel}</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 지도 들어갈 부분 -->
			<div id="map" style="width:100%;height:400px;margin-left: 15px"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8940a4eb3083abd07d038b8c2839831&libraries=services"></script>
			<script>
				$(function() {
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
						level : 5
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new daum.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									'${record.addr}',
									function(result, status) {

										// 정상적으로 검색이 완료됐으면 
										if (status === daum.maps.services.Status.OK) {

											var coords = new daum.maps.LatLng(
													result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new daum.maps.Marker({
												map : map,
												position : coords
											});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new daum.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">보호소</div>'
													});
											infowindow.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
				});
			</script>
			</br>
			<a href="<c:url value='/miss/shelter.aw'/>"><button style="margin-left: 1050px;margin-top: 20px;margin-bottom:10px; height: 35px;width: 80px">목록</button></a>
		</div>
	</div>
</div>