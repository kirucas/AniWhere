<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>

<style>
	#reservationMain{
		margin-bottom: 100px;
	}
	#reservation{
		margin-top: 50px;
		margin-left: 30%;
	}
	#form_span span{
		font-size: 2em;
	}
	img{
		width: 30px;
		height: 30px;
	}
	#datepicker{
		margin-right: 5px;
	}
</style>
<script>
	$(function() {
	    $( "#datepicker" ).datepicker({
	    	 dateFormat: ('yy-mm-dd'),
	    	 changeMonth: true, 
	         changeYear: true,
	         nextText: '다음 달',
	         prevText: '이전 달',
	         minDate: -0,
	         maxDate: "+15D",
	         dayNamesMin:['월','화','수','목','금','토','일'],
	         showOn: 'button',
	         buttonImage: "<c:url value='/resources/images/calendar.png'/>"
	    });
	});
</script>
<div id="reservationMain">
	 <article class="container">
        <div class="page-header">
          <h1>예약 페이지</h1>
        </div>
        <div id="reservation">
          <form role="form" method="post" action="<c:url value='/where/reservate.awa'/>" id="form_span">
	          	<div class="form-group">
	          		상가업소 번호 : ${store_no}<input type="hidden" name="store_no" value="${store_no}"/> 
	          	</div>
	            <div class="form-group">
	              	 업소명 : ${bizesNm}<input type="hidden" name="bizesNm" value="${bizesNm}"/>
	            </div>
	            <div class="form-group">
	              	<span>날짜 선택 : </span><input type="text" id="datepicker" name="booking_date">
	            </div>
	            <div class="form-group" id="btn">
	              <button type="submit" class="btn btn-info">예약하기</button>
	            </div>
            </form>
       	</div>
	</article>
</div>	
