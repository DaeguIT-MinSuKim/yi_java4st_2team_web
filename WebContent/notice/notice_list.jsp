<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_notice.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>공지사항</h3>
		<div class="location pc">HOME <span>></span> 공지사항</div>
		
		<div class="notice_content">
			<table class="table_style1">
				<!-- 글 있는 경우 -->
				<colgroup>
					<col width="10%">
					<col width="">
					<col width="20%">
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<tr class="board">
					<td><span class="notice_board">공지</span></td>
					<td class="tl"><a href="noticeView.do">공지사항 글 중에서의 공지 글 입니다.</a></td>
					<td>2020-10-16 12:38:09</td>
				</tr>
				<tr class="board">
					<td>3</td>
					<td class="tl"><a href="noticeView.do">공지사항입니다.</a></td>
					<td>2020-10-16 12:38:09</td>
				</tr>
				<tr class="board">
					<td>2</td>
					<td class="tl"><a href="noticeView.do">공지사항입니다.</a></td>
					<td>2020-10-16 12:38:09</td>
				</tr>
				<tr class="board">
					<td>1</td>
					<td class="tl"><a href="noticeView.do">공지사항입니다.</a></td>
					<td>2020-10-16 12:38:09</td>
				</tr>
				
				<!-- 글 없는 경우 -->
				<tr class="no_board">
					<td colspan="5">작성된 글이 없습니다.</td>
				</tr>
			</table>
			
			<a href="noticeWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
			
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