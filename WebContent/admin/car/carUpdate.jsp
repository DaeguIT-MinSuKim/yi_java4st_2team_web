<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>차량 목록</h2>
	<div class="admin_page">
		<table border=1>
			<tr>
				<td>차량번호</td>
				<td>${car.no }</td>
			</tr>
			<tr>
				<th>차량 이름</th>
				<td><input type="text" value="${car.name}"></td>
			</tr>
			<tr>
				<th>차량 분류</th>
				<td><select id="kindList">
					<c:forEach items="${kindList }" var="kind">
						<option value="${kind.name}">${kind.name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>브랜 드명</th>
				<td><select id="brandList">
				<c:forEach items="${brandList}" var="brand">
					<option value="${brand.name}">${brand.name}</option>
				</c:forEach>
			</select></td>
			</tr>
			<tr>
				<th>비고 사항</th>
				<td>${car.remark}</td>
			</tr>
			<tr>
				<th>반납 여부</th>
				<td>${car.is_rent}</td>
			</tr>
			<tr>
				<th>대여 횟수</th>
				<td>${car.counting}</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><img src="upload/${car.image}"></td>
			</tr>
		</table>
		<input type="file" name="uploadfile" class="list_file">
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>