$(document).ready(function(){
	
	// 장기렌트 비밀글 확인
	$(".board_password_btn").click(function(){
		if ($(".board_password input[type=password]").val() == ""){
			alert("비밀번호를 입력하세요.")
			return false
		}
		
		$(".board_password").submit();
		return false;
	})
	
	// 장기렌트 댓글 수정
	$(".board_view .comment .comment_list > li .btn .update").click(function(){
		$(".board_view .comment .comment_list > li .content_box p").hide()
		$(".board_view .comment .comment_list > li .content_box form").show()
		
		return false;
	})
	
})