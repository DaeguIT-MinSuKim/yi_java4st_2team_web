<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>

<!-- 컨텐츠 -->
<script>
$(function(){
	$('#InsUpdate').on("click", function(){
		 
		
		if(admin_ins_writeCheck()) {
			
			var updateIns = {
				code : ${param.code},
				name : $('#name').val(),
				fare : $("#fare").val()
			};

			$.ajax({
				type : "post",
				url : "adminInsUpdate.do",
				cache : false,
				data : JSON.stringify(updateIns),
				success : function(data) {
					alert("보험을 수정했습니다.");
					window.location.href = "adminInsList.do";
				}

			});
		}

		
	});
	
});
</script>

	<div id="adimn_content">
		<h2>보험 수정</h2>
		<div class="admin_page">
			<form name=frmmm method="post">	
			<table class="insTable table_style1">
				<tr>	
					<th>보험코드</th>
					<td><input type="number" name="code" class="code" id="code" value="${param.code }"></td>
				</tr>
		
				<tr>	
					<th>보험 이름 </th>
					<td> <input type="text" name="name" class="name" id="name" value="${Ins.name }"></td>
				</tr>
				<tr>	
					<th>보험 가격</th>
					<td> <input type="number" name="fare" class="fare" id="fare" value="${Ins.fare }"></td>
				</tr>
			</table>
			</form>
				<ul class="button_style3 mt50">
					<li><a href="adminInsList.do" class="btn_small btn_case4">취소</a></li>
					<li><a class="btn_small btn_case2" id="InsUpdate">수정</a></li>
				</ul>
		</div>
	</div>


<%@ include file="/admin/include/footer.jsp"%>