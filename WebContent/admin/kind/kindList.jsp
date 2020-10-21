<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>차량분류 목록</h2>
	<div class="admin_page">
		<table border=1>
			<tr>
				<th>코드번호</th>
				<th>분류명</th>
				<th>분류금액</th>
				<th>분류수정</th>
				<th>분류삭제</th>
			</tr>
			<c:forEach items="${kindList }" var="kind">
				<tr>
					<td>${kind.code}</td>
					<td>${kind.name}</td>
					<td>${kind.fare}</td>
					<td><a href="kindUpdate.do?kindCode=${kind.code}"><input type="button"
										value="수정" class="update"></a></td>
					<td><a href="kindDelete.do?kindCode=${kind.code}"><input type="button"
										value="삭제" class="delete"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>