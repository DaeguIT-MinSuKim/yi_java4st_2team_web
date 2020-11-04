<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/include/header.jsp"%>

<!-- // header -->
<script>
	$(function() {
		$("#leave").on("click", function() {
			
			form1=document.outFrm;
		
			if (!form1.passwd.value) {
				alert("비밀번호를 입력하세요.");
				form1.passwd.focus();
				return;
			}
		
			if (!form1.member_out_reason.value) {
				alert("탈퇴사유를 선택하세요.");
				form1.member_out_reason.focus();
				return;
			}
			
			if (!form1.content.value) {
				alert("남기고 싶은 말을 입력하세요.");
				form1.content.focus();
				return;
			}
		
			if (!confirm("회원탈퇴를 하시겠습니까?")) {
				return;
			} else {
				var leaveMember = {
					id: $("#id").val(),
					pwd: $("#hidden_passwd").val(),
					gender: $("#hidden_gender").val(),
					birth: $("#hidden_birth").val(),
					name: $("#hidden_name").val(),
					tel: $("#hidden_tel").val(),
					li_class: $("#hidden_li_class").val(),
					li_number: $("#hidden_li_number").val(),
					li_number: $("#hidden_li_number").val(),
					email: $("#hidden_email").val(),
					address: $("#hidden_address").val(),
					reason: $("#reason").val(),
					content: $("#contents").val()
				};
				
				$.ajax({
					type : "post",
					url : "leave.do",
					cache : false,
					data : JSON.stringify(leaveMember),
					complete : function(data) {
						alert("탈퇴 되었습니다.");
						window.location.href = "logout.do";
					}
					
				});
				
			}
			
		});
		
	});
</script>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box out">
	<div class="contents">
		<h3>회원탈퇴</h3>
		<div class="location pc">HOME <span>></span> 회원정보 <span>></span> 회원탈퇴</div>
		<form class="form-horizontal" role="form" name="outFrm" method="post"
			action="" onsubmit="return false;" enctype="multipart/form-data">
		<input type="hidden" name="mode" value="memberEnd">
			<div class="join">
				<div class="msg_box pc">
					<i class="msg"></i>
					<p>회원탈퇴 시, 기존에 가입 하셨던 ID로 재가입이 불가능 합니다.</p>
					<div class="h30"></div>
				</div>
	
					<div class="title">탈퇴확인</div>
	
					<div class="form-group">
						<label class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="id" value="${loginUser.id}" disabled>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="passwd">
							<input type="hidden" name="hidden_passwd" id="hidden_passwd" value="leave">
						</div>
					</div>
					
					<input type="hidden" name="hidden_gender" id="hidden_gender" value="X">
					<input type="hidden" name="hidden_birth" id="hidden_birth" value="0001-01-01">
					<input type="hidden" name="hidden_name" id="hidden_name" value="탈퇴">
					<input type="hidden" name="hidden_tel" id="hidden_tel" value="탈퇴">
					<input type="hidden" name="hidden_li_class" id="hidden_li_class" value="탈퇴">
					<input type="hidden" name="hidden_li_number" id="hidden_li_number" value="탈퇴">
					<input type="hidden" name="hidden_email" id="hidden_email" value="탈퇴">
					<input type="hidden" name="hidden_address" id="hidden_address" value="탈퇴">
				
					<div class="form-group">
						<label class="col-sm-2 control-label">탈퇴사유</label>
						<div class="col-sm-10 divinner">
	                        <select class="selectpicker show-tick form-control" name="member_out_reason" id="reason">
								<option value="">-선택-</option>
								<option value="서비스불만">서비스불만</option>
								<option value="응대불친절">응대불친절</option>
								<option value="복잡한 절차">복잡한 절차</option>
								<option value="잦은 시스템 에러">잦은 시스템 에러</option>
								<option value="개인정보 유출 우려">개인정보 유출 우려</option>
								<option value="실질적인 혜택이 없음">실질적인 혜택이 없음</option>
								<option value="메일이 너무 많아짐">메일이 너무 많아짐</option>
								<option value="기타">기타</option>
	                        </select>
						</div>
					</div>
					
					<div class="form-group cal_Box">
						<label class="col-sm-2 control-label">남기고 싶은 말</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="contents" rows="10" name="content"></textarea>
						</div>
					</div>
			</div>
	
			<!-- 버튼 -->
			<div class="btn_box">
				<ul>
					<li><a class="btn btn-black" type="submit" id="leave">탈퇴완료</a></li>
					<li><a class="btn btn-gray" href="index.do">탈퇴취소</a></li>
				</ul>
			</div>
		</form>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>