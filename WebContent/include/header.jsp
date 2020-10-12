<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>동자승 렌터카</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum_scale=1, minimum_scale=1.0 ,width=device-width, target_densitydpi=device-dpi">
	<meta name="robots" content="">
	<meta name="subject" content="">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">

	<link  type="text/css" href="./style/bootstrap.3.3.6.min.css" rel="stylesheet">
	<link  type="text/css" href="./style/bootstrap-select.css" rel="stylesheet">
	<link  type="text/css" href="./style/common.css" rel="stylesheet">
	<link  type="text/css" href="./style/common-ani.css" rel="stylesheet">
	<link  type="text/css" href="./style/main.css" rel="stylesheet">
	<link  type="text/css" href="./style/layout.css" rel="stylesheet">
	<link  type="text/css" href="./style/program.css" rel="stylesheet">
	<link  type="text/css" href="./style/design.css" rel="stylesheet">
	<link  type="text/css" href="./style/member.css" rel="stylesheet">
	<link  type="text/css" href="./style/longrent.css" rel="stylesheet">
	<link  type="text/css" href="./style/event.css" rel="stylesheet">
	<link  type="text/css" href="./style/button.css" rel="stylesheet">
	<link  type="text/css" href="./style/rent.css" rel="stylesheet">
	<link  media="print" type="text/css" href="./style/bootstrap.print.min.css" rel="stylesheet"><!-- 프린트대응 -->

	<script type="text/javascript" src="./script/jquery.1.12.0.min.js"></script>
	<script type="text/javascript" src="./script/bootstrap.3.3.6.min.js"></script>
	<script type="text/javascript" src="./script/bootstrap-select.js"></script>
	<script type="text/javascript" src="./script/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="./script/gnb.type1.js"></script>
	<script type="text/javascript" src="./script/default.js"></script>
	<script type="text/javascript" src="./script/script.js"></script>
	<script type="text/javascript" src="./script/ani_popup.js"></script>
	<script type="text/javascript" src="./script/form.js"></script>
	<script type="text/javascript" src="./script/join.js"></script>
	
	
	<!-- 메인 슬라이더 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css?ver=191202">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/v4-shims.css?ver=191202">

	<!-- 달력 -->
	<script type="text/javascript" src="./script/jquery-ui.1.10.1.js"></script>
	<script type="text/javascript" src="./script/jquery.calendar.js"></script>
	<link  type="text/css" href="./style/jquery.ui.css" rel="stylesheet">

	<!--다음 도로명 주소 API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- IE 10까지만 접속가능하게 작업. 9부터 접근 불가 메시지창 띄움 -->
	<!--[if lt IE 10]>
		<link href="./style/ie.warning.css" rel="stylesheet" type="text/css">
	<![endif]-->
	
  	<!-- 슬라이드 플러그인 -->
 	<link  type="text/css" href="./style/swiper.min.css" rel="stylesheet">
   	<script type="text/javascript" src="./script/swiper.min.js"></script>

	<!-- 트랜지션 디폴트 세팅 -->
	<script type="text/javascript">
	$(window).load(function(){
		$(".img, .img *, a, a *").css(
			"transition","all .1s linear",
			"-webkit-transition","all .1s linear",
			"-moz-transition","all .1s linear"
		);
	});
	
	/* 채널톡 연결 */
	<!-- Channel Plugin Scripts -->
	 (function() {
	   var w = window;
	   if (w.ChannelIO) {
	     return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	   }
	   var ch = function() {
	     ch.c(arguments);
	   };
	   ch.q = [];
	   ch.c = function(args) {
	     ch.q.push(args);
	   };
	   w.ChannelIO = ch;
	   function l() {
	     if (w.ChannelIOInitialized) {
	       return;
	     }
	     w.ChannelIOInitialized = true;
	     var s = document.createElement('script');
	     s.type = 'text/javascript';
	     s.async = true;
	     s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	     s.charset = 'UTF-8';
	     var x = document.getElementsByTagName('script')[0];
	     x.parentNode.insertBefore(s, x);
	   }
	   if (document.readyState === 'complete') {
	     l();
	   } else if (window.attachEvent) {
	     window.attachEvent('onload', l);
	   } else {
	     window.addEventListener('DOMContentLoaded', l, false);
	     window.addEventListener('load', l, false);
	   }
	 })();
	 ChannelIO('boot', {
	   "pluginKey": "31509d5e-8324-4195-8eff-9ac8231365ba"
	 });
	<!-- End Channel Plugin -->
	</script>		
