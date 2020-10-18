<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>아이디/비밀번호 찾기</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 아이디/비밀번호 찾기</div>
		
		<div class="container-fluid login_box">
			<div class="">
				<h3>아이디 찾기</h3>
				<p class="fs13">가입당시 입력하셨던 이름과 이메일을 입력하세요.<br>입력 정보가 일치하면 이메일로 정보를 발송합니다.</p>
			</div>
			<form role="form">
				<div class="form-group box">
					<div class="col-xs-12">
						<label for="name">이름</label>
						<input type="text" class="form-control input-lg" id="name" placeholder="이름">
					</div>
					<div class="col-xs-12">
						<label for="email">이메일</label>
						<input type="password" class="form-control input-lg" id="email" placeholder="이메일">
					</div>
					<div>
						<a class="btn login" href="#void">아이디 찾기</a>
					</div>
				</div>
			</form>
			
			<div class="h50"></div>
			<div class="">
				<h3>비밀번호 찾기</h3>
				<p class="fs13">가입당시 입력하셨던 아이디와 이름, 이메일을 입력하세요.<br>입력 정보가 일치하면 이메일로 정보를 발송합니다.</p>
			</div>
			<form role="form">
				<div class="form-group box">
					<div class="col-xs-12">
						<label for="id">아이디</label>
						<input type="text" class="form-control input-lg" id="id" placeholder="아이디">
					</div>
					<div class="col-xs-12">
						<label for="name">이름</label>
						<input type="text" class="form-control input-lg" id="name" placeholder="이름">
					</div>
					<div class="col-xs-12">
						<label for="email">이메일</label>
						<input type="password" class="form-control input-lg" id="email" placeholder="이메일">
					</div>
					<div>
						<a class="btn login" href="#void">비밀번호 찾기</a>
					</div>
				</div>
			</form>
			
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>