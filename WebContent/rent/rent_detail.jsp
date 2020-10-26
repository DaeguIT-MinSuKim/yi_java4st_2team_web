<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<!-- 상단배경 -->
<section class="bgTop bgSub1 pc">
	<div class="slogan">
		<p>
			<strong>동자승 렌터카</strong> 따라올 수 없는 압도적 1등<br> 이제부터 렌터카 예약은
			동자승렌터카입니다.
		</p>
	</div>
</section>
<!-- //상단배경 -->

${carDetail}

<input type="hidden" name="get_loginUser" id="get_loginUser" value="${loginUser.getId()}">
<input type="hidden" name="get_carFare" id="get_carFare" value="${carDetail.getKind().getFare()}">
<input type="hidden" name="get_maxDateLimit" id="get_maxDateLimit" value="${maxDateLimit.getReturn_date()}">
<input type="hidden" name="get_carNo" id="get_carNo" value="${carDetail.getNo()}">


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
						<div class="img"><img src="./images/rentcar/${carDetail.getKind().getCode()}/${carDetail.getImage()}" alt="${carDetail.getName()}"></div>
					</div>
					<h4 class="carName">${carDetail.getName()}</h4>
					<p class="date">
						<span class="date_minDateVal" id="get_minDate">${minDate}</span> ${minHour}시 ~ 
						
						<!-- 사용자가 이전페이지에서 반납일 선택했는지, 안했는지에 따라 구분 출력 -->
						<c:choose>
							<c:when test="${maxDate=='0'}">
								<input type="text" class="form-control calendar next" readonly placeholder="렌터카 반납일 선택">
								<select class="hours next"><!-- script.js/rent_optionHours(); 메서드 사용 --></select>
							</c:when>
							<c:otherwise>
								<span id="get_maxDate">${maxDate}</span>${maxHour}시
							</c:otherwise>
						</c:choose>
						(24시간)
					</p>
					
					<hr>
					
					<form class="form-horizontal formDtl" role="form" name="frmName">
						<div class="form-group" id="get_insurance">
							<label class="col-sm-2">보험</label>
							<div class="col-sm-10">
								<label><input type="radio" name="insurance" value="0" data-insPrice="0" checked><span>선택안함</span></label>
								<c:forEach var="ins" items="${insList}">
									<label><input type="radio" name="insurance" value="${ins.getCode()}" data-insPrice="${ins.getFare() }"><span>${ins.getName()}</span></label>
								</c:forEach>
							</div>
						</div>
						
						<div class="form-group" id="get_option">
							<label class="col-sm-2">추가 옵션</label>
							<div class="col-sm-10">
								<c:forEach var="opt" items="${optList}">
									<label><input type="checkbox" name="carOption" value="${opt.getCode()}" data-optPrice="${opt.getFare()}"><span>${opt.getName()}</span></label>
								</c:forEach>
								<input type="hidden" id="optResultPrice" name="optResultPrice" value="0">
							</div>
						</div>
						<div class="form-group" id="get_discount">
							<label class="col-sm-2">할인/쿠폰</label>
							<div class="col-sm-10">
								<select class="selectpicker show-tick form-control">
									<c:choose>
										<c:when test="${evtList==null}">
											<option value="0">쿠폰없음</option>
										</c:when>
										<c:otherwise>
											<option value="0">사용하지 않음</option>
											<c:forEach var="evt" items="${evtList}">
												<option value="${evt.getSale()}">${evt.getName()} (${evt.getSale()}원)</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</div>
					</form>	
					
					<hr>
					<div class="h20"></div>
					
					<h4>렌터카 대여 위치 (동자승 렌터카)</h4>
					<div id="kakaoMap"></div>
	
					<div class="mapInfo">
						<div class="col-sm-6">
							<i class="fas fa-map-marker-alt"></i>
							<span>대구광역시 서구 내당동 230-6</span>
						</div>
						<div class="col-sm-6">
							<i class="fas fa-phone-alt"></i>
							<span>053-123-1234</span>
						</div>
					</div>
					
					<div class="h20"></div>
					
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
								<br>2. 업체 영업 시간 외 인수 &amp; 반납<br>렌터카 업체의 영업 시간보다 일찍
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
							<div class="right" id="set_insurance">선택안함</div>
						</li>
						<li>
							<div class="left">옵션</div>
								<div class="right" id="set_option">선택안함</div>
						</li>
						<li>
							<div class="left">할인/쿠폰</div>
							<div class="right" id="set_discount">사용하지않음</div>
						</li>
						<li>
							<div class="left">차량종류</div>
							<div class="right">${carDetail.getKind().getName()}</div>
						</li>
						<li>
							<div class="left">총 대여일</div>
							<div class="right" id="set_day"><span>0</span>일</div>
						</li>
						<li class="priceCalcul">
							<div class="left">
								<ul>
									<li>
										<span>(보험)</span>
										<b class="c_blue set_insurance">0</b>
									</li>
									<li>
										<span>(옵션)</span>
										<b class="c_blue set_option">0</b> 
									</li>
									<li>
										<span>(할인/쿠폰)</span>
										<b class="c_blue set_discount">0</b> 
									</li>
									<li>
										<span>(차량)</span>
										<b class="c_blue">${carDetail.getKind().getFare()}</b>
									</li>
									<li>
										<span>(대여일)</span>
										<b class="c_blue set_day">0</b>
									</li>
								</ul>
							</div>
						</li>
						<li class="priceResult">
							<div class="left">총 결제금액</div>
							<div class="right" id="set_total"><span data-total="">0</span>원</div>
						</li>
					</ul>
					<div class="text">
						차량 대여일이 <span class="c_red">15일 이상</span>일 경우,<br>장기렌트로 예약하면 가격이 저렴합니다.
						<a href="longRent.do">> 장기렌트로 예약하기</a>
					</div>
					<a href="javascript:;" class="btn-carmore btn_payBox_submit" id="btn_payBox_submit">예약하기</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->

	<%@ include file="/include/footer.jsp"%>