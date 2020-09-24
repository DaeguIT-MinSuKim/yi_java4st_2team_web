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
	<link  type="text/css" href="./style/ebi.slider.css" rel="stylesheet">
	<link  type="text/css" href="./style/main.css" rel="stylesheet">
	<link  type="text/css" href="./style/layout.css" rel="stylesheet">
	<link  type="text/css" href="./style/program.css" rel="stylesheet">
	<link  type="text/css" href="./style/design.css" rel="stylesheet">
	<link  media="print" type="text/css" href="./style/bootstrap.print.min.css" rel="stylesheet"><!-- 프린트대응 -->

	<script type="text/javascript" src="./script/jquery.1.12.0.min.js"></script>
	<script type="text/javascript" src="./script/bootstrap.3.3.6.min.js"></script>
	<script type="text/javascript" src="./script/smoothscroll.js"></script>
	<script type="text/javascript" src="./script/bootstrap-select.js"></script>
	<script type="text/javascript" src="./script/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="./script/gnb.type1.js"></script>
	<script type="text/javascript" src="./script/default.js"></script>
	<script type="text/javascript" src="./script/script.js"></script>

	<!--다음 도로명 주소 API START-->
	<!--<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!--다음 도로명 주소 API END-->

	<!--[if lt IE 9]>
		<link href="./style/ie.warning.css" rel="stylesheet" type="text/css">
	<![endif]-->

	<!-- 트랜지션 디폴트 세팅 -->
	<script type="text/javascript">
	$(window).load(function(){
		$(".img, .img *, a, a *").css(
			"transition","all .1s linear",
			"-webkit-transition","all .1s linear",
			"-moz-transition","all .1s linear"
		);
	});
	</script>		
</head>

