<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<input type="hidden" id="loginUser" name="loginUser" value="${loginUser.getId()}">

<div class="main_wrap box">
	<div id="mVisual">
		<div class="visu_slide">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="img_box" style="background-image:url(images/main/m_visual1.jpg)"></div>
					<div class="txt_box">
						<p class="t1">대구 렌터카 전문점</p>
						<p class="t2">DJS RENTCAR</p>
						<p class="t3">
							따라올 수 없는 압도적 1등<br>
							이제부터 렌터카 예약은 동자승렌터카입니다.
						</p>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="img_box" style="background-image:url(images/main/m_visual2.jpg)"></div>
					<div class="txt_box">
						<p class="t1">국산에서 수입차까지</p>
						<p class="t2">대한민국 최저가 !</p>
						<p class="t3">
							어떤 차량을 원하든<br>
							동자승에서는 최저금액이 된다 !						
						</p>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="img_box" style="background-image:url(images/main/m_visual3.jpg)"></div>
					<div class="txt_box">
						<p class="t1">언제나 안전하고 쾌적하게</p>
						<p class="t2">최적화된 차량관리 시스템</p>
						<p class="t3">
							정기적인 차량관리 및 점검으로<br>
							깨끗한 차량만을 고집합니다.
						</p>
					</div>
				</div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>
	</div><!-- //mVisual -->
	
	<div id="mAdvice">
		<div>
			<div class="txt_box">
				<div>
					<h2>장기렌트<br>빠른상담신청</h2>
					<p class="number">053-123-4567</p>
					<p class="time">상담시간 : 평일 <span>09:00~18:00</span></p>
					<p class="t1">※ 휴일 및 야간에는 빠른 상담신청을 하시면 <br>확인 후 순차적으로 연락드립니다.</p>
				</div>
			</div>
			<div class="form_box">
				<form name="main_longrent" action="longRentWriteMain.do" method="get">
					<div class="tit">
						<h2>장기렌트 빠른상담신청</h2>
					</div>
					<ul>
						<li>
							<label>이름</label>
							<input type="text" placeholder="성함을 기재해주세요" class="f_input" name="m_name">
						</li>
						<li>
							<label>연락처</label>
							<input type="text" placeholder="연락처를 기재해주세요" class="f_input" name="m_tel">
						</li>
						<li class="btn"><input type="submit" onclick="MPopup(); return false;" class="btn_submit" value="빠른상담"></li>
					</ul>
					<p class="privacy"><input type="checkbox"id="checkboxMainLR"><a href="javascript:;" class="btn_mainPrivacy">개인정보 처리방침</a>에 동의합니다.</p>
				</form>
			</div>
		</div>
	</div><!-- //mAdvice -->
	
	<div id="mProduct">
		<p class="t1"><span class="point1">동자승</span> 이 달의 핫 <span class="point2">SALE 이벤트!</span></p>
		<p class="t2">"고민할 시간에 예약하자"</p>
		<p class="t3">인기차종<br><span>빠른출고!</span></p>
	
		<ul>
			<c:forEach items="${carList}" var="car" end="8">
				<li><a href="javascript:;" class="btn_mainRent">
					<input type="hidden" name="carNo" value="${car.no}" class="carNo">
					<div class="img_box">
						<p class="name">${car.name}</p>
						<div class="img"><img src="./images/rentcar/${car.kind.code}/${car.image}"></div>
					</div>
					<p class="price"><span>24H기준</span><fmt:formatNumber value="${car.kind.fare}"/>원</p>
				</a></li>
			</c:forEach>
		</ul>
		<p class="t4">상단 차량 포함 모든 차종 <span>장기렌트 상담</span> 가능합니다.</p>
	</div>
	
	<div id="mBanner">
		<div>
			<h2>손해보험사 지정점</h2>
			<p>휠매니아는 손해보험사 지정점으로 국산차 및 수입차를 취급합니다.<br>
			휠 수리·도장 폴리싱 굴절·용접 중고 휠 매입·판매 다이아몬드컷팅 복원
		</p></div>
	</div><!-- //mBanner -->
	
	
	<div id="mBoard" class="s-inner">
		<div class="wow fadeInUp">
			<div class="tit">
				<h2>공지사항</h2>
				<a href="notice.do">더보기</a>
			</div>
			<ul>
				<c:forEach items="${noticeList}" var="notice" end="3">
					<li><a href="noticeView.do?no=${notice.no}">${notice.title }</a></li>
				</c:forEach>
				<li class="no_board tc">등록된 글이 없습니다.</li>
			</ul>
		</div>
		<div class="wow fadeInUp" data-wow-delay="0.2s">
			<div class="tit">
				<h2>이벤트</h2>
				<a href="event.do">더보기</a>
			</div>
			<ul class="online">
				<c:forEach items="${eventList}" var="event" end="4">
					<li><a href="eventView.do?code=${event.eventCode}">${event.name}</a></li>
				</c:forEach>
				<li class="no_board tc">등록된 글이 없습니다.</li>
			</ul>
		</div>
	</div><!-- //mBoard -->
</div>
<!-- </section> -->

<script>
	$(function(){
		$("#mBoard ul").each(function(){
			console.log($(this).children("li").length)
			if($(this).children("li").length == 1){
				$(this).children("li").hide()
				$(this).find(".no_board").show();
			}
		})
	})
</script>

<script>
	var swiper = new Swiper('.visu_slide', {
		effect: 'fade',
		autoplay: {
			delay: 8000,
			disableOnInteraction: false,
		},
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
</script>


<div class="popup_common popup_mainPrivacy">
	<div class="con">
		<div class="top">
			<div class="title">
				개인정보 처리방침 정보
				<a href="javascript:;" class="popup_close_common">
					<img src="./images/member/popup_close.svg" alt="팝업창 닫기">
				</a>
			</div>
		</div>
		<div class="btm">
			<div class="privacyBox">
				<%@ include file="/include/privacy_inner.jsp"%>
			</div>
		</div>
	</div>
	<div class="bg popup_close_common"></div>
</div>

<div class="popup_common popup_mainRent">
	<div class="con">
		<div class="top">
			<div class="title">
				대여날짜 선택
				<a href="javascript:;" class="popup_close_common">
					<img src="./images/member/popup_close.svg" alt="팝업창 닫기">
				</a>
			</div>
		</div>
		<div class="btm">
			<form class="mainCalendarBox">
				<input type="hidden" name="carNoPopup" class="carNoPopup">
				<input type="text" class="form-control calendar prev" readonly placeholder="렌트카 대여일 선택"> 
				<select class="hours prev">
					<!-- script.js/rent_optionHours(); 메서드 사용 -->
				</select>
				 <span>-</span> 
				 <input type="text" class="form-control calendar next" readonly placeholder="렌트카 반납일 선택">
				 <select class="hours next">
					<!-- script.js/rent_optionHours(); 메서드 사용 -->
				</select>
				<a href="javascript:;" class="btn btn-blue btn_mainCarRent">예약</a>
			</form>
		</div>
	</div>
	<div class="bg popup_close_common"></div>
</div>


<%@ include file="/include/footer.jsp"%>