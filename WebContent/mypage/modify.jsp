<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sub_member.jsp"%>

<script>
	function changePass() {
		
		var popupWidth = 480;
		var popupHeight = 350;
		
		var left = (screen.availWidth - popupWidth) / 2;
			if (window.screenLeft < 0) {
				left += window.screen.width * -1;
			} else if (window.screenLeft > window.screen.width) {
				left += window.screen.width;
			}
			
		var top = (screen.availHeight - popupHeight) / 2 - 10;
		
		var options = "resizable=no,left=" + left + ",top=" + top +" width=" + popupWidth+ ",height=" + popupHeight +",menubar=no, status=no, toolbar=no, location=no, scrollbars=yes";
		
		var url = "changePassword.do"
		window.open(url, "_blank_1", options);
			
	}

</script>

<script>
	/* 생년월일 */
	$(function() {
		var date = new Date();
		var year = date.getFullYear();
		
		var selectValue = document.getElementById("birthYear");
		var optionIndex = 0;
		for(var i = year-60; i <= year; i++) {
			selectValue.add(new Option(i, i), optionIndex++);                        
		}
		
		var selectValue = document.getElementById("birthMonth"); 
		var optionIndex = 0;
		for(var i = 1; i<13; i++) {
			selectValue.add(new Option(i, i), optionIndex++);
		}
		
		var selectValue = document.getElementById("birthDay");
		var optionIndex = 0;
		for(var i = 1; i<32; i++) {
			selectValue.add(new Option(i, i), optionIndex++);
		}
		
	});
</script>

