<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>이벤트 글쓰기</h3>
		<div class="location pc">HOME <span>></span> 이벤트 글쓰기</div>
		
		<div class="event_content">
			<form action="eventWrite.do" method="post" class="event_write" enctype="multipart/form-data">
				<div>
					<input type="text" name="title" placeholder="제목을 입력해주세요" id="title">
					<input type="text" name="sale" placeholder="할인금액(Ex.1000)" id="sale" class="mt5">
					<div class="date_box">
						<input type="text" name="startDate" class="form-control calendar start" readonly placeholder="이벤트 시작일 선택">
						<span>~</span>
						<input type="text" name="endDate" class="form-control calendar end" readonly placeholder="이벤트 종료일 선택">
					</div>
					<div class="file_wrap">
						<p>리스트 이미지</p><input type="file" name="uploadfile01" class="list_file">
						<p>상세페이지 이미지</p><input type="file" name="uploadfile02" class="view_file">
					</div>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="event.do" class="btn_small btn_case4">취소</a></li>
					<li><input type="submit" value="확인" class="btn_small btn_case2" id="event_write"></li>
				</ul>
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<script>
	$(function(){
		$("#event_write").click(function(){
			if ($(".event_write #title").val() == ""){
				alert("제목을 입력해주세요.")
				$(".event_write #title").focus()
				return false;
			}
			if ($(".event_write #sale").val() == ""){
				alert("할인금액을 입력해주세요.")
				$(".event_write #sale").focus()
				return false;
			}
			if ($(".event_write .start").val() == ""){
				alert("이벤트 시작일을 선택해주세요.")
				return false;
			}
			if ($(".event_write .end").val() == ""){
				alert("이벤트 종료일을 선택해주세요.")
				return false;
			}
			if ($(".event_write .list_file").val() == ""){
				alert("리스트 이미지를 첨부해주세요.")
				return false;
			}
			if ($(".event_write .view_file").val() == ""){
				alert("상세페이지 이미지를 첨부해주세요.")
				return false;
			}
			//$(".event_write").submit();
			//return false;
		})
	})
</script>

<%@ include file="/include/footer.jsp"%>