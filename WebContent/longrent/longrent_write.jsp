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
			/* 	
			function checkbox(){
				var flag = false;
				//checkbox 접근 후 체크된 개수 파악
				//getElementsByName: 태그의 name값에 접근한다.
				var values = document.getElementsByName("chk");
				//형태는 배열이 된다.
				alert(values.length);
				for(var i=0; i<values.length;i++){
					if(values[i].checked){
						alert(values[i].value);
					}
				}
				return flag;
			} */
			/* 	var send_array = Array();
				var send_cnt = 0;
				var chkbox = $(".checkSelect");

				for(i=0;i<chkbox.length; i++){
					if(chkbox[i].checked == true){
						send_array[send_cnt] = chkbox[i].value;
						send_cnt++;
					}
				}
			 */
			 
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
					contents : $('#contents').val(),
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