<body>
<header>
	<div class="head">
		<div class="wrap">
			<h1><a href="./main/main.jsp"><img src="./images/common/logo.jpg" alt="판교노인종합복지관" title="판교노인종합복지관"></a></h1>
			<div class="side">
				<ul>
					<li class="home"><a href="./main/main.jsp">HOME</a></li>
					<li><a class="login" href="./member/login.jsp"><span>로그인</span></a></li>
					<li><a class="join" href="./member/join_agree.jsp">회원가입</a></li>
					<li><a class="join" href="#">관리자</a></li>

			<!-- 로그인 후 
					<li><a class="logout" href="./member/usrlogout.jsp"><span>로그아웃</span></a></li>
					<li><a class="join" href="./mypage/modify_before.jsp">마이페이지</a></li>
			-->
				</ul>
			</div>


			<a class="gnbView mobile" href="#void" title="전체메뉴보기"></a>
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
					<li>
						<a href="./intro/greeting.jsp">기관소개</a>
						<ul>
							<li><a href="./intro/greeting.jsp"><span><img src="./images/common/intro_greeting_off.png" alt="관장 인사말"></span>관장 인사말</a></li>
							<li><a href="./intro/mission.jsp"><span><img src="./images/common/intro_mission_off.png" alt="미션 및 비전"></span>미션 및 비전</a></li>
							<li><a href="./intro/manage.jsp"><span><img src="./images/common/intro_manage_off.png" alt="운영방향"></span>운영방향</a></li>
							<li><a href="./intro/juridical.jsp"><span><img src="./images/common/intro_juridical_off.png" alt="법인소개"></span>법인소개</a></li>
							<li><a href="./intro/present.jsp"><span><img src="./images/common/intro_present_off.png" alt="기관현황"></span>기관현황</a></li>
							<li><a href="./intro/staff.jsp"><span><img src="./images/common/intro_staff_off.png" alt="조직도"></span>조직도</a></li>
							<li><a href="./intro/location.jsp"><span><img src="./images/common/intro_location_off.png" alt="오시는길"></span>오시는길</a></li>
						</ul>
					</li>
					<li>
						<a href="./guide/join_guide.jsp">이용안내</a>
						<ul>
							<li><a href="./guide/join_guide.jsp"><span><img src="./images/common/guide_join_off.png" alt=""></span>회원가입</a></li>
							<li><a href="./guide/lecture.jsp"><span><img src="./images/common/guide_lecture_off.png" alt=""></span>수강안내</a></li>
							<li><a href="./guide/shuttle.jsp"><span><img src="./images/common/guide_shuttle_off.png" alt=""></span>셔틀버스 운행</a></li>
							<li><a href="./guide/menu.jsp"><span><img src="./images/common/guide_menu_off.png" alt=""></span>오늘의 메뉴</a></li>
							<li><a href="./guide/visit.jsp"><span><img src="./images/common/guide_visit_off.png" alt=""></span>기관방문</a></li>
						</ul>
					</li>
					<li>
						<a href="./pro/rights.jsp">프로그램</a>
						<ul>
							<li><a href="./pro/rights.jsp"><span><img src="./images/common/pro_rights_off.png" alt=""></span>상담권익</a></li>
							<li><a href="./pro/health.jsp"><span><img src="./images/common/pro_health_off.png" alt=""></span>건강복지</a></li>
							<li><a href="./pro/edu.jsp"><span><img src="./images/common/pro_edu_off.png" alt=""></span>평생교육</a></li>
							<li><a href="./pro/society_edu.jsp"><span><img src="./images/common/pro_society_off.png" alt=""></span>사회체육</a></li>
							<li><a href="./pro/nutrition.jsp"><span><img src="./images/common/pro_nutrition_off.png" alt=""></span>영양지원</a></li>
							<li><a href="./pro/apply.jsp"><span><img src="./images/common/pro_apply_off.png" alt=""></span>프로그램 신청</a></li>
						</ul>
					</li>
					<li>
						<a href="./share/protect.jsp">공유복지</a>
						<ul>
							<li><a href="./share/protect.jsp"><span><img src="./images/common/share_protect_off.png" alt=""></span>주간보호</a></li>
							<li><a href="./share/research.jsp"><span><img src="./images/common/share_research_off.png" alt=""></span>조사연구</a></li>
							<li><a href="./share/convenience.jsp"><span><img src="./images/common/share_convenience_off.png" alt=""></span>편의시설</a></li>
							<li><a href="./share/promotion.jsp"><span><img src="./images/common/share_promotion_off.png" alt=""></span>홍보출판</a></li>
						</ul>
					</li>
					<li>
						<a href="./support/service.jsp">자원봉사 및 후원</a>
						<ul>
							<li><a href="./support/service.jsp"><span><img src="./images/common/support_service_off.png" alt=""></span>자원봉사</a></li>
							<li><a href="./support/support.jsp"><span><img src="./images/common/support_support_off.png" alt=""></span>후원</a></li>
						</ul>
					</li>
					<li>
						<a href="./board_notice01/list.jsp?tn=board_notice01&G_state=Y">판교이야기</a>
						<ul>
							<li><a href="./board_notice01/list.jsp?tn=board_notice01&G_state=Y"><span><img src="./images/common/board_notice01_off.png" alt=""></span>전체 알림</a></li>
							<li><a href="./board_community01/list.jsp?tn=board_community01&G_state=Y"><span><img src="./images/common/board_community01_off.png" alt=""></span>자유게시판</a></li>
							<li><a href="./board_elderly01/list.jsp?tn=board_elderly01&G_state=Y"><span><img src="./images/common/board_elderly01_off.png" alt=""></span>어르신게시판</a></li>
							<li><a href="./board_gallery01/list.jsp?tn=board_gallery01&G_state=Y"><span><img src="./images/common/board_gallery01_off.png" alt=""></span>갤러리</a></li>
							<li><a href="./board_press01/list.jsp?tn=board_press01&G_state=Y"><span><img src="./images/common/board_press01_off.png" alt=""></span>언론속의 판교</a></li>
							<li><a href="./board_panjeon01/list.jsp?tn=board_panjeon01&G_state=Y"><span><img src="./images/common/board_panjeon01_off.png" alt=""></span>판교판전</a></li>
						</ul>
					</li>
					<li class="mobile" data-device="mobile">
						<a href="./member/login.jsp">회원관리</a>
						<ul>
							<li><a href="./member/login.jsp">로그인</a></li>
							<li><a href="./member/search.jsp">아이디/비밀번호찾기</a></li>
							<li><a href="./member/join_agree.jsp">회원가입</a></li>
							<li><a href="./member/agree.jsp">이용약관</a></li>
							<li><a href="./member/privacy.jsp">개인정보취급방침</a></li>
						</ul>
					</li>
<!-- 로그인 후 
					<li <?=$bMenu_200?> class="mobile" data-device="mobile">
						<a href="./mypage/modify.jsp">마이페이지</a>
						<ul>
							<li><a href="./mypage/modify_before.jsp">개인정보수정</a></li>
							<li><a href="./member/agree.jsp">이용약관</a></li>
							<li><a href="./member/privacy.jsp">개인정보취급방침</a></li>
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
			<a href="#void" class="gnbClose"></a>
			<a class="home" href="./main/main.jsp">HOME</a>
		</div>
	</nav>
</header><!-- // header -->