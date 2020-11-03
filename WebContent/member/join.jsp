<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<script>
	function TypeCheck(s, spc) {

		var i;

		for (i = 0; i < s.length; i++) {
			if (spc.indexOf(s.substring(i, i + 1)) < 0) {
				return false;
			}
		}
		return true;
	}
</script>

<script>
	function idcheck() {

		// 아이디 조합 체크
		var NUMBER = "1234567890";
		var SALPHA = "abcdefghijklmnopqrstuvwxyz";
		var ALPHA = SALPHA + NUMBER;
 
		if (!document.getElementsByName("member_id")[0].value) {
			alert("아이디를 입력하세요");
			document.getElementsByName("member_id")[0].focus();
			return;
		}
		
		if (document.getElementsByName("member_id")[0].value.length < 6
				|| document.getElementsByName("member_id")[0].value.length > 20) {
			window.alert("아이디는 영문 소문자와 숫자 조합으로 6자 ~ 20자 이하입니다");
			document.getElementsByName("member_id")[0].focus();
			return;
		}
		
		if (!TypeCheck(document.getElementsByName("member_id")[0].value, ALPHA)) {
			window.alert("아이디는 영문 소문자와 숫자 조합으로 사용할 수 있습니다");
			document.getElementsByName("member_id")[0].focus();
			return;
		}
		
		if (!TypeCheck(document.getElementsByName("member_id")[0].value, NUMBER) == false) {
			window.alert("아이디는 숫자만으로 사용할 수 없습니다");
			document.getElementsByName("member_id")[0].focus();
			return;
		}
		
		if (!TypeCheck(document.getElementsByName("member_id")[0].value, SALPHA) == false) {
			window.alert("아이디는 영문만으로 사용할 수 없습니다");
			document.getElementsByName("member_id")[0].focus();
			return;
		}
		
		var popupWidth = 480;
		var popupHeight = 250;
		
		var left = (screen.availWidth - popupWidth) / 2;
			if (window.screenLeft < 0) {
				left += window.screen.width * -1;
			} else if (window.screenLeft > window.screen.width) {
				left += window.screen.width;
			}
			
		var top = (screen.availHeight - popupHeight) / 2 - 10;
		
		var options = "resizable=no,left=" + left + ",top=" + top +" width=" + popupWidth+ ",height=" + popupHeight +",menubar=no, status=no, toolbar=no, location=no, scrollbars=yes";
		
		var url = "joinIdCheck.do?id="
			+ document.getElementsByName("member_id")[0].value
		window.open(url, "_blank_1", options);
			
	}

</script>

