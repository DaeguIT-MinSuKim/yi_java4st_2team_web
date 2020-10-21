<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<script type="text/javascript">
	$(function(){
		$('#add').on("click", function(){
			var newCar = {no:$('#carNo').val(),
					name:$('#carName').val(),
					floor:$('#floor').val()
					};
			$.ajax({
				type:"post",
				url:"DepartmentAddHandler",
				cache: false,
				data: JSON.stringify(newDept),
				complete:function(data){
					alert("추가되었습니다." + data);
					window.location.href="DepartmentListHandler";
				}
			});
		});
		$('#cancel').on("click", function(){
			window.location.href="DepartmentListHandler";
		});
	});
</script>
<div id="adimn_content">
	<h2>차량 추가</h2>
	<div class="admin_page">
		<table border=1>
			<tr>
				<th>차량번호</th>
				<td><input type="text" id="carNo"></td>
			</tr>
			<tr>
				<th>차량 이름</th>
				<td><input type="text" id="carName"></td>
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
				<td><textarea cols="15" rows="11" id="remark"></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="uploadfile" class="list_file"></td>
			</tr>
			<tr><th colspan="2">
		<button id="add">추가</button>
				<button id="cancel">취소</button>
				</th>
				</tr>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>