$(document).ready(function(){
	
	// 장기렌트 비밀글 확인
	$(".board_password_btn").click(function(){
		$(".board_password").attr("action", "longRentPassword.do")
		$(".board_password").submit();
	})
	
})