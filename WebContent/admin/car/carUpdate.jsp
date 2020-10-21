<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>차량 목록</h2>
	<div class="admin_page">
			<table border=1>
					<tr>
						<td>${car.no }</td>
					</tr>
					<tr>
						<td>${car.name}</td>
					</tr>
					<tr>
						<td>${car.kind.name }</td>
					</tr>
					<tr>
						<td>${car.brand.name }</td>
					</tr>
					<tr>
						<td>${car.remark}</td>
					</tr>
					<tr>
						<td>${car.is_rent}</td>
					</tr>
					<tr>
						<td>${car.counting}</td>
					</tr>
					<tr>
						<td>${car.image}</td>
					</tr>
			</table>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>