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
</style>
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
					<li class="nav-item">
						<a class="nav-link" aria-current="false" id="passchange-tab" data-toggle="tab" href="#passchange" role="tab" aria-controls="passchange">
							비밀번호 변경 
						</a>
					</li>
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
					<form action="#" method="post">
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
													<span class="member-input__valid-wrapper"></span>
												</div>
											</div>
											<div class="edit__tr">
											<div class="edit__th">
												이름
											</div>
												<div class="edit__td">
													<input class="member-input__box" type="text" autocomplete="off" name="mem_name" value="${record.mem_name}">
													<span class="member-input__valid-wrapper"></span>
												</div>
											</div>
											<div class="edit__tr">
											<div class="edit__th">
												닉네임
											</div>
												<div class="edit__td">
													<input class="member-input__box" type="text" autocomplete="off" name="mem_nickname" value="${record.mem_nickname}">
													<span class="member-input__valid-wrapper"></span>
												</div>
											</div>
											<div class="edit__th">
												관심동물
											</div>
											<div class="edit__td">
												<input class="member-input__box" type="text" autocomplete="off" name="mem_interani" value="${record.mem_interani}">
												<span class="member-input__valid-wrapper"></span>
											</div>
											
										</div>
									</div>
									<div class="text-center">
										<input type="submit" class="member-button" value="수정">
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
						<img id="aniwarn" src="<c:url value='/resources/images/animalwarn.jpg'/>"/>
					</div>
					<span style="text-size:18px">등록된 애완동물이 없으시네요.<a href="<c:url value='/animal/enroll.aw'/>"> 펫 등록하러 가기</a></span>
				</div>
			</c:if>
			<c:if test="${not isEmpty}">
    			<c:forEach var="record" items="${list}" varStatus="loop">
					<section class="member-settings-layout__content">
						<div class="member-settings-layout__content-inner">
							<h2 class="member-settings-layout__title">동물 프로필 관리</h2>
							<form action="#" method="post">
								<div class="edit">
									<div class="edit__inner">
										<div class="member-input">
											<div class="member-input__state">
												<div class="edit__table">
													<div class="edit__tr">
													<div class="edit__th">
														펫 이름
													</div>
														<div class="edit__td">
															<input style="" id="memberInput7437" class="member-input__box" type="text" autocomplete="off" name="ani_name" disabled value="${ani_name}">
															<span class="member-input__valid-wrapper"></span>
														</div>
													</div>
													<div class="edit__tr">
													<div class="edit__th">
														펫 나이
													</div>
														<div class="edit__td">
															<input style="" id="memberInput7437" class="member-input__box" type="text" autocomplete="off" name="ani_age" value="예시: ${ani_age}">
															<span class="member-input__valid-wrapper"></span>
														</div>
													</div>
													<div class="edit__tr">
													<div class="edit__th">
														펫 성별
													</div>
														<div class="edit__td">
															<input style="" id="memberInput7437" class="member-input__box" type="text" autocomplete="off" name="ani_gender" value="예시: ${ani_gender}">
															<span class="member-input__valid-wrapper"></span>
														</div>
													</div>
													<div class="edit__th">
														펫 분류
													</div>
													<div class="edit__td">
														<input style="" id="memberInput7437" class="member-input__box" type="text" autocomplete="off" name="ani_kind" value="예시:${ani_kind}">
														<span class="member-input__valid-wrapper"></span>
													</div>
												</div>
											</div>
											<div class="text-center">
												<input type="submit" class="member-button" value="수정">
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</section>
				</c:forEach>
			</c:if>
		</div>
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
								<h3 class="leave__title">개인정보 보관</h3>
							<div class="leave__sub">회원 탈퇴 시 일부 개인정보는 개인정보처리방침에 따라 탈퇴일로부터 30일간 보관되며, 그 이후 관계법령에 필요한 경우에는 별도 보관합니다.</div>
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
