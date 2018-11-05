<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<style>
	#btn{
		margin-bottom: 200px;
		float: right;
	}
	#btn a{
		color:white;
		
	}
	#qr_cord{
		float: left;
		width: 500px;
		height: 500px;
	}
	#qr_cord img{
		padding: 40% 10% 0 10%;
		width: 100%;
		height: 100%;
	}
	#reservation_view{
		overflow: auto;
		padding-top: 9%;
	}
	#reservation_view div{
		height: 125px;
		text-align: left;
		
	}
	#reservation_view div span{
		font-size: 2em;
		line-height: 140px;
		
	}
</style>
<div id="reservation_qrcord">
	<div id="qr_cord">
		<img alt="QRcord" src="<c:url value='/resources/images/Notice.jpg'/>">
	</div>
	<div id="reservation_view">
		<div>
			<span>예약 번호 : ${dto.rv_no }</span>
		</div>
		<div>
			<span>상가 이름 : ${dto.besizenm }</span>
		</div>
		<div>
			<span>등록 날짜 : ${dto.apply_date }</span>
		</div>
		<div>
			<span>예약 날짜 : ${dto.booking_date }</span>
		</div>
	</div>
</div>
<div id="btn">
	<a class="btn btn-primary">수정</a>
	<a class="btn btn-danger">삭제</a>
</div>