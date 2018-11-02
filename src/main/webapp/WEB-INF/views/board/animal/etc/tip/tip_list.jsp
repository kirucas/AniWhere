<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
#no{
	text-align:center;
	font-size: 1.5em;
}
.sub-header-info{
	padding-bottom:0px;
}
#pagingDiv{
	width: 100%;
	text-align: center;
}
.row nav{
	margin:0 auto;
}
#pagingDiv nav ul li {
	margin-right: 10px;
}
.prev_next a img {
	width: 100px;
	height: 100px;
}
#list_container{
	padding-left:0px;
	padding-right:0px;
	margin-bottom:15px;
}
#btn_img{
	float:left;
	margin-top:5px;
}
.sub-header-search{
	margin-bottom:5px;
}
#select_form{
	display:inline;
}
#select_form label select{
	margin-left:10px;
}
#select_form input{
	float: right;
}
#tip_no{
	text-align: center;
}
</style>
<!-- 바디 -->
<div class="container" id="list_container">
		<div class="sub-header">
			<div class="sub-header-info">
				<div>
					<ul class="sub-link__list">
						<li class="sub-link__item sub-link__item--active">
							<a href="#"><img src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"	alt=""><span>인기</span></a>
						</li>
						<li class="sub-link__item ">
							<a href="#"> <img src="https://talk.op.gg/images/icon-new@2x.png" width="24" alt=""><span>최신</span></a>
						</li>
						<li class="sub-link__item ">
							<a href="#"> <img src="https://talk.op.gg/images/icon-top@2x.png" width="24" alt=""><span>TOP</span></a>
						</li>
					</ul>		
					<ul class="sub-header-button">
						<li class="sub-header-button__item sub-header-button__item--search">
							<button id="search-toggle-button" class="button">
								<img src="https://talk.op.gg/images/icon-search@2x.png" alt="검색하기" width="24">
							</button>
						</li>
					</ul>
					<div class="sub-header-search" >
						<a href="<c:url value='/security/animal/etc/tip/write.aw'/>">
							<img id="btn_img" src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기" width="24">
						</a>
		                <form id="select_form" action="">
		                    <label>
		                    	<select name="target" class="sub-header-search__select">
		                            <option value="title">제목</option>
		                            <option value="content">내용</option>
		                            <option value="title_content">제목+내용</option>
		                            <option value="user_name">작성자</option>
		                        </select>
		                    </label>
		                    <input type="text" name="q" class="sub-header-search__input" placeholder="검색">
		                    <button class="sub-header-search__button"><img src="https://talk.op.gg/images/icon-search@2x.png" width="24" alt="검색"></button>
		                </form>
	            	</div>
				</div>
			</div>
		</div>

		<!-- 내용 부분 시작  -->
		<section class="article-list article-list--fixed"></section>
		<section class="article-list">
			<!-- 여기서 반복문 돌려서 글 -->
			<c:if test="${empty requestScope.list}" var="isEmpty">
				   등록된 게시물이 없어요
    		</c:if>
    		<c:if test="${not isEmpty}">
    			<c:forEach var="record" items="${list}" varStatus="loop">
		    		<article class="article-list-item">
					<div class="article-list-item__vote">
						<img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
						<div><span id="tip_hit">${record.tip_hit}</span></div>
		    		</div>
				<div class="article-list-item__content">
					<a href="<c:url value='/animal/etc/tip/tip_view.aw?no=${record.no}'/>" class="article-list-item__info">
						<div class="article-list-item__title">
							<span id="tip_title">${record.tip_title}</span> <em>[21]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item">
							<span data-tooltip data-date=${record.tip_regidate } title=""></span>
						</div>
						<c:if test="${record.mem_nickname eq null}" var="result">
							<div class="article-list-item-meta__item article-list-item-meta__item--author">
								<span>X 를 눌러 조의를 표하십시오</span>
							</div>
						</c:if>
						<c:if test="${not result}">
							<div class="article-list-item-meta__item article-list-item-meta__item--author">
								<span id="mem_no">${record.mem_nickname} </span>
							</div>
						</c:if>
						<div class="article-list-item-meta__item">
							조회수 <span id="tip_count">${record.tip_count}</span>
						</div>
					</div>
				</div>
				<div class="article-list-item__vote">
					<div><span id="tip_no">${record.no}</span></div>
				</div>
			</article>
	    		</c:forEach>
    		</c:if>
			<!-- 페이징 부분
			<section class="article-list-paging" >
				<div class="article-list-paging-content">
					<ul class="article-list-paging-list">
						<li class="article-list-paging__item article-list-paging__item--prev">
                        <a href="https://talk.op.gg/s/lol/all?page=9" class="article-list-paging__button button">
                            <img src="https://talk.op.gg/images/icon-arrow-left@2x.png" width="24" alt=""><span>이전</span>
                        </a>
						<li class="article-list-paging__item article-list-paging__item--current">
							<span class="article-list-paging__link">1</span></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">2</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">3</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">4</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">5</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">6</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">7</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">8</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">9</a></li>
						<li class="article-list-paging__item ">
							<a href="#" class="article-list-paging__link">10</a></li>
						<li	class="article-list-paging__item article-list-paging__item--next">
							<a href="#"	class="article-list-paging__button button"> 
								<span>다음</span>
								<img src="https://talk.op.gg/images/icon-arrow-right@2x.png" width="24" alt="">
							</a>
						</li>
					</ul>
				</div>
			</section>
			 -->
			
		</section>
	</div>
	<!-- 아래는 페이징 -->
    <div class="row" id="pagingDiv">
    	${pagingString}
    </div>	
<!-- 바디 끝 -->
