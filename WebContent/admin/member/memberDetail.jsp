<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/admin/include/header.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객 상세정보</title>
	</head>
	
	<body>
		<div id="adimn_content">
		<h2>고객 상세정보</h2>
		<div class="admin_page">
		<table class="table_style1">
				<c:forEach items="${memberList}" var="member">
				<tr class="board">
					<th scope="row">아이디</th>
					<td>${member.id}</td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td>${member.name}</td>
				</tr>
				<tr>
				<th scope="row">성별</th>
				<td>
					<c:choose>
						<c:when test="${member.gender == 'M'}">남성</c:when>
						<c:when test="${member.gender == 'F'}">여성</c:when>							
					</c:choose>
				</td>
				</tr>
				<tr>
				<th scope="row">생년월일</th>
				<td>
					<fmt:formatDate value="${member.birth}" pattern="yyyy년 MM월 dd일"/>
				</td>
				</tr>
				<tr>
				<th scope="row">전화번호</th>
				<td>${member.tel}</td>
				</tr>
				<tr>
				<th scope="row">면허종류</th>
				<td>
					<c:choose>
						<c:when test="${member.li_class == 'Class2A'}">2종 보통</c:when>
						<c:when test="${member.li_class == 'Class2M'}">2종 수동</c:when>
						<c:when test="${member.li_class == 'Class1A'}">1종 보통</c:when>
						<c:when test="${member.li_class == 'Class1B'}">1종 대형</c:when>
					</c:choose>
				</td>
				</tr>
				<tr>
				<th scope="row">면허번호</th>
				<td>${member.li_number}</td>
				</tr>
				<tr>
				<th scope="row">이메일</th>
				<td>${member.email}</td>
				</tr>
				<tr>
				<th scope="row">주소</th>
				<td>${member.address}</td>
				</tr>
				<tr>
				<th scope="row">블랙</th>
				<td>${member.is_black}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</div>
	</body>
</html>

<%@ include file="/admin/include/footer.jsp"%>