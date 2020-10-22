<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>브랜드 목록</h2>
	<div class="admin_page">
		<table border=1>
			<tr>
				<td><input type="text" value="${brand.name }"></td>
			</tr>
			<tr>
				<td><img src="upload/${brand.image }"></td>
			</tr>
			<tr>
				<td><input type="file" name="uploadfile" class="list_file"></td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>