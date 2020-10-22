<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<script>
	$(function() {
		var kindCode = ${car.kind.code};
		$('#kindList').val(kindCode);
		
		var brandCode = ${car.brand.code};
		$('#brandList').val(brandCode);
	});
</script>

<div id="adimn_content">
	<h2>차량 수정</h2>
	<div class="admin_page">
		<form action="carUpdate.do" method="post"
			enctype="multipart/form-data">
			<table border=1>
				<tr>
					<td>차량번호</td>
					<td>${car.no }</td>
				</tr>
				<tr>
					<th>차량이름</th>
					<td><input type="text" value="${car.name}"></td>
				</tr>
				<tr>
					<th>차량분류</th>
					<td><select id="kindList">
							<c:forEach items="${kindList }" var="kind">
								<option value="${kind.code}">${kind.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>브랜드명</th>
					<td><select id="brandList">
							<c:forEach items="${brandList}" var="brand">
								<option value="${brand.code}">${brand.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>비고사항</th>
					<td><textarea cols="15" rows="11" id="remark" name="remark">${car.remark}</textarea></td>
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
					<td><input type="file" name="image" class="list_file"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><input type="submit" value="수정" class="btn_small btn_case2"
					id="add"></li>
				<li><a href="carList.do" class="btn_small btn_case4"
					id="cancel">취소</a></li>
			</ul>
			<img src="upload/${car.image}">
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>