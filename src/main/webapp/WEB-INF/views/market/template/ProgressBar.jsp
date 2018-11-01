<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <title>프로그레스바 </title>
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<SCRIPT> 
//시간 구하기 표시하기 로직
function getTime() { 
now = new Date(); 
dday = new Date(2018,10,3,18,00,00); 

//원하는 날짜, 시간 정확하게 초단위까지 기입.
days = (dday - now) / 1000 / 60 / 60 / 24; 
daysRound = Math.floor(days); 
hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound); 
hoursRound = Math.floor(hours); 
minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound); 
minutesRound = Math.floor(minutes); 
seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
secondsRound = Math.round(seconds);

document.getElementById("counter0").innerHTML = daysRound; 
document.getElementById("counter1").innerHTML = hoursRound; 
document.getElementById("counter2").innerHTML = minutesRound; 
document.getElementById("counter3").innerHTML = secondsRound; 
newtime = window.setTimeout("getTime();", 1000); 
} 

</SCRIPT>
<style type="text/css">

#bt {
	height: 100px;
	width: 400;
	padding-left: 100px;
	padding-top: 0px;
}
</STYLE>

<script> 

function printClock() {
    
	var now='현재시각 '
	var end='입니다'
	
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 0){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
   // clock.innerHTML =now+currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"+end; //날짜를 출력해 줌
   
    setTimeout("printClock()",1000);
    
    // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}




</script>

    <style>
       

        .progress-bar {
            background-color: White;
            height: 25px;
            padding: 5px;
            <%-- width: 1040px; --%>
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
			background-color: #777;
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
            background-color: #34c2e3;   
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

<body onload="printClock()">

<div style="border:1px solid silver;">

<div onload="printClock()" class="col-ms-12" style="line-height:50px; color:#666;font-size:30px; text-align:center;" id="clock">

	
	</div>
	<DIV  class="col-ms-12" style="line-height:60px; color:#666;font-size:50px; text-align:center;border:1px solid yellow;	">
	<FONT >거래시간</FONT>
	<!-- <c:if>를 사용하여   거래가능시간 종료시 거래 끝을 알리는 로직 추가하기 -->
	
	<SPAN  id=counter0></SPAN><FONT style="FONT-FAMILY: '굴림'; ">일</FONT>
	<SPAN  id=counter1></SPAN><FONT >시간</FONT> <SPAN  id=counter2></SPAN><FONT >분</FONT> <SPAN  id=counter3></SPAN><FONT >초 남았습니다</FONT>
    <SPAN style="text-align:center"></SPAN></div>
    
    <SCRIPT>getTime()</SCRIPT>
	
	




<p style="text-align:center;">%%개 달성시 %% 해택을 드립니다   </p>
    <p style="text-align:center;">현재 몇% 달성중 입니다</p>
   

<div class="progress-bar blue stripes col-ms-12">
    <span style="width: 80%"></span> <!-- 안쪽에 % 숫자 로직으로 조절 -->
</div>


</div>


</body>
