<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/admin/include/header.jsp"%>

<meta charset="UTF-8">
<title>고객 목록</title>
<script>
	$(function() {
		if ($(".board").length == 0) { // 글이 없는 경우
			$(".no_board").show();
			$(".board").hide();
		}
		

		function admin_frm_adminOptUpdate(){
			if( $("form[name=admin_frm_adminOptUpdate]").length > 0 ){
				if( frm_adminOptUpdate.optName.value.length == 0 ){
					alert("옵션이름을 적어주세요");
					return false;
				}
				if( frm_adminOptUpdate.optFare.value.length == 0 ){
					alert("옵션비용을 적어주세요");
					return false;
				}
				return true;
			}
		}
		
		if( admin_frm_adminOptUpdate() ){
			
		}
	});
</script>
	
	<div id="adimn_content">
		<h2>고객 목록</h2>
		<div class="admin_page">
			<div class="divSearch">
				<form name="frmSearch" action="adminOptList.do" method="post">
					<select name="condition">
						<option value="opt_code">옵션코드</option>
						<option value="name">옵션 이름</option>
					</select> 
					<input type="text" name="keyword" title="검색어 입력">
					<input type="submit" value="검색">
					<input type="hidden" value="${paging.nowPage}" name="nowPage">
					<a href="adminOptList.do" type="button" class="btn btn_case2">목록보기</a>
				</form>
			</div>
			
			<table class="table_style1">
				<!-- 글 있는 경우 -->
				<colgroup>
					<col width="30%">
					<col width="25%">
					<col width="25%">
					<col width="10%"> 
					<col width="10%"> 
				</colgroup>
				
				<tr>
					<th>옵션 코드</th>
					<th>옵션 이름</th>
					<th>옵션 비용</th>
					<th colspan="2"></th>
				</tr>

				<c:forEach items="${optPaging}" var="opt">
					<tr class="board">
						<td>${opt.code}</td>
						<td>${opt.name}</td>
						<td>${opt.fare}</td>
						<td>
							<a href="adminOptUpdate.do?code=${opt.code}" ><input type="button" value="수정" class="update btn-success"></a>
						</td>
						<td>
							<a href="carDelete.do?code="${opt.code}">
								<input type="button" value="삭제" class="delete btn_case5">
							</a>
						</td>
					</tr>
				</c:forEach>
				
				<!-- 글 없는 경우 -->
				<tr class="no_board">
					<td colspan="7">고객 목록이 없습니다.</td>
				</tr>
			</table>
			
			<div class="board_list_page clear">
				<a href="adminOptList.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
				<c:if test="${paging.nowPage != 1}">
					<a href="adminOptList.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
				</c:if>
				<c:if test="${paging.nowPage == 1}">
					<a href="adminOptList.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
				</c:if>
				<ul>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li class="active"><a>${p}</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="adminOptList.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				</ul>
			
				<c:if test="${paging.nowPage != paging.lastPage}">
					<a href="adminOptList.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
				</c:if>
				<c:if test="${paging.nowPage == paging.lastPage}">
					<a href="adminOptList.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
				</c:if>
				<a href="adminOptList.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>	
	</div>

<%@ include file="/admin/include/footer.jsp"%>