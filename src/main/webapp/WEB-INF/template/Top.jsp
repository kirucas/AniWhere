<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
* {
	font-family: 메이플스토리;
}
a{
	color:#1ABC9C;
}
.dropdown-toggle::after {
    display:none;
}
/* Small devices (landscape phones, 576px 이상) */
/* @media ( min-width : 576px) {

} */

/* Medium devices (tablets, 768px 이상) */
/* @media ( min-width : 768px) {

} */

/* Large devices (desktops, 992px 이상) */
/* @media ( min-width : 992px) {

} */

/* Extra large devices (large desktops, 1200px 이상) */
/* @media ( min-width : 1200px) {

} */
html, body {
    margin:0;
    padding:0;
    height:100%;
}
* {box-sizing: border-box;}
.container {
    height:100%;
}
a {
    color:#fff;
    text-decoration:none;
    border-bottom:1px dotted #fff;
    padding:0px 0px 20px 0px;
    width:100%;
    display:block;
    height:100%;
}
li {
    padding:20px 20px 0 20px;
    width:100%;
    color:#fff;
}
.container ul {height:100%;}
.container > ul {
    width:250px;
    background-color:#224490;
    position:relative;
    overflow:visible;
}
.container > ul > li {}
.container > ul > li:hover {background-color:#0f1e41;}
.container > ul > li > ul {
    display:none;
    position:absolute;
    right:-250px;
    top:0;
    width:250px;
    background-color:#18316a;
}
.container > ul > li:hover > ul {
    display:block;
}
.container > ul > li > ul >li:hover {background-color:#0f1e41;}
.container > ul > li > ul > li > ul {
    display:none;
    position:absolute;
    right:-250px;
    top:0;
    width:250px;
    background-color:#112551;
}
.container > ul > li > ul > li:hover ul {
    display:block;
}
.container > ul > li > ul > li > ul > li:hover {background-color:#0f1e41;}
.container > ul > li > ul > li ul li ul li {
    border-bottom:1px dotted #fff;
    padding:20px;
}
</style>
<div class="container">        
            <ul class="">

                <li class="">
                    <a tabindex="-1" href="#">Client Advice</a>
                    <ul class="">

                        <li class=""><a tabindex="-1" href="#">Pre-advice</a></li>
                        <li class=""><a href="#">Strategy & Technical</a></li>
                        <li class=""><a href="#">Research</a></li>
                        <li class="">
                            <a href="#">APL & Products</a>
                            <ul class="parent">
                                <li >
                                    <a href="#">
                                        Approved Product List                                        
                                    </a>

                                    <ul class="child">
                                        <li >Platforms</li>
                                        <li >Managed Funds</li>
                                        <li >Wealth Protection</li>
                                        <li >Listed Securities</li>
                                        <li >Wealth Protection</li>
                                        <li >Listed Securities</li>
                                        <li >Listed Securities</li>
                                    </ul>

                                </li>
                                <li ><a href="#">Model Portfolios</a></li>
                                <li ><a href="#">Non-approved Products</a></li>
                            </ul>
                        </li>
                        <li class=""><a href="#">Implementation</a></li>
                        <li class=""><a href="#">Review</a></li>
                        <li class=""><a href="#">Execution Only</a></li>
                    </ul>
                </li>
                <li ><a href="#">Personal Development</a></li>
                <li ><a href="#">Practice</a></li>
                <li ><a href="#">News</a></li>
            </ul>

    </div>


---------------





	<nav class="navbar navbar-expand-lg sticky-top navbar-light" data-spy="affix" data-offset-top="50">
		  <a class="navbar-brand" href="<c:url value="/main.aw" />"> 
		  		<img src="<c:url value='/resources/images/logoLong.png'/>" alt=""	style="width: 120px; height: 51px">
		  </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    	<span class="navbar-toggler-icon"></span>
		  </button>

  <div class="collapse navbar-collapse" id="main-menu">
    <ul class="nav nav-inline">
      <li class="nav-item">
        <a class="nav-link active" href="<c:url value="/main.aw" />" role="button">
			AniWhere
		</a>
      </li>
      <li class="nav-item dropright">
        <a class="nav-link dropdown-toggle"  href="#" id="animal" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	동물
        </a>
		<div class="dropdown-menu" aria-labelledby="animal">
			<ul class="nav nav-inline">
				<li class="nav-item dropright">
					<a class="nav-link dropdown-toggle" href="#" href="#" id="dog" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						강아지
					</a>
					<div class="dropdown-menu" aria-labelledby="dog">
						 <a class="dropdown-item" href="#">사진 게시판</a>	
						 <a class="dropdown-item" href="#">동영상 게시판</a>	
						 <a class="dropdown-item" href="#">질문 게시판</a>	
						 <a class="dropdown-item" href="#">팁 게시판</a>	
					
					
					</div>
				</li>	
				
				
				
			</ul>
	  		 
		  	 <a class="dropdown-item" href="#">고양이</a>	
		  	 <a class="dropdown-item" href="#">파충류&양서류</a>
		  	 <a class="dropdown-item" href="#">조류</a>
	         <a class="dropdown-item" href="#">기타 포유류</a>
	         <div class="dropdown-divider"></div>
	         <a class="dropdown-item" href="#">자유게시판</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link active" href="<c:url value="/main.aw" />" role="button">
			장터
		</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link active" href="<c:url value="/main.aw" />" role="button">
			유기동물
		</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link active" href="<c:url value="/main.aw" />" role="button">
			만나요
		</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link active" href="<c:url value="/main.aw" />" role="button">
			위치
		</a>
      </li>
      <!-- login btn -->
	  <li class="nav-item">
			<button type="button" class="btn btn-default navbar-btn"
				style="color: black;" id="login">LOGIN</button>
	  </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
			<!-- Navbar Starts -->
			
			<nav class="navbar sticky-top navbar-light" data-spy="affix"
				data-offset-top="50">
				<div class="container">
					<!-- Brand -->
					

					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu">
    					<span class="navbar-toggler-icon"></span>
  					</button>

					<div class="collapse navbar-collapse" id="main-menu">
						<!-- Navbar Starts -->
						<ul class="nav nav-inline">
							<li class="nav-item">
								<a class="nav-link active" href="<c:url value="/main.aw" />" role="button">
									AniWhere
								</a>
							</li>
							<li class="nav-item dropright">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"> 
								동물 
							</a>
								<div class="dropdown-menu">
									<ul class="nav-item dropright">
										<a class="nav-link dropdown-toggle" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false" role="button"
											href="<c:url value='/animal/dog/main.aw' />"><img
											src="<c:url value='/resources/images/animal/dog.png'/>"
											style="width: 30px; height: 30px;" /> 강아지 </a>
										<div class="dropdown-menu">
											<!-- Dropdown menu links -->
											<a href="<c:url value='/animal/cat/main.aw' />"><img
												src="<c:url value='/resources/images/animal/cat.png'/>"
												style="width: 30px; height: 30px;" /> 고양이</a>
										</div>
									</ul>
									<a class="dropdown-item"
										href="<c:url value='/animal/cat/main.aw' />"><img
										src="<c:url value='/resources/images/animal/cat.png'/>"
										style="width: 30px; height: 30px;" /> 고양이</a> <a
										class="dropdown-item"
										href="<c:url value='/animal/rna/main.aw' />"><img
										src="<c:url value='/resources/images/animal/reptiles.png'/>"
										style="width: 30px; height: 30px;" /> 파충류 & 양서류 </a> <a
										class="dropdown-item"
										href="<c:url value='/animal/bird/main.aw' />"><img
										src="<c:url value='/resources/images/animal/bird.png'/>"
										style="width: 30px; height: 30px;" /> 조류</a> <a
										class="dropdown-item"
										href="<c:url value='/animal/etc/main.aw' />"><img
										src="<c:url value='/resources/images/animal/rat.png'/>"
										style="width: 30px; height: 30px;" /> 기타 포유류</a> <a
										class="dropdown-item"
										href="<c:url value='/animal/freeboard.aw' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자유
										게시판</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" id="market_main"> 장터 </a>
								<div class="dropdown-menu">
									<a class="dropdown-item"
										href="<c:url value='/market/sell.aw' />">팔아요</a> <a
										class="dropdown-item" href="<c:url value='/market/buy.aw' />">사요</a>
									<a class="dropdown-item"
										href="<c:url value='/market/groupbuy.aw' />">같이 싸게 사요</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" id="miss_main"> 유기동물 </a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="<c:url value='/miss/see.aw' />">봤어요</a>
									<a class="dropdown-item" href="<c:url value='/miss/find.aw' />">찾아요</a>
									<a class="dropdown-item"
										href="<c:url value='/miss/shelter.aw' />">보호소</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" id="mating_main"> ♡ 만나요 </a>
								<div class="dropdown-menu">
									<a class="dropdown-item"
										href="<c:url value='/mating/main.aw'/>">만나요!</a> <a
										class="dropdown-item"
										href="<c:url value='/mating/matingProfile.aw'/>">프로필 카드
										등록해요</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button"> 위치 </a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">우리 아이가 아플 때</a> <a
										class="dropdown-item" href="#">아이를 맡겨야 할 때</a> <a
										class="dropdown-item" href="#">용품이 사고 싶을 때</a> <a
										class="dropdown-item" href="#">입양을 하고 싶을 때</a> <a
										class="dropdown-item" href="#">산책을 하고 싶을 때</a>
								</div></li>
							<!-- login btn -->
							<li class="nav-item">
								<button type="button" class="btn btn-default navbar-btn"
									style="color: black;" id="login">LOGIN</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Navbar Ends -->
