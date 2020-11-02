<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<form method="get">
			<div class="join_end">
				<div class="title"><q><strong style="color: #007aff;">${joinMember.name}</strong></q>님 회원가입을 축하드립니다.</div>
				<h4>현재 가입하신 아이디는 <q><strong style="color: #007aff;">${joinMember.id}</strong></q>입니다.</h4>
				<br>
				<p>가입시 입력하신 정보는 '마이페이지 > 개인정보수정' 메뉴에서 수정이 가능합니다.<br><br>감사합니다.</p>
			</div>
			
			<!-- 버튼 -->
			<div class="btn_box" style="margin-top: 50px">
				<ul>
					<li><a class="btn btn-normal" href="login.do">로그인</a></li>
					<li><a class="btn btn-normal" href="index.do">메인으로 이동</a></li>
				</ul>
			</div>
	</form>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>