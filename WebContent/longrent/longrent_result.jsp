ㅂ<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>
<script>
$(function(){
	
		if( $(".board").length == 0 ){ // 글이 없는 경우
			$(".no_board").show();
			$(".board").hide();
		}
});
</script>

<!-- 컨텐츠 -->
<%-- ${list } --%>
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>장기렌트</h3>
		<div class="location pc">HOME <span>></span> 장기렌트</div>
		
		<div class="longrent_content">


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
					<th>답변여부</th>
				</tr>
				<c:forEach var="LongRent" items="${list}">
					<tr class="board">
						<td id="no">${param.no }</td>
						<td class="tl" id="title"><a href="longRentPasswordForm.do?no=${param.no}">${param.title }</a></td>
						<td id="name">${param.name }</td>
						<%-- <td id="date" class="date">${LongRent.writeDate }</td> --%>
						<td id="date"><fmt:formatDate value="${param.writeDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td> 
						<td>
							<c:choose>
								<c:when test="${param.repYn==1 }">X</c:when>
								<c:when test="${param.repYn==2 }">O</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				
				<!-- 글 없는 경우 -->
				<tr class="no_board">
					<td colspan="5">작성된 글이 없습니다.</td>
				</tr>
			</table>
			
			<a href="longRentWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
			
		
		<div class="board_list_page clear">
			<a href="longRent.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="longRent.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="longRent.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="longRent.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="longRent.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="longRent.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="longRent.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>
		
		
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>