<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/include/sub_member.jsp"%>



<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>렌트 중인 차량</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 렌트 중인 차량</div>

        <div class=" logincontainer-fluid_box page_mypage">
        
        	<c:choose>
        		<c:when test="${empty rentList}">
		        	<div class="rent_empty">
		        		<div class="calendarWrap">
							<div class="dongja">
								<img src="./images/rent/note1.png" alt="음표1" class="note1">
								<img src="./images/rent/note2.png" alt="음표2" class="note2">
								<img src="./images/rent/dong.png" alt="동자승 캐릭터" class="dongja_char">
							</div>
						</div>
						<p>렌트 내역이 없습니다 :)</p>
						<span>
							지금 원하는 렌터카로<br>
							신나게 떠나볼까요?
						</span>
						<a href="rent.do" class="btn-carmore">렌트하러 가기</a>
					</div>
      			</c:when>
	        	<c:otherwise>
					<div class="rent_list">
		        		<ul class="carList_common">
			        		<c:forEach var="rentList" items="${rentList}">
							<li>
								<div class="left imgBox insertBg">
									<div class="img">
										<img src="./images/rentcar/${rentList.carNo.getKind().getCode()}/${rentList.carNo.image}" alt="${rentList.carNo.getName()}">
									</div>
								</div>
								<div class="right textBox">
									<ul class="text">
										<li>
											<div class="left">
												차량 이름
											</div>
											<div class="right">
												<p>
													${rentList.carNo.name} (${rentList.carNo.no})
												</p>
											</div>
										</li>
										<li>
											<div class="left">
												렌트 기간
											</div>
											<div class="right">
												<p>
													<span class="c_blue">${fn:split(rentList.rent_date,'T')[0]}</span>
													<span>${fn:split(rentList.rent_date,'T')[1]}</span>
													~
													<span class="c_blue">${fn:split(rentList.return_date,'T')[0]}</span>
													<span>${fn:split(rentList.return_date,'T')[1]}</span>
												</p>
											</div>
										</li>
										<li>
											<div class="left">
												보험
											</div>
											<div class="right">
												<p>
													${rentList.insCode.name }
												</p>
											</div>
										</li>
										<li class="priceResult">
											<div class="left">
												총 결제 금액
											</div>
											<div class="right">
												<fmt:formatNumber value="${rentList.fare}" pattern="#,###,###" /> 원
											</div>
										</li>
									</ul>
								</div>
							</li>
							</c:forEach>
						</ul>
		        	</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>