</head>

<body>
<header>
	<div class="head">
		<div class="wrap">
			<h1><a href="index.do"><img src="./images/common/logo.png" alt="동자승렌터카" title="동자승렌터카"></a></h1>
			<div class="side">
				<ul>
					<li class="home">
						<a href="index.do">HOME</a>
					</li>
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<li>
								<a class="login" href="login.do"><span>로그인</span></a>
							</li>
							<li>
								<a class="join" href="joinAgree.do">회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
	         					${sessionScope.loginUser.name}(${sessionScope.loginUser.id})님
	      					</li>
	      					<li>
	      						<a class="logout" href="logout.do"><span>로그아웃</span></a>
	      					</li>
							<li>
								<a class="mypage" href="mypage.do">마이페이지</a>
							</li>
						</c:otherwise>
					</c:choose>
					<li>
						<a class="admin" href="admin.do">관리자</a>
					</li>
				</ul>
			</div>


			<a class="gnbView mobile" href="javascript:;" title="전체메뉴보기"></a>
		</div>
	</div>

		<nav class="pc box">
			<div class="navbg pc">
				<div class="dep1"></div>
				<div class="dep2"></div>
			</div>		
			<!-- orgH:1차메뉴 높이 / maxH:최대높이 / leftgap:왼쪽에서 여백 px,% 사용가능 -->
			<div class="gnb box" data-orgH="50" data-maxH="180" data-gap="70px" data-leftPos="0">	
				<ul>
					<!-- <a class="home mobile" href="./main/main.jsp">HOME</a> -->
					<li><a href="rent.do">단기렌트</a></li>
					<li><a href="longRent.do">장기렌트</a></li>
					<li><a href="event.do">이벤트</a></li>
					<li><a href="mypage.do">마이페이지</a></li>
				
					<li class="mobile" data-device="mobile">
						<a href="./member/login.jsp">회원관리</a>
						<ul>
							<li><a href="mypage.do">마이페이지</a></li>
							<li><a href="mypage.do">렌트중인차량</a></li>
							<li><a href="login.do">로그인</a></li>
							<li><a href="search.do">아이디/비밀번호찾기</a></li>
							<li><a href="joinAgree.do">회원가입</a></li>
							<li><a href="agree.do">이용약관</a></li>
							<li><a href="privacy.do">개인정보취급방침</a></li>
						</ul>
					</li>
<!-- 로그인 후 
					<li <?=$bMenu_200?> class="mobile" data-device="mobile">
						<a href="./mypage/modify.jsp">마이페이지</a>
						<ul>
							<li><a href="./mypage/modify_before.jsp">개인정보수정</a></li>
							<li><a href="agree.do">이용약관</a></li>
							<li><a href="privacy.do">개인정보취급방침</a></li>
							<li><a href="./mypage/member_end.jsp">회원탈퇴</a></li>
						</ul>
					</li>
-->
				</ul>
			</div>
		</div><!-- //wrap -->
	</nav><!-- //nav -->

	<div class="gnbCover mobile"></div>
	<nav class="mobile box">
		<div class="closeWrap">
			<a href="javascript:;" class="gnbClose"></a>
			<a class="home" href="./main/main.jsp">HOME</a>
		</div>
	</nav>
</header><!-- // header -->