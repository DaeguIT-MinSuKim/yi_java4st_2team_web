<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents search">
		<h3>아이디/비밀번호 찾기</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 아이디/비밀번호 찾기</div>
		
		<div class="login_box">
			<div class="col-sm-6">
				<a class="btn login" href="./search_id_1.php">아이디 찾기</a>
			</div>
			<div class="col-sm-6">
				<a class="btn login" href="./search_pwd_1.php">비밀번호 찾기</a>
			</div>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>