<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>


<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>장기렌트</h3>
		<div class="location pc">HOME <span>></span> 장기렌트</div>
		
		<div class="longrent_content">
			<div class="board_view">
				<p class="tit">${LongRent.title }</p>
				<p class="date">${LongRent.writeDate }</p>
				<div class="content">
					<ul>
						<li>이름 : ${LongRent.name } </li>
						<li>연락처 : ${LongRent.tel } </li>
					</ul>
					<div style="white-space:pre;"><c:out value="${LongRent.contents }"/></div>
				</div>
				<div class="option">
					<p class="t1">옵션</p>
					<p class="t2">${LongRent.options }</p>
				</div>
				<div class="comment">
				<!-- 	<form>
						<p class="t1">답변</p>
						<textarea></textarea>
						<input type="submit" value="확인">
					</form> -->
					<ul class="comment_list">
						<li>
							<div class="tit_box">
								<p class="name">관리자</p>
								<p class="date"><fmt:formatDate value="${LongRent.writeDate}" pattern="yyyy-MM-dd"/></p>
							</div>
							<div class="content_box">
								<p>
									<c:choose>
										<c:when test="${LongRent.repContent==null }">문의를 확인 중입니다... <br> 관리자가 답글을 남길 곳입니다. </c:when>
										<c:otherwise>${LongRent.repContent }</c:otherwise>
									</c:choose>
								</p>
								<form>
									<textarea>관리자가 답변을 남겼습니다.</textarea>
									<input type="submit" value="수정">
								</form>
							</div>
							<ul class="btn">
								<li><a href="#" class="update"></a></li>
								<li><a href="#" class="delete"></a></li>
							</ul>
						</li>
					</ul>
				</div>
				<a href="longRent.do" class="btn_small btn_case2 floatR mt10">목록</a>
				<a href="longUpdate.do?no=${param.no}" class="btn_small btn_case2 floatR mt10 mr5">수정</a>
			</div>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>