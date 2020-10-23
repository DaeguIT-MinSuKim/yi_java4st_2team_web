<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>

<!-- 컨텐츠 -->
<script>
$(function(){
	$('#noticeUpdate').on("click", function(){
		
		var chkYN = "";
		
		if($('#CHECK_YN').prop("checked") == true ){
			chkYN = 0;
			//alert("체크 했다 = 공지");
		}else{
			chkYN = 1;
		}
		
		
		if(admin_writeCheck()) {
			
			var updateNotice = {
				no : ${param.no},
				title : $('#title').val(),
				contents : CKEDITOR.instances.contents_ckeditor.getData(),
				isTop : chkYN
			};

			$.ajax({
				type : "post",
				url : "adminNoticeUpdate.do",
				cache : false,
				data : JSON.stringify(updateNotice),
				success : function(data) {
					alert("공지사항을 수정했습니다.");
					window.location.href = "adminNotice.do";
				}

			});
		}

		
	});
	
});
</script>

	<div id="adimn_content">
		<h2>공지사항 글수정</h2>
		
		<div class="admin_page">
			<form method="post" name="frm">
				<div>
					<input type="hidden" id="YN" name="YN"/>
					<label><input type="checkbox" id="CHECK_YN" name="CHECK_YN"> <strong>공지</strong><br> <small>(체크하시면 공지로 상단에 등록됩니다.)</small>  </label>
					<input type="text" class="mt5" name="title" value="${Notice.title }" id="title">
					<textarea class="write_content mt5" name="contents" id="contents_ckeditor"></textarea>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="adminNotice.do" class="btn_small btn_case4">취소</a></li>
					<li><a class="btn_small btn_case2" id="noticeUpdate">수정</a></li>
				</ul>
			</form>
		</div>
	</div>


<%@ include file="/admin/include/footer.jsp"%>