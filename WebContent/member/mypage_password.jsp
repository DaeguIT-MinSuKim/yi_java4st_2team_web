<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>마이페이지</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 마이페이지</div>
		
        <div class=" logincontainer-fluid_box page_mypage">
        	
        	<form class="board_password" method="post" action="mypagePassword.do">
			<input type="hidden" name="pwd" value="" id="pwd"> 
				<i class="fas fa-unlock-alt"></i>
				<p>비밀번호를 입력해 주세요.</p>
				<input type="password" placeholder="비밀번호" name="passwd" id="passwd">
				<a class="btn_small btn_case2 mt30 board_password_btn">확인</a>
			</form>
			
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>