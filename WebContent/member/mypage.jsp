<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>마이페이지</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 마이페이지</div>
		
        <div class=" logincontainer-fluid_box page_mypage">
        	<div class="rent_list">
        		<p class="title">렌트 중인 차량</p>
        		<ul class="carList_common">
					<li>
						<div class="left imgBox insertBg">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
						</div>
						<div class="right textBox">
							<ul class="text">
								<li>
									<div class="left">
										차량 이름
									</div>
									<div class="right">
										모닝 (90허 1922)
									</div>
								</li>
								<li>
									<div class="left">
										렌트 기간
									</div>
									<div class="right">
										<p><span>10/9</span> 10:00 ~ <span>10/10</span> 10:00 (24시간)</p>
									</div>
								</li>
								<li>
									<div class="left">
										보험
									</div>
									<div class="right">
										<p>일반자차</p>
									</div>
								</li>
								<li>
									<div class="left">
										추가 옵션
									</div>
									<div class="right">
										<span>후방카메라</span>
										<span>블루투스</span>
									</div>
								</li>
								<li>
									<div class="left">
										할인/쿠폰
									</div>
									<div class="right">
										없음
									</div>
								</li>
								<li class="priceResult">
									<div class="left">
										총 결제 금액
									</div>
									<div class="right">
										50,000원
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="left imgBox insertBg">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
						</div>
						<div class="right textBox">
							<ul class="text">
								<li>
									<div class="left">
										차량 이름
									</div>
									<div class="right">
										모닝 (90허 1922)
									</div>
								</li>
								<li>
									<div class="left">
										렌트 기간
									</div>
									<div class="right">
										<p><span>10/9</span> 10:00 ~ <span>10/10</span> 10:00 (24시간)</p>
									</div>
								</li>
								<li>
									<div class="left">
										보험
									</div>
									<div class="right">
										<p>일반자차</p>
									</div>
								</li>
								<li>
									<div class="left">
										추가 옵션
									</div>
									<div class="right">
										<span>후방카메라</span>
										<span>블루투스</span>
									</div>
								</li>
								<li>
									<div class="left">
										할인/쿠폰
									</div>
									<div class="right">
										없음
									</div>
								</li>
								<li class="priceResult">
									<div class="left">
										총 결제 금액
									</div>
									<div class="right">
										50,000원
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="left imgBox insertBg">
							<div class="img"><img src="./images/rentcar/small/morning.png" alt="morning"></div>
						</div>
						<div class="right textBox">
							<ul class="text">
								<li>
									<div class="left">
										차량 이름
									</div>
									<div class="right">
										모닝 (90허 1922)
									</div>
								</li>
								<li>
									<div class="left">
										렌트 기간
									</div>
									<div class="right">
										<p><span>10/9</span> 10:00 ~ <span>10/10</span> 10:00 (24시간)</p>
									</div>
								</li>
								<li>
									<div class="left">
										보험
									</div>
									<div class="right">
										<p>일반자차</p>
									</div>
								</li>
								<li>
									<div class="left">
										추가 옵션
									</div>
									<div class="right">
										<span>후방카메라</span>
										<span>블루투스</span>
									</div>
								</li>
								<li>
									<div class="left">
										할인/쿠폰
									</div> 
									<div class="right">
										없음
									</div>
								</li>
								<li class="priceResult">
									<div class="left">
										총 결제 금액
									</div>
									<div class="right">
										50,000원
									</div>
								</li>
							</ul>
						</div>
					</li>
				</ul>
        	</div>
        
        
        
        
        	
        	<div class="rent_empty">
				<div class="noImg"><img src="./images/member/norent.png" alt=""></div>
				<p>진행중인 렌트 내역이 없습니다 :)</p>
				<span>
					지금 원하는 렌트카 빌리고<br>
					신나게 떠나볼까요?
				</span>
				<a href="rent.do" class="btn-carmore">렌트하러 가기</a>
			</div>
			
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>