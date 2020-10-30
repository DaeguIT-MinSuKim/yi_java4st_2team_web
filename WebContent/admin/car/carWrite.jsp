<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<script type="text/javascript">
	$(function() {
		$('#add').on("click", function() {
			if ($('#carNo').val() == "") {
				alert("차량번호를 기입해주세요")
				$("#carNo").focus()
				return false;
			}
			if ($('#carName').val() == "") {
				alert("차량이름을 기입해주세요")
				$('#carName').focus()
				return false;
			}
			if ($('#image').val() == "") {
				alert("차량 이미지를 기입해주세요")
				$('#image').focus()
				return false;
			}
			if($('#chkForm').val() == "N"){
				alert("중복확인 해주세요")
				$('#chkForm').focus()
				return false;
			}
		});
			
		$('#chkNo').on("click", function() {
			// location.href="carWrite.do?carNo=" + $('#carNo').val();
			$.ajax({
				type : "get",
				url : "carWrite.do?carNo=" +  $('#carNo').val(),
				complete : function(data){
					if(data.responseText == 1) {
						alert("확인되었습니다")
						$('#chkForm').val('Y');
						$('#carNo').attr('readonly', true);
					} else {
						alert("기입하신 차량번호는 존재하는 번호입니다.");
					}
				} ,
				error: function(){
					alert("기입")
				}
			});
		});
	});
</script>
<div id="adimn_content">
	<h2>차량 추가</h2>
	<div class="admin_page">
		<form action="carWrite.do" method="post" enctype="multipart/form-data">
			<table class="table_style1">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tr>
					<th>차량번호</th>
					<td style="display : flex;">
						<input type="text" id="carNo" name="carNo">
						<input type="button" value="중복확인" id="chkNo" style="width : 100px">
						<input type="hidden" value="N" id="chkForm">
					</td>
					<th>차량이름</th>
					<td><input type="text" id="carName" name="carName"></td>
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
					<td colspan="3"><textarea cols="15" rows="11" id="remark" name="remark"></textarea></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3"><input type="file" name="image" id="image" class="list_file"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><input type="submit" value="확인" class="btn_small btn_case2"
					id="add"></li>
				<li><a href="carList.do" class="btn_small btn_case4">취소</a></li>
			</ul>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>