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
			<h3>차량검색</h3>
			<div class="location pc">
				HOME <span>></span> 단기렌트 <span>></span> 차량검색
			</div>
			 
		
			
 		
 			<div class="calendarWrap">
 				<h4>언제 떠나세요 ?</h4>
 				<div class="calendarBox">
					<input type="text" class="form-control calendar prev" readonly placeholder="렌트카 대여일 선택">
					<span>-</span>
					<input type="text" class="form-control calendar next" readonly placeholder="렌트카 반납일 선택">
					<a href="javascript:;" class="btn btn-blue">검색</a>
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
						<a href="javascript:;">
							<h4 class="carName">모닝</h4>
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<p class="price">렌탈 1일기준 <span>50,000원</span></p>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<h4 class="carName">모닝</h4>
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<p class="price">렌탈 1일기준 <span>50,000원</span></p>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<h4 class="carName">모닝</h4>
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<p class="price">렌탈 1일기준 <span>50,000원</span></p>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<h4 class="carName">모닝</h4>
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<p class="price">렌탈 1일기준 <span>50,000원</span></p>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<h4 class="carName">모닝</h4>
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<p class="price">렌탈 1일기준 <span>50,000원</span></p>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<h4 class="carName">모닝</h4>
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<p class="price">렌탈 1일기준 <span>50,000원</span></p>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<h4 class="carName">모닝</h4>
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
							<p class="price">렌탈 1일기준 <span>50,000원</span></p>
						</a>
					</li>
				</ul>
			</div>

		</div>
	</div>
	<!-- //컨텐츠 -->


	<%@ include file="/include/footer.jsp"%>