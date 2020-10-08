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

	<div class="contents_box out page_rent">
		<div class="contents">
			<h3>단기렌트</h3>
			<div class="location pc">
				HOME <span>></span> 단기렌트
			</div>
			 
 			<div class="calendarWrap">
 				<img src="./images/member/norent.png" alt="">
 				<h4>언제 떠나세요 ?</h4>
 				<div class="calendarBox">
					<input type="text" class="form-control calendar prev" readonly placeholder="렌트카 대여일 선택">
					<select>
						<option>00시</option>
						<option>01시</option>
						<option></option>
						<option></option>
						<option></option>
					</select>
					<span>-</span>
					<input type="text" class="form-control calendar next" readonly placeholder="렌트카 반납일 선택">
					<select>
						<option>00시</option>
						<option>01시</option>
						<option></option>
						<option></option>
						<option></option>
					</select>
					<a href="javascript:;" class="btn btn-blue">차량검색</a>
				</div>
			</div>
			
			<div class="h50"></div>
			
 			<div class="rentcarList_tabBtn">
				<a href="javascript:;" data-kindNum="0" class="active">전체</a>
				<a href="javascript:;" data-kindNum="1">소형</a>
				<a href="javascript:;" data-kindNum="2">중형</a>
				<a href="javascript:;" data-kindNum="3">대형</a>
				<a href="javascript:;" data-kindNum="4">승합</a>
				<a href="javascript:;" data-kindNum="5">수입</a>
			</div>
			
			<div class="rentcarList insertBg" data-ratioH="60">
				<ul>
					<li data-kindItem="1">
						<a href="rentDtl.do">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<div class="text">
								<h4 class="carName">소형</h4>
								<p class="price">렌탈 1일기준 <span>50,000원</span></p>
							</div>
						</a>
					</li>
					<li data-kindItem="2">
						<a href="javascript:;">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<div class="text">
								<h4 class="carName">중형</h4>
								<p class="price">렌탈 1일기준 <span>50,000원</span></p>
							</div>
						</a>
					</li>
					<li data-kindItem="3">
						<a href="javascript:;">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<div class="text">
								<h4 class="carName">대형</h4>
								<p class="price">렌탈 1일기준 <span>50,000원</span></p>
							</div>
						</a>
					</li>
					<li data-kindItem="4">
						<a href="javascript:;">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<div class="text">
								<h4 class="carName">승합</h4>
								<p class="price">렌탈 1일기준 <span>50,000원</span></p>
							</div>
						</a>
					</li>
					<li data-kindItem="5">
						<a href="javascript:;">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<div class="text">
								<h4 class="carName">수입</h4>
								<p class="price">렌탈 1일기준 <span>50,000원</span></p>
							</div>
						</a>
					</li>
				</ul>
			</div>

		</div>
	</div>
	<!-- //컨텐츠 -->


	<%@ include file="/include/footer.jsp"%>