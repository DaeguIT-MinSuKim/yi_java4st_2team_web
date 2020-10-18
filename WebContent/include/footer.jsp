<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 하단 -->
<body>
	<footer>
		<div class="wrap box">
			<ul class="fnb col-xs-12">
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<li><a href="joinAgree.do">회원가입</a></li>
					<li><a href="search.do">아이디/비밀번호 찾기</a></li>
				</c:when>
				<c:otherwise>
					<li><a class="logout" style="cursor:pointer;" id="logout" href="logout.do">로그아웃</a></li>
					<li><a class="mypage" href="mypage.do">마이페이지</a></li>
				</c:otherwise>
				</c:choose>
				<li><a href="agree.do">이용약관</a></li>
				<li><a href="privacy.do">개인정보처리방침</a></li>
				<li><a href="preventEmail.do">이메일집단수집거부</a></li>
			</ul>
			<div class="clear"></div>
			<address class="box col-md-8 col-sm-12 col-xs-12">
				<div class="col-xs-12 address">
					<strong>동자승 렌터카</strong>			
					<p>Copyright © 2020 All rights reserved by  김대현, 오수정, 문중희, 이승은, 김창동.</p>
				</div>
			</address>
		</div>
	</footer>

	<!-- 위로 올리기 -->
	<a id="gotop" href="javascript:;" title="위로"></a>

	<div id="ie-warning">
		<p><span>본 사이트는<br>Internet Explorer 9 이하 버전을<br>지원하지 않습니다.</span><br>Internet Explorer 10 이상으로 업데이트 하거나<br>크롬, 파이어폭스, 오페라, 사파리 최신 브라우저를 이용해 주십시오.<br>불편을 드려 죄송합니다.</p>
		<a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank">Internet Explorer Update</a>
	</div>
</body>
</html>