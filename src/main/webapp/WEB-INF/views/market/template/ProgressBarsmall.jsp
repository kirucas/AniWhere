<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">

<head>
    <title>프로그레스바 </title>
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
    <style>
       

        .progress-bar {
            background-color: White;
            height: 15px;
            padding: 5px;
            width: 250px;
            margin: 10px 0 10px 0;			
            -moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			border-radius: 5px;
            -moz-box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;
			-webkit-box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;
			box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;           
        }
        
        .progress-bar span {
            display: inline-block;
            height: 100%;
			background-color: red;
            -moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			border-radius: 3px;
            -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
			-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
			box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
			-webkit-transition: width .4s ease-in-out;
			-moz-transition: width .4s ease-in-out;
			-ms-transition: width .4s ease-in-out;
			-o-transition: width .4s ease-in-out;
			transition: width .4s ease-in-out;		
        }
		
		/*---------------------------*/			
		
        .blue span {
            background-color:red;   
        }

        

      	
		
		/*---------------------------*/		
		
		.stripes span {
            -webkit-background-size: 30px 30px;
            -moz-background-size: 30px 30px;
            background-size: 30px 30px;			
			background-image: -webkit-gradient(linear, left top, right bottom,
								color-stop(.25, rgba(255, 255, 255, .15)), color-stop(.25, transparent),
								color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .15)),
								color-stop(.75, rgba(255, 255, 255, .15)), color-stop(.75, transparent),
								to(transparent));
            background-image: -webkit-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: -moz-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: -ms-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: -o-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);
            background-image: linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
                                transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
                                transparent 75%, transparent);            
            
            -webkit-animation: animate-stripes 3s linear infinite;
            -moz-animation: animate-stripes 3s linear infinite;       		
		}
        
        @-webkit-keyframes animate-stripes { 
			0% {background-position: 0 0;} 100% {background-position: 60px 0;}
        }
        
        
        @-moz-keyframes animate-stripes {
			0% {background-position: 0 0;} 100% {background-position: 60px 0;}
        }
		
		/*---------------------------*/	 

		.shine span {
			position: relative;
		}
		
		.shine span::after {
			content: '';
			opacity: 0;
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			background: #fff;
            -moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			border-radius: 3px;			
			
            -webkit-animation: animate-shine 2s ease-out infinite;
            -moz-animation: animate-shine 2s ease-out infinite; 			
		}

        @-webkit-keyframes animate-shine { 
			0% {opacity: 0; width: 0;}
			50% {opacity: .5;}
			100% {opacity: 0; width: 95%;}
        }
        
        
        @-moz-keyframes animate-shine {
			0% {opacity: 0; width: 0;}
			50% {opacity: .5;}
			100% {opacity: 0; width: 95%;}
        }

		/*---------------------------*/	 
		
		.glow span {
            -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
			-webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
			box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
			
            -webkit-animation: animate-glow 1s ease-out infinite;
            -moz-animation: animate-glow 1s ease-out infinite; 			
		}

		@-webkit-keyframes animate-glow {
		 0% { -webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;} 
		 50% { -webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .3) inset, 0 -5px 5px rgba(255, 255, 255, .3) inset;} 
		 100% { -webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;}
		 }

		@-moz-keyframes animate-glow {
		 0% { -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;} 
		 50% { -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .3) inset, 0 -5px 5px rgba(255, 255, 255, .3) inset;} 
		 100% { -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;}
		 }
		 
		 
    </style>
</head>

<body>
<div >
<p>%%개 달성시 공동구매 가격이 더 저렴해져요   </p>
    <p style="text-align:center;">현재 80% 달성중 입니다</p>
    <div class="col-md-4 col-sm-6 ">

<div class="progress-bar blue stripes">
    <span style="width: 80%"></span>
</div>

</div>
</div>






</body>
</html>