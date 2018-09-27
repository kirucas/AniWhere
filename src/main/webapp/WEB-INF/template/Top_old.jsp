<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	nav{
		font-family:메이플스토리;
	}
	p{
		font-family:메이플스토리;
	}
	h2{
		font-family:메이플스토리;
	}
	h1{
		font-family:메이플스토리;
	}
	body{
		font-family:메이플스토리;
	}

</style>

<!-- Header area wrapper starts -->
  <header id="header-wrap">
    <!-- Header area starts -->
    <section id="header">

     <!-- Navbar Starts -->
      <nav class="navbar sticky-top navbar-light" data-spy="affix" data-offset-top="50">
        <div class="container">
          <button class='navbar-toggler hidden-md-up pull-xs-right' data-target='#main-menu' data-toggle='collapse' type='button'>
        	    ☰
          </button>
          <!-- Brand -->
          <a class="navbar-brand" href="#">
            <img src="<c:url value='/resources/images/logoLong.png'/>" alt="" style="width:120px;height:51px">
          </a>
          <div class="collapse navbar-toggleable-sm pull-xs-left pull-md-right" id="main-menu">
            <!-- Navbar Starts -->
            <ul class="nav nav-inline">
              <li class="nav-item dropdown">
                <a class="nav-link active" href="#" role="button" aria-haspopup="true" aria-expanded="false">AniWhere</a>                  
              </li>                                     
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                  	동물
                </a>
                <div class="dropdown-menu">                      
                  <a class="dropdown-item" href="#"><i class="pulse-shrink"><img src="<c:url value='/resources/images/animal/dog.png'/>" style="width:30px;height:30px;"/> </i> 강아지</a>
                  <a class="dropdown-item" href="#"><img src="<c:url value='/resources/images/animal/cat.png'/>" style="width:30px;height:30px;"/>  고양이</a>
                  <a class="dropdown-item" href="#"><img src="<c:url value='/resources/images/animal/reptiles.png'/>" style="width:30px;height:30px;"/>  파충류 & 양서류 </a>
                  <a class="dropdown-item" href="<c:url value='/bird_list.aw' />"><img src="<c:url value='/resources/images/animal/bird.png'/>" style="width:30px;height:30px;"/>  조류</a>
                  <a class="dropdown-item" href="#"><img src="<c:url value='/resources/images/animal/rat.png'/>" style="width:30px;height:30px;"/>  기타 포유류</a>
                  <a class="dropdown-item" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자유 게시판</a>
                </div>
              </li>             
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                  장터 
                </a>
                <div class="dropdown-menu">                      
                  <a class="dropdown-item" href="#">팔아요</a>
                  <a class="dropdown-item" href="#">사요</a>
                  <a class="dropdown-item" href="#">같이 싸게 사요</a>
                </div> 
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="miss_main" data-toggle="dropdown" href="#"  aria-haspopup="true" aria-expanded="false">
              	  유기동물
                </a>                    
                <div class="dropdown-menu">                      
                  <a class="dropdown-item" href="<c:url value='/miss/see.aw'/>">봤어요</a>
                  <a class="dropdown-item" href="<c:url value='/miss/find.aw'/>">찾아요</a>
                  <a class="dropdown-item" href="<c:url value='/miss/shelter.aw'/>">보호소</a>
                </div>  
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                 	 ♡ 만나요
                </a>                    
                <div class="dropdown-menu">                      
                  <a class="dropdown-item" href="#">만나요!</a>
                  <a class="dropdown-item" href="#">프로필 카드 등록해요</a>
                </div>                   
              </li> 
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                  	위치
                </a>
                <div class="dropdown-menu">                      
                  <a class="dropdown-item" href="#">우리 아이가 아플 때</a>
                  <a class="dropdown-item" href="#">아이를 맡겨야 할 때</a>
                  <a class="dropdown-item" href="#">용품이 사고 싶을 때</a>
                  <a class="dropdown-item" href="#">입양을 하고 싶을 때</a>
                  <a class="dropdown-item" href="#">산책을 하고 싶을 때</a>
                </div> 
              </li>          
              
              
              <!-- Search in right of nav -->
              <!-- 
              <li class="nav-item" class="search">
                <form class="top_search clearfix">
                  <div class="top_search_con">
                    <input class="s" placeholder="Search Here ..." type="text">
                    <span class="top_search_icon"><i class="icon-magnifier"></i></span>
                    <input class="top_search_submit" type="submit">
                  </div>
                </form>
              </li>
               -->
              <!-- Search Ends -->    
              
              <!-- login btn -->  
             <li class="nav-item"><button type="button" class="btn btn-default navbar-btn" style="color:black">LOGIN</button></li>
            </ul>  
          </div>              
            <!-- Form for navbar search area -->
            <form class="full-search">
              <div class="container">
                <input type="text" placeholder="Type to Search">
                <a href="#" class="close-search">
                  <span class="fa fa-times fa-2x">
                  </span>
                </a>
              </div>
            </form>
            <!-- Search form ends -->
        </div>
      </nav>
      <!-- Navbar Ends -->

    </section> 
  </header>
  <!-- Header-wrap Section End -->
