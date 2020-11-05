<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/admin/include/header.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객 상세정보</title>
		<script>
			$(function() {
				$("#blackUpdate").on("click",function() {
					var blackMember = {
						id : $('#member_id').text().trim(),
						is_black : $('#black').val(),
						bl_reason : $('#bl_reason').val()
					};
					
					$.ajax({
						type : "post",
						url : "adminBlackUpdate.do",
						cache : false,
						data : JSON.stringify(blackMember),
						complete : function(data) {
							alert("수정 되었습니다.");
							window.location.href = "adminBlackList.do";
						}
						
					});
				
				});
				
				$("#admin_gnb > ul > li:eq(3)").addClass("on")
				
			});
		</script>
	</head>
	
	<body>
	<form action="adminMemberDetail.do" method="post">
		<div id="adimn_content">
		<h2>${selectMember.name}(${selectMember.id})고객님 상세정보</h2>
		<div class="admin_page">
		<table class="table_style1" class="tl">
			<colgroup>
				<col width="10%">
				<col width="">
			</colgroup>
			<tr>
				<th scope="row">아이디</th>
				<td class="tl">
					<div class="col-xs-5" id="member_id">
						${selectMember.id}
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td class="tl">
					<div class="col-xs-5">
						${selectMember.name}
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">성별</th>
				<td class="tl">
					<div class="col-xs-5">
						<c:choose>
							<c:when test="${selectMember.gender == 'M'}">남성</c:when>
							<c:when test="${selectMember.gender == 'F'}">여성</c:when>						
							<c:when test="${selectMember.gender == 'X'}">탈퇴</c:when>						
						</c:choose>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">생년월일</th>
				<td class="tl">
					<div class="col-xs-5">
						<c:choose>
							<c:when test="${selectMember.birth == '0001-01-01 00:00:00.0'}">탈퇴</c:when>
						</c:choose>
						<fmt:formatDate value="${selectMember.birth}" pattern="yyyy년 MM월 dd일"/>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td class="tl">
					<div class="col-xs-5">
						${selectMember.tel}
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">면허종류</th>
				<td class="tl">
					<div class="col-xs-5">
						<c:choose>
							<c:when test="${selectMember.li_class == 'Class2A'}">2종 보통</c:when>
							<c:when test="${selectMember.li_class == 'Class2M'}">2종 수동</c:when>
							<c:when test="${selectMember.li_class == 'Class1A'}">1종 보통</c:when>
							<c:when test="${selectMember.li_class == 'Class1B'}">1종 대형</c:when>
							<c:when test="${selectMember.li_class == '탈퇴'}">탈퇴</c:when>
						</c:choose>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">면허번호</th>
				<td class="tl">
					<div class="col-xs-5">
						${selectMember.li_number}
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td class="tl">
					<div class="col-xs-5">
						${selectMember.email}
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">주소</th>
				<td class="tl">
					<div class="col-xs-10">
						${selectMember.address}
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">대여 횟수</th>
				<td class="tl">
					<div class="col-xs-5">
						${selectMember.counting}
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">블랙리스트</th>
				<td class="tl">
					<div class="col-xs-2">
						<select name="black" id="black" class="selectpicker show-tick form-control">
							<option value="Y" <c:if test="${selectMember.is_black == 'Y'}"></c:if>>블랙</option>
							<option value="N" <c:if test="${selectMember.is_black == 'N'}">selected</c:if>>일반</option>
						</select>
					</div>
					<div class="col-xs-1">
						<a class="btn_small btn_case2 submit" id="blackUpdate" type="button">등록</a>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">블랙 이유</th>
				<td class="tl">
					<div class="col-xs-10">
						<textarea class="text" name="bl_reason" id="bl_reason">${selectMember.bl_reason}</textarea>
					</div>
				</td>
			</tr>
			
		</table>
		</div>
			<a href="adminMemberList.do" class="btn_small btn_case2 floatR mt10 mr5" >고객 목록</a>
		</div>
		</form>
	</body>
</html>

<%@ include file="/admin/include/footer.jsp"%>