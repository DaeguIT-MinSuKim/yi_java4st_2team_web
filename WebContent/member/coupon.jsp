<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>쿠폰 보관함</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 쿠폰 보관함</div>
		
		<div class="mypage_coupon">
			<p>보유중인 쿠폰</p>
			<table class="table_style1">
				<colgroup>
					<col width="60%">
					<col width="30%">
					<col width="10%">
				</colgroup>
				<tr>
					<th>제목</th>
					<th>기간</th>
					<th>금액</th>
				</tr>
				<c:forEach items="${memberCoupon}" var="coupon">
				<tr>
					<td class="tl">${coupon.name}</td>
					<td>
						<fmt:formatDate value="${coupon.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${coupon.endDate}" pattern="yyyy-MM-dd"/> 
					</td>
					<td><fmt:formatNumber value="${coupon.sale}"/>원</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="h50"></div>
		
		<div class="mypage_coupon">
			<p>사용한 쿠폰</p>
			<table class="table_style1">
				<colgroup>
					<col width="60%">
					<col width="30%">
					<col width="10%">
				</colgroup>
				<tr>
					<th>제목</th>
					<th>기간</th>
					<th>금액</th>
				</tr>
				<c:forEach items="${memberCouponUse}" var="coupon">
				<tr>
					<td class="tl">${coupon.name}</td>
					<td>
						<fmt:formatDate value="${coupon.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${coupon.endDate}" pattern="yyyy-MM-dd"/> 
					</td>
					<td><fmt:formatNumber value="${coupon.sale}"/>원</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="h50"></div>
		
		<div class="mypage_coupon">
			<p>기간 만료 쿠폰</p>
			<table class="table_style1">
				<colgroup>
					<col width="60%">
					<col width="30%">
					<col width="10%">
				</colgroup>
				<tr>
					<th>제목</th>
					<th>기간</th>
					<th>금액</th>
				</tr>
				<c:forEach items="${memberCouponExpiration}" var="coupon">
				<tr>
					<td class="tl">${coupon.name}</td>
					<td>
						<fmt:formatDate value="${coupon.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${coupon.endDate}" pattern="yyyy-MM-dd"/> 
					</td>
					<td><fmt:formatNumber value="${coupon.sale}"/>원</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>