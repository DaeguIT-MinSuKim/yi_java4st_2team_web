<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>이벤트 글쓰기</h3>
		<div class="location pc">HOME <span>></span> 이벤트 글쓰기</div>
		
		<div class="longrent_content">
			<form method="post">
				<div>
					<label><input type="checkbox"> 사용</label>
					<div class="input_col2">
						<input type="text" placeholder="코드" id="name">
						<input type="text" placeholder="할인" id="tel">
					</div>
					<input type="text" class="mt5" placeholder="제목을 입력해주세요" id="title">
					<div class="file_wrap">
						<p>리스트 이미지</p><input type="file">
						<p>상세페이지 이미지</p><input type="file">
					</div>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="event.do" class="btn_small btn_case4">취소</a></li>
					<li><a href="eventWrite.do" class="btn_small btn_case2" id="add">확인</a></li>
				</ul>
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>