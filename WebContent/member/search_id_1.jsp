<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<script language='javascript'>
//본인인증 START
window.name ="Parent_window";

function niceSmsPopup(){
 	document.getElementsByName("searchId")[0].value = "ipin";
	document.getElementsByName("searchId")[1].value = "sms";

	if(document.getElementsByName("searchId")[0].checked == false
			&& document.getElementsByName("searchId")[1].checked == false) {
		window.alert("아이디 찾기에 사용할 본인 인증 방식을 선택하세요.");
		document.getElementsByName("searchId")[0].focus();
		return;
	}
	
	if(document.getElementsByName("searchId")[0].checked == true) {
		window.open('https://cert.vno.co.kr/ipin.cb', 'popupIPIN3', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		/* document.form_ipin.target = "popupIPIN3";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		document.form_ipin.action = "";
		document.form_ipin.submit(); */
	}else{
		window.open('https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb?m=auth_mobile_main', 'popupChk3', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		/* document.form_chk.target = "popupChk3";
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.action = "";
		document.form_chk.submit(); */
	}
}
//본인인증 END
</script>
<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents search_id">
		<h3>아이디 찾기</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 아이디/비밀번호 찾기</div>
	
		<div class="id_wrap">
			<p>아이디 찾기에 사용할 본인 인증 방식을 선택하세요.</p>
			<div>
				<label><input type="radio" class="radio-inline" name="searchId" value="ipin"> 아이핀 인증</label>
				<label><input type="radio" class="radio-inline" name="searchId" value="sms"> 휴대폰 인증</label>
				<label><input type="radio" class="radio-inline" name="searchId" value="email"> 이메일 인증</label>
			</div>
		</div>
		<div class="btn_box">
			<a href="javascript:;" class="btn btn-blue" onclick="niceSmsPopup(); return false;">다음</a>
		</div>

	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>