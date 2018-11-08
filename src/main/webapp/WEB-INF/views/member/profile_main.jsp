<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<link rel="stylesheet" href="https://member.op.gg/src.45ea0fc1.css">
<style>
.nav-tabs {
    border-bottom: none;
}
.member-input__state {
    border-bottom: none;
}
.member-settings-layout__title{
	padding-bottom:40px;
}
*{
	font-family:메이플스토리 !important;
}
.passwordinput {
	border-bottom:0.5px solid black !important;
}
#aniwarn{
	width:50%;
	margin-top:20px;
	align:center;
}
.card{
	display:inline-block;
	margin-right:-4px;
}
#img_div{
	 padding-top:15px;
}
#ani_profile{
	height: 200px;
}
.card-body{
	height: 90px;
}
#plus{
	border: none;
}
#plus img{
	margin-bottom: 40px;
}
#profile-text span{
	margin-bottom: 5px;
}
#button_div{
	display:none;
	position: absolute;
	top:220px;
	width: 203px;
}
#button_div a{
	width: 100%;
}
.img_div:hover #button_div{
	display: block;
	position: absolute;
	top: 200px;
}
.img_div{
	padding-top: 15px;
}
#ani_checkbox input{
	margin : 0px 5px 0px 5px;
}

</style>
<script>
function delete_ani(ani_no){
	var con = confirm("정말로 삭제 하시겠습니까?");
	$.ajax({
		data: {"ani_no":ani_no},
        type: "POST",
        url : "<c:url value='/security/member/animal/delete.awa'/>",
        success: function() {
        	if(con){
				$('[id='+ani_no+']').remove();
        	}
        },
        error : function() {
           console.log("error");
        }
    });
}
var idck = 0;
$(function(){
	var ani = '${record.mem_interani}';
	console.log(ani);
	var arr = ani.split("");
	for(var i=0;i<=arr.length;i++){
		switch(arr[i]){
		case "1":
			$('.checkbox:eq(0)').prop("checked",true);
			break;
		case "2":
			$('.checkbox:eq(1)').prop("checked",true);	
			break;			
		case "3":
			$('.checkbox:eq(2)').prop("checked",true);	
			break;
		case "4":
			$('.checkbox:eq(3)').prop("checked",true);	
			break;
		case "5":
			$('.checkbox:eq(4)').prop("checked",true);	
			break;
		}
	}
	$("#mem_nickname").change(function(){
		idck=0;
		$("#idck").prop("disabled",false);
	});
	$("#edit").click(function() {
	    if(idck==0){
	        alert('닉네임 중복체크를 해주세요');
	        return false;
	    }
	    else{
	    	$("#frm").submit();
	    }
	});
	 //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
        var nick =  $("#mem_nickname").val(); 
        console.log(nick);
        $.ajax({
            async: true,
            type : 'POST',
            data : {"mem_nickname":nick},
            dataType : "json",
            url : "<c:url value='/member/nickchk.aw'/>",
            success : function(data) {
            	var result = data.result;
                if (result > 0) {
                    alert("닉네임이 존재합니다. 다른 닉네임을 입력해주세요.");
                    $("#mem_nickname").focus();
                } else {
                    alert("사용가능한 닉네임입니다.");
                    $("#idck").prop("disabled",true);
                    idck = 1;
                }
            },
            error : function(error) {
                console.log("error : " + error);
            }
        });
    });
});
</script>
<!-- 내용 시작 -->
<div class="container">
	<!-- nav부분 -->
		<div class="settings-navigator">
			<div class="settings-navigator__inner" style="width:100%">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="person-tab" data-toggle="tab" href="#person" role="tab" aria-controls="person" aria-current="true"> 
							개인정보 관리 
						</a>
					</li>
					<li class="nav-item">
						<a	class="nav-link" aria-current="false" id="animal-tab" data-toggle="tab" href="#animal" role="tab" aria-controls="animal"> 동물프로필
							관리 
						</a>
					</li>
					<c:if test="${record.mem_log!=1 or record.mem_log!=2 }">
					<li class="nav-item">
						<a class="nav-link" aria-current="false" id="passchange-tab" data-toggle="tab" href="#passchange" role="tab" aria-controls="passchange">
							비밀번호 변경 
						</a>
					</li>
					</c:if>
					<li class="nav-item">
						<a	class="nav-link" aria-current="false" id="goodbye-tab" data-toggle="tab" href="#goodbye" role="tab"	aria-controls="goodbye"> 
							회원탈퇴 
						</a>
					</li>
				</ul>
			</div>
		</div>
	<!-- 내용 -->
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="person" role="tabpanel" aria-labelledby="person-tab">
			<section class="member-settings-layout__content">
				<div class="member-settings-layout__content-inner">
					<h2 class="member-settings-layout__title">개인 프로필 관리</h2>
					<form id="frm" action="<c:url value='/member/edit.aw'/>" method="post">
						<div class="edit">
							<div class="edit__inner">
								<div class="member-input">
									<div class="member-input__state">
										<div class="edit__table">
											<div class="edit__tr">
												<div class="edit__th">
													아이디
												</div>
												<div class="edit__td">
													<input class="member-input__box" type="text" autocomplete="off" name="mem_id" disabled value="${record.mem_id}">
												</div>
											</div>
											<div class="edit__tr">
												<div class="edit__th">
													이름
												</div>
												<div class="edit__td">
													<input class="member-input__box" type="text" autocomplete="off" name="mem_name"  style="text-decoration:underline" value="${record.mem_name}">
												</div>
											</div>
											<div class="edit__tr">
												<div class="edit__th">
													닉네임
												</div>
												 <div class="edit__td">
			                                       <div style="float: left;">
			                                          <input class="member-input__box" type="text" autocomplete="off" name="mem_nickname" id="mem_nickname"style="text-decoration:underline" value="${record.mem_nickname}">
			                                       </div>
			                                       <div>
			                                          <input id="idck" class="btn btn-primary" type="button" value="중복확인"></input>
			                                       </div>
			                                    </div>
			                                 </div>
											<div class="edit__th">
												관심동물
											</div>
											<div class="edit__td" id="ani_checkbox">
												<input class="checkbox" type="checkbox" name="mem_interani" value="1">강아지 
												<input class="checkbox" type="checkbox" name="mem_interani" value="2">고양이 
												<input class="checkbox" type="checkbox" name="mem_interani" value="3">파충류 & 양서류 
												<input class="checkbox" type="checkbox" name="mem_interani" value="4">조류
												<input class="checkbox" type="checkbox" name="mem_interani" value="5">기타포유류 
											</div>
											<input type="hidden" name="mem_id" value="${record.mem_id}"/>
											<input type="hidden" name="mem_pw" value="${record.mem_pw}"/>
											<input type="hidden" name="mem_gender" value="${record.mem_gender}"/>
										</div>
									</div>
									<div class="text-center">
										<input id="edit" type="submit" class="member-button" value="수정">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
			
			<div class="tab-pane fade" id="animal" role="tabpanel" aria-labelledby="animal-tab">
			<c:if test="${empty anirecord }" var="isEmpty">
				<div class="container" style="text-align:center">
					<div style="display:inline-block">
						<img id="aniwarn" src="<c:url value='/resources/images/animalwarn.jpg'/>" alt="애완동물 등록이 안되어있습니다."/>
					</div>
					<span style="font-size:25px">등록된 애완동물이 없으시네요.<a href="<c:url value='/animal/enroll.aw'/>"> 펫 등록하러 가기</a></span>
				</div>
			</c:if>
			<c:if test="${not isEmpty}">
				<section class="member-settings-layout__content">
					<div class="member-settings-layout__content-inner" style="height: 100%;">
						<h2 class="member-settings-layout__title">동물 프로필 관리</h2>
						<div class="container" style="vertical-align:middle;">
	  						<c:forEach var="animal" items="${anirecord}" varStatus="loop">
							  <div class="card col-12 col-md-3 img_div" id="${animal.ani_no}">
							  	<a href="#">
								  <img class="card-img-top" src="<c:url value='${animal.ani_pic}'/>" alt="애완동물 사진" id="ani_profile">
								</a>  
								<div id="button_div">
								  <a onclick="delete_ani(${animal.ani_no});" href="#" class="btn btn-danger">X</a>
								</div>
							    <div class="card-body" style="height: 120px;">
								    <h2 class="card-title">애완동물 이름 : ${animal.ani_name}</h2>
								    <p class="card-text" id="profile-text">
								    	<span>나이 : ${animal.ani_age} 살</span><br>
							    		<span>성별 : ${animal.ani_gender}</span><br>
							    		<span>대분류 : ${animal.ani_species}</span><br>
							    		<span>중분류 : ${animal.ani_kind}</span>
						    		</p>
							    </div>
							  </div>
							</c:forEach>
							<div class="card col-12 col-md-3" id="plus">
								<a href="<c:url value='/animal/enroll.aw'/>"><img style="height: 200px;" class="card-img-top" src="<c:url value='/resources/images/plus.jpg'/>" alt="애완동물 추가"></a>
							</div>
						</div>
					</div>	
				</section>
			</c:if>
		</div>
		<c:if test="${record.mem_log!=1 or record.mem_log!=2 }">
			<div class="tab-pane" id="passchange" role="tabpanel" aria-labelledby="passchange-tab">
				<section class="member-settings-layout__content">
					<div class="member-settings-layout__content-inner">
						<h2 class="member-settings-layout__title">비밀번호 변경</h2>
						<div class="member-settings-layout__sub">
							개인정보 보호를 위해 비밀번호를 주기적으로 변경해주세요.
						</div>
						<form  action="#" method="post">
							<div class="change-password">
								<div class="change-password__inner">
									<div class="member-input">
										<div class="member-input__state">
											<div>현재 비밀번호</div>
											<input class="member-input__box passwordinput" type="password" autocomplete="off" name="currentPassword" value="">
										</div>
									</div>
									<div class="member-input">
										<div class="member-input__state">
											<div>신규 비밀번호</div>
											<input class="member-input__box passwordinput" type="password" autocomplete="off" name="newPassword" value="">
										</div>
									</div>
									<div class="member-input">
										<div class="member-input__state">
											<div>신규 비밀번호 확인</div>
											<input class="member-input__box passwordinput" type="password" autocomplete="off" name="checkNewPassword" value="">
										</div>
									</div>
									<button type="submit" class="member-button change-password__save-btn">확인</button>
								</div>
							</div>
						</form>
					</div>
				</section>
			</div>
		</c:if>
		<div class="tab-pane fade" id="goodbye" role="tabpanel" aria-labelledby="goodbye-tab">
			<section class="member-settings-layout__content">
				<div class="member-settings-layout__content-inner">
					<h2 class="member-settings-layout__title">회원탈퇴</h2>
				<div class="member-settings-layout__sub">
					회원탈퇴 전에 반드시 유의사항을 확인하고 진행해 주세요.
				</div>
					<div class="leave">
						<div class="leave__inner">
							<h3 class="leave__title">개인정보 및 서비스 이용 기록 삭제</h3>
							<div class="leave__sub">개인정보 및 개인화 서비스 이용기록이 모두 삭제 되며, 삭제된 데이터는 복구되지 않습니다. 필요한 데이터는 미리 백업해 주시기 바랍니다.</div>
								<h3 class="leave__title">소셜 계정 연결 정보 삭제</h3>
							<div class="leave__sub">이메일 ID에 소셜 계정을 연결한 경우 탈퇴 시 연결 정보도 함께 삭제됩니다.</div>
								<h3 class="leave__title">커뮤니티 서비스 등록 게시물 유지</h3>
							<div class="leave__sub">회원가입 이후 등록하신 게시물들은 회원탈퇴 후에도 삭제 되지 않고 유지됩니다. 삭제를 원하시는 경우에는 직접 삭제하신 후 회원탈퇴를 진행하시기 바랍니다.</div>
						</div>
						<div class="leave__l-line"></div>
						<div class="leave__l-btn">
							<button type="button" id="bye" class="member-button leave__agree-btn">동의</button>
							<div class="leave__l-disagree-btn">
								<button type="button" class="member-button cancel-button leave__disagree-btn">비동의</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- tab-content -->
</div>
<!-- 내용 끝 -->
