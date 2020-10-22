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
	document.getElementsByName("searchId")[2].value = "email";

	if(document.getElementsByName("searchId")[0].checked == false
			&& document.getElementsByName("searchId")[1].checked == false
			&& document.getElementsByName("searchId")[2].checked == false) {
		window.alert("아이디 찾기에 사용할 본인 인증 방식을 선택하세요.");
		document.getElementsByName("searchId")[0].focus();
		return;
	}
	
	if(document.getElementsByName("searchId")[0].checked == true) {
		window.open('', 'popupIPIN3', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN3";
		document.form_ipin.action = "https://cert.vno.co.kr/IPIN/menu.cb";
		document.form_ipin.submit();
		self.close();
	} else if (document.getElementsByName("searchId")[1].checked == true){
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.target = "popupChk";
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.submit();
		self.close();
	} else {
		
	}
}
//본인인증 END
</script>
<%@ include file="/include/sub_member.jsp"%>

	<form name="form_ipin" method="post">
		<input type="hidden" name="m" 			value="pubmain" />
		<input type="hidden" name="enc_data" 	value="AgAFQUQ2MDBowYeIUAG92mzBoun+QMn3fESw5PqDJUUhYTETGgMEBObky1hfOP194qcvbnzmgNQSAOOMJCXeCyp9uCWg/1LShK/lcRsq8oScEOVgcm46M7yY9WWPxCmB7fBrNPI1E6/w50GuhpGKTjeYovRtlfgpFuZX5Y2oQFPf5imrvcJ1ylUYWAa+uPPEhIDF67NHL22+jDgkCXKq3/Q2k+q3R/7Fd9yQo8O2+YnG0qDo3j4DcktKUVWIrXwzdpbiw6NZoQNBU39AiUdbiLLWBcnEVr9HmbiHWNI+U53+b3X+WbpB8kcfek5BH57MpI8Qm5XxoKMDEVuWPC0Fb67XhhQgX0j9n6DZYmHr2sFsomoOdFgmgfcQhV4gHtOZhBccOd5l0agnDvq9g4X+opDb10lEOdA7gCyrJYiAL6IE4cvMRFsDUtlIwMJpOXyWjJNcmrjrCJK2IWi732u/HsHeRWKDaR+vjfd5AiGQtzHZV1HdCF9LIJYe5QZf8FzpdNf37Vm6ukk=">
		<input type="hidden" name="param_r1" 	value="" />
		<input type="hidden" name="param_r2" 	value="" />
		<input type="hidden" name="param_r3" 	value="" />
	</form>

	<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
	<form name="form_chk" method="post">
		<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="m" value="checkplusSerivce">
		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
		<input type="hidden" name="EncodeData" value="20ECF2B43F9032B2E4C7F0A2CA650FBD8459626739BAC9B6CB6CEF8E354F37B7B511301E280D0EFD15072A78FC531AEB3C91692B35382D3F0BF055D8AFBAB956131BCED61B9AD97487ABD01A79DEE9DDD482E7975EA7A905B5BE5B6269D03DED9392B0D81C8DDBBC5DA1D5ED412114B57DA53B87490FBE002A2AE0FE6BADDA1885C9FB8933A80FABDCC10A22051C7CD3BD4942DABD1BAA18FC492D7CCAC469F347B16A7A9E809AED311BA004717E4020B8CEB7A2FB6F4E4D17195912FDEDBDE84763F326D1AC45BE8A12A0FF3D5F783C9D9D89F033DD1316F3DEF9872EA6668BFC62E65330FFE79BDCF6884BBE492017C52BD4E7C7E3021C0B481F97B7668A4E">
	</form>
	
	
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