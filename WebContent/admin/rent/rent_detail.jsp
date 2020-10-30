<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>렌트 상세정보</h2>
	<div class="admin_page">
		<form action="rentUpdate.do" method="post" enctype="multipart/form-data">
			<table class="table_style1">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tr>
					<th>렌트번호</th>
					<td><input type="hidden" value="${rent.rentNo}" name="rentNo">${rent.rentNo}</td>
					<th>예약자 아이디</th>
					<td><input type="hidden" value="${rent.id.id}" name="userId">${rent.id.id}</td>
				</tr>
				<tr>
					<th>렌트차량</th>
					<td>
						<img src="images/rentcar/${rent.carNo.getKind().getCode()}/${rent.carNo.image}" alt="${rent.carNo.name}">
						<div class="h20"></div>
						<p>${rent.carNo.name}</p>
					</td>
					<th>보험종류</th>
					<td>
						${rent.insCode.name}
					</td>
				</tr>
				<tr>
					<th>대여일</th>
					<td>
						<span class="c_blue">${fn:split(rent.rent_date,'T')[0]}</span>
						<span>${fn:split(rent.rent_date,'T')[1]}</span>
					</td>
					<th>반납일</th>
					<td>
						<span class="c_blue">${fn:split(rent.return_date,'T')[0]}</span>
						<span>${fn:split(rent.return_date,'T')[1]}</span>
					</td>
				</tr>
				<tr>
					<th>반납유무</th>
					<td>
						${rent.is_rent }
					</td>
					<th>옵션 정보</th>
					<td>
						<c:forEach var="opt" items="${optList}">
							${opt} &nbsp;
						</c:forEach>
						<c:if test="${empty optList}">
							선택안함
						</c:if>
					</td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td colspan="3">
						<b class="c_blue"><fmt:formatNumber value="${rent.fare}" pattern="#,###,###" /></b> 원
					</td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><a href="adminRent.do" class="btn_small btn_case2">목록</a></li>
				<li><a href="javascript:;" data-rentNo="${rent.rentNo}" class="btn_small btn_case5 btn_rentDelete">삭제</a></li>
			</ul>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>