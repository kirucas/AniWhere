<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var isDelete = function() {
		if (confirm("글을 삭제 하시겠습니까?"))
			location.replace("<c:url value='/market/groupbuy/delete.aw?groupbuy_no=${record.no}'/>");
	};
</script>
<!-- 구매량 +  - 하는 로직 -->
<script type="text/javascript"> 
function test() { 
var td = document.getElementById("test"); 
var n = Number(td.innerHTML); 
td.innerHTML = n + 1; 

} 


function test2() { 
	var td = document.getElementById("test"); 
	var n = Number(td.innerHTML); 
	td.innerHTML = n - 1; 
	if(n<=2){
		td.innerHTML=1}
	}
	

/* <!-- 구매시 허가구하는 로직 --> */

function buyaccept(){	
	if (confirm("구입하시겠습니까?")){
		
    alert("구입해주셔서 감사합니다");
    /* <!--구입했을떄 id = buy_number 에서  ${record.buy_count}에  주어진 숫자를 추가해주는 로직 만들기 --> */
    
    bn = document.getElementById("buy_number"); 
    
    
    action="redirect:/market/groupbuy.aw";
        
   
    
	}
	else 
		return false;
}
</script> 


<script>
   //해당 글번호에 대한 코멘트 목록을 뿌려주는 함수
   var showComments = function(key){
      $.ajax({
          url:"<c:url value='/market/groupbuy/cmt_list.awa'/>",
         data:{no:key},
         dataType:'json',
         type:'post',
         success:displayComments
      });
   };
   
 //해당 글번호에 대한 코멘트 목록을 뿌려주는 함수 
	var displayComments	= function(data){
		var commentString='<h2 data-v-f39b78c2="" class="comment__title" style="margin-top: 20px;margin-bottom: 15px;">댓글 목록</h2>';
			commentString+='<div class="row border-top">';
		if(data.length==0){
			commentString+="<h3 class='text-center' style='padding-top:10px;width:100%'>등록된 댓글이 없습니다</h3>";
		}
		$.each(data,function(index,cmt){			
			commentString+='<div class="col-sm-5" style="margin-top: 10px">';
			commentString+=cmt["mem_nickname"]+'&nbsp;&nbsp; '+cmt["regidate"];
			commentString+='</div>';
			commentString+='<div class="offset-sm-5 col-sm-2" style="text-align:right;padding-top: 10px">';
			if('${sessionScope.mem_no}' == cmt["mem_no"])
				commentString+='<span title="'+cmt["cmt_no"]+'" class="commentDelete" style="cursor: pointer; color: orange; font-weight: bold">삭제</span>';
			else
				commentString+='';
			commentString+='</div>';
			commentString+='<div class="col-sm-12">';
			commentString+='<h4 class="commentEdit" style="cursor: pointer;" title="'+cmt["cmt_no"]+'">'+cmt["cmt_content"]+'</h4>';
			commentString+='</div>';
		});		
		commentString+='</div>';
      $('#comments').html(commentString);
      if(${sessionScope.mem_no==record.mem_no}){
    	  
	      //코멘트 수정/삭제 처리
	      $('.commentEdit').click(function() {
	         //console.log($(this).attr("title"));
	        
	         $("#title").val($(this).html());
	            $("#submit").val('수정');
	            $('input[name=cmt_no]').val($(this).attr("title"));
	      });
	      $('.commentDelete').click(function() {
	            var cno_value = $(this).attr("title");
	            $.ajax({
	                url:'<c:url value="/market/groupbuy/cmt_delete.awa"/>',
	                data:{cmt_no:cno_value,no:${record.no}},
	                dataType:'text',
	                type:'post',
	                success:function(key){
	                   showComments(key);                   
	                }
	             });
	      });
      }
   };
    
   
   $(function(){
      //페이지 로드시 코멘트 목록 뿌려주기
      showComments(${record.no});
      
      //코맨트 입력처리
      $('#submit').click(function(){
         if($(this).val()=='등록')
            var action = "<c:url value='/market/groupbuy/cmt_write.awa'/>";
         else
            var action = "<c:url value='/market/groupbuy/cmt_edit.awa'/>";
         
         $.ajax({
            url:action,
            data:$('#frm').serialize(),
            dataType:'text',
            type:'post',
            success:function(key){
               showComments(key);
               if($('#submit').val()=='등록'){
            	   $("#title").val('');
               }
               if($('#submit').val()=='수정'){
                  $("#submit").val('등록');
                  $("#title").val('');
               }
            }
         });
      });
   });
</script>

<script>
   $(function(){
      $('#summernote').summernote({
    	 maxHeight:null,
    	 minHeight:null,
    	 height:630,
         callbacks : {
            onImageUpload : function(files, editor, welEditable) {
               for (var i = files.length - 1; i >= 0; i--) {
                  sendFile(files[i], this);	
               }
            }
         }
      });
      function sendFile(file, el, wel) {
         var form_data = new FormData();
         form_data.append('file', file);
         $.ajax({
            data: form_data,
            type: "POST",
            url : "<c:url value='/market/groupbuy/Upload.aw'/>",
            cache: false,
            contentType: false,
            processData: false,
            success: function(url) {
                 $('#summernote').summernote('insertImage', "<c:url value='/"+url+"' />");
            },
            error : function() {
               console.log("error");
            }
         });
      }
   });

   </script>

  <head>

	<style>	

 .scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}

