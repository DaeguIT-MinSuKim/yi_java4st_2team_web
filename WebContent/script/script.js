$(document).ready(function(){
	
	// 장기렌트 비밀글 확인
	$(".board_password_btn").click(function(){
		if ($(".board_password input[type=password]").val() == ""){
			alert("비밀번호를 입력하세요.")
			return false
		}
		
		$(".board_password").submit();
		return false;
	});
	
	// 장기렌트 댓글 수정
	$(".board_view .comment .comment_list > li .btn .update").click(function(){
		$(".board_view .comment .comment_list > li .content_box p").hide()
		$(".board_view .comment .comment_list > li .content_box form").show()
		
		return false;
	});
	
	
	
	// 단기렌트 상세 - 버튼 '렌트시 유의사항 보기'
	var $el_class_btnNotice = $(".btn_notice").eq(0);
	if( $el_class_btnNotice.length > 0 ){
		$el_class_btnNotice.on("click", function(){
			$el_class_btnNotice.hide();
			$(".noticeText").slideDown(200);
		});
	};
	
	// 단기렌트 상세 - 결제정보 위치 fixed
	$el_class_payBox = $(".payBox").eq(0);
	$(window).scroll(function(){
		if( $(window).width() > 992 ){
			var fixTop = $('.carInfoBox').offset().top - 20;
			var scTop = $(window).scrollTop();
			
			if( fixTop <= scTop ){
				$el_class_payBox.addClass('fixOn');
			}else{
				$el_class_payBox.removeClass('fixOn');
			}
		}else{
			$el_class_payBox.removeClass('fixOn');
		}
	});
});
