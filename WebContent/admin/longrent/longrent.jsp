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
	
	$('#repX').on("click", function(){
		if($('#selectBox option:selected').val() == "rep_yn" && frmSearch.keyword.value == ""){
	//		alert("됐다");
			frmSearch.keyword.value = 1;
		}
	})		
	
	$("#admin_gnb > ul > li:eq(4)").addClass("on")
})
</script>
<div id="adimn_content">
	<h2>장기렌트</h2>
	<div class="admin_page">
	
		<div class="divSearch">
				<form name="frmSearch" action="adminLongRent.do" method="post">
					<select name="condition" id="selectBox">
						<option value="name">이름</option>
						<option value="title">제목</option>
						<option value="contents">내용</option>
						<option value="rep_yn" id="repYn">답변여부X</option>
					</select> 
					<input type="text" name="keyword" title="검색어 입력" id="keyword" > 
					<input type="hidden" name="no" value="${LongRent.no }"> 
					<input type="submit" value="검색" id="repX">
					<a href="adminLongRent.do" type="button" class="btn btn_case2">목록보기</a>
				</form>
		</div>
	
		<table class="table_style1">
			<!-- 글 있는 경우 -->
			<colgroup>
				<col width="10%">
				<col width="">
				<col width="13%">
				<col width="18%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>답변여부</th>
			</tr>
			<c:forEach items="${list}" var="LongRent">
				<tr class="board">
					<td id="no">${LongRent.no }</td>
					<td class="tl" id="title"><a href="adminLongRentView.do?no=${LongRent.no}">${LongRent.title }</a></td>
					<td id="name">${LongRent.name }</td>
					<%-- <td id="date" class="date">${LongRent.writeDate }</td> --%>
					<td id="date"><fmt:formatDate value="${LongRent.writeDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td> 
					<td>
						<c:choose>
							<c:when test="${LongRent.repYn==1 }" ><span class="notice_board">X</span></c:when>
							<c:when test="${LongRent.repYn==2 }">O</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			
			<!-- 글 없는 경우 -->
			<tr class="no_board">
				<td colspan="5">작성된 글이 없습니다.</td>
			</tr>
		</table>
		
		<!-- <a href="#" class="btn_small btn_case2 floatR mt10">답글쓰기</a> -->
			
		
		<div class="board_list_page clear">
			<a href="adminLongRent.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="adminLongRent.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="adminLongRent.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="adminLongRent.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>


	</div>

	<c:if test="${method eq 'post'}">
		<input type="hidden" name="post_condition" value="${condition}">
		<input type="hidden" name="post_keyword" value="${keyword}">
	
	<script>
		$(document).ready(function(){
			$(".divSearch select").val($("input[name=post_condition]").val())
			if ($("input[name=post_condition]").val() != "rep_yn"){
				$(".divSearch input[name=keyword]").val($("input[name=post_keyword]").val())
			}
			
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

</div>
<%@ include file="/admin/include/footer.jsp"%>