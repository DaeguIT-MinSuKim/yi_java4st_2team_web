<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko" style="overflow-x:auto">
<head>
	<title>동자승 렌터카 관리자</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum_scale=1, minimum_scale=1.0 ,width=device-width, target_densitydpi=device-dpi">
	<meta name="robots" content="">
	<meta name="subject" content="">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<link rel="shortcut icon" href="./images/common/favi.ico">

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
	<link  type="text/css" href="./style/admin.css" rel="stylesheet">
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

	<!-- 카카오지도 API -->	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ef72da273f6433ac6899e8cec9ac49b"></script>
	<script type="text/javascript" src="./script/kakaoMap_init.js"></script>
	
  	<!-- 슬라이드 플러그인 -->
 	<link  type="text/css" href="./style/swiper.min.css" rel="stylesheet">
   	<script type="text/javascript" src="./script/swiper.min.js"></script>

	<!-- ck에디터 -->
	<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="./ckeditor/ckeditor_init.js"></script>

	<!-- 채널톡 -->
	<script type="text/javascript" src="./script/channelTalk.js"></script>

	<!-- 트랜지션 디폴트 세팅 -->
	<script type="text/javascript">
	$(window).load(function(){
		$(".img, .img *, a, a *").css(
			"transition","all .1s linear",
			"-webkit-transition","all .1s linear",
			"-moz-transition","all .1s linear"
		);
	});
	
	$(function() {
		$('#logout').on("click", function() {
			if (confirm("${sessionScope.loginUser.name}님 로그아웃 하시겠습니까?") == true) {	// 확인
				location.href="logout.do";
		    } else {	// 취소
		    	return;
		    }
			
		});
	});
	</script>
</head>

<body style="min-width:1200px; overflow-x:auto">
<header id="admin_header">
	<h1><a href="index.do" class="admin_logo"><img src="./images/common/logo_w.png" alt="동자승렌터카" title="동자승렌터카"></a></h1>
	<ul>
		<li>관리자님</li>
		<li><a href="#">로그아웃</a></li>
		<li><a href="index.do">HOME</a>
	</ul>
</header><!-- // header -->

<nav id="admin_gnb">
	<ul>
		<li><a href="adminRent.do">단기렌트 관리</a></li>
		<li><a href="#">차량관리</a>
			<ul>
				<li><a href="carList.do">차량정보</a></li>
				<li><a href="brandList.do">브랜드</a></li>
				<li><a href="kindList.do">차량분류</a></li>
			</ul>
		</li>
		<li><a href="#">대여관리</a>
			<ul>
				<li><a href="#">보험</a></li>
				<li><a href="#">옵션</a></li>
			</ul>
		</li>
		<li><a href="#">고객관리</a>
			<ul>
				<li><a href="adminMemberList.do">고객목록</a></li>
				<li><a href="adminBlackList.do">블랙리스트</a></li>
			</ul>
		</li>
		<li><a href="adminLongRent.do">장기렌트 관리</a></li>
		<li><a href="adminNotice.do">공지사항</a></li>
		<li><a href="adminEvent.do">이벤트</a></li>
		<li><a href="#">성과현황</a>
			<ul>
				<li><a href="#">회원</a></li>
				<li><a href="#">대여</a></li>
				<li><a href="longRentChart.do">장기렌트</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</li>
	</ul>
</nav>