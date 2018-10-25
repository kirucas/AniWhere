<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp" %>
<head>
<meta charset="UTF-8">
<title>AniWhere-Profile</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="theme-color" content="#1ea1f7">
<link rel="stylesheet" href="https://member.op.gg/src.45ea0fc1.css">
</head>
<!-- 내용 시작 -->
<div class="container">
	<!-- nav부분 -->
		<div class="settings-navigator">
			<div class="settings-navigator__inner">
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
	</nav>
	<!-- 내용 -->
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="person" role="tabpanel" aria-labelledby="person-tab">
			<section class="member-settings-layout__content">
				<div class="member-settings-layout__content-inner">
					<h2 class="member-settings-layout__title">개인 프로필 관리</h2>
					<form>
						<div class="edit">
							<div class="edit__inner">
								<div class="edit__table">
									<div class="edit__tr">
										<div class="edit__th">아이디</div>
										<div class="edit__td">
											<div class="member-input">
												<div class="member-input__state">
													<input id="memberInput7437" class="member-input__box" type="text" autocomplete="off" name="email" value="">
													<label for="memberInput7437" class="member-input__label">이메일 주소</label>
													<span class="member-input__valid-wrapper"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="edit__tr">
										<div class="edit__th">이름</div>
										<div class="edit__td">
											<div class="edit__id">name: ${record.mem_name}</div>
										</div>
									</div>
									<div class="edit__tr">
										<div class="edit__th">닉네임</div>
										<div class="edit__td">
											<div class="edit__id">nickname: ${record.mem_nickname}</div>
										</div>
									</div>
									<div class="edit__tr">
										<div class="edit__th">관심동물</div>
										<div class="edit__td">
											<div class="edit__id">interani: ${record.mem_interani}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
		<div class="tab-pane" id="animal" role="tabpanel" aria-labelledby="animal-tab">
			<section class="member-settings-layout__content">
				<div class="member-settings-layout__content-inner">
					<h2 class="member-settings-layout__title">동물 프로필 관리</h2>
					<div class="edit">
						<div class="edit__inner">
							<div class="edit__table">
								<div class="edit__tr">
									<div class="edit__th">이메일</div>
									<div class="edit__td">
										<div class="edit__email">wmffkdla@naver.com</div>
									</div>
								</div>
								<div class="edit__tr">
									<div class="edit__th">닉네임</div>
									<div class="edit__td">
										<div class="member-edit-box-input">
											<div class="member-box-input">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="tab-pane" id="passchange" role="tabpanel" aria-labelledby="passchange-tab">
			<section class="member-settings-layout__content">
				<div class="member-settings-layout__content-inner">
					<h2 class="member-settings-layout__title">비밀번호 변경</h2>
					<div class="member-settings-layout__sub">
						개인정보 보호를 위해 비밀번호를 주기적으로 변경해주세요.<span
							class="member-settings-layout__deco"> </span>
					</div>
					<form>
						<div class="change-password">
							<div class="change-password__inner">
								<div class="member-input">
									<div class="member-input__state">
										<input id="memberInput9152" class="member-input__box" type="password" autocomplete="off" name="currentPassword" value="">
											<label for="memberInput9152" class="member-input__label">
												현재 비밀번호</label>
											<span class="member-input__valid-wrapper"></span>
									</div>
								</div>
								<div class="member-input">
									<div class="member-input__state">
										<input id="memberInput8355" class="member-input__box" type="password" autocomplete="off" name="newPassword" value="">
										<label for="memberInput8355" class="member-input__label">
											신규 비밀번호
										</label>
										<span class="member-input__valid-wrapper"></span>
									</div>
								</div>
								<div class="member-input">
									<div class="member-input__state">
										<input id="memberInput7335" class="member-input__box" type="password" autocomplete="off" name="checkNewPassword" value="">
											<label for="memberInput7335" class="member-input__label">신규 비밀번호 확인</label>
											<span class="member-input__valid-wrapper"></span>
									</div>
								</div>
								<button type="submit"
									class="member-button change-password__save-btn" disabled="">확인</button>
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
					<span class="member-settings-layout__deco"></span>
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
						<div class="leave__inner">
							<div class="member-checkbox member-circle-checkbox leave__checkbox">
								<span class="member-checkbox__state">
									<input id="memberCheckbox6554" type="checkbox" class="member-checkbox__input">
								</span>
								<label for="memberCheckbox6554" class="member-checkbox__label">회원탈퇴 시 유의사항을 확인하였으며, 모두 동의합니다.</label>
							</div>
						</div>
						<div class="leave__l-btn">
							<button type="button" class="member-button leave__agree-btn" disabled="">동의</button>
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
