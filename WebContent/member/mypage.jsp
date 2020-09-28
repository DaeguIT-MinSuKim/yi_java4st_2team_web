<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>마이페이지</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 마이페이지</div>
		
        <div class=" logincontainer-fluid_box page_mypage">
        	<div class="rent_empty">
				<div class="noImg"><img src="./images/member/norent.png" alt=""></div>
				<p>진행중인 렌트 내역이 없습니다 :)</p>
				<span>
					지금 원하는 렌트카 빌리고<br>
					신나게 떠나볼까요?
				</span>
				<a href="rent.do" class="btn-carmore">렌트하러 가기</a>
				<a href="javascript:;" class="btn-underline btn_nonmember">비회원 예약조회</a>
			</div>
		</div>
	</div>
</div><!-- //컨텐츠 -->


<div class="popup_nonmember">
	<div class="con">
		<div class="top">
			<p class="title">비회원 예약조회</p>
			<a href="javascript:;" class="popup_close_common">X</a>
		</div>
		<div class="btm">
			<p class="title">예약정보 입력</p>
			<label>운전자 이름</label>
			<input type="text" placeholder="성명을 입력해주세요">
		</div>
	</div>
	<div class="bg"></div>
</div>

<%@ include file="/include/footer.jsp"%>