<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>
<script type='text/javascript'>
document.board_password.pwd.value = $("#pwdCh").text();
</script>
<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>장기렌트</h3>
		<div class="location pc">HOME <span>></span> 장기렌트</div>
		
		<div class="longrent_content">
			<form class="board_password" method="post" action="longRentView.do">
			<input type="hidden" name="no" value="${param.no}">
			<input type="hidden" name="pwd" value=""> 
				<i class="fas fa-unlock-alt"></i>
				<p>이 글은 비밀글입니다.<br>비밀번호를 입력해 주세요.</p>
				<input type="password" placeholder="비밀번호" name="pwd" id="pwdCh">
				<a class="btn_small btn_case2 mt30 board_password_btn">확인</a>
				<br>
				${message }
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>