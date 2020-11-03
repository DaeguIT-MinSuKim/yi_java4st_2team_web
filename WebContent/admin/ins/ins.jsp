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
		
		$("#admin_gnb > ul > li:eq(2)").addClass("on")
})
</script>
<div id="adimn_content">
	<h2>보험</h2>
	<div class="admin_page">
	
		<div class="divSearch">
				<a href="adminInsAdd.do" class="btn_small btn-primary c_fff btn_add_right">보험 추가</a>
				<form name="frmSearch" action="#" method="post">
					<select name="condition" id="selectBox">
						<option value="INS_CODE">보험 코드</option>
						<option value="INS_NAME">보험 이름</option>
					</select> 
					<input type="text" name="keyword" title="검색어 입력" id="keyword" > 
					<input type="submit" value="검색" id="repX">
					<a href="adminInsList.do" type="button" class="btn btn_case2">목록보기</a>
				</form>
		</div>
	
		<table class="table_style1">
			<!-- 글 있는 경우 -->
			<colgroup>
				<col width="10%">
				<col width="45%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>보험 코드</th>
				<th>보험 명</th>
				<th>보험 가격</th>
				<th>보험 수정</th>
				<th>보험 삭제</th>
				
			</tr>
			<c:forEach items="${insList}" var="Ins">
				<tr class="board">
					<td id="code">${Ins.code }</td>
					<td class="tl" id="title">${Ins.name }</td>
					<td id="fare">${Ins.fare }</td>
					<td><a href="adminInsUpdate.do?code=${Ins.code}">
						<input type="button" value="수정" class="update btn-success">
						</a></td>
					<td><a href="adminInsDelete.do?code=${Ins.code }">
						<input type="button" value="삭제" class="delete btn_case5"></a></td>
				</tr>
			</c:forEach>
			
			<!-- 글 없는 경우 -->
			<tr class="no_board">
				<td colspan="5">작성된 글이 없습니다.</td>
			</tr>
		</table>
		
	
			
		
		<div class="board_list_page clear">
			<a href="adminInsList.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="adminInsList.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="adminInsList.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="adminInsList.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="adminInsList.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="adminInsList.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="adminInsList.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>


	</div>

	<c:if test="${method eq 'post'}">
		<input type="hidden" name="post_condition" value="${condition}">
		<input type="hidden" name="post_keyword" value="${keyword}">
	
	<script>
		$(document).ready(function(){
			$(".divSearch select").val($("input[name=post_condition]").val())
			
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

<%@ include file="/admin/include/footer.jsp"%>