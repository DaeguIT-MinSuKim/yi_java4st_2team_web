<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<script type="text/javascript">
	$(function() {
		$('#add').on("click", function() {
			if($('#name').val() == ""){
				alert("브랜드명을 기입해주세요");
				$('$name').focus();
				return false;
			}
			if ($('#image').val() == "") {
				alert("차량 이미지를 기입해주세요");
				$('#image').focus();
				return false;
			}
		})
	});
	</script>
<div id="adimn_content">
	<h2>브랜드 목록</h2>
	<div class="admin_page">
		<form action="brandWrite.do" method="post"
			enctype="multipart/form-data">
			<table border=1>
				<tr>
					<td><input type="text" id="name"></td>
				</tr>
				<tr>
					<td><input type="file" name="uploadfile" class="list_file"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><input type="submit" value="확인" class="btn_small btn_case2" id="add"></li>
				<li><a href="brandList.do" class="btn_small btn_case4">취소</a></li>
			</ul>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>