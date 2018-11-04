<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
            url : "<c:url value='/miss/find_upload/Upload.aw'/>",
            cache: false,
            contentType: false,
            processData: false,
            success: function(url) {
                 $('#summernote').summernote('insertImage', "<c:url value='"+url+"' />");
            },
            error : function() {
               console.log("error");
            }
         });
      }
   });
</script>

<script>
    $(function(){
        var postcode;//우편번호 변수 설정
        //주소 API
        $('.orgBtn').on("click",function(){
            new daum.Postcode({
                    oncomplete: function(data) {
                        var value;
                        var jusoSangsae="";
                        var str = data.jibunAddress;   
                        str = str.split(" ");          
                     if(data.userSelectedType == "J"){  
                            for(var i =0;i<str.length;i++){
                                if(str[i]==data.bname){     
                                    value=i;               
                                }
                            }
                        }else{
                            str = data.roadAddress;        
                            str = str.split(" ");         
                            for(var i=0;i<str.length;i++){
                                if(str[i]==data.roadname){
                                    value=i;               
                                }
                            }
                        }
                     for(var i=value;i<str.length;i++){  
                            jusoSangsae = jusoSangsae+str[i];
                        }
                     addr = data.sigungu;
                        postcode = data.postcode;
                        $("#address").val(postcode);
                         $("#address").val(addr);
                         $('#addressError').html("");   
                         $('#addressError').html("");   
                  },
                shorthand : false
                }).open();
        });
        
     });
</script>

<style>
@import url("https://talk.op.gg/css/app.css?id=43e12108193fdc5b2d34");
@media (max-width: 575.98px) {
	#titlediv {
		margin-top:16px;
		margin-left:1px;
		
	}
	#title{
		width:468.7px;
	}
}
</style>
<!-- 내용 시작 -->
<div class="container">
	<div class="page-header">
		<h2>
			찾아요
		</h2>
	</div>
	<div style="width:100%">
		<form method="post" action="<c:url value='/security/miss/find_insert.aw'/>">
			<div class="form-group form-row">
				<input type="hidden" name="table_name" value="find"/>
				<input type="hidden" name="mem_no" value="#" />
				
                 	<select name="animal_code" style="width:100px;height:38px;margin-right:10px;">
                        <option value="1">고양이</option>
                         <option value="2">강아지</option>
                         <option value="3">조류</option>
                         <option value="4">파충류&양서류</option>
                         <option value="5">기타 포유류</option>
                  	</select>
				<div class="form-row" style="width:83%;"id="titlediv">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
				</div>
			</div>
			<div class="form-inline">
 				<div class="form-group">
 					<input type="text" class="form-control" style="width: 250px" placeholder="예)금천구 가산동" name="addr" id="address">    							
  					<button type="button" value="button타입" class="orgBtn article-action__button button" id="lookup" style="margin-left: 15px">조회하기</button>
  				</div> 					
   			</div>
   			<p style="color: orange; margin-top: 5px;font-size: 0.9em">※애완동물을 잃어버린 위치를 시,군,구 단위로 간략하게 입력해주세요</p>
			</br>
			<div class="form-group form-row">
				<div style="width:92.75%">
					<textarea rows="10" class="form-control" id="summernote" name="content"></textarea>
				</div>
			</div>
			<div class="form-group form-row" style="float: left;">
				<div class="col-sm-offset-2">
					<button type="submit" class="article-action__button button">등록</button>
				</div>
			</div>
		</form>
		<a href="<c:url value='/miss/find.aw'/>"><button class="article-action__button button button--red button--red--border" style="float: left; margin-left: 15px">취소</button></a>
	</div>
</div>
<!-- 내용 끝 -->
