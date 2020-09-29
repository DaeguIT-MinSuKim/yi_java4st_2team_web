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
        	<div class="rent_list">
        		차량 들어간 정보리스트 ~
	        	<a href="javascript:;" class="btn-underline btn_nonmember">비회원 예약조회</a>
        	</div>
        
        
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
			<a href="javascript:;" class="popup_close_common"><img src="./images/member/popup_close.svg" alt="닫기"></a>
		</div>
		<div class="btm">
			<h4 class="title">예약정보 입력</h4>
			<p>운전자 이름</p>
			<input type="text" name="driverName" placeholder="성명을 입력해주세요">
			<p>주민등록번호</p>
			<div class="regiBox">
				<div class="left">
					<input type="number" name="resiNum1" placeholder="생년월일 6자리"  maxLength="6" oninput="maxLengthCheck(this)">
				</div>
				<span>-</span>
				<div class="right">
					<input type="password" name="resiNum2" maxLength="1">
					<span>******</span>
				</div>
			</div>
			<p>예약번호</p>
			<input type="number" name="rentNum">
			
			<div class="h20"></div>
			
			<a href="nonmember.do" class="btn-carmore">조회</a>
		</div>
	</div>
	<div class="bg popup_close_common"></div>
</div>

<%@ include file="/include/footer.jsp"%>