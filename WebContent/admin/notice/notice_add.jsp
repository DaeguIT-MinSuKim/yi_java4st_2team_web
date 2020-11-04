<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>

<!-- 컨텐츠 -->
<script>
$(function(){
	$('#noticeAdd').on("click", function(){
		
		var chkYN = "";
		
		if($('#CHECK_YN').prop("checked") == true ){
			chkYN = 0;
			//alert("체크 했다 = 공지");
		}else{
			chkYN = 1;
		}
		
		
		if(admin_writeCheck()) {
			
			var newNotice = {
				title : $('#title').val(),
				contents : $("textarea").val(),
				isTop : chkYN
			};

			$.ajax({
				type : "post",
				url : "adminNoticeWrite.do",
				cache : false,
				data : JSON.stringify(newNotice),
				success : function(data) {
					alert("공지사항을 추가했습니다.");
					window.location.href = "adminNotice.do";
				}

			});
		}

		
	});
	
	$("#admin_gnb > ul > li:eq(5)").addClass("on")
	
});
</script>

	<div id="adimn_content">
		<h2>공지사항 글쓰기</h2>
		
		<div class="admin_page">
			<form method="post" name="frm">
				<div>
					<input type="hidden" id="YN" name="YN"/>
					<label><input type="checkbox" id="CHECK_YN" name="CHECK_YN"> <strong>공지</strong><br> <small>(체크하시면 공지로 상단에 등록됩니다.)</small>  </label>
					<input type="text" class="mt5" name="title" placeholder="제목을 입력해주세요" id="title">
					<textarea class="write_content mt5" wrap="hard" name="contents"></textarea>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="adminNotice.do" class="btn_small btn_case4">취소</a></li>
					<li><a class="btn_small btn_case2" id="noticeAdd">확인</a></li>
				</ul>
			</form>
		</div>
	</div>


<%@ include file="/admin/include/footer.jsp"%>