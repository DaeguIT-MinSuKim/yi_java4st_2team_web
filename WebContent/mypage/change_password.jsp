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
		<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum_scale=1, minimum_scale=1.0 ,width=device-width, target_densitydpi=device-dpi">
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
				
		<script>
			$(function() {
				$("#changePass").on("click", function() {
					window.alert("비밀번호가 변경 되었습니다.");
					request.setAttribute("message", "비밀번호가 변경되었습니다.");
					self.close();
				});
			});
		</script>
		
		<script type="text/javascript">
			function exit() {
				self.close();
			}
		</script>

		<script type="text/javascript">
			$(function changePass() {
				
					// 비밀번호 조합 체크
					var regMust1 = /[a-zA-Z0-9_]/;
					var regMust2 = /[^a-zA-Z0-9_]/;
								
					if (!document.getElementsByName("new_passwd1")[0].value) {
						window.alert("변경할 비밀번호를 입력하세요.");
						document.getElementsByName("new_passwd1")[0].focus();
						return;
					}
					
					/* if (document.getElementsByName("new_passwd1")[0].value.length < 6
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
					} */
					
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
					
					if (changePass()) {
						var changePass = {
							id : ${param.id},
							address : $('#new_passwd2').val()
						};
						
						$.ajax({
							type : "post",
							url : "modify.do"
							cache : false,
							data : JSON.stringify(changePass),
							complete : function(data) {
								alert("수정 되었습니다.");
								window.location.href = "joinEnd.do";
							}
						
						});
						
					}
					//self.close();
				
			});
		</script>
	</head>
	
	<body>
		<div class="contents_box padLeft0">
			<div class="logincontainer-fluid_box page_mypage">
			<form action="changePassword.do" method="post" name="formm" style="margin-right: 0">
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
					<input type="submit" id="changePass"
						class="btn btn-blue" value="변경" onclick="changePass(); return false;">
				</li>
				<!-- <li>
					<a type="button" id="changePass"
						class="btn btn-blue" onclick="changePass(); return false;">변경</a>
				</li> -->
				<li>
					<a type="submit" id="changePass"
						class="btn btn-blue" onclick="exit(); return false;">닫기</a>
				</li>
			</ul>
			</div>

			</form>
			</div>
		</div>
	</body>
</html>