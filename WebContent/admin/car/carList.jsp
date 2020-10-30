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

		// 셀렉박스 value 값 체크하기
		$("#opt").change(function() {
			var optChk = $("#opt option:selected").val();

			$("#opt3, #opt4, #opt5").hide();
			$el_id_inputSearch.hide();

			if (optChk == "CAR_NO" || optChk == "CAR_NAME") {
				$el_id_inputSearch.show();
			} else if (optChk == "KIND_NAME") {
				$("#opt3").show();
			} else if (optChk == "BRAND_NAME"){
				$("#opt4").show();
			} else if (optChk == "IS_RENTCAR"){
				$("#opt5").show();
			}
		});

		// 검색버튼 클릭후 체크
		$(".search").click(function() {
			var res = $("#opt option:selected").val();
			if( res != "" ){
				document.frm.submit();
			}
			alert("값을 기입하여주세요");
		})
	});
</script>

		<!-- 차량 검색 -->
<div id="adimn_content">
	<h2>차량 목록</h2>
	<div class="admin_page">
		<div class="search_car">
			<a href="carWrite.do">차량추가</a>
			<form name="frm" method="post" action="carList.do">
			<select name="opt" id="opt">
				<option value="">선택하세요</option>
				<option value="CAR_NO"">차량번호</option>
				<option value="CAR_NAME">차량이름</option>
				<option value="KIND_NAME">종류별</option>
				<option value="BRAND_NAME">브랜드별</option>
				<option value="IS_RENTCAR">대여유무</option>
			</select> <select id="opt3" name="opt3">
				<c:forEach items="${kindList }" var="kind">
					<option value="${kind.name}">${kind.name}</option>
				</c:forEach>
			</select> <select id="opt4" name="opt4">
				<c:forEach items="${brandList}" var="brand">
					<option value="${brand.name}">${brand.name}</option>
				</c:forEach>
			</select> <select id="opt5" name="opt5">
				<option value="Y">반납완료</option>
				<option value="N">대여중</option>
			</select> <input type="text" name="inputSearch" id="inputSearch" placeholder="검색란">

			<button class="search">검색</button>
			</form>
		</div>
		
		<!-- 차량 목록 -->
		<table class="carTable table_style1">
			<tr>
				<th>차량 번호</th>
				<th>차량 이름</th>
				<th>차량 분류</th>
				<th>브랜드 명</th>
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
					<td><img src="upload/${car.image}" width="100" height="50"></td>
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
		<div class="board_list_page clear">
			<a href="carList.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="carList.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="carList.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="carList.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="carList.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="carList.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="carList.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
		</div>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>