<script>
	$(function() {
		$("#join").on("click",function() {
	
			// 비밀번호 조합 체크
			var regMust1 = /[a-zA-Z0-9_]/;
			var regMust2 = /[^a-zA-Z0-9_]/;
	
			// 아이디 조합 체크
			var NUMBER = "1234567890";
			var SALPHA = "abcdefghijklmnopqrstuvwxyz";
			var ALPHA = SALPHA + NUMBER;
	
			if (!document.getElementsByName("member_id")[0].value) {
				window.alert("아이디를 입력하세요.");
				document.getElementsByName("member_id")[0].focus();
				return;
			}
			
			if (document.getElementsByName("member_id")[0].value.length < 6
					|| document.getElementsByName("member_id")[0].value.length > 20) {
				window.alert("아이디는 영문 소문자와 숫자 조합으로 6자 ~ 20자 이하입니다.");
				document.getElementsByName("member_id")[0].focus();
				return;
			}
			
			if (!TypeCheck(document.getElementsByName("member_id")[0].value, ALPHA)) {
				window.alert("아이디는 영문 소문자와 숫자 조합으로 사용할 수 있습니다.");
				document.getElementsByName("member_id")[0].focus();
				return;
			}
			
			if (!TypeCheck(document.getElementsByName("member_id")[0].value, NUMBER) == false) {
				window.alert("아이디는 숫자만으로 사용할 수 없습니다.");
				document.getElementsByName("member_id")[0].focus();
				return;
			}
			
			if (!TypeCheck(document.getElementsByName("member_id")[0].value, SALPHA) == false) {
				window.alert("아이디는 영문만으로 사용할 수 없습니다.");
				document.getElementsByName("member_id")[0].focus();
				return;
			}
			
			if (document.getElementsByName("member_id")[0].value != 
					document.getElementsByName("hidden_id")[0].value) {
				window.alert("아이디 중복검사를 해주세요.");
				return;
			}

			if (!document.getElementsByName("passwd")[0].value) {
				window.alert("비밀번호를 입력하세요.");
				document.getElementsByName("passwd")[0].focus();
				return;
			}
			
			if (document.getElementsByName("passwd")[0].value.length < 6
					|| document.getElementsByName("passwd")[0].value.length > 20) {
				window.alert("비밀번호는 6자이상 20자이하입니다.");
				document.getElementsByName("passwd")[0].focus();
				return;
			}
			
			if (!regMust1.test(document.getElementsByName("passwd")[0].value)
					|| !regMust2.test(document.getElementsByName("passwd")[0].value)) {
				window.alert("특수문자를 하나 이상 입력하세요.");
				document.getElementsByName("passwd")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("passwd1")[0].value) {
				window.alert("비밀번호를 한번 더 입력하세요.");
				document.getElementsByName("passwd1")[0].focus();
				return;
			}
			
			if (document.getElementsByName("passwd")[0].value != document.getElementsByName("passwd1")[0].value) {
				window.alert("비밀번호가 일치하지 않습니다.");
				document.getElementsByName("passwd1")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("gender")[0].value) {
				window.alert("성별을 선택하세요.");
				document.getElementsByName("gender")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("birthYear")[0].selected == false) {
				window.alert("생년월일을 입력하세요.");
				document.getElementsByName("birthYear")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("birthMonth")[0].selected == false
					&& !document.getElementsByName("birthDay")[0].selected == false) {
				window.alert("생년월일을 끝까지 입력하세요.");
				document.getElementsByName("birthYear")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("member_name")[0].value) {
				window.alert("이름을 입력하세요");
				document.getElementsByName("member_name")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("cel2")[0].value) {
				alert("휴대전화번호를 입력하세요");
				document.getElementsByName("cel2")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("cel3")[0].value) {
				alert("휴대전화번호를 끝까지 입력하세요.");
				document.getElementsByName("cel3")[0].focus();
				return;
			}
			
			if (document.getElementsByName("li_class")[0].checked == false
					&& document.getElementsByName("li_class")[1].checked == false
					&& document.getElementsByName("li_class")[2].checked == false
					&& document.getElementsByName("li_class")[3].checked == false) {
				alert("운전면허종류를 선택하세요.");
				document.getElementsByName("li_class")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("li_number1")[0].value) {
				alert("운전면허번호를 입력하세요.");
				document.getElementsByName("li_number1")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("li_number1")[0].value
					|| !document.getElementsByName("li_number2")[0].value
					|| !document.getElementsByName("li_number3")[0].value
					|| !document.getElementsByName("li_number4")[0].value) {
				alert("운전면허번호를 끝까지 입력하세요.");
				document.getElementsByName("li_number1")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("email1")[0].value) {
				window.alert("이메일을 입력하세요.");
				document.getElementsByName("email1")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("email2")[0].value) {
				window.alert("이메일 주소를 선택하세요.");
				document.getElementsByName("email2")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("zipcode")[0].value) {
				window.alert("주소를 입력하세요.");
				document.getElementsByName("zipcode")[0].focus();
				return;
			}
			
			if (!document.getElementsByName("addr2")[0].value) {
				window.alert("상세주소를 입력하세요.");
				document.getElementsByName("addr2")[0].focus();
				return;
			} else {
				var joinMember = {
					id : $('#member_id').val(),
					pwd : $('#passwd').val(),
					gender : $('#gender').val(),
					birth : ($('#birthYear').val() + "-" + $('#birthMonth').val() + "-" + $('#birthDay').val()),
					name : $('#member_name').val(),
					tel : ($('#cel1').val() + "-" + $('#cel2').val() + "-" + $('#cel3').val()),
					li_class : $('#li_class').val(),
					li_number : ($('#li_number1').val() + "-" + $('#li_number2').val() + "-" +$('#li_number3').val() + "-" +$('#li_number4').val()),
					email : ($('#email1').val() + $('#email2').val()),
					address : ($('#zipcode').val() + " " + $('#addr1').val() + " " + $('#addr2').val()),
				};
	
				$.ajax({
					type : "post",
					url : "join.do",
					cache : false,
					data : JSON.stringify(joinMember),
					complete : function(data) {
						alert("가입 되었습니다.");
						window.location.href = "joinEnd.do";
					}
	
				});
	
			}
	
		});
		
	});
