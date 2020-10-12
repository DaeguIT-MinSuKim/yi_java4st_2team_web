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
	
			<form class="form-horizontal page_listdDtl" role="form" name="frmName" method="post" action="" onsubmit="return false;" enctype="multipart/form-data">
				<div class="col-lg-7">
					<div class="insertBg" data-ratioH="60">
						<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
					</div>
					<h4 class="carName">모닝</h4>
					<p class="date">10/9 10:00 ~ 10/10 10:00 (24시간)</p>
					
					<hr>
						
					<div class="form-group">
						<label class="col-sm-2 control-label">보험</label>
						<div class="col-sm-10">
							<label><input type="radio" name="insurance" checked><span>일반자차</span></label>
							<label><input type="radio" name="insurance"><span>완전자차</span></label>
							<label><input type="radio" name="insurance"><span>슈퍼자차</span></label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">옵션</label>
						<div class="col-sm-10">
							<label><input type="checkbox" name="carOption"><span>후방카메라</span></label>
							<label><input type="checkbox" name="carOption"><span>블루투스</span></label>
							<label><input type="checkbox" name="carOption"><span>카시트</span></label>
							<label><input type="checkbox" name="carOption"><span>내비게이션</span></label>
							<label><input type="checkbox" name="carOption"><span>하이패스</span></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">할인/쿠폰</label>
						<div class="col-sm-10">
							<select>
								<option>이벤트할인</option>
								<option>회원가입쿠폰?</option>
							</select>
							<!-- 
								사용가능한 할인/쿠폰이 없습니다.
							 -->
						</div>
					</div>
				</div>
				
				<div class="col-lg-5">
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
				</div>
			</form>
			
		</div>
	</div>
	<!-- //컨텐츠 -->


	<%@ include file="/include/footer.jsp"%>