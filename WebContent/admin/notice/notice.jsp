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
	<h2>공지사항</h2>
	<div class="admin_page">
		<table class="table_style1">
			<!-- 글 있는 경우 -->
			<colgroup>
				<col width="10%">
				<col width="">
				<col width="12%">
				<col width="16%">
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="Notice" items="${list }">
					<tr class="board">
						<td>
							<c:choose>
								<c:when test="${Notice.isTop == 0 }"><span class="notice_board">공지</span></c:when>
								<c:when test="${Notice.isTop == 1 }">${Notice.no }</c:when>
							</c:choose>
						<td class="tl"><a href="adminNoticeView.do?no=${Notice.no}">${Notice.title }</a></td>
						<td> 관리자 </td>
						<td><fmt:formatDate value="${Notice.writeDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td> 
					</tr>
				</c:forEach>
				
				<!-- 글 없는 경우 -->
				<tr class="no_board">
					<td colspan="5">작성된 글이 없습니다.</td>
				</tr>
			</table>
		<!-- <form action="adminNoticeWrite.do" method="get">
		</form> -->
		<a href="adminNoticeWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
		
		
		<div class="board_list_page clear">
			<a href="adminNotice.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="adminNotice.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="adminNotice.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="adminNotice.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="adminNotice.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="adminNotice.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="adminNotice.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>
		

</div><!--컨텐츠  -->



<%@ include file="/admin/include/footer.jsp"%>