<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>쓰기게시판 내부</title>


<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500, // set editor height
			minHeight : 500, // set minimum height of editor
			maxHeight : 500, // set maximum height of editor         
			focus : true,// set focus to editable area after initializing summernote
			lang : 'ko-KR'
		});
	});
</script>

</head>
<body>

	<form action="#" accept-charset="utf-8" name="groupbuy_info"
		method="post">
		<div class="container">

			<div style="margin-top: 10px"></div>
			<br />

			<div class="col-md-12">
				<label for="" class="">제목</label> <input class="form-control"
					type="text" id="nickname">

				<p style="margin-top: 30px;">
				<label for="" class="">동물분류</label> <input type="hidden"
						name="animal_code" value="${animal_code}" /> <select
						id="animal_listSelect" class="select_filter" onclick=""
						name="animal">
						<option value="0">-----</option>
						<option value="1">개</option>
						<option value="2">고양이</option>
						<option value="3">파충류</option>
						<option value="4">조류</option>
						<option value="5">기타 포유류</option>
					</select>

					<label for="" class="">용도분류</label> 
					<select id="use_listSelect"
						class="select_filter" onclick="">
						<option value="0">-----</option>
						<option value="food">사료및간식</option>
						<option value="playtoy">장난감</option>
						<option value="home">보금자리</option>
						<option value="buty">미용용품</option>
						<option value="medicine">의약품</option>
						<option value="other">기타</option>
					</select> 
				</p>

				<div style="border: 1px silver solid">
					<div class="row" style="text-align: center; margin-left: 20px">
						<div class="my-4">
							<span style="margin-right: 20px">희망가</span><input
								class="form-control" type="text" id="price" />
						</div>
						<div class="my-4">
							<span>거래기간</span> <input type="date" min="2018-10-19"
								max="2020-01-01" name="date" class="form-control" type="text"
								id="time" />
						</div>

						<div class="my-4">
							<span>연락처</span> <input class="form-control" type="text"
								id="phone" />
						</div>
					</div>
				</div>
		
				
				<p>
					<label for="" class="" style="margin-top: 30px">프로그래스바
						설정:목표수량</label> <input type="text" id="nickname">개 
						<label for=""class=""> 해택종류</label>
						 <select id="use_listSelect"
						class="select_filter" onclick="">
						<option value="nopoint">혜택없음</option>
						<option value="bonus">사은품추가</option>
						<option value="point">포인트 추가</option>
						<option value="other">기타</option>
					</select> <label for="" class="">해택상세설명</label> <input type="text"
						id="nickname">

					<!-- Related Projects Row -->
				<h3 class="my-4">판매자가 올린 사진 3개이상필요</h3>
				<input multiple="multiple" type="file" name="sellfile"
					style="color: slategray; border: 1 solid silver; width: 300; height: 20">
				(최대 5M)


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
					<textarea id="summernote" class="col-md-12 container" rows=""
						cols="" style="border: 1px solid blue; height: 500px"
						maxlength="2048"></textarea>
				</div>
				<div style="text-align: center">
					<a href="<c:url value='/market/groupbuy.aw'/>"><input
						class="btn btn-info" type="button" id="exitBtn" value="취소"></a>
					<input class="btn btn-danger" type="button" id="enterBtn"
						value="확인">

				</div>
			</div>
			<div style="margin-bottom: 50px"></div>

		</div>
	</form>

</body>
