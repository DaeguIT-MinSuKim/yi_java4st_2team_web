$(document).ready(function(){
	
	// 장기렌트
	longrent_pwdConfirm(); // 장기렌트 비밀글 확인
	longrent_editComment(); // 장기렌트 댓글 수정 

	
	// 단기렌트
	rent_btnNotice(); //단기렌트 상세 - 버튼 '렌트시 유의사항 보기'
	rent_payBox(); //단기렌트 상세 - 결제정보 위치 fixed
	rent_tabBtn(); // 단기렌트 탭버튼
	rent_optionHours(); // selectBox option 시간 삽입
	rent_carSearch();
	rent_optionHours(); // 단기렌트 - selectBox option 시간 삽입
	rent_carSearch(); // 단기렌트 - 차량 검색
	
	//이벤트
	event_popup();
});


// 장기렌트 비밀글 확인
function longrent_pwdConfirm(){
	$(".board_password_btn").click(function(){
		if ($(".board_password input[type=password]").val() == ""){
			alert("비밀번호를 입력하세요.")
			return false
		}
		
		var pwdCh = $("#pwdCh").val();
		$("#pwd").val(pwdCh);
//		alert($("#pwd").val());
		
		$(".board_password").submit();
		return false;
	});
}

// 장기렌트 수정
function updateCheck(){
	if(document.frm.name.value.length == 0) {
		alert("변경할 이름을 입력하세요.");
		return false;
	}
	if(document.frm.tel.value.length == 0) {
		alert("변경할 전화번호를 입력하세요.");
		return false;
	}
	if(document.frm.pwd.value.length == 0) {
		alert("변경할 비밀번호를 입력하세요.");
		return false;
	}
	if(document.frm.title.value.length == 0) {
		alert("변경할 제목 입력하세요.");
		return false;
	}
//	if(document.frm.contents.value.length == 0) {
//		alert("변경할 내용 입력하세요.");
//		return false;
//	}
	
	return true;
}

// 장기렌트 글쓰기
function writeCheck(){
	if(document.frm.name.value.length == 0) {
		alert("이름은 필수항목입니다.");
		return false;
	}
	if(document.frm.tel.value.length == 0) {
		alert("전화번호은 필수항목입니다.");
		return false;
	}
	if(document.frm.pwd.value.length == 0) {
		alert("비밀번호는 필수항목입니다.");
		return false;
	}
	if(document.frm.title.value.length == 0) {
		alert("제목을 입력해주세요.");
		return false;
	}
//	if(document.frm.contents.value.length == 0) {
//		alert("문의 내용을 입력해주세요.");
//		return false;
//	}
	
	return true;
}



//장기렌트 댓글 수정 
function longrent_editComment(){
	$(".board_view .comment .comment_list > li .btn .update").click(function(){
		$(".board_view .comment .comment_list > li .content_box p").hide()
		$(".board_view .comment .comment_list > li .content_box form").show()
		
		return false;
	});
}

//단기렌트 상세 - 버튼 '렌트시 유의사항 보기'
function rent_btnNotice(){
	var $el_class_btnNotice = $(".btn_notice").eq(0);
	if( $el_class_btnNotice.length > 0 ){
		$el_class_btnNotice.on("click", function(){
			$el_class_btnNotice.hide();
			$(".noticeText").slideDown(200);
		});
	};
}

// 단기렌트 상세 - 결제정보 위치 fixed
function rent_payBox(){
	$el_class_payBox = $(".payBox").eq(0);
	if( $el_class_payBox.length > 0 ){
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
	}
		
}

// 단기렌트 탭버튼
function rent_tabBtn(){
	$(".rentcarList_tabBtn>a").on("click", function(e){
		var kindNum = $(this).attr("data-kindnum"); // 구분 차량 기준번호 확인
		$(".rentcarList_tabBtn>a").removeClass("active");
		$(this).addClass("active");
		
		if( kindNum == 0 ){ // 전체 차량 보기
			$(".page_rent .rentcarList>ul>li").show();
		}else{ // 차량 구분별로 보기
			$(".page_rent .rentcarList>ul>li[data-kinditem="+kindNum+"]").siblings().hide().end().show();
		}
	});
}

// select option 시간 삽입
function rent_optionHours(){
	if( $(".hours").length > 0 ){
		
		var add_option = "";
		
		for( var i=0; i < 24; i++ ){
			add_option += "<option value="+ i +">" + i + "시</option>";
		}
		
		$(".hours").each(function(){
			$(this).append(add_option);
		});
	}
}


// 단기렌트 - 차량 검색
function rent_carSearch(){
	$(".btn_carSearch").on("click", function(){
		var minDateVal = $(".calendar.prev").val().trim();
		var maxDateVal = $(".calendar.next").val().trim();
		var minHourVal = $(".calendar.prev").next(".hours").val();
		var maxHourVal = $(".calendar.next").next(".hours").val();
		
		if( minDateVal == "" ){ // 대여일 선택 안한 경우
			alert("차량 검색할 날짜를 선택해주세요");
			return false;
			
		}else{     // 대여일 선택
			
			if( maxDateVal == "" ){ // 반납일 선택 안한 경우
				var dateArr = {
					"minDateVal":minDateVal,
					"minHourVal":minHourVal
				};
				
//				$.ajax({
					
//				});
				
			}else{ // 반납일 선택
				
				var dateArr = {
					"minDateVal":minDateVal,
					"maxDateVal":maxDateVal,
					"minHourVal":minHourVal,
					"maxHourVal":maxHourVal
				};
				
//				$.ajax({
//			        type : 'GET',
//			        url : "rent.do",
//			        data : {dateArr},
//			        success : function (data) {

//			        }
//				});

			}
		}
		
	});
	
}



// event view 알림 팝업
function event_popup(){
	$(".event_popup .cancle").click(function(){
		$(".event_popup").hide()
		
		return false;
	})
	
	$(".event_img").click(function(){
		$(".event_popup").css({display:"table"})
	})
}