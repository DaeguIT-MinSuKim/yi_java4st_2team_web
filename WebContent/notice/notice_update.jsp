<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_notice.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>공지사항 글수정</h3>
		<div class="location pc">HOME <span>></span> 공지사항 글수정</div>
		
		<div class="notice_content">
			<form name= "frm" method="post" action="noticeUpdate.do">
				<div>
					<input type="text" class="mt5" name="title" id="title" value="공지사항입니다.">
					<textarea class="write_content mt5" name="contents" id="contents_ckeditor">공지사항 내용 글 입니다.</textarea>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="javascript:;" class="btn_small btn_case1 c_fff" id="updateBtn">수정</a></li>
					<li><a href="notice.do" class="btn_small btn_case2" >취소</a></li>
				</ul>
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>