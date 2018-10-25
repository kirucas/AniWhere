<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>
    <head>
     <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
<style>
html { background: url("<c:url value='/resources/images/signup1.jpg'/>") no-repeat center center fixed; 
-webkit-background-size: cover;
 -moz-background-size: cover;
  -o-background-size: cover;
   background-size: cover; }
.input-field>label{
	color:white;
}
.btn:hover, .btn-large:hover, .btn-small:hover {
    background-color: white;
    color:black;
}
*{
   font-family: 메이플스토리;
   color:white;
}
.btn{
   background-color: #ccd5f0;
   font-family: 메이플스토리;
   color:black;
}
[type="checkbox"]:checked+span:not(.lever):before {
	border-right: 2px solid #ebc594;
    border-bottom: 2px solid #ebc594;
}
[type="radio"]:checked+span:after, [type="radio"].with-gap:checked+span:before, [type="radio"].with-gap:checked+span:after {
    border: 2px solid #ebc594;
}
[type="radio"]:checked+span:after, [type="radio"].with-gap:checked+span:after {
    background-color: #ebc594;
}
[type="radio"]:checked+span:after, [type="radio"].with-gap:checked+span:before, [type="radio"].with-gap:checked+span:after {
    border: 2px solid #ebc594;
}
input.valid:not([type]), input.valid:not([type]):focus, input.valid[type=text]:not(.browser-default), input.valid[type=text]:not(.browser-default):focus, input.valid[type=password]:not(.browser-default), input.valid[type=password]:not(.browser-default):focus, input.valid[type=email]:not(.browser-default), input.valid[type=email]:not(.browser-default):focus, input.valid[type=url]:not(.browser-default), input.valid[type=url]:not(.browser-default):focus, input.valid[type=time]:not(.browser-default), input.valid[type=time]:not(.browser-default):focus, input.valid[type=date]:not(.browser-default), input.valid[type=date]:not(.browser-default):focus, input.valid[type=datetime]:not(.browser-default), input.valid[type=datetime]:not(.browser-default):focus, input.valid[type=datetime-local]:not(.browser-default), input.valid[type=datetime-local]:not(.browser-default):focus, input.valid[type=tel]:not(.browser-default), input.valid[type=tel]:not(.browser-default):focus, input.valid[type=number]:not(.browser-default), input.valid[type=number]:not(.browser-default):focus, input.valid[type=search]:not(.browser-default), input.valid[type=search]:not(.browser-default):focus, textarea.materialize-textarea.valid, textarea.materialize-textarea.valid:focus, .select-wrapper.valid>input.select-dropdown {
    border-bottom: 1px solid #ebc594;
    -webkit-box-shadow: 0 1px 0 0 #ebc594;
    box-shadow: 0 1px 0 0 #ebc594;
}
input[type=text]:not(.browser-default):focus:not([readonly]){
	border-bottom: 1px solid #ebc594;
    -webkit-box-shadow: 0 1px 0 0 #ebc594;
    box-shadow: 0 1px 0 0 #ebc594;
}
input[type=password]:not(.browser-default):focus:not([readonly]){
	border-bottom: 1px solid #ebc594;
    -webkit-box-shadow: 0 1px 0 0 #ebc594;
    box-shadow: 0 1px 0 0 #ebc594;
}
input[type=date]:not(.browser-default):focus:not([readonly]){
	border-bottom: 1px solid #ebc594;
    -webkit-box-shadow: 0 1px 0 0 #ebc594;
    box-shadow: 0 1px 0 0 #ebc594;
}
</style>

<script>
$(document).ready(function() {
      $('#birthdate').click(function(){
        $('.datepicker').pickadate({
            selectMonths: true,
            selectYears: 150, 
            format: 'yyyy-mm-dd',
            min: new Date(1900,1,1),
            max: true
        });
    });

        initBindings();
    });

    function initBindings(){
        $('#birthdate-icon').click(function(){
            $('#birthdate').click();
        });
    };

</script>
    <body>
		<div class="container" id="signup">
	      	<div class="row">
		        <div class="input-field col s12 center">
		          <h4>회원가입</h4>
		          <p class="center">지금 우리 커뮤니티에 가입하세요 !</p>
		        </div>
		    	<form action="<c:url value='/signUpProcess.aw'/>" class="col s12">
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="id" name="mem_id" type="text" class="validate">
			          <label for="id">아이디</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="password" name="mem_pw" type="password" class="validate">
			          <label for="password">비밀번호</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="passwordc" type="password" class="validate">
			          <label for="passwordc">비밀번호 확인</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="name" name="mem_name" type="text" class="validate">
			          <label for="name">이름</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="nick" name="mem_nickname" type="text" class="validate">
			          <label for="nick">별명</label>
			        </div>
			      </div>
			      <div class="row">
			      	<div class="col s4 offset-s4">
			      		<span>성별</span>
			      	</div>
			        <div class="input-field inline col s2 offset-s4">
     			      <label>
        				<input name="mem_gender" type="radio" value="M" />
        				<span>남자</span>
     				  </label>
			        </div>
			        <div class="input-field inline col s2">
			        <label>
				        <input name="mem_gender" type="radio" value="F" />
				        <span>여자</span>
				      </label>
				    </div>  
			      </div>
			      <div class="row">
			      	<div class="col s4 offset-s4">
		      			<span>생년월일</span>
	      			</div>
			      	<div class="input-field col s4 offset-s4">
			      		<input id="birthdate" type="date" class="datepicker" name="mem_birth">
			      	</div>
				  </div>
				  		<input type="hidden" name="mem_log" value="0">
				  <div class="row">
			      	<div class="input-field col s4 offset-s4">
			      		<span>관심동물</span>
			      		<p>
			      		<label>
        				<input type="checkbox" name="mem_interani" value="1"/>
        				<span>강아지</span>
      					</label>
      					</p>
					    <p>
					    <label>
					        <input type="checkbox" name="mem_interani" value="2"/>
					        <span>고양이</span>
					    </label>
						</p>
						<p>
					    <label>
					        <input type="checkbox" name="mem_interani" value="3" />
					        <span>파충류 및 양서류</span>
					    </label>
						</p>
						<p>
					    <label>
					        <input type="checkbox" name="mem_interani" value="4" />
					        <span>조류</span>
					    </label>
						</p>
						<p>
					    <label>
					        <input type="checkbox" name="mem_interani" value="5" />
					        <span>기타 포유류</span>
					    </label>
						</p>
			      	</div>
				  </div>
				  <div class="row">
				  	<div class="input-field inline col s2 offset-s4">
         			 <button type="submit" class="btn waves-effect waves-light col s12">회 원 가 입</button>
				  	</div>
			  	    <div class="input-field col s12">
         			 	<p class="margin center medium-small sign-up">이미 계정이 있으세요? <a href="<c:url value='/login.aw' />">Login</a></p>
        			</div>
				  </div>
				  	
			    </form>
		  	</div>
	    </div>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>