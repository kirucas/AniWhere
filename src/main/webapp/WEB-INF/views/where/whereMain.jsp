<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
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
.wrap {position: absolute;left: 0;bottom: 40px;width: 280px;height: 150px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 14px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 280px;height: 150px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 0;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 0;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
dd{
	color:#28dbb7;
}
button{
	border-radius: 10px;
}
.btn-primary{
	width: 100px;
	height: 40px;
	font-size: 20px;
}
</style>

<div id="where-main" style="margin-top: 30px;">
   <div id="where-list">
      <div id="list-select">
         <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link" id="all" href="#">전체보기</a></li>
            <li class="nav-item"><a class="nav-link" id="cafe" href="#" title="Q12A07">애견카페</a></li>
            <li class="nav-item"><a class="nav-link" id="hair" href="#" title="D09A02">애완미용</a></li>
            <li class="nav-item"><a class="nav-link" id="hospital" href="#" title="S04A01 S04A02">동물병원</a></li>
            <li class="nav-item"><a class="nav-link" id="pharm" href="#" title="D25A16">동물약국</a></li>
            <li class="nav-item"><a class="nav-link" id="etc" href="#" title="D09A01 S04A03">동물기타</a>
            </li>
         </ul>
      </div>
      <div style="text-align: center;">
      	 <span style="marigin-bottom:10px;">'클릭' 하시면 해당위치로 이동합니다</span>
         <div id="span-tag">
             <span id="around" style="font-size: 1.4em; text-align: center;">주변 리스트</span>
         </div>
         <div id="list-view">
            <ul id="near" style="padding-inline-start:0px;list-style: none;">
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
                           <a href="#">상호 : </a>
                        </dt>
                        <dd>위치 : </dd>
                        <dd>분류 : </dd>
                        <dd>거리 : KM</dd>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8940a4eb3083abd07d038b8c2839831&libraries=services,clusterer,drawing"></script>
<script>
		$(document).ready(function() {
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 14 // 지도의 확대 레벨
	    	};  
			var mylat;
			var mylon;
			// 지도와 클러스터러를 생성하는 메소드
			var map = new daum.maps.Map(mapContainer, mapOption); 
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			
			var clusterer = new daum.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    	});
			
			//마커들을 담을 배열 
			var markers=[];
			var overlays = [];
			total();
			//전체 출력
			function total(){
				$.each(overlays,function(index,value){
					value.setMap(null);
				});
				$.ajax({
		            type: "POST",
		            dataType : "json",
		            url : "<c:url value='/security/where/map/total.awa'/>",
		            success: function(jsonObj) {
		            	map.setLevel(14);	
		            	clusterer.removeMarkers(markers);
		            	markers=[];
		            	var curl;
		            	$.each(jsonObj, function(index, value){
		            		
		            		var imageSrc = "<c:url value='/resources/images/all.png'/>", // 마커이미지의 주소입니다    
						    imageSize = new daum.maps.Size(22, 35), // 마커이미지의 크기입니다
						    imageOption = {offset: new daum.maps.Point(15, 45)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
						    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
						    markerPosition = new daum.maps.LatLng(value.lat, value.lon); // 마커가 표시될 위치입니다
		            		
		            		// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다.
		            		// 지도와 클러스터러를 생성하는 메소드
		            		var marker = new daum.maps.Marker({
		            			image : markerImage,
	                            position : new daum.maps.LatLng(value.lat, value.lon)
	                        });
		            		
		            		curl = '<c:url value="/security/where/reservation.awa?store_no='+value.bizesId+'&bizesNm='+value.bizesNm+'"/>'
		            				
		            		var content = 
		            			'<div class="wrap">' + 
		                        '    <div class="info">' + 
		                        '        <div class="title">' + 
		                        			value.bizesNm + 
		                        '            <div class="close" title="닫기"></div>' + 
		                        '        </div>' + 
		                        '        <div class="body">' + 
		                        '            <div class="desc">' + 
		                        '				 <div>'+(value.brchNm == null ? '' : value.brchNm)+'</div>'+
		                        '                <div class="ellipsis" style="text-align:center;">'+value.rdnmAdr+'</div>' + 
		                        '                <div class="jibun ellipsis" style="text-align:center;">'+
        						'					<span> '+(value.dongNo == null ? '' : value.dongNo+'동</span>')+
        						'					<span> '+(value.flrNo == null ? '' : value.flrNo+'층</span>')+
        						'					<span> '+(value.hoNo == null ? '' : value.hoNo+'호</span>')+
		                        '                </div>' + 
		                        '                <div style="text-align:center;margin-top:5px"><a class="btn btn-primary" href="'+curl+'">예약</a></div>' + 
		                        '            </div>' + 
		                        '        </div>' + 
		                        '    </div>' +    
		                        '</div>';
			               
	        				var overlay = new daum.maps.CustomOverlay({
	        					clickable: true,
	        				    content: content,
	        				    map: map,
	        				    position: marker.getPosition()       
	        				});
	        				$('.close').click(closeOverlay);
	        				
	        				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	        	    		function closeOverlay() {
	        	    			overlay.setVisible(false);
	        	    		   count=0;
	        	    		}
	        	    		var count=0;
							
	        				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	        				daum.maps.event.addListener(marker, 'click', function() {
	        					if(count==0){
	        						overlay.setVisible(true);
        				    		count++;
	        					}
	        				});
	        				
	        				// 마커에 마우스오버 이벤트를 등록합니다
		            		daum.maps.event.addListener(marker, 'mouseover', function() {
		            		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		            		  	if(count==0)
		            		  		overlay.setVisible(true);
		            		});
	        				
		            		// 마커에 마우스오버 이벤트를 등록합니다
		            		daum.maps.event.addListener(marker, 'mouseout', function() {
		            		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		            		  	if(count==0)
		            		  		overlay.setVisible(false);
		            		});
		            		
	        				overlay.setVisible(false);
	        				overlays.push(overlay);
		            		//지도 마크 클러스터화 해주기 위한 객체에 마크를 담기
		                    markers.push(marker);	
		            	});
		            	// 클러스터러에 마커들을 추가합니다
	            	    clusterer.addMarkers(markers);
	            	    map.setLevel(5);	
		            	var moveLatLon = new daum.maps.LatLng(mylat,mylon);
		            	map.panTo(moveLatLon);
		            },
		            
		            error : function() {
		               console.log("error");
		            }
		         });
			};
			//옆에 메뉴 눌렀을때 해당하는 녀서들
			function indssclscd(code,pic){
				$.each(overlays,function(index,value){
					value.setMap(null);
				});
		         $.ajax({
		        	data : {indssclscd:code},
		            type: "POST",
		            url : "<c:url value='/security/where/map/select.awa'/>",
		            dataType : "json",
		            success: function(jsonObj) {
		            	map.setLevel(14);
		            	clusterer.removeMarkers(markers);
	            		markers=[];
	            		var curl;
		            	$.each(jsonObj, function(index, value){
		            		totalvalue = value;
		            		var imageSrc = "<c:url value='/resources/images/"+pic+".png'/>", // 마커이미지의 주소입니다    
						    imageSize = new daum.maps.Size(22, 35), // 마커이미지의 크기입니다
						    imageOption = {offset: new daum.maps.Point(15, 45)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
						    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
						    markerPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다
						 	// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		            		var marker = new daum.maps.Marker({
		            			image : markerImage,
	                            position : new daum.maps.LatLng(value.lat, value.lon)
	                        });
		            		curl = '<c:url value="/security/where/reservation.awa?store_no='+value.bizesId+'&bizesNm='+value.bizesNm+'"/>'
		            		var content = 
		            			'<div class="wrap">' + 
		                        '    <div class="info">' + 
		                        '        <div class="title">' + 
		                        			value.bizesNm + 
		                        '            <div class="close" title="닫기"></div>' + 
		                        '        </div>' + 
		                        '        <div class="body">' + 
		                        '            <div class="desc">' + 
		                        '				 <div>'+(value.brchNm == null ? '' : value.brchNm)+'</div>'+
		                        '                <div class="ellipsis" style="text-align:center;">'+value.rdnmAdr+'</div>' + 
		                        '                <div class="jibun ellipsis" style="text-align:center;">'+
       							'					<span> '+(value.dongNo == null ? ' ' : value.dongNo+'동</span>')+
       							'					<span> '+(value.flrNo == null ? ' ' : value.flrNo+'층</span>')+
       							'					<span> '+(value.hoNo == null ? ' ' : value.hoNo+'호</span>')+
		                        '                </div>' + 
		                        '                <div style="text-align:center;margin-top:5px"><a class="btn btn-primary" href="'+curl+'">예약</a></div>' + 
		                        '            </div>' + 
		                        '        </div>' + 
		                        '    </div>' +    
		                        '</div>';
			               
	        				var overlay = new daum.maps.CustomOverlay({
	        					clickable: true,
	        				    content: content,
	        				    map: map,
	        				    position: marker.getPosition()       
	        				});
	        				
							$('.close').click(closeOverlay);
							
							// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	        	    		function closeOverlay() {
	        	    			overlay.setVisible(false);
	        	    		}
							
							
	        				var count=0;
							daum.maps.event.addListener(map, 'click',function(mouseEvent){
								if(count==1){
									overlay.setVisible(false);
								}
								count=0;
							});
	        				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	        				daum.maps.event.addListener(marker, 'click', function() {
	        					if(count==0){
	        						overlay.setVisible(true);
        				    		count++;
	        					}
	        				});
	        				
	        				// 마커에 마우스오버 이벤트를 등록합니다
		            		daum.maps.event.addListener(marker, 'mouseover', function() {
		            		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		            		  	if(count==0)
		            		  		overlay.setVisible(true);
		            		});
	        				
		            		// 마커에 마우스오버 이벤트를 등록합니다
		            		daum.maps.event.addListener(marker, 'mouseout', function() {
		            		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		            		  	if(count==0)
		            		  		overlay.setVisible(false);
		            		});
		            		
		            		overlays.push(overlay);
		            		overlay.setVisible(false);
		            		//지도 마크 클러스터화 해주기 위한 객체에 마크를 담기
		                    markers.push(marker);	
		            	});
		            	// 클러스터러에 마커들을 추가합니다
	            	    clusterer.addMarkers(markers);
		            	map.setLevel(5);
		            },
		            error : function() {
		               console.log("error");
		            }
		         });
			};

			//주변 리스트 전체 띄우기 반경 2km
			function neartotal(){
				$.ajax({
					data: {'mylat':mylat,'mylon':mylon},
		            type: "POST",
		            dataType : "json",
		            url : "<c:url value='/security/where/map/near.awa'/>",
		            success: function(jsonObj) {
		            	var nearString = '';
		            	$.each(jsonObj, function(index, value){
		            		    var latlng=value.lat+':'+value.lon;
								nearString += 
									'<li>'+ 
										'<div style="width:100%;">'+
										'<div style="float:left;width: 10%; height: 100px;">'+
											'<div style="width: 25px; height: 40px;">'+
												'<img style="width:18px;height:28px;" src="<c:url value='/resources/images/all.png'/>">'+
											'</div>'+
										'</div>'+
										'<dl style="margin-left: 40px; margin-right: 8px;">'+
										'<dt>'+
											'<button class="movetarget bttn-fill bttn-md bttn-danger" title="'+latlng+'">'+value.bizesNm+'</button>'+
										'</dt>'+
												'<dd> '+value.rdnmAdr+
												(value.dongNo == null ? '' : value.dongNo+'동 ')+'</br>'+
												(value.flrNo == null ? '' : value.flrNo+'층 ')+
												(value.hoNo == null ? '' : value.hoNo+'호')+
												'</dd>'+
												'<dd>'+value.indsSclsNm+'</dd>'+
												'<dd>'+value.diskill+' KM</dd>'+
											'</dl>'+
										'</div>'+
									'</li>';	
		            	});
						$(document).on('click','.movetarget',function(){
							var latlng = $(this).prop('title');
						    var laln=latlng.split(':');
							var LatLng = new daum.maps.LatLng(laln[0],laln[1]);
							map.setCenter(LatLng);
						});
						
	            		$('#near').html(nearString);
		            },
		            error : function() {
		               console.log("error");
		            }
		         });
			};
			
			//선택한 메뉴 주변리스트 반경 5km
			function nearselect(code,pic){
				$.ajax({
					data: {indssclscd:code,'mylat':mylat,'mylon':mylon},
		            type: "POST",
		            dataType : "json",
		            url : "<c:url value='/security/where/map/nearselect.awa'/>",
		            success: function(jsonObj) {
		            	var nearString = '';
		            	var curl = "<c:url value='/resources/images/"+pic+".png'/>";
		            	$.each(jsonObj, function(index, value){
		            		var latlng=value.lat+':'+value.lon;
								nearString += 
									'<li>'+ 
										'<div style="width:100%;">'+
										'<div style="float:left;width:10%;height:100px;">'+
											'<div style="width: 25px; height: 40px;">'+
												'<img style="width: 18px; height: 28px;" src="'+curl+'"/>'+
											'</div>'+
										'</div>'+
										'<dl style="margin-left: 40px; margin-right: 8px;">'+
										'<dt>'+
											'<button class="movetarget bttn-fill bttn-md bttn-danger" title="'+latlng+'">'+value.bizesNm+'</button>'+
										'</dt>'+
												'<dd> '+value.rdnmAdr+
												(value.dongNo == null ? '' : value.dongNo+'동 ')+'</br>'+
												(value.flrNo == null ? '' : value.flrNo+'층 ')+
												(value.hoNo == null ? '' : value.hoNo+'호')+
												'</dd>'+
												'<dd>'+value.indsSclsNm+'</dd>'+
												'<dd>'+value.diskill+' KM</dd>'+
											'</dl>'+
										'</div>'+
									'</li>';
		            	});
		            	$(document).on('click','.movetarget',function(){
							var latlng = $(this).prop('title');
						    var laln=latlng.split(':');
							var LatLng = new daum.maps.LatLng(laln[0],laln[1]);
							map.setCenter(LatLng);
						});
	            		$('#near').html(nearString);
		            },
		            error : function() {
		               console.log("error");
		            }
		         });
			};
			
         	var space = /\+/g; //" "을 의미하는 값
         	var totalvalue;
			$('#all').click(function(){
		        total();
		        neartotal();
			});
			$("#list-select ul li a").click(function() {
				var str= $(this).text()+" 리스트";
				$("#around").html(str);
			});
			
			var cafe = $("#cafe").prop("title");
			$('#cafe').click(function(){
				var pic = "cafe";
				indssclscd(cafe,pic);
				nearselect(cafe,pic);
			});
			
			var hair = $("#hair").prop("title");
			$('#hair').click(function(){
				var pic = "hair";
				indssclscd(hair,pic);
				nearselect(hair,pic);
			});
			
			var hospital = $("#hospital").prop("title");
			$('#hospital').click(function(){
				var pic = "hospital";
				indssclscd(hospital,pic);
				nearselect(hospital,pic);
			});
			
			var pharm = $("#pharm").prop("title");
			$('#pharm').click(function(){
				var pic = "hospital";
				indssclscd(pharm,pic);
				nearselect(pharm,pic);
			});
			
			var etc = $("#etc").prop("title");
			$('#etc').click(function(){
				var pic = "etc";
				indssclscd(etc,pic);
				nearselect(etc,pic);
			});
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
			//마커 생성 함수
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
         
         if (navigator.geolocation) {

            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation
                  .getCurrentPosition(function(position) {

                     lat = position.coords.latitude, // 위도
                     lon = position.coords.longitude; // 경도
                     mylat = lat;
                     mylon = lon;
                     neartotal();
                     var locPosition = new daum.maps.LatLng(
                           lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                     message = ' '; // 인포윈도우에 표시될 내용입니다
                     
                     var imageSrc = '<c:url value="/resources/images/self.png"/>', // 마커이미지의 주소입니다    
                      imageSize = new daum.maps.Size(45, 55), // 마커이미지의 크기입니다
                      imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                      
                      var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
                      markerPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다
                     // 마커를 생성합니다
                     // 마커와 인포윈도우를 표시합니다
                     displayMarker(locPosition, message,markerImage);
                  },null,{
                       enableHighAccuracy: true,
                       maximumAge: 0,
                       timeout: 10000});

         } 
         else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

            var locPosition = new daum.maps.LatLng(33.450701, 126.570667),
                   message = 'geolocation을 사용할수 없어요..'

            displayMarker(locPosition, message,markerImage);
         }

         // 지도에 마커와 인포윈도우를 표시하는 함수입니다
         function displayMarker(locPosition, message,markerImage) {
            var marker = new daum.maps.Marker({
               map : map,
               image : markerImage,
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
               map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
               roadmapControl.className = 'selected_btn';
               skyviewControl.className = 'btn';
            } else {
               map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
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

         // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
         function makeOverListener(map, marker, infowindow) {
             return function() {
                 infowindow.open(map, marker);
             };
         }
         // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
         function makeOutListener(infowindow) {
             return function() {
                 infowindow.close();
             };
         }
         
         //api에서 바로 반경 뽑아오는 소스
//          function radius(lat1,lon1){
//             $.ajax({
//                  data : {code:"D09A01/D09A02/D25A16/Q12A07/S04A03/S04A01/S04A02",'lat':lat1,'lon':lon1},
//                   type: "POST",
//                   dataType : "json",
//                   url : "<c:url value='/where/map/radius.awa'/>",
//                   success: function(jsonObj) {
//                   var codes = ["D09A01","D09A02","D25A16","Q12A07","S04A03","S04A01","S04A02"];
//                      $.each(jsonObj, function(code, co_val){
//                         $.each(JSON.parse(co_val), function(tag, tag_val){
//                            if(tag=='body'){
//                               $.each(tag_val,function(key,val){
//                                  if(key=='items'){
//                                     $.each(val,function(k,v){
//                                        mapMaker(v.lat,v.lon);
//                                     });
//                                  }
//                               });
//                            }
//                         });
//                      });
//                   },
//                   error : function() {
//                      console.log("error");
//                   }
//                });
//          };
      });
</script>