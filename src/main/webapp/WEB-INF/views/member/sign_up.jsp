<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(".login-form").validate({
     rules: {
       username: {
         required: true,
         minlength: 4
       },     
       pwd: {
         required: true,
         minlength: 4
       },
       pwd_a: {
         required: true,
         minlength: 5,
         equalTo: "#password"
       },
       name: {
         required: true,
         minlength: 5
       },
       nickname: {
            required: true,
            minlength: 5
          }
     },
     //For custom messages
     messages: {
       username:{
         required: "Enter a username",
         minlength: "Enter at least 4 characters"
       }
     },
     errorElement : 'div',
     errorPlacement: function(error, element) {
       var placement = $(element).data('error');
       if (placement) {
         $(placement).append(error)
       } else {
         error.insertAfter(element);
       }
     }
   });
</script>
<style>
   body{
    display: table-cell;
    vertical-align: middle;
    background-color: white !important;
}

html {
    display: table;
    margin: auto;
}

html, body {
    height: 100%;
}

.medium-small {
    font-size: 0.9rem;
    margin: 0;
    padding: 0;
}

.login-form {
    width: 700px;
}

.login-form-text {
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 0.8rem;
}

.login-text {
    margin-top: -6px;
    margin-left: -6px !important;
}

.margin {
    margin: 0 !important;
}

.pointer-events {
    pointer-events: auto !important;
}

.input-field >.material-icons  {
    padding-top:10px;
}

.input-field div.error{
    position: relative;
    top: -1rem;
    left: 3rem;
    font-size: 0.8rem;
    color:#FF4081;
    -webkit-transform: translateY(0%);
    -ms-transform: translateY(0%);
    -o-transform: translateY(0%);
    transform: translateY(0%);
}
*{
   font-family: 메이플스토리;
}
   
</style>
</head>
<body>
<div id="login-page" class="row">
  <div class="col s12 z-depth-4 card-panel">
    <form class="login-form">
      <div class="row">
        <div class="input-field col s12 center">
          <h4>회원가입</h4>
          <p class="center">지금 우리 커뮤니티에 가입하세요 !</p>
        </div>
      </div>
   <!-- 아이디 -->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
          <i class="material-icons prefix">account_circle</i>
          <input id="username" name="username" type="text"/>
          <label for="username">아이디</label>
        </div>
      </div>
      <!-- 비밀번호 -->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">vpn_key</i>
          <input id="pwd" name="pwd" type="password" />
          <label for=pwd>비밀번호</label>
        </div>
      </div>
      <!-- 비밀번호 재확인-->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">vpn_key</i>
          <input id="pwd_a" name="cpassword" type="password" />
          <label for="pwd_a">비밀번호 재확인</label>
        </div>
      </div>
      <!-- 이름 -->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">sentiment_satisfied_alt</i>
          <input id="name" name="name" type="text" />
          <label for="name">이름</label>
        </div>
      </div>
      <!-- 별명 -->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">face</i>
          <input id="nickname" name="nickname" type="text" />
          <label for="nickname">별명</label>
        </div>
      </div>
      
      <!-- 성별 -->
      <div class="row margin">
        <div class="input-field col s12" style="margin-bottom: 37px;">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">face</i>
          <div style="float: left;margin-left: 33px;margin-right: 10px;">
             <input id="m_gender" name="m_gender" type="radio"/>
             <label for="m_gender">남</label>
          </div>
          <div style="margin-left: 33px;">
             <input id="f_gender" name="f_gender" type="radio"/>
             <label for="f_gender">여</label>
          </div>
        </div>
      </div>
      <!-- 생일 -->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">face</i>
          <input id="birth" name="birth" type="text" />
          <label for="birth">생년월일</label>
        </div>
      </div>
      <!-- 지역 -->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">face</i>
          <input id="loc" name="loc" type="text" />
          <label for="loc">지역</label>
        </div>
      </div>
      <!-- 관심동물 -->
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">face</i>
          <div style="margin-left: 35px;">
             <input id="interani" name="interani" type="checkbox"/>
             <label for="interani">강아지</label>
          </div>
          <div style="margin-left: 35px;">
             <input id="interani" name="interani" type="checkbox"/>
             <label for="interani">고양이</label>
          </div>
          <div style="margin-left: 35px;">
             <input id="interani" name="interani" type="checkbox"/>
             <label for="interani">파충류 & 양서류</label>
          </div>
          <div style="margin-left: 35px;">
             <input id="interani" name="interani" type="checkbox"/>
             <label for="interani">조류</label>
          </div>
          <div style="margin-left: 35px;">
             <input id="interani" name="interani" type="checkbox"/>
             <label for="interani">기타 포유류</label>
          </div>
        </div>
      </div>
   
      <div class="row">
        <div class="input-field col s12">
          <button type="submit" class="btn waves-effect waves-light col s12">REGISTER NOW</button>
          
        </div>
        <div class="input-field col s12">
          <p class="margin center medium-small sign-up">Already have an account? <a href="./login">Login</a></p>
        </div>
      </div>


    </form>
  </div>
</div>
</body>
