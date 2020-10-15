<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>


<!--
if( 로그인했으면 ){
	include "/include/sub_mypage.jsp";
}else{
	include "/include/sub_member.jsp";
}
-->

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>이용약관</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 이용약관</div>
		
		<div class="agree box">		
			<%@ include file="/include/agree_inner.jsp"%>
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>