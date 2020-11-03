<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<script>
function emailChkYorN() {
	document.frmName.emailChk.value="";
}

function createQueryingChk() {

	var form1 = document.frmName;

	if(!form1.email.value){
		alert("이메일을 입력하세요");
		form1.email.focus();
		return;
	}
	var EMAIL = form1.email.value;
	if (EMAIL) {
		if ((EMAIL.indexOf('@') < 0 )||(EMAIL.indexOf('.') < 0 )) {
			window.alert('이메일을 정확하게 입력하세요');
			form1.email.focus();
			return;
		}
	}
	validate_EmailDupl();
}
</script>
<script src="/js/email_dupl.js"></script>


<script>
function frmChk(){

	form1=document.frmName;
	var NUM=0;

	//비밀번호 특수문자 체크
	var regMust1 = /[a-zA-Z0-9_]/;
	var regMust2 = /[^a-zA-Z0-9_]/;
	
	if(!document.getElementsByName("old_passwd")[0].value){
		window.alert("비밀번호를 입력하세요.");
		document.getElementsByName("old_passwd")[0].focus();
		return;
	}
	if (document.getElementsByName("passwd")[0].value) {
		if(!document.getElementsByName("passwd")[0].value){
			window.alert("비밀번호를 입력하세요.");
			document.getElementsByName("passwd")[0].focus();
			return;
		}
		if(document.getElementsByName("passwd")[0].value.length<6 || document.getElementsByName("passwd")[0].value.length>20){
			window.alert("비밀번호는 6자이상 20자 이하입니다.");
			document.getElementsByName("passwd")[0].focus();
			return;
		}
		if(!regMust1.test(document.getElementsByName("passwd")[0].value) || !regMust2.test(document.getElementsByName("passwd")[0].value)) {
			window.alert("특수문자를 하나 이상 입력하세요");
			document.getElementsByName("passwd")[0].focus();
			return;
		}
		if(!document.getElementsByName("passwd1")[0].value){
			window.alert("비밀번호를 한번 더 입력하세요.");
			document.getElementsByName("passwd1")[0].focus();
			return;
		}
		if(document.getElementsByName("passwd")[0].value != document.getElementsByName("passwd1")[0].value){
			window.alert("비밀번호가 일치하지 않습니다.");
			document.getElementsByName("passwd1")[0].focus();
			return;
		}
	}

/*
	if(!document.getElementsByName("birthday")[0].value){
		window.alert("생년월일을 선택하세요");
		document.getElementsByName("birthday")[0].focus();
		return;
	}
*/
	if(!document.getElementsByName("zipcode")[0].value){
		window.alert("주소를 입력하세요");
		document.getElementsByName("zipcode")[0].focus();
		return;
	}
	if(!document.getElementsByName("addr1")[0].value){
		window.alert("주소를 입력하세요");
		document.getElementsByName("addr1")[0].focus();
		return;
	}
	if(!document.getElementsByName("cel1")[0].value || !document.getElementsByName("cel2")[0].value || !document.getElementsByName("cel3")[0].value){
		alert("휴대전화번호를 입력하세요");
		document.getElementsByName("cel1")[0].focus();
		return;
	}
	if(!document.getElementsByName("email")[0].value){
		window.alert("이메일을 입력하세요");
		document.getElementsByName("email")[0].focus();
		return;
	}
	var EMAIL = document.getElementsByName("email")[0].value;
	if (EMAIL) {
		if ((EMAIL.indexOf('@') < 0 )||(EMAIL.indexOf('.') < 0 )) {
			window.alert('이메일을 정확하게 입력하세요');
			document.getElementsByName("email")[0].focus();
			return;
		}
	}
	if(!document.getElementsByName("emailChk")[0].value) {
		window.alert("이메일 중복검사를 해주세요");
		return;
	}
	if(document.getElementsByName("emailChk")[0].value=="N") {
		window.alert("이미 사용중인 이메일입니다.");
		return;
	}

	form1.submit();
}
</script>




<?include "../include/sub_mypage.php";?>


<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>개인정보수정</h3>
		<div class="location pc">HOME <span>></span> 회원정보 <span>></span> 개인정보수정</div>


