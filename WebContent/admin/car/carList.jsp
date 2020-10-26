<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<c:if test="${carList == null}">
	<script>
		//받아온 리스트가 비었을시
		alert("검색한 항목의 내용이 없습니다");
		location.href = "carList.do";
	</script>
</c:if>
<script>
	$(function() {
		//검색옵션 가리기
		var $el_id_inputSearch = $("#inputSearch");

		$("#opt3, #opt4, #opt5").hide();
		$el_id_inputSearch.hide();

		// 1 셀렉박스 value 값 체크하기
		$("#opt").change(function() {
			var optChk = $("#opt option:selected").val();

			$("#opt3, #opt4, #opt5").hide();
			$el_id_inputSearch.hide();

			if (optChk == 1 || optChk == 2) {
				$el_id_inputSearch.show();
			} else {
				$("#opt" + optChk).show();
			}
		});

		// 2 각 value에 맞는 상황 뽑아내기
		$(".search").click(function() {
			var res = $("#opt option:selected").val();
			var query;

			if (res == 0) {
				alert("검색옵션을 선택해주세요")
				return null;
			} else if (res == 1 || res == 2) {
				query = $el_id_inputSearch.val();
			} else {
				query = $("#opt" + res).val();
			}

			// 3 submit 하기
			location.href = "carSearch.do?res=" + res + "&query=" + query;
		})
	});
</script>

		<!-- 차량 검색 -->
<div id="adimn_content">
	<h2>차량 목록</h2>
	<div class="admin_page">
		<div class="search_car">
			<a href="carWrite.do">차량추가</a>
			<form name="frm" method="get" action=""></form>
			<select name="opt" id="opt">
				<option value="">선택하세요</option>
				<option value="1">차량번호</option>
				<option value="2">차량이름</option>
				<option value="3">종류별</option>
				<option value="4">브랜드별</option>
				<option value="5">대여유무</option>
			</select> <select id="opt3">
				<c:forEach items="${kindList }" var="kind">
					<option value="${kind.name}">${kind.name}</option>
				</c:forEach>
			</select> <select id="opt4">
				<c:forEach items="${brandList}" var="brand">
					<option value="${brand.name}">${brand.name}</option>
				</c:forEach>
			</select> <select id="opt5">
				<option value="Y">반납완료</option>
				<option value="N">대여중</option>
			</select> <input type="text" id="inputSearch" placeholder="검색란">

			<button class="search">검색</button>
		</div>
		
		<!-- 차량 목록 -->
		<table border=1 class="carTable">
			<tr>
				<th>차량 번호</th>
				<th>차량 이름</th>
				<th>차량 분류</th>
				<th>브랜 드명</th>
				<th>비고 사항</th>
				<th>반납 여부</th>
				<th>대여 횟수</th>
				<th>이미지</th>
				<th>차량 수정</th>
				<th>차량 삭제</th>
			</tr>
			<c:forEach items="${carList }" var="car">
				<tr>
					<td>${car.no }</td>
					<td>${car.name}</td>
					<td><c:if test="${car.kind != null}">
							${car.kind.name }
						</c:if></td>
					<td><c:if test="${car.brand != null}">
							${car.brand.name }
					</c:if></td>
					<td>${car.remark}</td>
					<td>${car.is_rent}</td>
					<td>${car.counting}</td>
					<td>${car.image}</td>
					<td><a href="carUpdate.do?carNo=${car.no}"><input
							type="button" value="수정" class="update"></a></td>
					<td><c:choose>
							<c:when test="${car.is_rent != 'N'}">
								<a href="carDelete.do?carNo=${car.no}"><input type="button"
									value="삭제" class="delete"></a>
							</c:when>
							<c:when test="${car.is_rent == 'N'}">
								<input type="button" value="대여중">
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>