<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_longrent.jsp"%>
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
<script>
$(function() {
    $("#updateBtn").on("click", function(e) {
      
      e.preventDefault();
      
      /* updateCheck() -> return true */
      
      
      var chkStr = "";
		 for(var i=0; i< $("input[name='chBoxName']").length; i++){ //checkbox 갯수만큼 반복
			 if( $("input[name='chBoxName']").eq(i).prop("checked") == true) { //i번째 checkbox가 checked 되어있으면...
				 if(chkStr == "") {//chkStr에 값 넣는게 처음이라면
					chkStr += $("input[name='chBoxName']").eq(i).val();	 
				 }else{ //처음이 아니라면 쉼표 넣어준다...
					 chkStr += "," + $("input[name='chBoxName']").eq(i).val();
				 }
			 }
		 }
      
      
      if( updateCheck() ){
	      
	       var updateLR = {
	             no: ${param.no},
	             name: $("#name").val(),
	             tel: $("#tel").val(),
	             pwd: $("#pwd").val(),
	             title: $("#title").val(),
	             contents: $("#contents").val(),
	             options: chkStr
	       };
	
	       
	      // alert(JSON.stringify(updateLR));
	       
	       $.ajax({
	          type: "post",
	          url: "longUpdate.do",
	          cache: false,
	          data: JSON.stringify(updateLR),
	          complete: function(data) {
	             if(data.responseText == "1") { 
	                alert("성공적으로 수정되었습니다.");
	                window.location.href = "longRent.do";
	             }
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
		<h3>장기렌트 글수정</h3>
		<div class="location pc">HOME <span>></span> 장기렌트 글수정</div>
		
		<div class="longrent_content">
			<form name= "frm" method="post" action="longUpdate.do">
			<input type="hidden" name="no" value="${LongRent.no }">
				<div>
					<div class="input_col3">
						<input type="text" name= "name" id="name" value="${LongRent.name }">
						<input type="text" name="tel" id="tel" value="${LongRent.tel }">
						<input type="password" name="pwd" id="pwd" value="${LongRent.pwd }">
					</div>
					<input type="text" class="mt5" name="title" id="title" value="${LongRent.title }">
					<%-- <input type="text" name="contents" class="write_content mt5" id="contents" value="${LongRent.contents}"> --%>
					<textarea class="write_content mt5" name="contents" id="contents_ckeditor"></textarea>
					
					<div class="option_check" id="options">
						<label><input type="checkbox" name="chBoxName" value="후방 카메라" class="checkSelect"> 후방 카메라</label>
						<label><input type="checkbox" name="chBoxName" value="블루투스"class="checkSelect"> 블루투스</label>
						<label><input type="checkbox" name="chBoxName" value="카시트" class="checkSelect"> 카시트</label>
						<label><input type="checkbox" name="chBoxName" value="내비게이션" class="checkSelect"> 내비게이션</label>
						<label><input type="checkbox" name="chBoxName" value="하이패스" class="checkSelect"> 하이패스</label>
					</div>
				</div>
				
	
				<ul class="button_style3 mt50">
					<!-- <li><input type="submit" id="updateBtn" value="수정"></li> -->
					<li><a href="javascript:;" class="btn_small btn_case1 c_fff" id="updateBtn">수정</a></li>
					<li><a href="longRent.do" class="btn_small btn_case2" >취소</a></li>
				</ul>
			</form>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>