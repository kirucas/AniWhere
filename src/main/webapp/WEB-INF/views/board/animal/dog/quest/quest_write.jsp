<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script>
	$(function(){
		//썸머노트에 아무것도 없으면 안넘어가게 하기위한 변수
		var summernoteForm = $('#frm');
	    var summernoteElement = $('#quest_content');
	    var summernoteValidator = summernoteForm.validate({
	        errorElement: "div",
	        errorClass: 'is-invalid',
	        validClass: 'is-valid',
	        ignore: ':hidden:not(#quest_content),.note-editable.card-block',
	        errorPlacement: function (error, element) {
	            error.addClass("invalid-feedback");
	            console.log(element);
	            if (element.hasClass("summer")) {
	                error.insertAfter(element.siblings(".note-editor"));
	            } else {
	                error.insertAfter(element);
	            }
	        }
	    });
	    //썸머노트를 적용한 quest_content에 넣을 수 있는 최대 문자 수 및 null이 들어가면 메시지 뜨게하기 
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
                        if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey))
                        e.preventDefault(); 
                    } 
                },
                onKeyup: function (e) {
                    var t = e.currentTarget.innerText;
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
                },
                onChange: function (contents, $editable) {
                	summernoteElement.val(summernoteElement.summernote('isEmpty') ? "" : contents);
	                summernoteValidator.element(summernoteElement);
	            }
			}
		})
		//이미지 저장을 위한 ajax
		function sendFile(file, el, wel) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data: form_data,
				type: "POST",
				url : "<c:url value='/animal/dog/quest/Upload.aw'/>",
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
	<div class="row col-md-4">
		<h2>강아지 질문 게시판</h2>
	</div>
		<form id="frm" class="form-horizontal" method="post"
		action='<c:url value="/security/animal/dog/quest/quest_write.aw"/>'>
		<div class="form-row">
			<label for="quest_title" class="col-md-2 control-label" style="font-size:20px">제목</label>
			<input data-msg="제목을 입력하세요" required="required" maxlength="50" class="form-control" type="text" name="quest_title" id="quest_title" autofocus="autofocus" placeholder="제목을 입력해주세요" />
		</div>
		<div class="form-row" style="padding-top: 10px;padding-bottom: 20px">
			<label for="quest_content" class="col-md-2 control-label" style="font-size:20px">내용</label><h5 class="col-md-10 text-right" id="maxContentPost"></h5>
			<textarea data-msg="내용을 입력하세요" required="required" class="form-control summer" name="quest_content" id="quest_content" rows="30"></textarea>
		</div>
		<div class="form-row">
			<div class="form-group offset-md-5 col-md-1">
				<a href="javascript:history.back()">
					<input type="button" class="btn btn-lg btn-outline-danger" value="취소"/>
				</a>
			</div>
			<input type="hidden" id="ani_category" name="ani_category" value="1" />
			<div class="form-group col-md-1">
				<button type="submit" class="btn btn-lg btn-outline-primary">등록</button>
			</div>
		</div>
	</form>
</div>