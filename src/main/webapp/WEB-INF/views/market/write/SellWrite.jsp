<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>쓰기게시판 내부</title>



<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

</head>

<body>


	<div class="container">

		<div style="margin-top: 10px"></div>
		<br />

		<div class="col-md-12">
	
			<label for="" class="">제목</label> <input class="form-control"
				type="text" id="title"/>


			<p style="margin-top: 30px">
	
									<label for="" class="">크기분류</label>
									<select id="size_listSelect" class="select_filter" onclick="">
										<option value="">-----</option>
										<option value="small">소형</option>
										<option value="middle">중형</option>
										<option value="large">대형</option>
									
									</select>
								
								   
									<label for="" class="">용도분류</label>
									<select id="use_listSelect" class="select_filter" onclick="">
									    <option value="">-----</option>
										<option value="food">사료및간식</option>
										<option value="playtoy">장난감</option>
										<option value="home">보금자리</option>
										<option value="buty">미용용품</option>
										<option value="madicen">의약품</option>
									    <option value="other">기타</option>
									</select>
							
								 
									<label for="" class="">동물분류</label>
									<select id="animal_listSelect" class="select_filter" onclick="">
									    <option value="">-----</option>
										<option value="dog">개</option>
										<option value="cat">고양이</option>
										<option value="bird">조류</option>
										<option value="Reptilia">파충류</option>
										<option value="amphibia">양서류</option>
										<option value="fish">어류</option>
										<option value="insect">곤충류</option>
									    <option value="otheranimal">기타</option>
									</select>
								</p>
				<div>
			<div class="row" style="text-align: center;border: 1px silver solid; margin-left: 20px">
				<div class="my-3">
					<span style="margin-right: 20px">희망가</span><input placeholder="       원" style="text-align: right"
						class="form-control" type="text" id="wishprice" />
				</div>
				
				<div class="my-3">
					<span>거래기간</span> <input type = "date" min = "2018-10-19" max = "2020-01-01" name = "date" class="form-control" type="text"
						id="wishtime" />
						  
						
				</div>
			
			<!--  도로명 주소 인증키:	U01TX0FVVEgyMDE4MTAxNTIxMzIwODEwODIzNjM= -->
							
				<div class="my-3">
					<span>거래방법</span> <input class="form-control" type="text" placeholder="예)직거래,택배등" style="text-align: right"
						id="wishcount" />
				</div>
				<div class="my-3">
					<span>연락처</span> <input class="form-control" type="text" placeholder="집전화,휴대폰번호" style="text-align: right"
						id="wishcount" />
				</div>
				
			</div>
				<span>우편번호</span>
				<jsp:include page="../template/adress.jsp" />
			<!-- Related Projects Row -->
			<h3 class="my-4">판매자가 올린 사진 3개이상</h3>
			
             <input multiple="multiple" type="file" name="sellfile" style="color:slategray;border:1 solid silver;width:300; height:20"> (최대 5M)</td>
                                     
			<div class="row">
			

				<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

					<img id="product1" onclick="javascript:changeimage1()"
						class="img-fluid shadow scale"
						src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
						alt="" style="width: 300px; height: 200px;">

				</div>

				<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

					<img id="product2" onclick="javascript:changeimage2()"
						class="img-fluid shadow scale"
						src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
						alt="" style="width: 300px; height: 200px;">

				</div>

				<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

					<img id="product3" onclick="javascript:changeimage3()"
						class="img-fluid shadow scale"
						src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
						alt="" style="width: 300px; height: 200px;">

				</div>

				<div class="col-md-3 col-sm-6 mb-4 view overlay zoom">

					<img id="product4" onclick="javascript:changeimage4()"
						class="img-fluid shadow scale"
						src="<c:url value='/resources/images/maketimages/requestphoto.jpg'/>"
						alt="" style="width: 300px; height: 200px;">

				</div>

			</div>
			<!-- /.row -->

			 <div class="col-md-12 container">
     <textarea id="summernote" class="col-md-12 container" rows="" cols="" style=" border: 1px solid blue;height: 500px" maxlength="2048"></textarea>
       
        </div>
			<div style="text-align: center">
				<input class="btn btn-info" type="button" id="exitBtn" value="취소">
				<input class="btn btn-danger" type="submit" id="enterBtn" value="확인">

			</div>
		</div>
		 <div style="margin-bottom: 50px" ></div>

	</div>
</div>

	<script>

$(document).ready(function() {
     $('#summernote').summernote({
             height: 500,                 // set editor height
             minHeight: 500,             // set minimum height of editor
             maxHeight: 500,             // set maximum height of editor         
             focus: true,// set focus to editable area after initializing summernote
             lang: 'ko-KR'
     });
});

</script>

</body>

