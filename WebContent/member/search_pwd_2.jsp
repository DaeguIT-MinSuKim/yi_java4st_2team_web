<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<script>
function frmChk(){
	form1=document.frmName;
	var NUM=0;

	//비밀번호 특수문자 체크
	var regMust1 = /[a-zA-Z0-9_]/;
	var regMust2 = /[^a-zA-Z0-9_]/;


	if(document.getElementsByName("passwd")[0].value==0){
		window.alert("새 비밀번호를 입력하세요");
		document.getElementsByName("passwd")[0].focus();
		return;
	}
	if(document.getElementsByName("passwd")[0].value.length<6 || document.getElementsByName("passwd")[0].value.length>20){
		window.alert("비밀번호는 6자이상 20자이하입니다");
		document.getElementsByName("passwd")[0].focus();
		return;
	}
	if(!regMust1.test(document.getElementsByName("passwd")[0].value) || !regMust2.test(document.getElementsByName("passwd")[0].value)) {
		window.alert("특수문자를 하나 이상 입력하세요");
		document.getElementsByName("passwd")[0].focus();
		return;
	}
	if(!document.getElementsByName("passwd1")[0].value){
		window.alert("새 비밀번호를 한번 더 입력하세요");
		document.getElementsByName("passwd1")[0].focus();
		return;
	}
	if(document.getElementsByName("passwd")[0].value != document.getElementsByName("passwd1")[0].value){
		window.alert("비밀번호가 일치하지 않습니다");
		document.getElementsByName("passwd1")[0].focus();
		return;
	}

	//form1.action="?mode=end";
	form1.submit();
}
</script>


<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents search_id search_pwd">
		<h3>비밀번호 재설정</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 아이디/비밀번호 찾기</div>
		
<form  class="form-horizontal" role="form" name="frmName" method="post" action="" onsubmit="return false;">
<input type="hidden" name="mode" value="pwdChg">
		<div class="id_wrap">
			<p>새로 사용할 비밀번호를 입력해주세요</p>
			<strong>아이디 : <span><?=$row[0]?></span></strong>
			<div>
				<div class="col-sm-3">
					<span>새 비밀번호</span>
				</div>
				<div class="col-sm-9">
					<input type="password" class="form-control" name="passwd" maxlength="20">
				</div>
				<div class="col-sm-3">
					<span>새 비밀번호 확인</span>
				</div>
				<div class="col-sm-9">
					<input type="password" class="form-control" name="passwd1" maxlength="20">
				</div>
			</div>
		</div>
		<div class="btn_box">
			<a href="#void" class="btn btn-blue" onclick="frmChk(); return false;">확인</a>
		</div>
</form>
		
		
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>