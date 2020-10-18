<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<!-- // header -->


<script language="JavaScript">
<!--
function enter_checklogin() {
	if (event.keyCode == 13) {
		frm_mm_chk();	
	}
}

function frm_mm_chk(){
	form1=document.usrlog;
	if(!form1.member_id.value || form1.member_id.value==" id"){
		alert("아이디를 입력하세요.");
		//ID_NAME();
		form1.member_id.focus();
		return;
	}
	if(!form1.passwd.value || form1.passwd.value==" password"){
		alert("비밀번호를 입력하세요.");
		//PASS_NAME();
		form1.passwd.focus();
		return;
	}
	form1.submit();
}
//-->
window.onload = function(){ document.usrlog.member_id.focus(); }
</script>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>회원 로그인</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 회원 로그인</div>
		
		<div class="container-fluid login_box">
			<div class="">
				<h3>회원 로그인</h3>
				<p class="fs13">회원서비스를 이용하시려면 로그인을 하셔야 합니다.<br>아이디와 비밀번호를 정확히 입력하세요.</p>
				<div class="h30"></div>
			</div>
            <form name="usrlog" method="post" action="" onsubmit="return false;">
				<div class="form-group box">
					<div class="col-xs-12">
						<label for="id">작성자명</label>
						<input type="text" class="form-control input-lg" name="member_id" placeholder="아이디" onkeypress="enter_checklogin();">
					</div>
					<div class="col-xs-12">
						<label for="pwd">비밀번호</label>
						<input type="password" class="form-control input-lg" name="passwd" placeholder="비밀번호" onkeypress="enter_checklogin();">
					</div>
					<div>
						<a class="btn btn-normal login" href="#void" onclick="frm_mm_chk(); return false;">로그인</a>
					</div>
				</div>
            </form>

			<div class="info box">
				<div class="col-xs-12 col-sm-6">
					<span>아직 회원가입을 하지 않으셨나요?</span><br>
					<a class="btn btn-normal btn-sm" href="joinAgree.do">회원가입</a>
				</div>
				<div class="col-xs-12 col-sm-6">
					<span>아이디, 비밀번호가 기억나지 않으세요?</span><br>
					<a class="btn btn-normal btn-sm" href="search.do">아이디/비밀번호찾기</a>
				</div>
			</div>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>