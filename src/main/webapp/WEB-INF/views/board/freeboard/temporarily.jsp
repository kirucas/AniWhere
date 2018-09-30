<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="now" value="<%=new java.util.Date() %>" />

<!-- 내용 시작 -->
<div class="container">

	<table class="table table-dark">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">분류</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td><span class="text-muted">[정보]</span></td>
				<td>미나러미ㅏ렂마;ㅣㄹㅈ댜ㅐ 헉솨;ㅣ허 ㅏㅣ;ㅎㄷ거 ㅐ너라;ㅣ ㅅㅍㄷ저ㅜ ㅣㅑㅓ우;ㅑㅐㅌㄹㅋ ㅓㅏ</td>
				<td>캣새끼</td>
				<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td><span class="text-muted">[잡담]</span></td>
				<td>ㅣㅏ넝ㄱㅍ 시ㅗㅡㅑㅎ온ㅊ ㅣ감 ㅓㅎ;ㅣㅏㅓㄹ;ㅣㅏㅂㅁㄴ</td>
				<td>불곰</td>
				<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td><span class="text-muted">[정보]</span></td>
				<td>ㅇㄴ큐 ㅛ헉ㅌ ㅛㅓㅗㄾㅎㅌ 푶ㅈㄷㄷ ㅛㄹ헡ㅎ롷ㅌㄹ륨</td>
				<td>왜가리</td>
				<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td><span class="text-muted">[잡담]</span></td>
				<td>ㅇㄹㄹㅋ슈 ㅠ쇼ㅕ쇼, ㅑㅐ ㅗ,호.3ㅜ20132ㄴㅇ4ㅍ68ㄳ3</td>
				<td>게릿!</td>
				<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
		</tbody>
	</table>

</div>
<!-- 내용 끝 -->