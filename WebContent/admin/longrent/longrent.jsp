<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<script>
$(function(){
	
		if( $(".board").length == 0 ){ // 글이 없는 경우
			$(".no_board").show();
			$(".board").hide();
		}
})
</script>
<div id="adimn_content">
	<h2>장기렌트</h2>
	<div class="admin_page">
		<table class="table_style1">
			<!-- 글 있는 경우 -->
			<colgroup>
				<col width="10%">
				<col width="">
				<col width="12%">
				<col width="16%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>답변여부</th>
			</tr>
			<c:forEach items="${list}" var="LongRent">
				<tr class="board">
					<td id="no">${LongRent.no }</td>
					<td class="tl" id="title"><a href="adminLongRentView.do?no=${LongRent.no}">${LongRent.title }</a></td>
					<td id="name">${LongRent.name }</td>
					<%-- <td id="date" class="date">${LongRent.writeDate }</td> --%>
					<td id="date"><fmt:formatDate value="${LongRent.writeDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td> 
					<td>
						<c:choose>
							<c:when test="${LongRent.repYn==1 }" ><span class="notice_board">X</span></c:when>
							<c:when test="${LongRent.repYn==2 }">O</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			
			<!-- 글 없는 경우 -->
			<tr class="no_board">
				<td colspan="5">작성된 글이 없습니다.</td>
			</tr>
		</table>
		
		<!-- <a href="#" class="btn_small btn_case2 floatR mt10">답글쓰기</a> -->
			
		
			<div class="board_list_page clear">
			<a href="adminLongRent?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="adminLongRent.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="adminLongRent.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>


<%@ include file="/admin/include/footer.jsp"%>