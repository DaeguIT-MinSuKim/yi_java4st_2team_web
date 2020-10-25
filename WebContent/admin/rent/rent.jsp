<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<h2>단기렌트</h2>
	<div class="admin_page">
	
		<div class="divSearch">
			<form name="frmSearch" action="adminRent.do" method="post">
				<select name="condition">
					<option value="id">아이디</option>
					<option value="car_name">차량종류</option>
					<option value="car_no">차량번호</option>
				</select> 
				<input type="text" name="keyword" title="검색어 입력"> 
				<input type="hidden" name="no" value=""> 
				<input type="hidden" name="nowPage" id="nowPage" value="${paging.nowPage}">
				<input type="submit" value="검색">
			</form>
		</div>
	
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
				<th>예약번호</th>
				<th>예약자 아이디</th>
				<th>차량종류</th>
				<th>차량번호</th>
				<th>보험종류</th>
				<th>대여일</th>
				<th>반납일</th>
				<th>반납유무</th>
				<th>총결제금액</th>
				<th>비고</th>
			</tr>
			<c:forEach items="${rentList}" var="rent">
				<tr class="board">
					<td>${rent.rentNo}</td>
					<td>${rent.id.id }</td>
					<td>${rent.carNo.name }</td>
					<td>${rent.carNo.no }</td>
					<td>${rent.insCode.name }</td>
					<td>${fn:split(rent.rent_date,'T')[0]}</td>
					<td>${fn:split(rent.return_date,'T')[0]}</td>
					<td>${rent.is_rent }</td>
					<td>${rent.fare }</td>
					<td>${rent.remark }</td>
				</tr>
			</c:forEach> 
			<!-- 글 없는 경우 -->
			<tr class="no_board">
				<td colspan="10">작성된 글이 없습니다.</td>
			</tr>
		</table>
		
		<div class="board_list_page clear">
			<a href="adminRent.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="adminRent.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="adminRent.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="adminRent.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="adminRent.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="adminRent.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="adminRent.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>
	</div>
		<!-- <a href="#" class="btn_small btn_case2 floatR mt10">답글쓰기</a> -->
</div>
<%@ include file="/admin/include/footer.jsp"%>