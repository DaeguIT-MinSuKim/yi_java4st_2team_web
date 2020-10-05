<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>


<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>장기렌트 글쓰기</h3>
		<div class="location pc">HOME <span>></span> 장기렌트 글쓰기</div>
		
		<div class="longrent_content">
			<div>
				<div class="input_col3">
					<input type="text" placeholder="이름">
					<input type="text" placeholder="연락처">
					<input type="password" placeholder="비밀번호">
				</div>
				<input type="text" class="mt5" placeholder="제목을 입력해주세요">
				<textarea class="write_content mt5" placeholder="내용을 입력해주세요"></textarea>
				<div class="option_check">
					<ul>
						<li>카시트</li>
						<li>카시트</li>
						<li>카시트</li>
					</ul>
					<p class="popup_longrent_option_btn"><span>버튼</span></p>
				</div>
			</div>
			

			<ul class="button_style3 mt50">
				<li><a href="longRent.do" class="btn_small btn_case4">취소</a></li>
				<li><a href="#" class="btn_small btn_case2">확인</a></li>
			</ul>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<div class="popup_longrent_option" style="top: 0px; display: block;">
	<div class="con">
		<div class="top">
			<p class="title">장기렌트 옵션 선택</p>
			<a href="javascript:;" class="popup_close_common" style="transition: all 0.1s linear 0s;"><img src="./images/member/popup_close.svg" alt="닫기" style="transition: all 0.1s linear 0s;"></a>
		</div>
		<div class="btm">
		</div>
	</div>
	<div class="bg popup_close_common" style="display: block;"></div>
</div>

<%@ include file="/include/footer.jsp"%>