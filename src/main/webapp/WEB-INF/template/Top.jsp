<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	(function($){
		$('.dropdown-menu a.dropdown-toggle').on('click', function(e) {
		  if (!$(this).next().hasClass('show')) {
			$(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
		  }
		  var $subMenu = $(this).next(".dropdown-menu");
		  $subMenu.toggleClass('show');
	
		  $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
			$('.dropdown-submenu .show').removeClass("show");
		  });
	
		  return false;
		});
	});

</script>
<style>
nav a{
	color:#1ABC9C;
}
.dropdown-menu{padding:0;margin:0;border:0 solid transition!important;border:0 solid rgba(0,0,0,.15);border-radius:0;-webkit-box-shadow:none!important;box-shadow:none!important}
.mainmenu a, .navbar-default .navbar-nav > li > a, .mainmenu ul li a , .navbar-expand-lg .navbar-nav .nav-link{color:gray;font-size:16px;text-transform:capitalize;padding:16px 15px;font-family:'메이플스토리';display: block !important;}
.mainmenu .active a,.mainmenu .active a:focus,.mainmenu .active a:hover,.mainmenu li a:hover,.mainmenu li a:focus ,.navbar-default .navbar-nav>.show>a, .navbar-default .navbar-nav>.show>a:focus, .navbar-default .navbar-nav>.show>a:hover{color: #1ABC9C;text-decoration:none;outline: 0;}

/******************************Drop-down menu work on hover**********************************/
.mainmenu{background: none;border: 0 solid;margin: 0;padding: 0;min-height:20px;width: 100%;}
@media only screen and (min-width: 767px) {
.mainmenu .collapse ul li:hover> ul{display:block}
.mainmenu .collapse ul ul{position:absolute;top:100%;left:0;min-width:250px;display:none;background-color:#FAFAFA;}
/*******/
.mainmenu .collapse ul ul li{position:relative}
.mainmenu .collapse ul ul li:hover> ul{display:block}
.mainmenu .collapse ul ul ul{position:absolute;top:0;left:100%;min-width:250px;display:none}
/*******/
.mainmenu .collapse ul ul ul li{position:relative}
.mainmenu .collapse ul ul ul li:hover ul{display:block}
.mainmenu .collapse ul ul ul ul{position:absolute;top:0;left:-100%;min-width:250px;display:none;z-index:1}

}
@media only screen and (max-width: 767px) {
.navbar-nav .show .dropdown-menu .dropdown-menu > li > a{padding:16px 15px 16px 35px}
.navbar-nav .show .dropdown-menu .dropdown-menu .dropdown-menu > li > a{padding:16px 15px 16px 45px}
}
.dropdown-toggle:after{
	display:none;
}
</style>

<div class="container">
        <div class="row">
            <nav class="navbar navbar-light navbar-expand-lg mainmenu">
            	<a class="navbar-brand" href="<c:url value="/main.aw" />"> 
  					<img src="<c:url value='/resources/images/logoLong.png'/>" alt="" style="width: 120px; height: 51px">
  				</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="main">
                    <ul class="navbar-nav ml-auto">
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">동물</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            	<li class="dropdown">
	                                <a class="dropdown-toggle" href="/animal/dog/main.aw" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                	<img src="<c:url value='/resources/images/animal/dog.png'/>" style="width:30px;height:30px;"/>
	                                		&nbsp;강아지
	                                </a>
	                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                <li><a href="/animal/dog/photo.aw">사진 게시판</a></li>
		                                <li><a href="/animal/dog/movie.aw">동영상 게시판</a></li>
		                                <li><a href="/animal/dog/quest.aw">질문 게시판</a></li>
		                                <li><a href="/animal/dog/tip.aw">팁 게시판</a></li>
	                                </ul>
                            	</li>
	                            <li class="dropdown">
	                                <a class="dropdown-toggle" href="/animal/cat/main.aw" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                	<img src="<c:url value='/resources/images/animal/cat.png'/>" style="width:30px;height:30px;"/>
	                                		&nbsp;고양이
                                	</a>
	                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                <li><a href="/animal/cat/photo.aw">사진 게시판</a></li>
		                                <li><a href="/animal/cat/movie.aw">동영상 게시판</a></li>
		                                <li><a href="/animal/cat/quest.aw">질문 게시판</a></li>
		                                <li><a href="/animal/cat/tip.aw">팁 게시판</a></li>
	                                </ul>
                            	</li>
	                            <li class="dropdown">
	                                <a class="dropdown-toggle" href="/animal/rna/main.aw" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                	<img src="<c:url value='/resources/images/animal/reptiles.png'/>" style="width:30px;height:30px;"/>
	                                		&nbsp;파충류 & 양서류
                               		</a>
	                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                <li><a href="/animal/rna/photo.aw">사진 게시판</a></li>
		                                <li><a href="/animal/rna/movie.aw">동영상 게시판</a></li>
		                                <li><a href="/animal/rna/quest.aw">질문 게시판</a></li>
		                                <li><a href="/animal/rna/tip.aw">팁 게시판</a></li>
	                                </ul>
	                            </li>
	                            <li class="dropdown">
	                                <a class="dropdown-toggle" href="/animal/bird/main.aw" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                	<img src="<c:url value='/resources/images/animal/bird.png'/>" style="width:30px;height:30px;"/>
	                                		&nbsp;조류
	                                </a>
	                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                <li><a href="/animal/bird/photo.aw">사진 게시판</a></li>
		                                <li><a href="/animal/bird/movie.aw">동영상 게시판</a></li>
		                                <li><a href="/animal/bird/quest.aw">질문 게시판</a></li>
		                                <li><a href="/animal/bird/tip.aw">팁 게시판</a></li>
	                                </ul>
	                            </li>
	                            <li class="dropdown">
	                                <a class="dropdown-toggle" href="/animal/etc/main.aw" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                	<img src="<c:url value='/resources/images/animal/rat.png'/>" style="width:30px;height:30px;"/>
	                                		&nbsp;기타 포유류
	                                </a>
	                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                                <li><a href="/animal/etc/photo.aw">사진 게시판</a></li>
		                                <li><a href="/animal/etc/movie.aw">동영상 게시판</a></li>
		                                <li><a href="/animal/etc/quest.aw">질문 게시판</a></li>
		                                <li><a href="/animal/etc/tip.aw">팁 게시판</a></li>
	                                </ul>
	                            </li>
	                            <li class="dropdown-divider"></li>
	                            <li><a href="<c:url value='/animal/freeboard.aw'/>">&emsp;&emsp;&nbsp;&nbsp;자유 게시판</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">장터</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			                                <li><a href="#">팔아요</a></li>
			                                <li><a href="#">사요</a></li>
			                                <li><a href="#">같이 싸게 사요</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" id="miss_main" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">유기동물</a>
                            <ul class="dropdown-menu" aria-labelledby="miss_main">
			                                <li><a href="<c:url value='/miss/see.aw'/>">봤어요</a></li>
			                                <li><a href="<c:url value='/miss/find.aw'/>">찾아요</a></li>
			                                <li><a href="<c:url value='/miss/shelter.aw'/>">보호소</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" id="mating_main" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">♡만나요</a>
                            <ul class="dropdown-menu" aria-labelledby="mating_main">
			                                <li><a href="#">만나요!</a></li>
			                                <li><a href="#">프로필 카드 등록해요</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">위치</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			                                <li><a href="#">우리 아이가 아플 때</a></li>
			                                <li><a href="#">아이를 맡겨야 할 때</a></li>
			                                <li><a href="#">용품을 사고 싶을 때</a></li>
			                                <li><a href="#">입양을 하고 싶을 때</a></li>
			                                <li><a href="#">산책을 하고 싶을 때</a></li>
                            </ul>
                        </li>
                    </ul>
                    <button type="button" class="btn btn-default navbar-btn" style="color:black;margin-left:30px" id="login">
                    	LOGIN
                    </button>
                </div>
            </nav>
        </div>
    </div>