<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_event.jsp"%>


<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>이벤트</h3>
		<div class="location pc">HOME <span>></span> 이벤트</div>
		
		<div class="longrent_content">
			<div class="board_view">
				<p class="tit">${event.name}</p>
				<div class="content">
					<div class="event_img"><img src="upload/${event.viewImage}"></div>
				</div>
				<a href="event.do" class="btn_small btn_case2 floatR mt10">목록</a>
				<a href="eventUpdate.do?code=${event.eventCode}" class="btn_small btn_case2 floatR mt10 mr5">수정</a>
				<a href="eventDelete.do?code=${event.eventCode}" class="btn_small btn_case2 floatR mt10 mr5">삭제</a>
			</div>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>