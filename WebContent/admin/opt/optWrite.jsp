<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- // header -->
<script type="text/javascript">
	$(function() {
		$('#add').on("click", function() {
			if ($('#optCode').val() == "") {
				alert("옵션코드를 기입해주세요");
				$("#carNo").focus()
				return false;
			}
			if ($('#optName').val() == "") {
				alert("옵션이름을 기입해주세요")
				$("#carNo").focus()
				return false;
			}
			if ($('#optFare').val() == "") {
				alert("옵션비용을 기입해주세요")
				$("#carNo").focus()
				return false;
			}
			
			$("#frm_adminOptWrite").submit();
		});
		
	});
</script>



<div id="adimn_content">
	<h2>옵션 추가</h2>
	<div class="admin_page">
		<form action="adminOptWrite.do" method="post" name="frm_adminOptWrite" id="frm_adminOptWrite">
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
					<td><input type="number" value="${fn:length(optList)+1}" name="optCode" id="optCode"></td>
					<th><label for="optName">옵션이름</label></th>
					<td><input type="text" name="optName" id="optName" value=""></td>
					<th><label for="optName">옵션비용</label></th>
					<td><input type="number" name="optFare" id="optFare" value=""></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><a href="javascript:;" class="btn_small btn-primary c_fff" id="add">등록</a></li>
				<li><a href="adminOptList.do" class="btn_small btn_case4" id="cancel">취소</a></li>
			</ul>
		</form> 
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>