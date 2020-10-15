<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

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
					<h2>렌터카<br>빠른상담신청</h2>
					<p class="number">053-123-4567</p>
					<p class="time">상담시간 : 평일 <span>09:00~18:00</span></p>
					<p class="t1">※ 휴일 및 야간에는 빠른 상담신청을 하시면 <br>확인 후 순차적으로 연락드립니다.</p>
				</div>
			</div>
			<div class="form_box">
				<form>
					<div class="tit">
						<h2>빠른상담신청</h2>
					</div>
					<ul>
						<li>
							<label>이름</label>
							<input type="text" placeholder="성함을 기재해주세요" class="f_input">
						</li>
						<li>
							<label>연락처</label>
							<input type="text" placeholder="연락처를 기재해주세요" class="f_input">
						</li>
						<li class="btn"><button>빠른상담<br>신청하기</button></li>
					</ul>
					<p class="privacy"><input type="checkbox"> <a href="#">개인정보 취급방침</a>에 동의합니다.</p>
				</form>
			</div>
		</div>
	</div><!-- //mAdvice -->
	
	<div id="mProduct">
		<p class="t1"><span class="point1">동자승</span> 이 달의 핫 <span class="point2">SALE 이벤트!</span></p>
		<p class="t2">"고민할 시간에 예약하자"</p>
		<p class="t3">인기차종<br><span>빠른출고!</span></p>
	
		<ul>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img1.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img2.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img3.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img1.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img2.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img3.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img1.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img2.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
			<li><a href="#">
				<div class="img_box">
					<p class="name">K7</p>
					<div class="img"><img src="images/main/mProduct_img3.jpg"></div>
				</div>
				<p class="price"><span>24H기준</span>60,000원</p>
			</a></li>
		</ul>
		<p class="t4">상단 사량 포함 모은 차량 <span>장기렌트 상담</span> 가능합니다.</p>
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
				<a href="#">더보기</a>
			</div>
			<ul>
				<li><a href="#">도산한 회사 퇴직근로자라면? ‘체당금 제도’ 이용도산한 회사 퇴직근로자라면? ‘체당금 제도’ 이용</a></li>
				<li><a href="#">한진해운, 사업 청산·빚잔치에 법정관리 ‘급물살’</a></li>
				<li><a href="#">[회생파산] 최은영 前회장 경영비리에 칼빼든 법원</a></li>
				<li><a href="#">빚에 찌든 20대, ‘나홀로 파산’</a></li>
				<li><a href="#">경남기업, 재매각 본입찰 ‘0’, 회생 ‘먹구름’</a></li>
			</ul>
		</div>
		<div class="wow fadeInUp" data-wow-delay="0.2s">
			<div class="tit">
				<h2>온라인상담</h2>
				<a href="#">더보기</a>
			</div>
			<ul class="online">
				<li><a href="#">개인파산 신청자격개인파산 신청자격개인파산 신청자격개인파산 신청자격개인파산 신청자격<span class="comment">답변대기</span></a></li>
				<li><a href="#">개인회생 상담좀 부탁드립니다<span class="comment compl">답변완료</span></a></li>
				<li><a href="#">개인회생하면 회사에 알려지나요?<span class="comment compl">답변완료</span></a></li>
				<li><a href="#">개인회생 관련 상담 신청합니다.<span class="comment compl">답변완료</span></a></li>
				<li><a href="#">카드빚 회생 가능할까요?<span class="comment compl">답변완료</span></a></li>
			</ul>
		</div>
	</div><!-- //mBoard -->
</div>
<!-- </section> -->


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

<%@ include file="/include/footer.jsp"%>