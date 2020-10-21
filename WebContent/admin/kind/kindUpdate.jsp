<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>차량분류 목록</h2>
	<div class="admin_page">
		<table border=1>
			<tr>
				<td>${kind.code }</td>
			</tr>
			<tr>
				<td>${kind.name }</td>
			</tr>
			<tr>
				<td>${kind.fare }</td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>