<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_notice.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>공지사항 글쓰기</h3>
		<div class="location pc">HOME <span>></span> 공지사항 글쓰기</div>
		
		<div class="notice_content">
			<form method="post" name="frm">
				<div>
					<label><input type="checkbox"> 공지</label>
					<input type="text" class="mt5" name="title" placeholder="제목을 입력해주세요" id="title">
					<textarea class="write_content mt5" name="contents" id="contents_ckeditor"></textarea>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="notice.do" class="btn_small btn_case4">취소</a></li>
					<li><a href="javascript:;" class="btn_small btn_case2" id="add">확인</a></li>
				</ul>
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>