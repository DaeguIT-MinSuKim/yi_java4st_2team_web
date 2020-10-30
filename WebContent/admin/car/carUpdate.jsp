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
		
			$('#add').on("click", function() {
				if ($('#carName').val() == "") {
					alert("차량이름을 기입해주세요")
					$('#carName').focus()
					return false;
				}
			});
	});
</script>

<div id="adimn_content">
	<h2>차량 수정</h2>
	<div class="admin_page">
		<form action="carUpdate.do" method="post" enctype="multipart/form-data">
			<table class="table_style1">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tr>
					<th>차량번호</th>
					<td><input type="hidden" value="${car.no }" name="carNo">${car.no }</td>
					<th><label for="carName">차량이름</label></th>
					<td><input type="text" name="carName" id="carName" value="${car.name}"></td>
				</tr>
				<tr>
					<th>차량분류</th>
					<td><select id="kindList" name="kind">
							<c:forEach items="${kindList }" var="kind">
								<option value="${kind.code}">${kind.name}</option>
							</c:forEach>
					</select></td>
					<th>브랜드명</th>
					<td><select id="brandList" name="brand">
							<c:forEach items="${brandList}" var="brand">
								<option value="${brand.code}">${brand.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>비고사항</th>
					<td colspan="3"><textarea cols="15" rows="11" id="remark" name="remark">${car.remark}</textarea></td>
				</tr>
				<tr>
					<th>반납 여부</th>
					<td>${car.is_rent}</td>
					<th>대여 횟수</th>
					<td>${car.counting}</td>
				</tr>
				<tr>
					<th>현 이미지</th>
					<td><img src="upload/${car.image}"></td>
					<th>바꿀 이미지</th>	
					<td><input type="file" name="image" class="list_file" id="image"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><input type="submit" value="수정" class="btn_small btn_case2" id="add"></li>
				<li><a href="carList.do" class="btn_small btn_case4" id="cancel">취소</a></li>
			</ul>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>