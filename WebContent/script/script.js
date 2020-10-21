function MPopup() {

	if (document.getElementById("checkboxMainLR").checked == false) {
		window.alert("이용약관을 확인하시고 동의하셔야 상담이 가능합니다.");
		document.getElementById("checkboxMainLR").focus();
		return;
	}

	document.main_longrent.submit();
}

$(document).ready(function() {

	// 헤더 로고 (동자승이 눈깜빡이는거 ~)
	logo_hover();

	// 장기렌트
	longrent_pwdConfirm(); // 장기렌트 비밀글 확인
	longrent_editComment(); // 장기렌트 댓글 수정

<<<<<<< HEAD
	// 단기렌트
	rent_btnNotice(); // 단기렌트 상세 - 버튼 '렌트시 유의사항 보기'
	rent_payBox(); // 단기렌트 상세 - 결제정보 위치 fixed
	rent_tabBtn(); // 단기렌트 탭버튼
	rent_optionHours(); // selectBox option 시간 삽입
	rent_optionHours(); // 단기렌트 - selectBox option 시간 삽입
	rent_carSearch(); // 단기렌트 - 차량 검색
	rent_calendarWrap_hover(); // 단기렌트 - 동자승 차 애니메이션

	// 이벤트
=======
	//이벤트
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git
	event_popup();

	// 관리자 메뉴
	admin_gnb();
<<<<<<< HEAD

	// 관리자 차량관리목록
	form_delete();
=======
	admin_logoHover(); // 헤더 로고 (동자승이 눈깜빡이는거 ~)
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git
});

