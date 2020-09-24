<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<!-- // header -->

<!--
if( 로그인했으면 ){
	include "/include/sub_mypage.jsp";
}else{
	include "/include/sub_member.jsp";
}
-->

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>개인정보취급방침</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 개인정보취급방침</div>
		
		<div class="container-fluid col-xs-12 privacy">	
			<%@ include file="/include/privacy_inner.jsp"%>	
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>