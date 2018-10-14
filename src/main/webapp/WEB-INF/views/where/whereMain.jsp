<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
   /* 체크박스 설정 */
    #pain , #entrust , #goods , #adopt , #walk{
       float: left; 
       margin-right: 1px;
       width: 50px;
       height: 50px;
       margin-top: 10px;
       margin-right: 7px;
       position: relative;
    }
    #li-font{
       font-size: 50px;
       list-style: none;
       text-align: center;
    }
    img {
       width: 100%;
       height: 500px;
    }
    @media (max-width : 993px){
       #checkList, #review {
          clear: both;
          width: 100%;
       }
    }
    @media (max-width : 500px){
       #li-font input[type="checkbox"]{
          width: 20px;
          height: 20px;
          margin-bottom: 10px;
       }
       #li-font li {
          font-size: 30px;
          margin-left: -200px;
       }
    }

    span{
        style="font-size: 2em;
        font-family: 메이플스토리;"
    }
    #review{
       vertical-align: middle;
    }
    #check-box{
       width:100%;
       height:50%;
       padding-top: 50px;
    }
</style>
<!-- 내용 시작 -->
<div class="container">
   <div  	id="map" style="width:600px;height:500px">
      
   </div>
	   <!-- daum 지도 API 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8940a4eb3083abd07d038b8c2839831"></script>
	<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
      <div>
         <div class="check-box" id="checkList">
            <ul id="li-font">
               <input type="checkbox" id="pain"><li>우리 아이가 아플때</li>
               <input type="checkbox" id="entrust"><li>아이를 맡겨야 할때</li>
               <input type="checkbox" id="goods"><li>용품을 사고 싶을때</li>
               <input type="checkbox" id="adopt"><li>입양을 하고 싶을때</li>
               <input type="checkbox" id="walk"><li>산책을 하고 싶을때</li>
            </ul>
         </div>
         <span>선택한 리스트</span>
         <div id="review">
            <img alt="" src="<c:url value='/resources/images/map.jpg'/>"/>
         </div>
      </div>
</div>
<!-- 내용 끝 -->