<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_event.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>진행중인 이벤트</h3>
		<div class="location pc">HOME <span>></span> 이벤트 <span>></span> 진행중인 이벤트</div>
		
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
		</div>
		
		
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>