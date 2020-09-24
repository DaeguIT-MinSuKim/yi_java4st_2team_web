<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sub_member.jsp"%>
<!-- // header -->

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents search_id">
		<h3>비밀번호 찾기</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 아이디/비밀번호 찾기</div>
		
		<div class="id_wrap">
			<p>비밀번호 찾기에 사용할 본인 인증 방식을 선택하세요.</p>
			<div>
				<label><input type="radio" class="radio-inline" name="ipin_sms" value="ipin"> 아이핀 인증</label>
				<label><input type="radio" class="radio-inline" name="ipin_sms" value="sms"> 휴대폰 인증</label>
			</div>
		</div>
		<div class="btn_box">
			<a href="#void" class="btn btn-blue">다음</a>
		</div>
		
		
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>