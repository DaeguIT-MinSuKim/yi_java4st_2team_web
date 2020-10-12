<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<!-- 상단배경 -->
<section class="bgTop bgSub1 pc">
	<div class="slogan">
		<p>
			<strong>동자승 렌터카</strong> 따라올 수 없는 압도적 1등<br> 이제부터 렌트카 예약은
			동자승렌터카입니다.
		</p>
	</div>
</section>
<!-- //상단배경 -->

<section class="con_wrap box">

	<div class="contents_box out padLeft0">
		<div class="contents">
			<h3>단기렌트 차량예약</h3>
			<div class="location pc">
				HOME <span>></span> 단기렌트 <span>></span> 차량예약
			</div>
			<div class="page_listdDtl">
				<div class="col-md-7 carInfoBox">
					<div class="insertBg" data-ratioH="60">
						<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
					</div>
					<h4 class="carName">모닝</h4>
					<p class="date"><span>10/9</span> 10:00 ~ <span>10/10</span> 10:00 (24시간)</p>
					
					<hr>
						
					<form class="form-horizontal formDtl" role="form" name="frmName" method="post" action="" onsubmit="return false;" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2">보험</label>
							<div class="col-sm-10">
								<label><input type="radio" name="insurance" checked><span>일반자차</span></label>
								<label><input type="radio" name="insurance"><span>완전자차</span></label>
								<label><input type="radio" name="insurance"><span>슈퍼자차</span></label>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2">추가 옵션</label>
							<div class="col-sm-10">
								<label><input type="checkbox" name="carOption"><span>후방카메라</span></label>
								<label><input type="checkbox" name="carOption"><span>블루투스</span></label>
								<label><input type="checkbox" name="carOption"><span>카시트</span></label>
								<label><input type="checkbox" name="carOption"><span>내비게이션</span></label>
								<label><input type="checkbox" name="carOption"><span>하이패스</span></label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2">할인/쿠폰</label>
							<div class="col-sm-10">
								<select name="cel1" class="selectpicker show-tick form-control">
									<option value="" selected="selected">이벤트할인</option>
									<option value="">이벤트할인</option>
								</select>
								<!-- 
									사용가능한 할인/쿠폰이 없습니다.
								 -->
							</div>
						</div>
					</form>	
					
					<hr>
					
					<div class="noticeText">
						<div class="box1"> 
							<h5>업체 유의사항</h5>
							<p>
								&lt; 일반자차 &gt; <br>- 보상한도 내에서 면책금(최소20~50만원)과 휴차보상료(1일
								대여요금의 50%)부담<br> - 단독사고인 경우 면책금(50만원) 발생 <br>- 휠/타이어
								보험처리 불가 <br>
								<br>&lt; 기타 &gt; <br>- 반려동물 동반 시 대여 가능 (케이지 지참 필수) <br>-
								낚시용품 지참 시 대여 불가 <br>* 악취, 오염 발생 시 실내 클리닝 비용 10~30만원 청구 <br>-
								군인 대여 가능 <br>* 이외 추가 문의사항이 있는 경우, 업체로 사전 문의 필수<br>
								<br>&lt; 외국인 대여 &gt; <br>1) 여권과 국제면허증 지참 <br>2)
								한국어 소통 가능 <br>* In order to rent a car, drivers should be
								able to communicate in Korean. Please contact us if you have
								any question. <br>
								<br>&lt; 영업시간 외 인수/반납 &gt; <br>영업 시간: 08:00 - 21:00 <br>-
								영업시간 외 인수/반납 불가
							</p>
						</div>

						<div class="box2"> 
							<h5>공통 유의사항</h5>
							<p>
								아래의 내용을 유의해주세요!<br>1. 운전자 대여 조건<br>-운전 면허 취득한 지 1년
								이상인지<br>-내 나이가 예약할 차량의 자차보험 나이 조건에 맞는지<br>조건에 맞지 않아
								현장 배차가 불가능한 경우 수수료가 발생합니다 T.T<br>
								<br>2. 업체 영업 시간 외 인수 &amp; 반납<br>렌트카 업체의 영업 시간보다 일찍
								혹은 늦게 인수 &amp; 반납하는 것을 말합니다. 필요할 경우, 동자승 고객센터를 통한 상담 후 예약해주시길
								바랍니다.<br>
								<br>3. 조기반납<br>앱을 통해 예약한 시간보다 일찍 반납하는 것을 말합니다. 필요 시
								업체와의 사전 조율을 통해 가능하며, 이 경우 비용 환불은 불가합니다. (호텔에서 일찍 체크아웃 하는 것과 같다고
								생각하시면 쉬워요! :D )<br>
								<br>4. 월렌트는 업체, 차량마다 대여조건(운전경력)이 다르니 확인 부탁 드립니다 !
							</p>
						</div>
					</div>
					<button class="btn_notice btn">렌트시 유의사항 보기</button>
				</div>
				
				<div class="col-md-1"></div>

				<div class="col-md-4 payBox">
					<h5>결제정보</h5>
					<ul>
						<li>
							<div class="left">보험</div>
							<div class="right">일반자차</div>
						</li>
						<li>
							<div class="left">옵션</div>
							<div class="right">후방카메라</div>
						</li>
						<li>
							<div class="left">할인/쿠폰</div>
							<div class="right">-10,000원</div>
						</li>
						<li class="priceResult">
							<div class="left">총 결제금액</div>
							<div class="right">50,000원</div>
						</li>
					</ul>
					<a href="rentEnd.do" class="btn-carmore">예약하기</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->


	<%@ include file="/include/footer.jsp"%>