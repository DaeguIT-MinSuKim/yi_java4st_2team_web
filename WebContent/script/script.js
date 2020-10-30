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

	// 이벤트
	event_popup();

	// 관리자 메뉴
	admin_gnb();
	admin_gnb_height(); // gnb 부족한 높이 채움

	// 관리자 차량관리목록
	form_delete();
	admin_logoHover(); // 헤더 로고 (동자승이 눈깜빡이는거 ~)
	
	// 모든 페이지의 textarea
	textarea_textcounting();
	
	// 관리자 단기렌트 관리 -> 렌트 삭제
	admin_rent_delete();
});

// 헤더 로고 (동자승이 눈깜빡이는거 ~)
function logo_hover() {
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

function admin_logoHover() {
	var logo = $(".admin_logo").eq(0);
	var str_logo = "logo_w";

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

	if (CKEDITOR.instances.contents_ckeditor.getData().trim() == "") {
		alert("변경할 내용 입력하세요.");
		return false;
	}

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
	if(document.frm.contents.value.length == 0) {
		alert("문의 내용을 입력해주세요.");
		return false;
	}

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

function form_delete() {
	$('.delete').on("click", function(e) {
		e.preventDefault();
		var chk_del = confirm("정말 삭제하시겠습니까?");
		
		if (chk_del == true) {
			var url = $(this).parent("a").attr("href");
			location.href = url;
		}
	});
}

// 어드민 - 장기렌트 글쓰기
function admin_writeCheck(){
	if(document.frm.title.length == 0) {
		alert("제목을 입력해주세요.");
		return false;
	}
	if (document.frm.contents.value.length == 0) {
		alert("문의 내용을 입력해주세요.");
		return false;
	}
	return true;
}

// 어드민 - 보험 수정
function admin_ins_writeCheck(){
	if(document.frmmm.code.value.length == 0) {
		alert("보험 코드를 입력해주세요.");
		return false;
	}
	if (document.frmmm.name.value.length == 0) {
		alert("보험 이름을 입력해주세요.");
		return false;
	}
	if (document.frmmm.fare.value.length == 0) {
		alert("보험 금액 입력해주세요.");
		return false;
	}
	return true;
}

// gnb 부족한 높이 채움
function admin_gnb_height(){
	var left_gnb = $("#admin_gnb");
	if(	left_gnb.length > 0 ){
		var right_content = $(".admin_page");
		
		if( left_gnb.outerHeight() < right_content.outerHeight() ){
			left_gnb.height(right_content.outerHeight() + $("#adimn_content>h2").outerHeight());
		}
	}
}

function textarea_textcounting(){
	if( $('textarea').length > 0 ){
		var html_wrapper = '<div id="textareaBox"></div>';
		var html_countingBox = '<span id="countingBox">(0 / 최대 1200자)</span>';
		
		$('textarea').wrap(html_wrapper);
		$('#textareaBox').append(html_countingBox);
		$('textarea').keyup(function (e){
		    var content = $(this).val();
		    $('#countingBox').html("("+content.length+" / 최대 1200자)");    //글자수 실시간 카운팅
		
		    if (content.length > 1200){
		        alert("최대 1200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1200));
		        $('#countingBox').html("(200 / 최대 1200자)");
		    }
		});
	}
}

function admin_rent_delete(){
	if( $(".btn_rentDelete").length ){
		$(".btn_rentDelete").on("click", function(){
			if( confirm("이 렌트예약을 삭제하시겠습니까?") ){
				var rentNo = $(this).attr("data-rentNo");
				$.ajax({
					url:"adminRentDelete.do?rentNo="+rentNo,
					type:"get",
					success:function(){
						alert("삭제가 완료되었습니다");
						location.href="adminRent.do";
					}
				});
			}
		});
	}
}