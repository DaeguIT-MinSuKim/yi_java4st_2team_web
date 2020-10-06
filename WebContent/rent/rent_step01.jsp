<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->

<!-- 상단배경 -->
<section class="bgTop bgSub1 pc">
	<div class="slogan">
		<p>
			<strong>동자승 렌터카</strong> 따라올 수 없는 압도적 1등<br> 이제부터 렌트카 예약은
			동자승렌터카입니다.
		</p>
	</div>
</section>
<!-- //상단배경 -->

<section class="con_wrap box">

	<div class="contents_box2 out">
		<div class="contents">
			<h3>단기렌트</h3>
			<div class="location pc">
				HOME <span>></span> 단기렌트 <span>></span> 렌트 STEP1
			</div>

			<form class="form-horizontal" role="form" name="outFrm" method="post"
				action="" onSubmit="return false;">
				<input type="hidden" name="mode" value="memberEnd">
				<div class="join">
					
					<div class="title">렌터카 검색</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<i class="fas fa-shield-alt"></i>
							<span>자차보험</span>
						</label>
						<div class="col-sm-10">
							<label><input type="radio" name="">일반자차</label>
							<label><input type="radio" name="">완전자차</label>
							<label><input type="radio" name="">슈퍼자차</label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<span>대여일시 / 반납일시</span>
						</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="passwd">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">탈퇴사유</label>
						<div class="col-sm-10 divinner">
							<select class="selectpicker show-tick form-control"
								name="member_out_reason">
								<option value="">-선택-</option>
								<option value="서비스불만">서비스불만</option>
								<option value="응대불친절">응대불친절</option>
								<option value="복잡한 절차">복잡한 절차</option>
								<option value="잦은 시스템 에러">잦은 시스템 에러</option>
								<option value="개인정보 유출 우려">개인정보 유출 우려</option>
								<option value="실질적인 혜택이 없음">실질적인 혜택이 없음</option>
								<option value="메일이 너무 많아짐">메일이 너무 많아짐</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>

					<div class="form-group cal_Box">
						<label class="col-sm-2 control-label">남기고 싶은 말</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="contents" rows="10"
								name="content"></textarea>
						</div>
					</div>
				</div>

				<!-- 버튼 -->
				<div class="btn_box">
					<ul>
						<li><a class="btn btn-black" href="javascript:;"
							onClick="outFrmChk(); return false;">탈퇴완료</a></li>
						<li><a class="btn btn-gray" href="./modify.php">탈퇴취소</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<!-- //컨텐츠 -->

	<%@ include file="/include/footer.jsp"%>