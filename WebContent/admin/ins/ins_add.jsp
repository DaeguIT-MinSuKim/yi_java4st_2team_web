<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>

<!-- 컨텐츠 -->
<script>
$(function(){
	$('#insAdd').on("click", function(){
		
		
		if(admin_ins_writeCheck()) {
			
			var newIns = {
					code : $('#code').val(),
					name : $('#name').val(),
					fare : $("#fare").val()
				};


			$.ajax({
				type : "post",
				url : "adminInsAdd.do",
				cache : false,
				data : JSON.stringify(newIns),
				success : function(data) {
					alert("보험을 추가했습니다.");
					window.location.href = "adminInsList.do";
				}

			});
		}

		
	});
	
	$("#admin_gnb > ul > li:eq(2)").addClass("on")
	
});
</script>

	<div id="adimn_content">
		<h2>보험 추가</h2>
		
		<div class="admin_page">
			<form name=frmmm method="post">	
			<table class="insTable table_style1">
				<tr>	
					<th>보험코드</th>
					<td><input type="text" name="code" class="code" id="code" value=""></td>
				</tr>
		
				<tr>	
					<th>보험 이름 </th>
					<td> <input type="text" name="name" class="name" id="name" value=""></td>
				</tr>
				<tr>	
					<th>보험 가격</th>
					<td><input type="text" name="fare" class="fare" id="fare" value=""></td>
				</tr>
			</table>
			
			<ul class="button_style3 mt50">
					<li><a href="adminInsList.do" class="btn_small btn_case4">취소</a></li>
					<li><a class="btn_small btn_case2" id="insAdd">추가</a></li>
			</ul>
			
			
			</form>
		</div>
	</div>


<%@ include file="/admin/include/footer.jsp"%>