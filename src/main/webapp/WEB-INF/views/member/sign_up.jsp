<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>
    <head>
    <!-- jQuery UI -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
    
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
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<style>
html { background: url("<c:url value='/resources/images/signup1.jpg'/>") no-repeat center center fixed; 
-webkit-background-size: cover;
 -moz-background-size: cover;
  -o-background-size: cover;
   background-size: cover; }
.input-field>label{
	color:white;
}
intput[type=submit]:hover{
    background-color: white;
    color:black;
    font-family: 메이플스토리;
}
*{
   color:white;
   font-family: 메이플스토리;
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
input[type=text]:not(.browser-default):focus.valid ~ label{
	color:white;
}
input[type=password]:not(.browser-default):focus:not([readonly])+label{
	color:white;
}
.error{
	color:#ff7070;
}
</style>
<script>

$(function(){
	$( "#frm" ).validate({
		  rules: {
		    mem_id: {
		    	required: true,
		    	minlength: 4,
		    	maxlength: 30
		    },
		    mem_name:{
		    	required: true,
		    	maxlength: 20
		    },
		    mem_nickname:{
		    	required: true,
		    	maxlength:40
		    },
		    mem_pw: {
		      required: true,
		      minlength: 8,
		      maxlength: 80
		    },
		    mem_pwc: {
		      required: true,
		      minlength: 8,
		      maxlength: 80,
		      equalTo: "#password"
		    },
		    mem_interani: {
		      required: true,
		    },
		    mem_gender: {
		      required: true,
		    }
		  },messages: {
			  mem_id: {
			    	required: "아이디를 입력해주세요.",
			    	minlength: "최소 4글자 이상 적어주세요.",
			    	maxlength: "최대 30글자까지 가능합니다."
			    },
			    mem_name:{
			    	required: "이름을 입력해주세요.",
			    	maxlength: "최대 20글자까지 가능합니다."
			    },
			    mem_nickname:{
			    	required:"닉네임을 입력해주세요.",
			    	maxlength: "최대 40글자까지 가능합니다."
			    },
			    mem_pw: {
			      required: "비밀번호를 입력해주세요.",
			      minlength: "최소 8글자 이상 적어주세요.",
			      maxlength: "최대 80글자까지 가능합니다."
			    },
			    mem_pwc: {
			      required: "비밀번호확인을 입력해주세요.",
			      minlength: "최소 8글자 이상 적어주세요.",
			      maxlength: "최대 80글자까지 가능합니다.",
			      equalTo: "비밀번호와 일치하지 않습니다."
			    },
			    mem_interani: {
			      required: "관심동물을 선택해주세요.",
			    },
			    mem_gender: {
			      required: "성별을 선택해주세요.",
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
});
	



</script>
    <body>
		<div class="container" id="signup">
	      	<div class="row">
		        <div class="input-field col s12 center">
		          <h4>회원가입</h4>
		          <p id="rightnow" class="center">지금 우리 커뮤니티에 가입하세요 !</p>
		        </div>
		    	<form id="frm" class="formValidate" action="<c:url value='/signUpProcess.aw'/>" class="col s12">
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <label for="mem_id">아이디(*)</label>
			          <input id="mem_id" name="mem_id" type="text" data-error=".errorTxt1">
			          <div class="errorTxt1"></div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <label for="password">비밀번호(*)</label>
			          <input id="password" name="mem_pw" type="password" data-error=".errorTxt2">
			          <div class="errorTxt2"></div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <label for="passwordc">비밀번호 확인(*)</label>
			          <input id="passwordc" name="mem_pwc" type="password" data-error=".errorTxt3">
			          <div class="errorTxt3"></div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <label for="mem_name">이름(*)</label>
			          <input id="mem_name" name="mem_name" type="text" data-error=".errorTxt4">
			          <div class="errorTxt4"></div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <label for="mem_nickname">별명(*)</label>
			          <input id="mem_nickname" name="mem_nickname" type="text" data-error=".errorTxt5">
			          <div class="errorTxt5"></div>
			        </div>
			      </div>
			      <div class="row">
			      	<div class="col s4 offset-s4">
			      		<span>성별(*)</span>
			      	</div>
			        <div class="input-field inline col s2 offset-s4">
     			      <label>
        				<input name="mem_gender" type="radio" value="M" data-error=".errorTxt6" />
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
			      	<div class="input-field col s4 offset-s4">
                         <div class="errorTxt6"></div>
                     </div>
                  </div>
				  		<input type="hidden" name="mem_log" value="0">
				  <div class="row">
			      	<div class="input-field col s4 offset-s4">
			      		<span>관심동물(*)</span>
			      		<p>
			      		<label>
        				<input type="checkbox" name="mem_interani" value="1" data-error=".errorTxt7"/>
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
						<div class="input-field">
		                    <div class="errorTxt7"></div>
		                </div>
			      	</div>
				  </div>
				  <div class="row">
				  	<div class="input-field inline col s2 offset-s4">
         			 <input type="submit" class="btn waves-effect waves-light col s12" value="회원가입"/>
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