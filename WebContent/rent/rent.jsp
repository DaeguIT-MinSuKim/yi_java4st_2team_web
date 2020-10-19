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
			<form method="post">
				<div class="calendarWrap">
					<img src="./images/member/norent.png" alt="">
					<h4>언제 떠나세요 ?</h4>
					<p class="c_gray">대여일만 선택하셔도 차량검색이 가능합니다.</p>
					<div class="h20"></div>
					<div class="calendarBox">
						<input type="text" class="form-control calendar prev" readonly placeholder="렌트카 대여일 선택"> 
						<select class="hours">
							<!-- script.js/rent_optionHours(); 메서드 사용 -->
						</select>
						 <span>-</span> 
						 <input type="text"
							class="form-control calendar next" readonly
							placeholder="렌트카 반납일 선택"> <select class="hours">
							<!-- script.js/rent_optionHours(); 메서드 사용 -->
						</select>
						<a href="javascript:;" class="btn btn-blue btn_carSearch">차량검색</a>
					</div>
				</div>
			</form>
			<div class="h50"></div>

			<div class="rentcarList_tabBtn">
				<a href="javascript:;" data-kindNum="0" class="active">전체</a> 
				<c:forEach var="kind" items="${kind}">
					<a href="javascript:;" data-kindNum="${kind.getCode()}">${kind.getName()}</a>
				</c:forEach>
			</div>

			<div class="rentcarList insertBg" data-ratioH="60">
				<ul>
					<c:forEach var="car" items="${car}">
						<li data-kindItem="${car.getKind().getCode()}">
							<a href="rentDtl.do">
								<div class="img" title="${car.getName()}">
									<img src="./images/rentcar/${car.getKind().getCode()}/${car.getImage()}" alt="${car.getName()}">
								</div>
								<img src="./images/brand/${car.getBrand().getImage()}" class="brand_logo" alt="${car.getBrand().getName()}">
								<div class="text">
									<h4 class="carName">${car.getName()}</h4>
									<p class="price">
										렌탈 1일기준 
										<span>
											<fmt:formatNumber value="${car.getKind().getFare()}" groupingUsed="true"/>원
										</span>
									</p>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->
	<%@ include file="/include/footer.jsp"%>