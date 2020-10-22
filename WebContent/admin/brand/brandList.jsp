<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>브랜드 목록</h2>
	<div class="admin_page">
		<a href="brandWrite.do">브랜드 추가</a>
		<table border=1>
			<tr>
				<th>브랜드명</th>
				<th>이미지</th>
				<th>브랜드 수정</th>
				<th>브랜드 삭제</th>
			</tr>
			<c:forEach items="${brandList }" var="brand">
				<tr>
					<td>${brand.name}</td>
					<td>${brand.image}</td>
					<td><a href="brandUpdate.do?brandCode=${brand.code}"><input
							type="button" value="수정" class="update"></a></td>
					<td><a href="brandDelete.do?brandCode=${brand.code}"><input
							type="button" value="삭제" class="delete"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>