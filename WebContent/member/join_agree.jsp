<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>


<script language='javascript'>
window.name ="Parent_window";

function fnPopup(){

	if(document.getElementById("checkboxA").checked==false) {
		window.alert("이용약관에 동의를 하셔야 회원가입이 가능합니다.");
		document.getElementById("checkboxA").focus();
		return;
	}
	
	if(document.getElementById("checkboxB").checked==false) {
		window.alert("개인정보취급방침에 동의를 하셔야 회원가입이 가능합니다.");
		document.getElementById("checkboxB").focus();
		return;
	}
	
    document.form_chk.submit();
}
</script>
<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>회원가입</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 회원가입</div>
		
		<div class="join_step box">
			<ul>
				<li class="col-xs-4 on">01 약관동의</li>
				<li class="col-xs-4">02 정보입력</li>
				<li class="col-xs-4">03 가입완료</li>
			</ul>
		</div>
        <form name="form_chk" action="join.do">
            <div class="join">
                <p class="bold">이용약관</p>
                <div class="agree pc" style="height:300px">		
                    <%@ include file="/include/agree_inner.jsp"%>
                </div>
                <div class="agree mobile" style="height:200px">		
                    <%@ include file="/include/agree_inner.jsp"%>
                </div>			
                <div class="checkbox">
                    <label><input type="checkbox" name="" id="checkboxA">이용약관에 동의합니다.</label>
                </div>
                <div class="h50"></div>			
                <p class="bold">개인정보취급방침</p>
                <div class="agree pc" style="height:300px">		
                    <%@ include file="/include/privacy_inner.jsp"%>
                </div>
                <div class="agree mobile" style="height:200px">		
                    <%@ include file="/include/privacy_inner.jsp"%>
                </div>
                
                <div class="h10"></div>
                <div class="checkbox">
                    <label><input type="checkbox" name="" id="checkboxB">개인정보취급방침에 동의합니다.</label>
                </div>
                
                <!-- 버튼 -->
                <div class="btn_box">
                    <ul>
                        <li><a href="javascript:;" class="btn btn-black" onclick="fnPopup(); return false;">다음단계</a></li>
                    </ul>
                </div>
            </div>
        </form>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>