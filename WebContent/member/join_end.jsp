<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>회원가입</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 회원가입</div>
		
		<div class="join_step box">
			<ul>
				<li class="col-xs-4">01 약관동의</li>
				<li class="col-xs-4">02 정보입력</li>
				<li class="col-xs-4 on">03 가입완료</li>
			</ul>
		</div>

		<div class="join_end">
			<div class="title">000님<br>회원가입을 축하드립니다.</div>
			<br><br>
			<p>가입시 입력하신 정보는 '마이페이지> 개인정보수정' 메뉴에서 수정이 가능합니다.<br>감사합니다.</p>
		</div>
		
		<!-- 버튼 -->
		<div class="btn_box">
			<ul>
<!--				<li><a class="btn btn-normal" href="../member/login.php">로그인</a></li>-->
				<li><a class="btn btn-normal" href="../main/main.php">메인으로 이동</a></li>
			</ul>
		</div>
		
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>