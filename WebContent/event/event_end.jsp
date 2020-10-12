<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_event.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>종료된 이벤트</h3>
		<div class="location pc">HOME <span>></span> 이벤트 <span>></span> 종료된 이벤트</div>
		
		<div>
			<ul class="event_list">
				<c:forEach items="${eventList}" var="event">
					<li><a href="eventView.do?code=${event.eventCode}">
						<img src="images/event/${event.thumImage}">
						<p>${event.name}</p>
					</a></li>
				</c:forEach>
				<!-- <li><a href="eventView.do">
					<img src="images/event/1_thumbnail.png">
					<p>10월 월렌트 이벤트</p>
				</a></li>
				<li><a href="eventView.do">
					<img src="images/event/1_thumbnail.png">
					<p>10월 월렌트 이벤트</p>
				</a></li>
				<li><a href="eventView.do">
					<img src="images/event/1_thumbnail.png">
					<p>10월 월렌트 이벤트</p>
				</a></li> -->
			</ul>
			
			<a href="eventWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
			
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