<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>

<script>
	var isDelete = function() {
		if (confirm("글을 삭제 하시겠습니까?"))
			location.replace("<c:url value='/market/groupbuy/delete.aw?groupbuy_no=${record.no}'/>");
	};
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
	var displayComments	 = function(data){
		console.log(JSON.stringify(data));
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
   $(function() {
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
   

        <div class="col-md-8">
         <!--  <img class="img-fluid" src="http://placehold.it/750x500" alt="" > -->
           <img id="product" class="card-img-right flex-auto d-none d-lg-block" alt="판매상품" src="<c:url value='/resources/images/maketimages/product1.jpg'/>" style="width: 700px; height: 500px;">
        
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
				<h3 class="my-4">구매등록</h3>
				<input name="reset"  class="btn btn-info" type="button" value="-"><input name="reset"  class="btn btn-info" type="button" value="0"><input name="reset"  class="btn btn-info" type="button" value="+"><br/>
				<input name="reset"  class="btn btn-danger" type="button" value="구매"  style="margin-top:20px;margin-left:200px;">
			
			

			</div>
          
        </div>

      </div>
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
      <div style="margin-top:10px">
   </div><br/>
      
 
   <jsp:include page="../template/ProgressBar.jsp" />
  
	

   
      
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
			<a href="<c:url value='/security/market/selledit.aw?sell_no=${record.no}'/>" type="button" class="btn btn-danger">수정</a>
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

    
  </body>

  
