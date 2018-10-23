<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <head>
 
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
	
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

<script>


function changeimage2() {
    var image = document.getElementById('product');
    var changeimage2=document.getElementById('product2');
    
    if (changeimage2.id.match("product2")) {
        image.src = "<c:url value='/resources/images/maketimages/product2.jpg'/>";
    } 

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
</script>

    
  </head>
  <body>
  
    <!-- Page Content -->
    <div class="container">

      <!-- Portfolio Item Heading -->
      <div >
      <h1 class="my-4">[관련태그]
        <small>DB연동 게시글의 제목</small>
      </h1>
</div>
      <!-- Portfolio Item Row -->
      <div class="row">
   

        <div class="col-md-8">
         <!--  <img class="img-fluid" src="http://placehold.it/750x500" alt="" > -->
           <img id="product" class="card-img-right flex-auto d-none d-lg-block" alt="판매상품" src="<c:url value='/resources/images/maketimages/product1.jpg'/>" style="width: 700px; height: 500px;">
        
        </div>

        <div class="col-md-4" style="border:1px solid silver">
          <h3 class="my-3">판매자 아이디</h3>
          <p>판매자 내부글 1번쨰줄 의 내용</p>
          <h3 class="my-3">상품종류[개][대형][사료]</h3>
          <ul>
            <li>거래 횟수</li>
            <li>만족 불만족 표시</li>
            <li>회원의 등급</li>
            <li>연락처 정보공개시에만 공개</li>
          </ul>
        </div>

      </div>
      <!-- /.row -->
      <div style="margin-top:10px">
   </div><br/>
      
 
  
	

      <!-- Related Projects Row -->
      <h3 class="my-4">판매자가 올린 사진 3개이상</h3> 

      <div class="row">

        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom" >
        
            <img id="product1"  onclick="javascript:changeimage1()"  class="img-fluid shadow scale" src="<c:url value='/resources/images/maketimages/product1.jpg'/>" alt="" style="width: 300px; height: 200px;">
         
        </div>

        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom">
         
            <img id="product2" onclick="javascript:changeimage2()"  class="img-fluid shadow scale" src="<c:url value='/resources/images/maketimages/product2.jpg'/>" alt="" style="width: 300px; height: 200px;">
       
        </div>

        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom">
        
            <img id="product3" onclick="javascript:changeimage3()"  class="img-fluid shadow scale" src="<c:url value='/resources/images/maketimages/product3.jpg'/>" alt="" style="width: 300px; height: 200px;">
        
        </div>

        <div class="col-md-3 col-sm-6 mb-4 view overlay zoom">
      
            <img id="product4" onclick="javascript:changeimage4()"  class="img-fluid shadow scale" src="<c:url value='/resources/images/maketimages/product4.png'/>" alt="" style="width: 300px; height: 200px;">

        </div>

      </div>
      <!-- /.row -->	

     <div class="col-md-12 container">
     <div class="col-md-12 col-ms-4 container">
     <table class="table table-hover table-striped table-bordered" style="max-width: 100%;"><tr>
    	<th colspan="2" class="text-center" style="max-width: 100%;">내용</th>
				</tr>
				<tr style="max-width: 100%;">
					<td colspan="2">${record.content}<br/>
					==================================================<br/>
					
					
					</td>
				</tr>
       </table>
        </div>
        </div>
            <div style="text-align:center">
      <a href="<c:url value='/market/sell.aw'/>">   <input name="reset" class="btn btn-info" type="button" id="list" value="목록" ></a>
	        <input name="submit" class="btn btn-danger" type="button" id="fix" value="수정">
	         <input name="reset" class="btn btn-suceess" style="background-color: #4CAF50;" type="button" id="repl" value="답글" >
	        <input name="submit" class="btn " type="button" id="del" value="삭제">
	        </div>
         <div style="margin-bottom: 50px" ></div>
    </div>

    
  </body>
