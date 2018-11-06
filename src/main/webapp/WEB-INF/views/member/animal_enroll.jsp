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
*{
   font-family: 메이플스토리;
   color:white;
}

.waves-button-input{
	width: 120px;
	height: 36px;
}
[value="애완동물 등록"]{
	font-family: 메이플스토리;
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
.error{
	color:#ff7070;
}
#ani_photo-error{
	margin-top:5px;
}
</style>
<script>
$(function(){
	$( "#frm" ).validate({
		  rules: {
		   	ani_name:{
		    	required: true,
		    	maxlength: 20
		    },
		    ani_age:{
		    	required: true,
		    	maxlength:3
		    },
		    ani_species: {
		      required: true
		    },
		    ani_gender: {
		      required: true
		    },
		    ani_kind: {
		      required: true,
		      maxlength:10
		    },
		    ani_photo:{
		    	required: true
		    }
		  },messages: {
			    ani_name: {
			    	required: "애완동물의 이름을 입력해주세요.",
			    	maxlength: "최대 20글자까지 가능합니다."
			    },
			    ani_age:{
			    	required:"나이 입력해주세요.",
			    	maxlength: "최대 3글자까지 가능합니다."
			    },
			    ani_species: {
			      required: "대분류를 선택해주세요.",
			    },
			    ani_gender: {
			      required: "성별을 선택해주세요.",
			    },
			    ani_kind:{
			    	required:"중분류를 선택해 주세요",
			    	maxlength:"최대 10글자까지 가능합니다"
			    },
			    ani_photo:{
			    	required:"사진을 첨부해주세요"
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
		          <h4>애완동물 등록</h4>
		          <p class="center">지금 당장 애완동물을 등록하세요!</p>
		        </div>
		    	<form id="frm" action="<c:url value='/enrollProcess.aw'/>" class="col s12" method="post" enctype="multipart/form-data">
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="ani_name" name="ani_name" type="text" class="validate" data-error=".errorTxt1">
			          <label for="ani_name">애완동물 이름(*)</label>
			          <div class="errorTxt1"></div>
			        </div>
			      </div>
			      <div class="row">
			      	<div class="input-field col s4 offset-s4">
			      		 <input id="ani_age" name="ani_age" type="text" class="validate" data-error=".errorTxt2">
			          <label for="ani_age">애완동물 나이(*)</label>
			          <div class="errorTxt2"></div>
			      	</div>
				  </div>
			      <div class="row">
			      	<div class="col s4 offset-s4">
			      		<span>애완동물 성별(*)</span>
			      		<div class="errorTxt3"></div>
			      	</div>
			        <div class="input-field inline col s2 offset-s4">
	     			    <label>
	        				<input name="ani_gender" type="radio" value="M"  data-error=".errorTxt3"/>
	        				<span>수</span>
	     				</label>
			        </div>
			        <div class="input-field inline col s2">
				        <label>
					        <input name="ani_gender" type="radio" value="F" />
					        <span>암</span>
					    </label>
				    </div>  
			      </div>
				  <div class="row">
			      	<div class="input-field col s4 offset-s4">
			      		<span>애완동물 대분류(*)</span>
			      		<div class="errorTxt4"></div>
			      		<p>
			      		<label>
	        				<input type="radio" name="ani_species" value="1" data-error=".errorTxt4"/>
	        				<span>강아지</span>
      					</label>
      					</p>
					    <p>
					    <label>
					        <input type="radio" name="ani_species" value="2"/>
					        <span>고양이</span>
					    </label>
						</p>
						<p>
					    <label>
					        <input type="radio" name="ani_species" value="3" />
					        <span>파충류 및 양서류</span>
					    </label>
						</p>
						<p>
					    <label>
					        <input type="radio" name="ani_species" value="4" />
					        <span>조류</span>
					    </label>
						</p>
						<p>
					    <label>
					        <input type="radio" name="ani_species" value="5" />
					        <span>기타 포유류</span>
					    </label>
						</p>
			      	</div>
				  </div>
				  <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="ani_kind" name="ani_kind" type="text" class="validate" data-error=".errorTxt5">
			          <label for="ani_kind">애완동물 중분류(*)</label>
			          <div class="errorTxt5"></div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s4 offset-s4">
			          <input id="ani_photo" name="ani_photo" type="file" class="validate" data-error=".errorTxt6">
			          <div class="errorTxt6"></div>
			        </div>
			      </div>
				  <div class="row">
				  	<div class="input-field inline col s2 offset-s4">
         			  <input type="submit" class="btn waves-effect waves-light col s12" value="애완동물 등록"/>
				  	</div>
				  </div>
		    	</form>
		  	</div>
	    </div>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>