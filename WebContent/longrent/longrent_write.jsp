<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>


<!-- 컨텐츠 -->
<div class="contents_box2">
	<div class="contents">
		<h3>장기렌트 글쓰기</h3>
		<div class="location pc">HOME <span>></span> 장기렌트 글쓰기</div>
		
		<div class="longrent_content">
			<form method="post">
				<div>
					<div class="input_col3">
						<input type="text" placeholder="이름">
						<input type="text" placeholder="연락처">
						<input type="password" placeholder="비밀번호">
					</div>
					<input type="text" class="mt5" placeholder="제목을 입력해주세요">
					<textarea class="write_content mt5" placeholder="내용을 입력해주세요"></textarea>
					<div class="option_check">
						<label><input type="checkbox"> 후방 카메라</label>
						<label><input type="checkbox"> 블루투스</label>
						<label><input type="checkbox"> 카시트</label>
						<label><input type="checkbox"> 내비게이션</label>
						<label><input type="checkbox"> 하이패스</label>
					</div>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="longRent.do" class="btn_small btn_case4">취소</a></li>
					<li><a href="#" class="btn_small btn_case2">확인</a></li>
				</ul>
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>