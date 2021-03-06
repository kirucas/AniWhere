<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
*{
	font-family: 메이플스토리;
}
span .mr-auto{
	font-size:35px;
}
.logins{
	width:140px;
	height:45px;
}
</style>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>AniWhere Sign In</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendors/iconfonts/puse-icons-feather/feather.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendors/css/vendor.bundle.base.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendors/css/vendor.bundle.addons.css' />">
    <!-- inject:css -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/shared/style.css' />">
    <!-- endinject -->
    <link rel="shortcut icon" href="<c:url value='/resources/assets/images/favicon.png' />" />
    <!-- 네이버 로그인 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
    <!-- 구글 로그인 -->
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name = "google-signin-client_id"content = "114002391093-2pah7et1b4fatvqhjob82j3pnrdt68hr.apps.googleusercontent.com">
</head>
<!-- <body> -->
   <c:if test="${not empty sign_error }">
      <script>
         alert("${sign_error}");
      </script>
   </c:if>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper auth p-0 theme-two">
                <div class="row d-flex align-items-stretch">
                    <div class="col-md-4 banner-section d-none d-md-flex align-items-stretch justify-content-center">
                        <div class="slide-content bg-1" style='background: url("<c:url value='/resources/images/loginlogo.jpg'/>");background-size: cover;'> </div>
                    </div>
                    <div class="col-12 col-md-8 h-100 bg-white">
                        <div class="auto-form-wrapper d-flex align-items-center justify-content-center flex-column">
                            <form action="<c:url value='/signInProcess.aw' />" method="post">
                                <span class="mr-auto">안녕하세요! 시작하자.</span>
                                <p class="mb-5 mr-auto">아래에 세부 정보를 입력하십시오.</p>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="mdi mdi-account-outline"></i>
                                            </span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Username" name="mem_id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="mdi mdi-lock-outline"></i>
                                            </span>
                                        </div>
                                        <input type="password" class="form-control" placeholder="Password" name="mem_pw">
                                    </div>
                                </div>
                                <div class="form-group" style="float:left;">
                                    <button style="width:100%;" class="btn btn-primary submit-btn">로그인</button>
                                </div>
                           </form>
                                <div class="row">
                                	<ul style="width:100%;list-style:none;margin:0;padding:0">
                               			<li style="float:left;padding-right:10px">
                                			<a href="${url}">
                                				<img class="logins" style="width:225px;height:36px;" id="naverLogin" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
                               				</a>
                            			</li>
                               			<li style="float:left">
                            				
                            				<div id="google_id_login" style="text-align:center">
                            					<a href="${google_url}"><img class="glogins" style="width:225px;height:36px;" src="<c:url value='/resources/images/googleicon.png'/>"/></a>
                            				</div>
                               			</li>
                               		</ul>
                  				</div>
                  				<div class="row" style="margin-top: 20px;">
	    			 				<p style="margin-top:1.rem;" class="margin center medium-small sign-up">계정이 없으십니까?
	    			 					<a href="<c:url value='/member/sign_up.aw' />"> Sign Up</a>
	    			 				</p>
    			 				</div>
                           <div class="wrapper mt-5 text-gray">
                               <p class="footer-text">Copyright © 2018 Bootstrapdash. All rights reserved.</p>
                               <ul class="auth-footer text-gray">
                                   <li>
                                       Terms & Conditions
                                   </li>
                                   <li>
                                       Cookie Policy
                                   </li>
                               </ul>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="<c:url value='/resources/assets/vendors/js/vendor.bundle.base.js' />"></script>
    <script src="<c:url value='/resources/assets/vendors/js/vendor.bundle.addons.js' />"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="<c:url value='/resources/assets/js/shared/off-canvas.js' />"></script>
    <script src="<c:url value='/resources/assets/js/shared/hoverable-collapse.js' />"></script>
    <script src="<c:url value='/resources/assets/js/shared/misc.js' />"></script>
    <script src="<c:url value='/resources/assets/js/shared/settings.js' />"></script>
    <script src="<c:url value='/resources/assets/js/shared/todolist.js' />"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <!-- End custom js for this page-->
</body>
</html>