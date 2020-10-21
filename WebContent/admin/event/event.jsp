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
	<h2>이벤트</h2>
	<div class="admin_page">
		<table class="table_style1">
			<!-- 글 있는 경우 -->
			<colgroup>
				<col width="8%">
				<col width="">
				<col width="13%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>코드</th>
				<th>제목</th>
				<th>금액</th>
				<th>진행 여부</th>
			</tr>
			<c:forEach items="${eventList}" var="event">
			<tr class="board">
				<td>${event.eventCode}</td>
				<td class="tl"><a href="eventView.do?code=${event.eventCode}">${event.name}</a></td>
				<td><fmt:formatNumber value="${event.sale}"/>원</td>
				<td>
					<c:choose>
						<c:when test="${event.isEvent=='y'}">O</c:when>
						<c:when test="${event.isEvent=='n'}">X</c:when>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
			
			<!-- 글 없는 경우 -->
			<tr class="no_board">
				<td colspan="4">작성된 글이 없습니다.</td>
			</tr>
		</table>
		
		<a href="eventWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
		
		
		<div class="board_list_page clear">
			<a href="adminEvent.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="adminEvent.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="adminEvent.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="adminEvent.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="adminEvent.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.endPage == paging.lastPage}">
				<a href="adminEvent.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="adminEvent.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
		</div>
	</div>
</div>



<%@ include file="/admin/include/footer.jsp"%>