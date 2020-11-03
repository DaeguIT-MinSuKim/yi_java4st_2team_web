<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<script>
$(function(){
	$("#update").on("click", function(){
		if( $("#optName").val().trim().length == "" ){
			alert("옵션이름을 작성해주세요");
			$("#optName").focus();
			return false;
		}
		if( $("#optFare").val().trim().length == "" ){
			alert("옵션비용을 작성해주세요");
			$("#optFare").focus();
			return false;
		}
		
		$("#frm_adminOptUpdate").submit();
	});
	
	$("#admin_gnb > ul > li:eq(2)").addClass("on")
});
</script>

<div id="adimn_content">
	<h2>옵션 수정</h2>
	<div class="admin_page">
		<form action="adminOptUpdate.do" method="post" name="frm_adminOptUpdate" id="frm_adminOptUpdate">
			<table class="table_style1">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>옵션코드</th>
					<td><input type="hidden" value="${opt.getCode()}" name="optCode">${opt.getCode()}</td>
					<th><label for="optName">옵션이름</label></th>
					<td><input type="text" name="optName" id="optName" value="${opt.getName()}"></td>
					<th><label for="optName">옵션비용</label></th>
					<td><input type="text" name="optFare" id="optFare" value="${opt.getFare()}"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><a href="javascript:;" class="btn_small btn_case2" id="update">수정</a></li>
				<li><a href="optList.do" class="btn_small btn_case4" id="cancel">취소</a></li>
			</ul>
		</form> 
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>