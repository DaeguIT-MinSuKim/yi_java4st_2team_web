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
				location.href = "brandList.do";
			}
		});
	});
</script>
<div id="adimn_content">
	<h2>브랜드 목록</h2>
	<div class="admin_page">
		<div class="search_car">
			<a href="brandWrite.do" class="btn btn-primary c_fff">브랜드 추가</a>
			<div class="divSearch">
				<form name="frm" method="post" action="brandList.do">
					<input type="text" name="inputSearch" id="inputSearch"
						placeholder="검색란" style="border-left:1px solid #ddd">
					<button class="search">검색</button>
				</form>
			</div>
		</div>
		<table class="table_style1">
			<tr>
				<th>브랜드명</th>
				<th>이미지</th>
				<th>브랜드 수정</th>
				<th>브랜드 삭제</th>
			</tr>
			<c:forEach items="${brandList }" var="brand">
				<colgroup>
					<col style="width:40%">
					<col style="width:40%">
					<col style="width:10%">
					<col style="width:10%">
				</colgroup>
				<tr>
					<td>${brand.name}</td>
					<td><img src="upload/${brand.image }" width="50" height="50"></td>
					<td><a href="brandUpdate.do?brandCode=${brand.code}"><input type="button" value="수정" class="update btn-success"></a></td>
					<td><a href="brandDelete.do?brandCode=${brand.code}"><input type="button" value="삭제" class="delete btn_case5"></a></td>
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