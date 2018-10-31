<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script language="javascript">

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

}
/** API 서비스 제공항목 확대 (2017.02) **/
 
 
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>
<title>주소 입력 </title>

<body>

<input type="text"  class="postcodify_postcode5"  style="text-align: center" placeholder="검색하기 를 누르세요" />
<input type="button" id="postcodify_search_button" value="검색하기"/><br />
<input type="text"  class="postcodify_address" style="width:600px;text-align: right" placeholder="주소" /><br />
<input type="text"  class="postcodify_details" style="width:600px;text-align: right" placeholder="상세주소" /><br />
<input type="text"  class="postcodify_extra_info" style="width:600px;text-align: right" placeholder="동이름"  /><br />

<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script> $(function() {
	
	 $("#postcodify_search_button").postcodifyPopUp(); 
	 
	}); </script>



</body>
