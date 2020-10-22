<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상단배경 -->
<section class="bgTop bgSub1 pc">
	<div class="slogan">
		<p>
            <strong>동자승 렌터카</strong>
			따라올 수 없는 압도적 1등<br>
			이제부터 렌트카 예약은 동자승렌터카입니다.
		</p>
	</div>
</section><!-- //상단배경 -->

<section class="con_wrap box">
	<!-- snb -->
	<div class="snb box pc momH">
		<h2>회원관리</h2>
		<ul>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<li><a href="joinAgree.do">회원가입</a></li>
				<li><a href="search.do">아이디/비밀번호 찾기</a></li>
			</c:when>
			<c:otherwise>
				<li><a class="logout" id="logout" href="logout.do">로그아웃</a></li>
				<li><a class="mypage" href="mypage.do">마이페이지</a></li>
			</c:otherwise>
			</c:choose>
			<li><a href="renting.do">렌트 중인 차량</a></li>
			<li><a href="agree.do">이용약관</a></li>
			<li><a href="privacy.do">개인정보취급방침</a></li>
		</ul>
	</div><!-- //snb -->