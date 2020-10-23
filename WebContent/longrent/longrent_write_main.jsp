<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script>
$(function() {
	$('#add').on("click", function(e) {
		e.preventDefault();
		 
		 var chkStr = "";
		 for(var i=0; i< $("input[name='chBoxName']").length; i++){ //checkbox 갯수만큼 반복
			 if( $("input[name='chBoxName']").eq(i).prop("checked") == true) { //i번째 checkbox가 checked 되어있으면...
				 if(chkStr == "") {//chkStr에 값 넣는게 처음이라면
					chkStr += $("input[name='chBoxName']").eq(i).val();	 
				 }else{ //처음이 아니라면 쉼표 넣어준다...
					 chkStr += "," + $("input[name='chBoxName']").eq(i).val();
				 }
			 }
		 } /* alert(chkStr); */
		 
		 
		 
		if (writeCheck()) {

			var newLongRent = {
				name : $('#name').val(),
				tel : $('#tel').val(),
				pwd : $('#pwd').val(),
				title : $('#title').val(),
				contents : CKEDITOR.instances.contents_ckeditor.getData(),
				options : chkStr
			};

			$.ajax({
				type : "post",
				url : "longRentWrite.do",
				cache : false,
				data : JSON.stringify(newLongRent),
				success : function(data) {
					alert("문의글을 추가했습니다..");
					window.location.href = "longRent.do";
				}

			});
		}

	});
});
</script>
<!--*a,b,c,d,e의 형태로 넘어간 값들은 SELECT, DELETE 문을 사용할때 wehre user_name in ('send_array') 와 같은 형태로 사용할 수 있다.  -->
<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>장기렌트 글쓰기</h3>
		<div class="location pc">HOME <span>></span> 장기렌트 글쓰기</div>
		
		<div class="longrent_content">
			<form method="post" name="frm">
				<div>
					<div class="input_col3">
						<input type="text" name="name" placeholder="이름" id="name">
						<input type="text" name="tel" placeholder="연락처" id="tel">
						<input type="password" name="pwd" placeholder="비밀번호 " id="pwd">
					</div>
					<input type="text" class="mt5" name="title" placeholder="제목을 입력해주세요" id="title">
					<input type="button" value="희망차종, 희망계약기간 등 자유롭게 문의 사항 작성해주시면, 빠른 답변 및 연락 드리겠습니다. ">
					<textarea class="write_content mt5" name="contents" id="contents_ckeditor"></textarea>
					<div class="option_check" id="options">
						<label><input type="checkbox" name="chBoxName" value="후방 카메라" > 후방 카메라</label>
						<label><input type="checkbox" name="chBoxName" value="블루투스"> 블루투스</label>
						<label><input type="checkbox" name="chBoxName" value="카시트" > 카시트</label>
						<label><input type="checkbox" name="chBoxName" value="내비게이션" > 내비게이션</label>
						<label><input type="checkbox" name="chBoxName" value="하이패스" > 하이패스</label>
					</div>
				</div>
				
	
				<ul class="button_style3 mt50">
					<li><a href="longRent.do" class="btn_small btn_case4">취소</a></li>
					<li><a href="javascript:;" class="btn_small btn_case2" id="add">확인</a></li>
				</ul>
				
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>