<script>
	/* 이메일 주소 자동 기입 */
	$(function() {
		$("#domain").change(function() {
			$("#email2").val($("#domain").val());
		});
		
	});
	
	/* 면허 종류 하나만 선택 */
	$(function() {
	    $('input[type="checkbox"][name="li_class"]').click(function(){
	        if ($(this).prop('checked')) {
	            $('input[type="checkbox"][name="li_class"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	        
	    });
	    
	});
	
	/* 면허 종류 값 받아서 자동 선택 */
	$(function() {
	 	$("input:checkbox[name='li_class']:checkbox[value='${loginUser.li_class}']").prop('checked', true);
	});
</script>

<script>
	$(function() {
		$("#modify").on("click", function() {

			if (document.getElementsByName("li_class")[0].checked == false
					&& document.getElementsByName("li_class")[1].checked == false
					&& document.getElementsByName("li_class")[2].checked == false
					&& document.getElementsByName("li_class")[3].checked == false) {
				alert("운전면허종류를 선택하세요.");
				document.getElementsByName("li_class")[0].focus();
				return;
			}
			
				var modifyMember = {
					id: $('#member_id').val(),
					gender : $('#gender').val(),
  					birth : ($('#birthYear').val() + "-" + $('#birthMonth').val() + "-" + $('#birthDay').val()),
					li_class : $('#li_class').val(),
					li_number : ($('#li_number1').val() + "-" + $('#li_number2').val() + "-" +$('#li_number3').val() + "-" +$('#li_number4').val()),
					email : ($('#email1').val() + $('#email2').val()),
					address : ($('#zipcode').val() + " " + $('#addr1').val() + " " + $('#addr2').val())
				};
				
				$.ajax({
					type : "post",
					url : "modify.do",
					cache : false,
					data : JSON.stringify(modifyMember),
					complete : function(data) {
						alert("수정 되었습니다.");
						window.location.href = "index.do";
					}
				
				});
				
		});
		
	});
</script>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>개인정보 수정</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 마이페이지<span>></span> 개인정보 수정</div>
        <div class=" logincontainer-fluid_box page_mypage">
        	<form class="form-horizontal" role="form" name="frmName" method="post"
        		action="modify.do">	
				<div class="join">
				<div class="form-group">
					<label class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-8">
							<input type="text" class="form-control" maxlength="20" name="member_id" id="member_id" value="${loginUser.id}" readonly>
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<a href="javascript:;" class="btn btn-normal" id="changePass"
							onclick="changePass(); return false;">비밀번호 변경하기</a>
						</div>
						<p>비밀번호 변경시 로그인 해제가 됩니다.</p>
					</div>
				</div>
								
				<div class="form-group">
					<label class="col-sm-2 control-label">성별</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-2">
							<select name="gender" id="gender" class="selectpicker show-tick form-control">
								<option value="${loginUser.gender}" selected="selected">${loginUser.gender}</option>
								<option value="M">남성</option>
								<option value="F">여성</option>
							</select>
						</div>
						<p></p>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<select name="birthYear" id="birthYear" class="selectpicker show-tick form-control" dir="rtl">
								<option selected="selected" >${fn:substring(loginUser.birth, 0, 4)}</option>
							</select>
						</div>
						<div class="col-xs-2">
							<select name="birthMonth" id="birthMonth" class="selectpicker show-tick form-control" dir="rtl">
								<option selected="selected">${fn:substring(loginUser.birth, 5, 7)}</option>
							</select>
							
						</div>
						<div class="col-xs-2">
							<select name="birthDay" id="birthDay" class="selectpicker show-tick form-control" dir="rtl">
								<option selected="selected">${fn:substring(loginUser.birth, 8, 10)}</option>
							</select>
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10 divinner addr">
						<div class="col-xs-5">
							<input type="text" class="form-control" maxlength="10" name="member_name" id="member_name" value="${loginUser.name}" readonly>
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">휴대전화</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<input type="text" class="form-control onlyNumber" maxlength="4"
								name="cel1" id="cel1" style="ime-mode: disabled;" value="${fn:substring(loginUser.tel, 0, 3)}" readonly>
						</div>
						<div class="col-xs-3">
							<input type="text" class="form-control onlyNumber" maxlength="4"
								name="cel2" id="cel2" style="ime-mode: disabled;" value="${fn:substring(loginUser.tel, 4, 8)}" readonly>
						</div>
						<div class="col-xs-3">
							<input type="text" class="form-control onlyNumber" maxlength="4"
								name="cel3" id="cel3" style="ime-mode: disabled;" value="${fn:substring(loginUser.tel, 9, 13)}" readonly>
						</div>
						<p></p>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">운전면허종류</label>
					<div class="col-sm-10 divinner">
						
							<div class="col-xs-3">
								<input type="checkbox" name="li_class" id="li_class" value="Class2A" >
								<span>  2종 보통</span>
							</div>
							<div class="col-xs-3">
								<input type="checkbox" name="li_class" id="li_class" value="Class2M">
								<span>  2종 수동</span>
							</div>
							<div class="col-xs-3">
								<input type="checkbox" name="li_class" id="li_class" value="Class1A">
								<span>  1종 보통</span>
							</div>
							<div class="col-xs-3">
								<input type="checkbox" name="li_class" id="li_class" value="Class1B">
								<span>  1종 대형</span>
							</div>
						
					</div>
					<p></p>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">운전면허번호</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<select name="li_number1" id="li_number1"
								class="selectpicker show-tick form-control">
								<option value="${fn:substring(loginUser.li_number, 0, 2)}" selected="selected">${fn:substring(loginUser.li_number, 0, 2)}</option>
								<option value="11">11(서울)</option>
								<option value="12">12(부산)</option>
								<option value="13">13(경기)</option>
								<option value="14">14(강원)</option>
								<option value="15">15(충북)</option>
								<option value="16">16(충남)</option>
								<option value="17">17(전북)</option>
								<option value="18">18(전남)</option>
								<option value="19">19(경북)</option>
								<option value="20">20(경남)</option>
								<option value="21">21(제주)</option>
								<option value="22">22(대구)</option>
								<option value="23">23(인천)</option>
								<option value="24">24(광주)</option>
								<option value="25">25(대전)</option>
								<option value="26">26(울산)</option>
								<option value="28">28(경기북부)</option>
								<option value="28">28(경기남부)</option>
							</select>
						</div>
						<div class="col-xs-2">
							<input type="text" class="form-control onlyNumber" maxlength="2"
								name="li_number2" id="li_number2" style="ime-mode: disabled;" value="${fn:substring(loginUser.li_number, 3, 5)}">
						</div>
						<div class="col-xs-3">
							<input type="text" class="form-control onlyNumber" maxlength="6"
								name="li_number3" id="li_number3" style="ime-mode: disabled;" value="${fn:substring(loginUser.li_number, 6, 12)}">
						</div>
						<div class="col-xs-2">
							<input type="text" class="form-control onlyNumber" maxlength="2"
								name="li_number4" id="li_number4" style="ime-mode: disabled;" value="${fn:substring(loginUser.li_number, 13, 15)}">
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10 divinner">
						<div class="col-xs-3">
							<input type="text" class="form-control" maxlength="40"
								name="email1" id="email1" value="${fn:substringBefore(loginUser.email, '@')}">
						</div>
						<div class="col-xs-4">
							<input type="text" class="form-control" maxlength="40"
								name="email2" id="email2" value="@${fn:substringAfter(loginUser.email, '@')}">
						</div>
						<div class="col-xs-4">
							<select name="email2" class="selectpicker show-tick form-control"
								id="domain">
								<option value="@${fn:substringAfter(loginUser.email, '@')}" selected="selected">@${fn:substringAfter(loginUser.email, '@')}</option>
								<option value="@naver.com">@naver.com</option>
								<option value="@daum.net">@daum.net</option>
								<option value="@nate.com">@nate.com</option>
								<option value="@gmail.com">@gmail.com</option>
								<option value="">직접입력</option>
							</select>
						</div>
						<p></p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10 divinner addr">
						<div class="col-xs-7">
							<label for="sel1">우편번호</label>
							<input type="text" class="form-control" readonly name="zipcode" id="zipcode"
								value="${fn:substring(loginUser.address, 0, 5)}">
						</div>
						<div class="col-xs-5">
							<a href="javascript:;" class="btn btn-normal"
								onclick="execDaumPostcode();">우편번호찾기</a>
						</div>
						<div class="col-xs-12">
							<label for="sel1">주소</label> <input type="text"
								class="form-control" maxlength="100" id="addr1" name="addr1"
									value="${fn:substring(loginUser.address, 6, 50)}">
						</div>
						<div class="col-xs-12">
							<label for="sel1">상세주소</label> <input type="text"
								class="form-control" maxlength="100" id="addr2" name="addr2">
						</div>
						<p></p>
					</div>
				</div>
	
					<div class="h30"></div>
					<div class="mypage_coupon">
						<p>보유중인 쿠폰</p>
						<table class="table_style1">
							<colgroup>
								<col width="60%">
								<col width="30%">
								<col width="10%">
							</colgroup>
							<tr>
								<th>제목</th>
								<th>기간</th>
								<th>금액</th>
							</tr>
							<c:forEach items="${memberCoupon}" var="coupon">
							<tr>
								<td class="tl">${coupon.name}</td>
								<td>
									<fmt:formatDate value="${coupon.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${coupon.endDate}" pattern="yyyy-MM-dd"/> 
								</td>
								<td><fmt:formatNumber value="${coupon.sale}"/>원</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
	
				<div class="h30"></div>
				<!-- 버튼 -->
				<div class="btn_box">
					<ul>
						<li><a class="btn btn-blue" id="modify" type="submit">수정하기</a></li>
						<li><a class="btn btn-gray" href="leave.do">회원탈퇴</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>