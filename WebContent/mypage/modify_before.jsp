<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->


<script language="javascript">
function enterCheckIdChk() {
	if (event.keyCode == 13) {
		frmChk();	
	}
}
</script>

<script language="JavaScript">
function frmChk(){
	form1=document.frmName;

	if(!form1.passwd.value){
		window.alert("비밀번호를 입력하세요.");
		form1.passwd.focus();
		return false;
	}

	form1.action="";
	form1.submit();
}

//window.onload = function(){ document.frmName.passwd.focus(); }
</script>

<%@ include file="/include/sub_mypage.jsp"%>
<!-- 컨텐츠 -->

<div class="contents_box">
	<div class="contents">
		<h3>개인정보수정</h3>
		<div class="location pc">HOME <span>></span> 회원정보 <span>></span> 개인정보수정</div>
		
		<div class="container-fluid login_box">
			<div class="pc">
				<h3>개인정보수정 확인</h3>
				<p class="fs13">본인확인을 위해 비밀번호를 한번 더 입력해주세요.</p>
				<div class="h30"></div>
			</div>
<form method="post" name="frmName" onsubmit="return frmChk();" role="form" autocomplete="off">
<input type="hidden" name="mode" value="beforeEnd">
				<div class="form-group box">
					<div class="col-xs-12">
						<label for="id">비밀번호</label>
						<input type="text" class="form-control input-lg" id="memberId01" placeholder="" value="" disabled="disabled">
					</div>
					<div class="col-xs-12">
						<label for="pwd">비밀번호</label>
						<input type="password" class="form-control input-lg" id="passwdId01" placeholder="비밀번호" name="passwd" onkeypress="enterCheckIdChk();">
					</div>
					<div>
						<a class="btn btn-normal login" href="./modify.php" onclick="frmChk(); return false;">확인</a>
					</div>
				</div>
</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>