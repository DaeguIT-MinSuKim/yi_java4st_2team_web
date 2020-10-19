<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>마이페이지</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 마이페이지</div>
		
        <div class=" logincontainer-fluid_box page_mypage">
        
        	<form class="form-horizontal" role="form" name="frmName" method="post" action="" onsubmit="return false;" enctype="multipart/form-data">
				<div class="join">
	
					<div class="form-group cal_Box">
						<label class="col-sm-2 control-label">이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" maxlength="10" name="member_name" id="member_name" value="동자승" readonly>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-10 divinner">
							<input type="text" class="form-control" maxlength="20" name="member_id" id="member_id" value="dong" readonly>
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" maxlength="20" name="passwd" id="passwd">
							<p>특수문자를 하나 이상 포함하여 6 ~ 20자로 입력하십시오.</p>
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-sm-2 control-label">비밀번호 확인</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" maxlength="20"
								name="passwd1">
							<p>비밀번호를 동일하게 다시 한 번 입력하십시오.</p>
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-sm-2 control-label">운전면호 번호</label>
						<div class="col-xs-8">
							<input type="text" class="form-control" maxlength="20"
								name="license" id="license">
							<p>특수문자 - 를 포함하여 입력하십시오.</p>
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-sm-2 control-label">휴대전화</label>
						<div class="col-sm-10 divinner">
							<div class="col-xs-3">
								<select name="cel1" id="cel1"
									class="selectpicker show-tick form-control">
									<option value="010" selected="selected">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<div class="col-xs-3">
								<input type="text" class="form-control onlyNumber" maxlength="4"
									name="cel2" id="cel2" style="ime-mode: disabled;">
							</div>
							<div class="col-xs-3">
								<input type="text" class="form-control onlyNumber" maxlength="4"
									name="cel3" id="cel3" style="ime-mode: disabled;">
							</div>
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-sm-2 control-label">이메일</label>
						<div class="col-sm-10 divinner">
							<div class="col-xs-3">
								<input type="text" class="form-control" maxlength="40"
									name="email1" id="email1">
							</div>
							<div class="col-xs-4">
								<input type="text" class="form-control" maxlength="40"
									name="email2" id="email2">
							</div>
							<div class="col-xs-3">
								<select name="email2" class="selectpicker show-tick form-control"
									id="domain">
									<option value="" selected="selected">선택하기</option>
									<option value="@naver.com">@naver.com</option>
									<option value="@daum.net">@daum.net</option>
									<option value="@nate.com">@nate.com</option>
									<option value="@gmail.com">@gmail.com</option>
									<option value="">직접입력</option>
								</select>
							</div>
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-sm-2 control-label">주소</label>
						<div class="col-sm-10 col-sm-10 divinner addr">
							<div class="col-xs-7">
								<label for="sel1">우편번호</label> <input type="text"
									class="form-control" readonly name="zipcode" id="zipcode">
							</div>
							<div class="col-xs-5">
								<a href="javascript:;" class="btn btn-normal"
									onclick="execDaumPostcode();">우편번호찾기</a>
							</div>
							<div class="col-xs-12">
								<label for="sel1">주소</label> <input type="text"
									class="form-control" maxlength="100" id="addr1" name="addr1">
							</div>
							<div class="col-xs-12">
								<label for="sel1">상세주소</label> <input type="text"
									class="form-control" maxlength="100" id="addr2" name="addr2">
							</div>
						</div>
					</div>
	
					<div class="h30"></div>
					<div class="mypage_coupon">
						<p>보유중인 쿠폰</p>
						<table class="table_style1">
							<colgroup>
								<col width="">
								<col widht="15%">
							</colgroup>
							<tr>
								<th>제목</th>
								<th>금액</th>
							</tr>
							<tr>
								<td class="tl">10월 이벤트</td>
								<td>1000원</td>
							</tr>
						</table>
					</div>
				</div>
	
	
				<div class="h30"></div>
				<!-- 버튼 -->
				<div class="btn_box">
					<ul>
						<li><a class="btn btn-blue submit" id="mypage_modify" type="button">수정하기</a></li>
					</ul>
				</div>
			</form>
			
		</div>
	</div>
</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>