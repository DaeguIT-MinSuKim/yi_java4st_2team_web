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
					 ${LongRent.contents }
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
								<p class="date">2020-10-01</p>
							</div>
							<div class="content_box">
								<p>
									관리자가 답변을 남겼습니다.
								</p>
								<form>
									<textarea>관리자가 답변을 남겼습니다.</textarea>
									<input type="submit" value="수정">
								</form>
							</div>
							<ul class="btn">
								<li><a href="#" class="update">수정</a></li>
								<li><a href="#" class="delete">삭제</a></li>
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