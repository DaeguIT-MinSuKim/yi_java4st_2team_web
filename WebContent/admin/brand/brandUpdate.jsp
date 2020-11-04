<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<script type="text/javascript">
	$(function() {
		$('#add').on("click", function() {
			if($('#name').val() == ""){
				alert("브랜드명을 기입해주세요");
				$('#name').focus();
				return false;
			};
		});
		
		$("#admin_gnb > ul > li:eq(1)").addClass("on")
	});
	</script>
<div id="adimn_content">
	<h2>브랜드 수정</h2>
	<div class="admin_page">
		<form action="brandUpdate.do" method="post"
			enctype="multipart/form-data">
			<table class="table_style1">
				<tr>
					<input type="hidden" value="${brand.code}" name="code">
					<td>이 름</td>
					<td><input type="text" value="${brand.name }" id="name" name="name"></td>
				</tr>
				<tr>
					<td>현 이미지</td>
					<td><img src="images/brand/${brand.image }" width="200" height="200"></td>
				</tr>
				<tr>
					<td>바꿀 이미지</td>
					<td><input type="file" name="image" class="list_file"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><input type="submit" value="수정" class="btn_small btn_case2"
					id="add"></li>
				<li><a href="brandList.do" class="btn_small btn_case4">취소</a></li>
			</ul>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>