<form class="form-horizontal" role="form" name="frmName" method="post" action="<?=$HTTP_HOST_RE?><?=$homeDir?>/mypage/process_mypage.php" onsubmit="return false;" enctype="multipart/form-data">
<input type="hidden" name="mode" value="modifyEnd">

		<div class="join">
			<div class="msg_box pc">
				<i class="msg"></i>
				<p>다음 항목들은 회원 관리 및 서비스 제공을 위해 활용됩니다.<br>설명에 따라 내용을 정확하게 입력하여 주십시오.</p>
				<div class="h30"></div>
			</div>

		
			<div class="title">필수정보 <span>(회원가입 필수 입력 항목입니다.)</span></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-5">
						<input type="text" class="form-control" maxlength="20" name="member_id" disabled value="<?=$_SESSION["session_usr_id"]?>">
					</div>
				</div>
			</div>

		   
			<div class="form-group">
				<label class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" maxlength="20" name="old_passwd">
					<p>개인정보를 수정하실 경우 입력하십시오.</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">새 비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" maxlength="20" name="passwd">
					<p>비밀번호 변경시 입력하십시오. 특수문자를 하나 이상 포함하여 6~20자로 입력하십시오.</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">새 비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" maxlength="20" name="passwd1">
					<p>비밀번호를 동일하게 다시 한 번 입력하십시오.</p>
				</div>
			</div>

			
			<div class="form-group cal_Box">
				<label class="col-sm-2 control-label">이름(성별)</label>
				<div class="col-sm-10">
					<div class="col-xs-5">
						<input type="text" class="form-control" maxlength="10" name="member_name" disabled value="<?=inputTextPrint($row["member_name"])?> (<?=sexFnc($row["sex"])?>)">
					</div>
				</div>
			</div>
			
			
			<div class="form-group cal_Box years">
			<label class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-4" style="width:35%;">
						<input type="text" class="form-control" disabled name="birthday" readonly value="<?=getMemberBrithday($row["birthday"],"A")?>">
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-2 control-label">주소</label>
				<div class="col-sm-10 col-sm-10 divinner addr">
					<div class="col-xs-7">
						<label for="sel1">우편번호</label>
						<input type="text" class="form-control" readonly name="zipcode" value="<?=$row["zipcode"]?>">
					</div>
					<div class="col-xs-5">
						<a href="#void" class="btn btn-normal" onclick="memberZip('zipcode','addr1',0); return false;">우편번호찾기</a>
					</div>
					<div class="col-xs-12">
						<label for="sel1">주소</label>
						<input type="text" class="form-control" maxlength="100" name="addr1" value="<?=inputTextPrint($row["addr1"])?>">
					</div>
					<div class="col-xs-12">
						<label for="sel1">상세주소</label>
						<input type="text" class="form-control" maxlength="100" name="addr2" value="<?=inputTextPrint($row["addr2"])?>">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">휴대전화</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-3">
						<!-- <select name="cel1" class="selectpicker show-tick form-control">
							<option value="010" <? if ($cel[0]=="010") {echo "selected";} ?>>010</option>
							<option value="011" <? if ($cel[0]=="011") {echo "selected";} ?>>011</option>
							<option value="016" <? if ($cel[0]=="016") {echo "selected";} ?>>016</option>
							<option value="017" <? if ($cel[0]=="017") {echo "selected";} ?>>017</option>
							<option value="018" <? if ($cel[0]=="018") {echo "selected";} ?>>018</option>
							<option value="019" <? if ($cel[0]=="019") {echo "selected";} ?>>019</option>
						</select> -->
					</div>			
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="cel2" placeholder="" style="ime-mode:disabled;" value="<?=$cel[1]?>">
					</div>
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="cel3" placeholder="" style="ime-mode:disabled;" value="<?=$cel[2]?>">
					</div>
					<div>
						<!-- <label class="before height_align"><input type="checkbox" name="sms_accept" value="Y" class="checkbox_normal" <?if($row["sms_accept"]=="Y") { echo " checked"; }?> /> 문자 수신 동의</label> -->
					</div>
					<p>
						공지사항 및 개인별 통지 메시지를 받기 위하여 가능한 수신 동의를 하여 주십시오.<br>
						문자 수신 동의 여부는 회원 가입신청 후 '마이페이지> 개인정보수정' 메뉴에서 자유롭게 변경이 가능합니다
					</p>
				</div>
			</div>

			<div class="form-group cal_Box">
				<label class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-8">
						<input type="text" class="form-control" maxlength="40" name="email" onKeyUp="emailChkYorN();" value="<?=$row["email"]?>">
					</div>
					<div class="col-xs-2">
						<input type="hidden" name="emailChk" value="Y" />
						<a href="#void" class="btn btn-normal" onclick="createQueryingChk(); return false;">중복확인</a>
					</div>
					<div>
						<!-- <label class="before height_align"><input type="checkbox" name="email_accept" value="Y" class="checkbox_normal" <?if($row["email_accept"]=="Y") { echo " checked"; }?> /> 메일 수신 동의</label> -->
					</div>
					<p>
						이메일 주소는 아이디/비밀번호 찾기에 이용됩니다.<br>
						공지사항, 개인별 통지 및 안내 사항을 받기 위하여 가능한 수신 동의를 하여 주십시오.<br>
						메일 수신 동의 여부는 회원 가입신청 후 '마이페이지> 개인정보수정' 메뉴에서 자유롭게 변경이 가능합니다
					</p>
				</div>
			</div>

			<div class="h30"></div>
			<div class="title">선택정보 <span>(회원가입 선택 입력 항목입니다.)</span></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">유선전화</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="tel1" placeholder="" style="ime-mode:disabled;" value="<?=$tel[0]?>">
					</div>			
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="tel2" placeholder="" style="ime-mode:disabled;" value="<?=$tel[1]?>">
					</div>
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="tel3" placeholder="" style="ime-mode:disabled;" value="<?=$tel[2]?>">
					</div>
				</div>
			</div>
		</div>

		<div class="h30"></div>
		<!-- 버튼 -->
		<div class="btn_box">
			<ul>
				<li><a class="btn btn-blue" href="#void" onclick="frmChk(); return false;">수정하기</a></li>
				<li><a class="btn btn-gray" href="./member_end.php">회원탈퇴</a></li>
			</ul>
		</div>
</form>

	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>