<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<script>
$(function(){
	
		if( $(".board").length == 0 ){ // 글이 없는 경우
			$(".no_board").show();
			$(".board").hide();
		}
		
		$("#reply_add").click(function(){	
			alert("댓글이 등록(수정)되었습니다.");
		});
		
		$("#reply_delete").click(function(e){	
			e.preventDefault();
			if(confirm("댓글을 삭제하시겠습니까?") == true){
				var val = $(this).attr("href");
				location.href=val;
			}
			
		});
		
		$("#btn_delete").click(function(e){
			e.preventDefault();
			if(confirm("게시글 삭제입니다. 삭제하시겠습니까?") == true){
				var val = $(this).attr("href");
				location.href=val;
			}else{
				//취소눌렀을때	
				
			}
			
		});
		
		$("#admin_gnb > ul > li:eq(4)").addClass("on")
		
		
		
	/*삭제 정말 삭제하시겠습니까? 경고창   */		
		
})
</script>
<!-- 컨텐츠 -->
<div id="adimn_content">
	<h2>장기렌트</h2>
	<div class="admin_page">
		<div class="board_view">
			<p class="tit">${LongRent.title }</p>
			<p class="date">${LongRent.writeDate }</p>
			<div class="content">
				<ul>
					<li>이름 : ${LongRent.name } </li>
					<li>연락처 : ${LongRent.tel } </li>
				</ul>
				<div style="white-space:pre-line;"><c:out value="${LongRent.contents }"/></div>
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
										<c:when test="${LongRent.repContent==null }">답변을 등록바랍니다. </c:when>
										<c:otherwise>${LongRent.repContent }</c:otherwise>
									</c:choose>
							</p>
							<form method="get" action="adminLongRentUpdate.do" accept-charset="utf-8">
								<textarea placeholder="관리자님 답변을 남겨주세요." id="Reply" name="reply"></textarea>
								<input type="hidden" value="${param.no}" name="no">
								<input type="submit" id="reply_add" value="댓글 등록">
							</form>	
						</div>
						 <ul class="btn">
                        <li><a href="#" id="reply_update" class="update">댓글 수정</a></li>
                        <li><a href="adminLongRentReplyDelete.do?no=${param.no }" id ="reply_delete" class="delete">댓글 삭제</a></li>
                     </ul>

					</li>
				</ul>
			</div>
			
		<a href="adminLongRentDelete.do?no=${param.no}" id="btn_delete"class="btn_small btn_case5 floatR mt10">글 삭제</a>
			<a href="adminLongRent.do" class="btn_small btn_case2 floatR mt10 mr5">글 목록</a>
		
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/admin/include/footer.jsp"%>