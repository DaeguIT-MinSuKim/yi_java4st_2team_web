<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/admin/include/header.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>탈퇴한 회원목록</title>
		<script>
			$(function() {
				if ($(".board").length == 0) { // 글이 없는 경우
					$(".no_board").show();
					$(".board").hide();
				}
				
				$("#admin_gnb > ul > li:eq(3)").addClass("on")
				
			});
		</script>
	</head>
	
	<body>
		<div id="adimn_content">
		<h2>탈퇴한 회원목록</h2>
		<div class="admin_page">
			<p>※ 회원님의 상세 정보는 아이디를 클릭하세요.</p>
			<div class="divSearch">
				<form name="frmSearch" action="adminMemberLeaveList.do" method="post">
					<select name="condition">
						<option value="name">이름</option>
						<option value="id">아이디</option>
					</select> 
					<input type="text" name="keyword" title="검색어 입력">
					<input type="submit" value="검색">
					<a href="adminMemberLeaveList.do" type="button" class="btn btn_case2">목록보기</a>
				</form>
			</div>
			
			<table class="table_style1">
				<!-- 글 있는 경우 -->
				<colgroup>
					<col width="5%">
					<col width="5%">
					<col width="5%">
					<col width="20%">
				</colgroup>
				
				<tr>
					<th>탈퇴</th>
					<th>아이디</th>
					<th>탈퇴 사유</th>
					<th>남기고 싶은 말</th>
				</tr>

				<c:forEach items="${leavePaging}" var="member">

				<tr class="board">
					<td>
						<c:choose>
							<c:when test="${member.gender == 'X'}">✔</c:when>
						</c:choose>
					</td>
					<td><a href="adminMemberDetail.do?id=${member.id}">${member.id}</a></td>
					<td>${member.reason}</td>
					<td>${member.content}</td>
				</c:forEach>
				
				<!-- 글 없는 경우 -->
				<tr class="no_board">
					<td colspan="4">고객 목록이 없습니다.</td>
				</tr>
			</table>
			
			<div class="board_list_page clear">
				<a href="adminMemberLeaveList.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
				<c:if test="${paging.nowPage != 1}">
					<a href="adminMemberLeaveList.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
				</c:if>
				<c:if test="${paging.nowPage == 1}">
					<a href="adminMemberLeaveList.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
				</c:if>
				<ul>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li class="active"><a>${p}</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="adminMemberLeaveList.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				</ul>
			
				<c:if test="${paging.nowPage != paging.lastPage}">
					<a href="adminMemberLeaveList.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
				</c:if>
				<c:if test="${paging.nowPage == paging.lastPage}">
					<a href="adminMemberLeaveList.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
				</c:if>
				<a href="adminMemberLeaveList.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>	
		</div>
	</body>
</html>

<%@ include file="/admin/include/footer.jsp"%>