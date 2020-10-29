<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/admin/include/header.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객 블랙리스트</title>
		<script>
			$(function() {
				if ($(".board").length == 0) { // 글이 없는 경우
					$(".no_board").show();
					$(".board").hide();
				}
				
			});
		</script>
	</head>
	
	<body>
		<div id="adimn_content">
		<h2>고객 블랙 리스트</h2>
		<div class="admin_page">
			<p>※ 고객님의 상세 정보는 아이디를 클릭하세요.</p>
			<div class="divSearch">
				<form name="frmSearch" action="adminBlackList.do" method="post">
					<select name="condition">
						<option value="name">이름</option>
						<option value="id">아이디</option>
					</select> 
					<input type="text" name="keyword" title="검색어 입력">
					<input type="submit" value="검색">
					<a href="adminBlackList.do" type="button" class="btn btn_case2">목록보기</a>
				</form>
			</div>
			
			<table class="table_style1">
				<!-- 글 있는 경우 -->
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				
				<tr>
					<th>블랙</th>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>면허종류</th>
					<th>면허번호</th>
					<th>최근접속</th>
				</tr>

				<c:forEach items="${blackPaging}" var="member">

				<tr class="board">
					<td>
						<c:choose>
							<c:when test="${member.is_black == 'Y'}">✔</c:when>
							<c:when test="${member.is_black == 'N'}"></c:when>
						</c:choose>
					</td>
					<td><a href="adminMemberDetail.do?id=${member.id}">${member.id}</a></td>
					<td>${member.name}</td>
					<td>${member.tel}</td>
					<td>
						<c:choose>
							<c:when test="${member.li_class == 'Class2A'}">2종 보통</c:when>
							<c:when test="${member.li_class == 'Class2M'}">2종 수동</c:when>
							<c:when test="${member.li_class == 'Class1A'}">1종 보통</c:when>
							<c:when test="${member.li_class == 'Class1B'}">1종 대형</c:when>
						</c:choose>
					</td>
					<td>${member.li_number}</td>
					<td>${member.date}</td>
				</tr>
				</c:forEach>
				
				<!-- 글 없는 경우 -->
				<tr class="no_board">
					<td colspan="7">고객 목록이 없습니다.</td>
				</tr>
			</table>
			
			<div class="board_list_page clear">
				<a href="adminBlackList.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
				<c:if test="${paging.nowPage != 1}">
					<a href="adminBlackList.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
				</c:if>
				<c:if test="${paging.nowPage == 1}">
					<a href="adminBlackList.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
				</c:if>
				<ul>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li class="active"><a>${p}</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="adminBlackList.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				</ul>
			
				<c:if test="${paging.nowPage != paging.lastPage}">
					<a href="adminBlackList.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
				</c:if>
				<c:if test="${paging.nowPage == paging.lastPage}">
					<a href="adminBlackList.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
				</c:if>
				<a href="adminBlackList.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>	
		</div>
	</body>
</html>

<%@ include file="/admin/include/footer.jsp"%>