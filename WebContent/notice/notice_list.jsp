<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_notice.jsp"%>

<script>
$(function(){
	if( $(".board").length == 0 ){ // 글이 없는 경우
		$(".no_board").show();
		$(".board").hide();
	}
})
</script>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>공지사항</h3>
		<div class="location pc">HOME <span>></span> 공지사항</div>
		
		<div class="notice_content">
		
			<div class="divSearch">
				<form name="frmSearch" action="notice.do" method="post">
					<select name="condition">
						<option value="title">제목</option>
						<option value="no">번호</option>
						<option value="contents">내용</option>
					</select> 
					<input type="text" name="keyword" title="검색어 입력"> 
					<input type="hidden" name="no" value="${Notice.no }"> 
					<input type="submit" value="검색">
					<a href="Notice.do" type="button" class="btn btn_case2">목록보기</a>
				</form>
			</div>
		
		
			<table class="table_style1">
				<!-- 글 있는 경우 -->
				<colgroup>
					<col width="10%">
					<col width="" >
					<col width="12%">
					<col width="20%">
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
								<c:when test="${Notice.isTop == 0 }"><span class="notice_board">공지(${Notice.no})</span></c:when>
								<c:when test="${Notice.isTop == 1 }">${Notice.no }</c:when>
							</c:choose>
						<td class="tl"><a href="noticeView.do?no=${Notice.no}">${Notice.title }</a></td>
						<td> 관리자 </td>
						<td><fmt:formatDate value="${Notice.writeDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td> 
					</tr>
				</c:forEach>
				
				<!-- 글 없는 경우 -->
				<tr class="no_board">
					<td colspan="5">작성된 글이 없습니다.</td>
				</tr>
			</table>
			
			<!-- <a href="noticeWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a> -->
			
			<div class="board_list_page clear">
			<a href="notice.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="notice.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="notice.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="notice.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="notice.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="notice.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="notice.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>
	</div>	
	
	<c:if test="${method eq 'post'}">
		<input type="hidden" name="post_condition" value="${condition}">
		<input type="hidden" name="post_keyword" value="${keyword}">
	
	<script>
		$(document).ready(function(){
			$(".divSearch select").val($("input[name=post_condition]").val())
			$(".divSearch input[name=keyword]").val($("input[name=post_keyword]").val())
			
			$(".board_list_page a").click(function(){
				var href = $(this).attr("href");
				var hrefArray = href.split('=');
				
				$(".divSearch form").append('<input type="hidden" name="nowPage" value="'+ hrefArray[1] +'">')
				$(".divSearch form").submit();
				return false;
			})
			
		})
	</script>
</c:if>
	
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>