</script>

<script>
	/* 생년월일 */
	$(function() {
		var date = new Date();
		var year = date.getFullYear();
		
		var selectValue = document.getElementById("birthYear");
		var optionIndex = 0;
		for(var i = year-60; i <= year; i++) {
			selectValue.add(new Option(i, i), optionIndex++);                        
		}
		
		var selectValue = document.getElementById("birthMonth"); 
		var optionIndex = 0;
		for(var i = 1; i<13; i++) {
			selectValue.add(new Option(i, i), optionIndex++);
		}
		
		var selectValue = document.getElementById("birthDay");
		var optionIndex = 0;
		for(var i = 1; i<32; i++) {
			selectValue.add(new Option(i, i), optionIndex++);
		}
		
	});
</script>

<script>
	/* 이메일 주소 자동 기입 */
	$(function() {
		$("#domain").change(function() {
			$("#email2").val($("#domain").val());
		});
		
	});
	
	/* 면허 종류 하나만 선택 */
	$(document).ready(function() {
	    $('input[type="checkbox"][name="li_class"]').click(function(){
	        if ($(this).prop('checked')) {
	            $('input[type="checkbox"][name="li_class"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	        
	    });
	    
	});
</script>

<script>

window.name ="Parent_window";

var popupWidth = 500;
var popupHeight = 550;

var left = (screen.availWidth - popupWidth) / 2;
	if (window.screenLeft < 0) {
		left += window.screen.width * -1;
	} else if (window.screenLeft > window.screen.width) {
		left += window.screen.width;
	}
	
var top = (screen.availHeight - popupHeight) / 2 - 10;

var options = "resizable=no,left=" + left + ",top=" + top +" width=" + popupWidth+ ",height=" + popupHeight +",menubar=no, status=no, toolbar=no, location=no, scrollbars=yes";

$(function() {
	$("#popupChk").on("click",function() {
		window.open('', 'popupChk', options);
		document.form_chk.target = "popupChk";
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.submit();
		self.close();

	});
	
});
</script>

<%@ include file="/include/sub_member.jsp"%>

	<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
	<form name="form_chk" method="post">
		<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="m" value="checkplusSerivce">
		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
		<input type="hidden" name="EncodeData" value="AgAFQUQ2MDBowYeIUAG92mzBoun+QMn3fESw5PqDJUUhYTETGgMEBObky1hfOP194qcvbnzmgNQSAOOMJCXeCyp9uCWg/1LShK/lcRsq8oScEOVgcm46M7yY9WWPxCmB7fBrNPI1E6/w50GuhpGKTjeYovRtlfgpFuZX5Y2oQFPf5imrvcJ1ylUYWAa+uPPEhIDF67NHL22+jDgkCXKq3/Q2k+q3R/7Fd9yQo8O2+YnG0qDo3j4DcktKUVWIrXwzdpbiw6NZoQNBU39AiUdbiLLWBcnEVr9HmbiHWNI+U53+b3X+WbpB8kcfek5BH57MpI8Qm5XxoKMDEVuWPC0Fb67XhhQgX0j9n6DZYmHr2sFsomoOdFgmgfcQhV4gHtOZhBccOd5l0agnDvq9g4X+opDb10lEOdA7gCyrJYiAL6IE4cvMRFsDUtlIwMJpOXyWjJNcmrjrCJK2IWi732u/HsHeRWKDaR+vjfd5AiGQtzHZV1HdCF9LIJYe5QZf8FzpdNf37Vm6ukk=">
	</form>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>회원가입</h3>
		<div class="location pc">
			HOME <span>></span> 회원관리 <span>></span> 회원가입
		</div>

		<div class="join_step box">
			<ul>
				<li class="col-xs-4">01 약관동의</li>
				<li class="col-xs-4 on">02 정보입력</li>
				<li class="col-xs-4">03 가입완료</li>
			</ul>
		</div>

		<form class="form-horizontal" role="form" name="frmName" method="post"
			action="" onsubmit="return false;" enctype="multipart/form-data">
			<input type="hidden" name="mode" value="joinEnd">
			<div class="join">
				<div class="msg_box pc">
					<i class="msg"></i>
					<p>
						다음 항목들은 회원 관리 및 서비스 제공을 위해 활용됩니다.<br>설명에 따라 내용을 정확하게 입력하여
						주십시오.
					</p>
					<div class="h30"></div>
				</div>

				<div class="title">
					필수정보 <span>(회원가입 필수 입력 항목입니다.)</span>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-8">
							<input type="hidden" name="hidden_id" id="hidden_id">
							<input type="text" class="form-control" maxlength="20"
								name="member_id" id="member_id" onKeyUP="id_chk_bb();">
						</div>
						<div class="col-xs-3">
							<a href="javascript:;" class="btn btn-normal" id="id_chk"
							onclick="idcheck(); return false;">중복 체크</a>
						</div>
						<p>영문 소문자, 숫자를 혼합하여 6 ~ 20자까지 입력 가능합니다.</p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10 divinner">
						<input type="password" class="form-control" maxlength="20"
							name="passwd" id="passwd">
						<p>특수문자를 하나 이상 포함하여 6 ~ 20자로 입력하십시오.</p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">비밀번호 확인</label>
					<div class="col-sm-10 divinner">
						<input type="password" class="form-control" maxlength="20"
							name="passwd1">
						<p>비밀번호를 동일하게 다시 한 번 입력하십시오.</p>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">성별</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-2">
							<select name="gender" id="gender"
								class="selectpicker show-tick form-control">
								<option value="" selected="selected">선택</option>
								<option value="M">남성</option>
								<option value="F">여성</option>
							</select>
						</div>
						<p></p>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<select name="birthYear" id="birthYear"
								class="selectpicker show-tick form-control" dir="rtl">
								<option selected="selected" >년</option>
							</select>
						</div>
						<div class="col-xs-2">
							<select name="birthMonth" id="birthMonth"
								class="selectpicker show-tick form-control" dir="rtl">
								<option selected="selected">월</option>
							</select>
							
						</div>
						<div class="col-xs-2">
							<select name="birthDay" id="birthDay"
								class="selectpicker show-tick form-control" dir="rtl">
								<option selected="selected">일</option>
							</select>
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10 divinner addr">
						<div class="col-xs-5">
							<input type="text" class="form-control" maxlength="10"
								name="member_name" id="member_name">
						</div>
						<div class="col-xs-5">
							<a href="javascript:;" class="btn btn-normal" id="popupChk"
								onclick="popupChk(); return false;">안심본인인증</a>
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">휴대전화</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<select name="cel1" id="cel1"
								class="selectpicker show-tick form-control">
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
						</div>
						<div class="col-xs-3">
							<input type="text" class="form-control onlyNumber" maxlength="4"
								name="cel2" id="cel2" style="ime-mode: disabled;">
						</div>
						<div class="col-xs-3">
							<input type="text" class="form-control onlyNumber" maxlength="4"
								name="cel3" id="cel3" style="ime-mode: disabled;">
						</div>
						<p></p>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">운전면허종류</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<input type="checkbox" name="li_class" id="li_class" value="Class2A"><span>  2종 보통</span>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="li_class" id="li_class" value="Class2M"><span>  2종 수동</span>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="li_class" id="li_class" value="Class1A"><span>  1종 보통</span>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="li_class" id="li_class" value="Class1B"><span>  1종 대형</span>
						</div>
					</div>
					<p></p>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">운전면허번호</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<select name="li_number1" id="li_number1"
								class="selectpicker show-tick form-control">
								<option value="" selected="selected">선택</option>
								<option value="11">11(서울)</option>
								<option value="12">12(부산)</option>
								<option value="13">13(경기)</option>
								<option value="14">14(강원)</option>
								<option value="15">15(충북)</option>
								<option value="16">16(충남)</option>
								<option value="17">17(전북)</option>
								<option value="18">18(전남)</option>
								<option value="19">19(경북)</option>
								<option value="20">20(경남)</option>
								<option value="21">21(제주)</option>
								<option value="22">22(대구)</option>
								<option value="23">23(인천)</option>
								<option value="24">24(광주)</option>
								<option value="25">25(대전)</option>
								<option value="26">26(울산)</option>
								<option value="28">28(경기북부)</option>
								<option value="28">28(경기남부)</option>
							</select>
						</div>
						<div class="col-xs-2">
							<input type="text" class="form-control onlyNumber" maxlength="2"
								name="li_number2" id="li_number2" style="ime-mode: disabled;">
						</div>
						<div class="col-xs-3">
							<input type="text" class="form-control onlyNumber" maxlength="6"
								name="li_number3" id="li_number3" style="ime-mode: disabled;">
						</div>
						<div class="col-xs-2">
							<input type="text" class="form-control onlyNumber" maxlength="2"
								name="li_number4" id="li_number4" style="ime-mode: disabled;">
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<input type="text" class="form-control" maxlength="40"
								name="email1" id="email1">
						</div>
						<div class="col-xs-4">
							<input type="text" class="form-control" maxlength="40"
								name="email2" id="email2">
						</div>
						<div class="col-xs-4">
							<select name="email2" class="selectpicker show-tick form-control"
								id="domain">
								<option value="" selected="selected">선택하기</option>
								<option value="@naver.com">@naver.com</option>
								<option value="@daum.net">@daum.net</option>
								<option value="@nate.com">@nate.com</option>
								<option value="@gmail.com">@gmail.com</option>
								<option value="">직접입력</option>
							</select>
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10 divinner addr">
						<div class="col-xs-7">
							<label for="sel1">우편번호</label> <input type="text"
								class="form-control" readonly name="zipcode" id="zipcode">
						</div>
						<div class="col-xs-5">
							<a href="javascript:;" class="btn btn-normal"
								onclick="execDaumPostcode();">우편번호찾기</a>
						</div>
						<div class="col-xs-12">
							<label for="sel1">주소</label> <input type="text"
								class="form-control" maxlength="100" id="addr1" name="addr1">
						</div>
						<div class="col-xs-12">
							<label for="sel1">상세주소</label> <input type="text"
								class="form-control" maxlength="100" id="addr2" name="addr2">
						</div>
						<p></p>
					</div>
				</div>

				<!-- <div class="h30"></div>
				<div class="title">
					선택정보 <span>(회원가입 선택 입력 항목입니다.)</span>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">특이사항</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-12">
							<textarea class="form-control" maxlength="500" name="remark"
								id="remark" rows="3"></textarea>
						</div>
					</div>
				</div> -->
			</div>

			<div class="h30"></div>
			<!-- 버튼 -->
			<div class="btn_box">
				<ul>
					<li><a class="btn btn-blue submit" id="join" type="button">가입하기</a></li>
					
					<li><a class="btn btn-gray" type="button" id="cancle"
						href="javascript:if(confirm('가입을 취소하시겠습니까?')) location.href='index.do'">작성취소</a></li>
				</ul>
			</div>
		</form>
	</div>
</div>
<!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>