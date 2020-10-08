<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>



<!-- 컨텐츠 -->
<%-- ${list } --%>
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>장기렌트</h3>
		<div class="location pc">HOME <span>></span> 장기렌트</div>
		
		<div class="longrent_content">
			<table class="table_style1">
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
						<td id="no">${LongRent.no }</td>
						<td class="tl" id="title"><a href="longRentPassword.do">${LongRent.title }</a></td>
						<td id="name">${LongRent.name }</td>
						<td id="date">${LongRent.writeDate }</td>
						<td>
						<c:choose>
							<c:when test="${LongRent.repYn==1 }">X</c:when>
							<c:when test="${LongRent.repYn==2 }">O</c:when>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td>5</td>
					<td class="tl"><a href="longRentPassword.do">장기렌트 대여 문의합니다!</a></td>
					<td>김*동</td>
					<td>2019.10.05</td>
				</tr>
			</table>
			
			<a href="longRentWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
			
			<div class="board_list_page clear">
				<a href="#" class="first arrow"><span class="text_hidden">처음</span></a>
				<a href="#" class="prev arrow"><span class="text_hidden">이전</span></a>
				<ul>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li><a href="#">10</a></li>
				</ul>
				<a href="#" class="next arrow"><span class="text_hidden">다음</span></a>
				<a href="#" class="end arrow"><span class="text_hidden">마지막</span></a>
			</div>
		</div>
		
		
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>