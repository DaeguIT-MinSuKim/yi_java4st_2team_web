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
			function idok() {
				opener.frmName.member_id.value="${id}";
				opener.frmName.hidden_id.value="${id}";
				self.close();
			}
		</script>
		
		<script>
			function idcheck() {
		
				// 아이디 조합 체크
				var NUMBER = "1234567890";
				var SALPHA = "abcdefghijklmnopqrstuvwxyz";
				var ALPHA = SALPHA + NUMBER;
		 
				if (!document.getElementsByName("id")[0].value) {
					alert("아이디를 입력하세요");
					document.getElementsByName("id")[0].focus();
					return;
				}
				
				if (document.getElementsByName("id")[0].value.length < 6
						|| document.getElementsByName("id")[0].value.length > 20) {
					window.alert("아이디는 영문 소문자와 숫자 조합으로 6자 ~ 20자 이하입니다");
					document.getElementsByName("id")[0].focus();
					return;
				}
				
				if (!TypeCheck(document.getElementsByName("id")[0].value, ALPHA)) {
					window.alert("아이디는 영문 소문자와 숫자 조합으로 사용할 수 있습니다");
					document.getElementsByName("id")[0].focus();
					return;
				}
				
				if (!TypeCheck(document.getElementsByName("id")[0].value, NUMBER) == false) {
					window.alert("아이디는 숫자만으로 사용할 수 없습니다");
					document.getElementsByName("id")[0].focus();
					return;
				}
				
				if (!TypeCheck(document.getElementsByName("id")[0].value, SALPHA) == false) {
					window.alert("아이디는 영문만으로 사용할 수 없습니다");
					document.getElementsByName("id")[0].focus();
					return;
				}
				
				opener.formm.id.value="${id}";
					
			}
		</script>
	</head>
	
	<body>
		<div class="contents_box padLeft0">
			<div class="logincontainer-fluid_box page_mypage">
			<form action="joinIdCheck.do" method="post" name="formm" style="margin-right: 0">
			<div class="col-sm-10 divinner">
				<label class="col-sm-2 control-label" style="margin-top: 20px">아이디</label>
				<p style="text-align: center;">영문 소문자, 숫자를 혼합하여 6 ~ 20자까지 입력 가능합니다.</p>
				<div class="col-xs-9">
				<input id="id" type="text" name="id">
				</div>
				<div class="col-xs-3">
					<input class="btn btn-normal" id="chkid" value="검색" type="submit" onclick="idcheck(); return false;">
				</div>
				<div style="margin-top: 80px">
					<c:choose>
						<c:when test="${getId.getId().equals(id)}">
							<div style="font-style: italic; text-align: center;">
								<h4>${id}</h4> 이미 사용중인 ID입니다.
							</div>
						</c:when>
						
						<c:otherwise>
							<div style="font-style: italic; text-align: center;">
								<h4>${id}</h4> 사용 가능한 ID입니다.
							</div>
							<div class="btn_box">
								<a style="margin-top: 10px" type="button" class="btn btn-blue " onclick="idok()">사용</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			</form>
			</div>
		</div>
	</body>
</html>