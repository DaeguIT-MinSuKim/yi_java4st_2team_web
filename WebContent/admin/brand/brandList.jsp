<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<c:if test="${brandList == null}">
	<script>
		//받아온 리스트가 비었을시
		alert("검색한 항목의 내용이 없습니다");
		location.href = "brandList.do";
	</script>
</c:if>
<script>
	$(function() {
		$(".search").click(function() {
			if ($("#inputSearch").val().trim() == "") {
				alert("값을 기입하여주세요");
				$("#inputSearch").focus();
				return false;
			}
		});
	});
</script>
<div id="adimn_content">
	<h2>브랜드 목록</h2>
	<div class="admin_page">
		<a href="brandWrite.do">브랜드 추가</a>
		<form name="frm" method="post" action="brandList.do">
			<input type="text" name="inputSearch" id="inputSearch"
				placeholder="검색란">
			<button class="search">검색</button>
		</form>
		<table border=1>
			<tr>
				<th>브랜드명</th>
				<th>이미지</th>
				<th>브랜드 수정</th>
				<th>브랜드 삭제</th>
			</tr>
			<c:forEach items="${brandList }" var="brand">
				<tr>
					<td>${brand.name}</td>
					<td><img src="upload/${brand.image }" width="50" height="50"></td>
					<td><a href="brandUpdate.do?brandCode=${brand.code}"><input
							type="button" value="수정" class="update"></a></td>
					<td><a href="brandDelete.do?brandCode=${brand.code}"><input
							type="button" value="삭제" class="delete"></a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="board_list_page clear">
			<a href="brandList.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="brandList.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="brandList.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="brandList.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="brandList.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="brandList.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="brandList.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
		</div>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>