<<<<<<< HEAD
function logo_hover() {
=======

// 헤더 로고 (동자승이 눈깜빡이는거 ~)
function logo_hover(){
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git
	var logo = $(".logo").eq(0);
	var str_logo = "logo";

	logo.on({
		mouseenter : function() {
			logo.find("img").attr(
					"src",
					logo.find("img").attr("src").replace(str_logo,
							str_logo + "_hover"));
		},
		mouseleave : function() {
			logo.find("img").attr(
					"src",
					logo.find("img").attr("src").replace(str_logo + "_hover",
							str_logo));
		}
	});
}

<<<<<<< HEAD
=======
function admin_logoHover(){
	var logo = $(".admin_logo").eq(0);
	var str_logo = "logo_w";

	logo.on({
		mouseenter:function(){
			logo.find("img").attr("src", logo.find("img").attr("src").replace(str_logo, str_logo + "_hover"));
		},
		mouseleave:function(){
			logo.find("img").attr("src", logo.find("img").attr("src").replace(str_logo + "_hover", str_logo));
		}
	});
}




>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git
// 장기렌트 비밀글 확인
function longrent_pwdConfirm() {
	$(".board_password_btn").click(function() {
		if ($(".board_password input[type=password]").val() == "") {
			alert("비밀번호를 입력하세요.")
			return false
		}

		var pwdCh = $("#pwdCh").val();
		$("#pwd").val(pwdCh);
		// alert($("#pwd").val());

		$(".board_password").submit();
		return false;
	});
}

// 장기렌트 수정
function updateCheck() {
	if (document.frm.name.value.length == 0) {
		alert("변경할 이름을 입력하세요.");
		return false;
	}
	if (document.frm.tel.value.length == 0) {
		alert("변경할 전화번호를 입력하세요.");
		return false;
	}
	if (document.frm.pwd.value.length == 0) {
		alert("변경할 비밀번호를 입력하세요.");
		return false;
	}
	if (document.frm.title.value.length == 0) {
		alert("변경할 제목 입력하세요.");
		return false;
	}
	// if(document.frm.contents.value.length == 0) {
	// alert("변경할 내용 입력하세요.");
	// return false;
	// }

	return true;
}

// 장기렌트 글쓰기
function writeCheck() {
	if (document.frm.name.value.length == 0) {
		alert("이름은 필수항목입니다.");
		return false;
	}
	if (document.frm.tel.value.length == 0) {
		alert("전화번호은 필수항목입니다.");
		return false;
	}
	if (document.frm.pwd.value.length == 0) {
		alert("비밀번호는 필수항목입니다.");
		return false;
	}
	if (document.frm.title.value.length == 0) {
		alert("제목을 입력해주세요.");
		return false;
	}
	// if(document.frm.contents.value.length == 0) {
	// alert("문의 내용을 입력해주세요.");
	// return false;
	// }

	return true;
}

// 장기렌트 댓글 수정
function longrent_editComment() {
	$(".board_view .comment .comment_list > li .btn .update").click(function() {
		$(".board_view .comment .comment_list > li .content_box p").hide()
		$(".board_view .comment .comment_list > li .content_box form").show()

		return false;
	});
}

<<<<<<< HEAD
// 단기렌트 상세 - 버튼 '렌트시 유의사항 보기'
function rent_btnNotice() {
	var $el_class_btnNotice = $(".btn_notice").eq(0);
	if ($el_class_btnNotice.length > 0) {
		$el_class_btnNotice.on("click", function() {
			$el_class_btnNotice.hide();
			$(".noticeText").slideDown(200);
		});
	}
	;
}

// 단기렌트 상세 - 결제정보 위치 fixed
function rent_payBox() {
	$el_class_payBox = $(".payBox").eq(0);
	if ($el_class_payBox.length > 0) {
		$(window).scroll(function() {
			if ($(window).width() > 992) {
				var fixTop = $('.carInfoBox').offset().top - 20;
				var scTop = $(window).scrollTop();

				if (fixTop <= scTop) {
					$el_class_payBox.addClass('fixOn');
				} else {
					$el_class_payBox.removeClass('fixOn');
				}
			} else {
				$el_class_payBox.removeClass('fixOn');
			}
		});
	}

}

// 단기렌트 탭버튼
function rent_tabBtn() {
	$(".rentcarList_tabBtn>a").on(
			"click",
			function(e) {
				var kindNum = $(this).attr("data-kindnum"); // 구분 차량 기준번호 확인
				$(".rentcarList_tabBtn>a").removeClass("active");
				$(this).addClass("active");

				if (kindNum == 0) { // 전체 차량 보기
					$(".page_rent .rentcarList>ul>li").show();
				} else { // 차량 구분별로 보기
					$(
							".page_rent .rentcarList>ul>li[data-kinditem="
									+ kindNum + "]").siblings().hide().end()
							.show();
				}
			});
}

// 단기렌트 - select option 시간 삽입
function rent_optionHours() {
	if ($(".hours").length > 0) {

		var add_option = "";

		for (var i = 0; i < 24; i++) {
			add_option += "<option value=" + i + ">" + i + "시</option>";
		}

		$(".hours").each(function() {
			$(this).append(add_option);
		});
	}
}

// 단기렌트 - 차량 검색
function rent_carSearch() {
	$(".btn_carSearch").on("click", function() {
		var minDateVal = $(".calendar.prev").val().trim();
		var maxDateVal = $(".calendar.next").val().trim();
		var minHourVal = $(".calendar.prev").next(".hours").val();
		var maxHourVal = $(".calendar.next").next(".hours").val();

		// 대여일 자르기
		var minYear = minDateVal.split("-")[0];
		var minMonth = minDateVal.split("-")[1];
		var minDay = minDateVal.split("-")[2];

		// 반납일 자르기
		var maxYear = maxDateVal.split("-")[0];
		var maxMonth = maxDateVal.split("-")[1];
		var maxDay = maxDateVal.split("-")[2];

		// alert(minYear + minMonth + minDay);

		if (minDateVal == "") { // 대여일 선택 안한 경우
			alert("차량 검색할 날짜를 선택해주세요");
			return false;

		} else { // 대여일 선택

			if (maxDateVal == "") { // 반납일 선택 안한 경우
				var params = {
					minYear : minYear,
					minMonth : minMonth,
					minDay : minDay,
					minHour : minHourVal
				};

				$.ajax({
					type : "POST",
					url : "rent.do",
					data : JSON.stringify(params),
					dataType : "json",
					contentType : "application/json;charset=UTF=8",
					success : function(data) {
						var result = JSON.parse(data);
						alert(result);
						alert("호출 성공!!");
					},
					error : function(e) { // 에러날경우 에러메시지 보기
						alert(e.responseText);
					}
				});

			} else { // 반납일 선택

				var dateArr = {
					"minDateVal" : minDateVal,
					"maxDateVal" : maxDateVal,
					"minHourVal" : minHourVal,
					"maxHourVal" : maxHourVal
				};

				// $.ajax({
				// type : 'GET',
				// url : "rent.do",
				// data : {dateArr},
				// success : function (data) {

				// }
				// });

			}
		}

	});

}

// 단기렌트 - 동자승 차 애니메이션
function rent_calendarWrap_hover() {
	var $el_class_calendarWrap = $(".calendarWrap").eq(0);
	var $el_class_dongja = $(".dongja").eq(0);
	var $el_class_note1 = $(".note1").eq(0);
	var $el_class_note2 = $(".note2").eq(0);
	var str_dong = "dong";

	$el_class_calendarWrap.on({
		mouseenter : function() {
			$el_class_dongja.addClass("dongja_aniOn");
			$el_class_note1.addClass("dongja_aniOn_note1");
			$el_class_note2.addClass("dongja_aniOn_note2");
			$el_class_dongja.find(".dongja_char").attr(
					"src",
					$el_class_dongja.find(".dongja_char").attr("src").replace(
							str_dong, str_dong + "_hover2"));
		},
		mouseleave : function() {
			$el_class_dongja.removeClass("dongja_aniOn");
			$el_class_note1.removeClass("dongja_aniOn_note1");
			$el_class_note2.removeClass("dongja_aniOn_note2");
			$el_class_dongja.find(".dongja_char").attr(
					"src",
					$el_class_dongja.find(".dongja_char").attr("src").replace(
							str_dong + "_hover2", str_dong));
		}
	});
}
=======
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git

// event view 알림 팝업
function event_popup() {
	$(".event_popup .cancle").click(function() {
		$(".event_popup").hide()

		return false;
	})

	$(".event_img").click(function() {
		$(".event_popup").css({
			display : "table"
		})
	})
}

// 관리자 메뉴
function admin_gnb() {
	$("#admin_gnb > ul > li > a").click(function() {
		if ($(this).parent("li").children().length == 2) {
			$(this).parent("li").children("ul").stop().slideToggle();
			return false;
		}
	})
}

<<<<<<< HEAD
function form_delete() {
	$('.delete').on("click", function(e) {
		e.preventDefault();
		var chk_del = confirm("정말 삭제하시겠습니까?");
		if (chk_del == true) {
			
			var url = $(this).parent("a").attr("href");
			alert(url);
			location.href=url;
		}
	});
}
=======
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git
