<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<script type="text/javascript">
	var regex = /[^0-9]/g;
	var fare = $('#fare').val();

	$(function() {
		$('#add').on("click", function() {
			if($('#name').val() == ""){
				alert("분류명을 기입해주세요");
				$('#name').focus();
				return false;
			}
			if ($('#fare').val() == "") {
				alert("분류 금액을 기입해주세요");
				$('#fare').focus();
				return false;
			}
			if(regex.test(fare)){
				alert("숫자만 기입해주세요");
				$('#fare').focus();
				return false;
			}
		});
		
		$("#admin_gnb > ul > li:eq(1)").addClass("on")
	});
	</script>
<div id="adimn_content">
	<h2>차량분류 추가</h2>
	<div class="admin_page">
		<form action="kindWrite.do" method="post">
			<table class="table_style1">
				<tr>
					<td>이 &nbsp; 름</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>금 &nbsp; 액</td>
					<td><input type="text" id="fare" name="fare"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><input type="submit" value="확인" class="btn_small btn_case2" id="add"></li>
				<li><a href="kindList.do" class="btn_small btn_case4">취소</a></li>
			</ul>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>