<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<script>
$(function(){
	
		if( $(".board").length == 0 ){ // 글이 없는 경우
			$(".no_board").show();
			$(".board").hide();
		}
	
		$("#btn_delete2").click(function(e){	
			e.preventDefault();
			if(confirm("공지사항 게시글을 삭제하시겠습니까?") == true){
				var val = $(this).attr("href");
				location.href=val;
			}
			
		});	
			
});
		
</script>
<!-- 컨텐츠 -->
<div id="adimn_content">
	<h2>공지사항</h2>
	<div class="admin_page">
		<div class="board_view">
				<c:choose>
								<c:when test="${Notice.isTop == 0 }"><span class="notice_board">공지</span></c:when>
								<c:when test="${Notice.isTop == 1 }"></c:when>
				</c:choose>
				<p class="tit">${Notice.title }</p>
				<p class="date">${Notice.writeDate }</p>
				<div class="content">
					 ${Notice.contents }
				</div>
				<a href="adminNotice.do" class="btn_small btn_case2 floatR mt10 mr5">목록</a>
				<a href="adminNoticeDelete.do?no=${param.no }" class="btn_small btn_case5 floatR mt10 mr5" id="btn_delete2">삭제</a>
				<a href="adminNoticeUpdate.do?no=${param.no }" class="btn_small btn_case2 floatR mt10 mr5">수정</a>
			</div>

			</div>
		</div>

<%@ include file="/admin/include/footer.jsp"%>