</style>

  <!-- 여기서부터 끝까지는 프로그래스바를 위한 로직  -->  

<SCRIPT> 

//시간 구하기 표시하기 로직
function getTime() { 
now = new Date(); 
dday = new Date(2018,10,10,18,00,00); 

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
    clock.innerHTML =now+currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"+end; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
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
<!-- 프로그래바를 위한 로직끝 -->

 
  </head>

    <!-- Page Content -->
    <div class="container">

      <!-- Portfolio Item Heading -->
      <div>
			<h1 class="my-4">
				<c:choose>
					<c:when test="${record.animal_code eq '1'}">
						<span>[개]</span>
					</c:when>
					<c:when test="${record.animal_code eq '2'}">
						<span>[고양이]</span>
					</c:when>
					<c:when test="${record.animal_code eq '3'}">
						<span>[파충류]</span>
					</c:when>
					<c:when test="${record.animal_code eq '4'}">
						<span>[조류]</span>
					</c:when>
					<c:otherwise>
						<span>[기타포유류]</span>
					</c:otherwise>
				</c:choose>
				<small>${record.title}</small>
			</h1>

		</div>
      <!-- Portfolio Item Row -->
      <div class="row">
   	<script>
   		$(function(){
   			var arr = new Array();
   			$('img[name=sellpic]').each(function(index,value){
   				arr.push($(value).prop('src'));
   			});
   			
   			$('#product').prop("src",arr[0]);
   			$.each(arr,function(index,value){
				console.log("이미지들어올떄마다 출력 됌");
				$('img[name=product]').eq(index).prop("src",value);
												
			})
			
			//이미지를 클릭하면 메인화면의 큼화면에서 볼수 있게하는 로직 
   		function changeimage2() {
    var image = document.getElementById('product');
    var changeimage2=document.getElementById('product2');
    
    
    if (changeimage2.id.match("product2")) {
        image.src = "";
    } //안먹힘 
    
}

   			
function changeimage3() {
    var image = document.getElementById('product');
    var changeimage3=document.getElementById('product3');
    
    if (changeimage3.id.match("product3")) {
        image.src = "<c:url value='/resources/images/maketimages/product3.jpg'/>";
    } 

}


function changeimage4() {
    var image = document.getElementById('product');
    var changeimage4=document.getElementById('product4');
    
    if (changeimage4.id.match("product4")) {
        image.src = "<c:url value='/resources/images/maketimages/product4.png'/>";
    } 

}

function changeimage1() {
    var image = document.getElementById('product');
    var changeimage1=document.getElementById('product1');
    
    if (changeimage1.id.match("product1")) {
        image.src = "<c:url value='/resources/images/maketimages/product1.jpg'/>";
    } 
}  		
   		});
   		
   		
   		
   		
   	</script>
		<!-- 메인 사진 -->
        <div class="col-md-8">
         <!--  <img class="img-fluid" src="http://placehold.it/750x500" alt="" > -->
           <img id="product" class="card-img-right flex-auto d-none d-lg-block" alt="판매상품" src="" style="width: 700px; height: 500px;">
        </div>
        <div class="col-md-4" style="border:1px solid silver">
        
         	<h3 class="my-3">판매자 아이디: ${record.mem_nickname}</h3>
       
          <h3 class="my-3" id="animal_code">
					관련태그:
					<c:choose>
						<c:when test="${record.animal_code eq '1'}">
							<span>[개]</span>
						</c:when>
						<c:when test="${record.animal_code eq '2'}">
							<span>[고양이]</span>
						</c:when>
						<c:when test="${record.animal_code eq '3'}">
							<span>[파충류]</span>
						</c:when>
						<c:when test="${record.animal_code eq '4'}">
							<span>[조류]</span>
						</c:when>
						<c:otherwise>
							<span>[기타포유류]</span>
						</c:otherwise>
					</c:choose>
				</h3>
				
          <div class="col-md-12" style="border: 1px solid silver;">
				<h3 class="my-4">조회수 :${record.count}</h3>
				<h3 class="my-4">등록일: ${record.regidate}</h3>
			

			</div>
			<div class="col-md-12" style="border: 1px solid silver;margin-top:40px">
				<h3 class="my-4">구매 개수 등록</h3>
				<input type="button"  class="btn btn-info"  value="+" onclick="test()">			
				<table style="width:30px;height:30px;margin-left:15px" ><tr><td id=buy_number>1</td></tr></table>
				<input type="button" class="btn btn-info"  value="-" onclick="test2()"><br/>
				<input   class="btn btn-danger" type="button" value="구매"  style="magin-bottom:10px;margin-top:20px;margin-left:200px;" onclick="buyaccept();">
		    
			</div>          
        </div>
      </div>
   <!-- Related Projects Row -->
      <h3 class="my-4">판매자가 올린 사진 3개이상</h3>
      <div class="row">		
        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom" >        
            <img name="product" id="product1" onclick="javascript:changeimage1()"  class="img-fluid shadow scale" src="#" alt="" style="width: 300px; height: 200px;">        
        </div>
        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom">
         
            <img name="product" id="product2" onclick="javascript:changeimage2()"  class="img-fluid shadow scale" src="#" alt="" style="width: 300px; height: 200px;">      
        </div>

        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom">
        
            <img name="product" id="product3" onclick="javascript:changeimage3()"  class="img-fluid shadow scale" src="#" alt="" style="width: 300px; height: 200px;">
        
        </div>

        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom">
      
            <img name="product" id="product4" onclick="javascript:changeimage4()"  class="img-fluid shadow scale" src="#" alt="" style="width: 300px; height: 200px;">

        </div>

      </div>
      <!-- /.row -->	
      <div style="margin-top:10px">
   </div><br/>
   
   
   <!-- 프로그래스바 시작 -->
   <body onload="printClock()">
 <div style="border:1px solid silver;">

<div onload="printClock()" class="col-ms-12" style="line-height:50px; color:#666;font-size:30px; text-align:center;" id="clock">
	
	</div>
	<DIV  class="col-ms-12" style="line-height:60px; color:#666;font-size:50px; text-align:center;border:1px solid yellow;	">
	<FONT >거래시간</FONT>
	
	<SPAN  id=counter0></SPAN><FONT style="FONT-FAMILY: '굴림'; ">일</FONT>
	<SPAN  id=counter1></SPAN><FONT >시간</FONT> <SPAN  id=counter2></SPAN><FONT >분</FONT> <SPAN  id=counter3></SPAN><FONT >초 남았습니다</FONT>
    <SPAN style="text-align:center"></SPAN>
      
    </div>
    <SCRIPT>getTime()</SCRIPT>
	<!-- 프로그래스바 로직 만들자  -->
	
	<if:"${record.goal}-${record.buy_count} >0" >
<p style="text-align:center;"> ${record.goal}-${record.buy_count} 개 달성시 공동구매성공입니다  </p>
       </if:>    
                         
     <!-- if 구문을 넣어서 공동구매  카운트 수가 0이 돼었다면 ?
     <p style="text-align:center;"> 목표수량 달성했습니다 공동구매성공입니다  </p>  
                              -->
    <p style="text-align:center;">현재 몇 ${record.buy_count}/${record.goal} %달성중 입니다</p>
   

<div class="progress-bar blue stripes col-ms-12">
    <span style="width: 80%"></span> 
    
    <!-- 안쪽에 % 숫자 로직으로 조절 -->
</div>


</div>
</body>
<!-- 프로그래스바 끝 -->
   
  <div style="margin-top:10px">
   </div><br/>

    <div class="col-md-12 container">
     <div class="col-md-12 container">
     <table class="table table-hover table-striped table-bordered"><tr>
    	<th colspan="2" class="text-center">내용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content}<br/>
										
					</td>
				</tr>
       </table>
        </div>
       
        </div>
         <!-- 버튼시작 -->
           <div style="text-align: center">
			<a href="<c:url value='/market/sell.aw'/>"> 
			<input name="reset"  class="btn btn-info" type="button" value="목록"></a> 			
			
			<c:if test="${sessionScope.mem_no==record.mem_no }">
			<a href="<c:url value='/security/market/groupbuyedit.aw?groupbuy_no=${record.no}'/>" type="button" class="btn btn-danger">수정</a>
			</c:if>	
							
				<c:if test="${sessionScope.mem_no==record.mem_no }">
				<a href="javascript:isDelete()" type="button" class="btn">삭제</a>					
				</c:if>				
		</div>	
		<div class="container border" style="margin-top: 15px;margin-bottom: 10px">
	<div class="row">
		<div class="col-sm-12" style="margin-top: 15px">
			<h2 data-v-f39b78c2="" class="comment__title">댓글 입력</h2>
		</div>
		<form id="frm" method="post">
			<input type="hidden" name="cmt_no" />
			<input type="hidden" id="no" name="no" value="${record.no}"/>
			<div class="form-row" style="width:100%">
				<input style="margin-bottom:10px ;width:83%;margin-left: 20px;margin-top: 10px;" class="form-control" id="title" name="cmt_content"  type="text" size="180" placeholder="댓글을 입력 하세요" />
				<input style="margin-top:10px;margin-left:10px;width:7%; height: 38px" type="button" id="submit" class="btn btn-outline-primary" value="등록"/>
			</div>
		</form>
	</div>
	<div id="comments">		
	</div>
</div>        
         <div style="margin-bottom: 50px" ></div>
        
    </div>
    
   