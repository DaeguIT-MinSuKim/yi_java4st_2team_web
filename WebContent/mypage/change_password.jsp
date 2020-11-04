<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 중복 체크</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="./images/common/favi.ico">
		<link  type="text/css" href="./style/bootstrap.3.3.6.min.css" rel="stylesheet">
		<link  type="text/css" href="./style/bootstrap-select.css" rel="stylesheet">
		<link  type="text/css" href="./style/common.css" rel="stylesheet">
		<link  type="text/css" href="./style/common-ani.css" rel="stylesheet">
		<link  type="text/css" href="./style/main.css" rel="stylesheet">
		<link  type="text/css" href="./style/layout.css" rel="stylesheet">
		<link  type="text/css" href="./style/program.css" rel="stylesheet">
		<link  type="text/css" href="./style/design.css" rel="stylesheet">
		<link  type="text/css" href="./style/member.css" rel="stylesheet">
		<link  type="text/css" href="./style/button.css" rel="stylesheet">
		<link  media="print" type="text/css" href="./style/bootstrap.print.min.css" rel="stylesheet">
			
		<script type="text/javascript" src="./script/jquery.1.12.0.min.js"></script>
		<script type="text/javascript" src="./script/bootstrap.3.3.6.min.js"></script>
		<script type="text/javascript" src="./script/bootstrap-select.js"></script>
		<script type="text/javascript" src="./script/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="./script/gnb.type1.js"></script>
		<script type="text/javascript" src="./script/default.js"></script>
		<script type="text/javascript" src="./script/script.js"></script>
		<script type="text/javascript" src="./script/ani_popup.js"></script>
		<script type="text/javascript" src="./script/form.js"></script>
		<script type="text/javascript" src="./script/join.js"></script>
		<script type="text/javascript" src="./script/rent.js"></script>		
		
		<script>
			/* $(function() {
				$("#changePass").on("click", function() {
					window.alert("비밀번호가 변경 되었습니다.");
					request.setAttribute("message", "비밀번호가 변경되었습니다.");
					self.close();
				});
			}); */
		</script>
		
		<script type="text/javascript">

		</script>

		<script>
			$(function() {
				$("#changePass").on("click", function() {

					// 비밀번호 조합 체크
					var regMust1 = /[a-zA-Z0-9_]/;
					var regMust2 = /[^a-zA-Z0-9_]/;
								
					if (!document.getElementsByName("new_passwd1")[0].value) {
						window.alert("변경할 비밀번호를 입력하세요.");
						document.getElementsByName("new_passwd1")[0].focus();
						return;
					}
					
					if (document.getElementsByName("new_passwd1")[0].value.length < 6
							|| document.getElementsByName("new_passwd1")[0].value.length > 20) {
						window.alert("비밀번호는 6자이상 20자이하입니다.");
						document.getElementsByName("new_passwd1")[0].focus();
						return;
					}
					
					if (!regMust1.test(document.getElementsByName("new_passwd1")[0].value)
							|| !regMust2.test(document.getElementsByName("new_passwd1")[0].value)) {
						window.alert("특수문자를 하나 이상 입력하세요.");
						document.getElementsByName("new_passwd1")[0].focus();
						return;
					}
					
					if (!document.getElementsByName("new_passwd2")[0].value) {
						window.alert("변경할 비밀번호를 한번 더 입력하세요.");
						document.getElementsByName("new_passwd2")[0].focus();
						return;
					}
					
					if (document.getElementsByName("new_passwd1")[0].value != document.getElementsByName("new_passwd2")[0].value) {
						window.alert("변경할 비밀번호가 일치하지 않습니다.");
						document.getElementsByName("new_passwd2")[0].focus();
						return;
					}

					var changePass = {
						id : $('#member_id').val(),
						pwd : $('#new_passwd2').val()
					};
					
					$.ajax({
						type : "post",
						url : "changePassword.do",
						cache : false,
						data : JSON.stringify(changePass),
						complete : function(data) {
							alert("수정 되었습니다.");
							alert("비밀번호 변경으로 로그아웃 되었습니다.");
							window.location.href = "logout.do";
						}
						
					});
					window.opener.location.href = "logout.do";    //부모창 reload
					window.close();    //현재 팝업창 Close

				});

			});
		</script>
	</head>
	
	<body>
		<div class="contents_box padLeft0">
			<div class="logincontainer-fluid_box page_mypage">
			<form action="changePassword.do" method="post" name="formm" style="margin-right: 0">
			<input type="hidden" name="member_id" id="member_id" value="${loginUser.id}">
			<div class="form-group">
				<label class="col-sm-2 control-label" style="margin-top: 20px">현재 비밀번호</label>
				<div class="col-sm-10 divinner">
					<input type="password" class="form-control" maxlength="20"
						name="passwd" id="passwd">
					<p></p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">새 비밀번호</label>
				<div class="col-sm-10 divinner">
					<input type="password" class="form-control" maxlength="20"
						name="new_passwd1" id="new_passwd1">
					<p>특수문자를 하나 이상 포함하여 6 ~ 20자로 입력하십시오.</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">새 비밀번호 확인</label>
				<div class="col-sm-10 divinner">
					<input type="password" class="form-control" maxlength="20"
						name="new_passwd2" id="new_passwd2">
					<p>변경할 비밀번호를 동일하게 다시 한 번 입력하십시오.</p>
				</div>
			</div>
			
			<div style="margin-top: 20px; font-style: italic; text-align: center;"><h4>${message}</h4></div>
	
			<div class="btn_box">
			<ul>
				<li>
					<a class="btn btn-blue" type="submit" id="changePass">변경</a>
				</li>
			</ul>
			</div>

			</form>
			</div>
		</div>
	</body>
</html>