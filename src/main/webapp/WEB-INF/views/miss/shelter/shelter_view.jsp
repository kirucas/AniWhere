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
								<div style="vertical-align: middle;">${record.careNm}</div>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: middle; background-color: rgba(80, 80, 80, 0.1);">보호소 전화번호</td>
							<td>
								<div style="vertical-align: middle;">${record.careTel}</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="totalsize" class="col col-sm-12" style="height: 450px; margin-top:15px; background-color: gray">
					<!-- 지도 들어갈 부분 -->
			</div>
			<a href="<c:url value='/miss/shelter.aw'/>"><button style="margin-left: 1050px;margin-top: 20px;margin-bottom:10px; height: 35px;width: 80px">목록</button></a>
		</div>
	</div>
</div>