<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<script language="javascript">
function outFrmChk(){	
	form1=document.outFrm;

	if(!form1.passwd.value){
		alert("비밀번호를 입력하세요.");
		form1.passwd.focus();
		return;
	}
	if(!form1.member_out_reason.value){
		alert("탈퇴사유를 선택하세요.");
		form1.member_out_reason.focus();
		return;
	}
	if(!form1.content.value){
		alert("남기고 싶은 말을 입력하세요.");
		form1.content.focus();
		return;
	}

	if(!confirm("회원탈퇴를 하시겠습니까?")) {
		return;
	}

	form1.submit();
}
</script>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box out">
	<div class="contents">
		<h3>회원탈퇴</h3>
		<div class="location pc">HOME <span>></span> 회원정보 <span>></span> 회원탈퇴</div>
		
<form class="form-horizontal" role="form" name="outFrm" method="post" action="" onSubmit="return false;">
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
						<input type="text" class="form-control" value="" disabled>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="passwd">
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-2 control-label">탈퇴사유</label>
					<div class="col-sm-10 divinner">
                        <select class="selectpicker show-tick form-control" name="member_out_reason">
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
				<li><a class="btn btn-black" href="javascript:;" onClick="outFrmChk(); return false;">탈퇴완료</a></li>
				<li><a class="btn btn-gray" href="./modify.php">탈퇴취소</a></li>
			</ul>
		</div>
</form>

	</div>

</div><!-- //컨텐츠 -->
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>