<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
<script>
	$(function(){
		$("#quest_content").summernote({
			placeholder: "내용을 입력하세요",
			height: 300,
			maxHeight: null,
			minHeight: null,
			lang : 'ko-KR',
			width: 1200,
			toolbar : [
				['style',['style']],/*폰트 스타일*/
				['style', ['bold', 'underline', 'clear']],/*폰트 굵기,밑줄,효과제거*/
			    ['fontsize', ['fontsize']],/*폰트 크기*/
			    ['color', ['color']],/*색깔*/
			    ['para', ['ul', 'ol', 'paragraph']],/*글머리,번호,정렬*/
			    ['height', ['height']],/*줄 간격*/
			    ['insert',['link','picture','table']]/*링크,이미지,표*/
			],
			callbacks:{
				onImageUpload:function(files,editor,welEditable){
					for (var i= files.length -1; i >= 0; i-- ){
						sendFile(files[i],this);
					}
				},
				onKeydown: function (e) { 
                    var t = e.currentTarget.innerText; 
                    if (t.trim().length >= 2000 ) {
                        //delete keys, arrow keys, copy, cut
                        if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey))
                        e.preventDefault(); 
                    } 
                },
                onKeyup: function (e) {
                    var t = e.currentTarget.innerText;
                    $('#maxContentPost').text(2000 - t.trim().length);
                },
                onPaste: function (e) {
                    var t = e.currentTarget.innerText;
                    var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                    e.preventDefault();
                    var maxPaste = bufferText.length;
                    if(t.length + bufferText.length > 2000){
                        maxPaste = 2000 - t.length;
                    }
                    if(maxPaste > 0){
                        document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
                    }
                    $('#maxContentPost').text(2000 - t.length);
                }
			}
		})
		function sendFile(file, el, wel) {
	        var form_data = new FormData();
	        form_data.append('file', file);
	        $.ajax({
	           data: form_data,
	           type: "POST",
	           url : "<c:url value='/animal/etc/quest/Upload.aw'/>",
	           cache: false,
	           contentType: false,
	           processData: false,
	           success: function(url) {
	                $('#quest_content').summernote('insertImage', "<c:url value='"+url+"' />");
	           },
	           error : function() {
	              console.log("error");
	           }
	        });
	     }
  	});
	
</script>
<div class="container border">
	<div class="row col-sm-4" >
		<h2>기타 포유류 질문 게시판</h2>
	</div>
	<form class="form-horizontal" method="post"
		action='<c:url value="/security/animal/etc/quest/quest_reply.aw"/>'>
		<div class="form-row">
			<label for="quest_title" class="col-sm-2 control-label" style="font-size:20px">제목</label>
			<input readonly="readonly" title="변경이 안됩니다" class="form-control" type="text" maxlength="50" name="quest_title" id="quest_title" value="└───＞${record.quest_title }글에 대한 답변 " />
		</div>
		<div class="form-row" style="padding-top: 10px;padding-bottom: 20px">
			<label for="quest_content" class="col-sm-2 control-label" style="font-size:20px">내용</label>
			<textarea autofocus="autofocus" maxlength="2000" class="form-control" name="quest_content" id="quest_content" rows="30" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div class="form-row">
			<div class="form-group offset-sm-5 col-sm-1">
				<a href="javascript:history.back()">
					<input type="button" class="btn btn-lg btn-outline-danger" value="취소"/>
				</a>
			</div>
			<input type="hidden" id="ani_category" name="ani_category" value="5" />
			<input type="hidden" id="checking" name=checking value="1" />
			<input type="hidden" id="origin_no" name="origin_no" value="${record.no }" />
			
			<div class="form-group col-sm-1">
				<button type="submit" class="btn btn-lg btn-outline-primary">등록</button>
			</div>
		</div>
	</form>
</div>