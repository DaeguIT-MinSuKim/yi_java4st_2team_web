<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<c:if test="${kindList == null}">
	<script>
		//받아온 리스트가 비었을시
		alert("검색한 항목의 내용이 없습니다");
		location.href = "kindList.do";
	</script>
</c:if>
<script>
	$(function() {
		$(".search").click(function() {
			if ($("#inputSearch").val().trim() == "") {
				alert("값을 기입하여주세요");
				location.href = "kindList.do";
			}
		});
		
		$("#admin_gnb > ul > li:eq(1)").addClass("on")
	});
</script>
<div id="adimn_content">
	<h2>차량분류 목록</h2>
	<div class="admin_page">
		<div class="search_car">
			<a href="kindWrite.do" class="btn btn-primary c_fff">분류항목 추가</a>
			<div class="divSearch">
				<form name="frm" method="post" action="kindList.do">
					<input type="text" name="inputSearch" id="inputSearch" style="border-left:1px solid #ddd" placeholder="검색란">
					<button class="search">검색</button>
				</form>
			</div>
		</div>
		<table class="table_style1">
			<colgroup>
				<col style="width: 40%">
				<col style="width: 40%">
				<col style="width: 10%">
				<col style="width: 10%">
			</colgroup>
			<tr>
				<th>분류명</th>
				<th>분류금액</th>
				<th>분류수정</th>
				<th>분류삭제</th>
			</tr>
			<c:forEach items="${kindList }" var="kind">
				<tr>
					<td>${kind.name}</td>
					<td>${kind.fare}</td>
					<td><a href="kindUpdate.do?kindCode=${kind.code}"><input type="button" value="수정" class="update btn-success"></a></td>
					<td><a href="kindDelete.do?kindCode=${kind.code}"><input type="button" value="삭제" class="delete btn_case5"></a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="board_list_page clear">
		<a href="kindList.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
		<c:if test="${paging.nowPage != 1}">
			<a href="kindList.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
		</c:if>
		<c:if test="${paging.nowPage == 1}">
			<a href="kindList.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
		</c:if>
		<ul>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<li class="active"><a>${p}</a></li>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<li><a href="kindList.do?nowPage=${p}">${p}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
		</ul>
		
		<c:if test="${paging.nowPage != paging.lastPage}">
			<a href="kindList.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
		</c:if>
		<c:if test="${paging.nowPage == paging.lastPage}">
			<a href="kindList.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
		</c:if>
		<a href="kindList.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
	</div>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>