<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>브랜드 목록</h2>
	<div class="admin_page">
		<table border=1>
			<tr>
				<th>코드번호</th>
				<th>브랜드명</th>
				<th>이미지</th>
			</tr>
			<c:forEach items="${brandList }" var="brand">
				<tr>
					<th>${brand.code}</th>
					<th>${brand.name}</th>
					<th>${brand.image}</th>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>