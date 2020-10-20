<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>차량 목록</h2>
	<div class="admin_page">
	<table border=1>
			<tr>
				<th>차량번호</th>
				<th>차량이름</th>
				<th>차량분류</th>
				<th>브랜드명</th>
				<th>차량비고</th>
				<th>반납여부</th>
				<th>대여횟수</th>
				<th>이미지</th>
				<th></th>
			</tr>
		<c:forEach items="${carList }" var="car">
			<tr>
				<th>${car.no}</th>
				<th>${car.name}</th>
				<th>${car.kind.name}</th>
				<th>${car.brand.name}</th>
				<th>${car.remark}</th>
				<th>${car.is_rent}</th>
				<th>${car.counting}</th>
				<th>${car.image}</th>
				<th></th>
			</tr>		
		</c:forEach>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>