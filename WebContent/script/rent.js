$(function(){
	
	// 단기렌트
	rent_btnNotice(); //단기렌트 상세 - 버튼 '렌트시 유의사항 보기'
	rent_payBox(); //단기렌트 상세 - 결제정보 위치 fixed
	rent_tabBtn(); // 단기렌트 탭버튼
	rent_optionHours(); // 단기렌트 - selectBox option 시간 삽입
	rent_carSearch(); // 단기렌트 - 차량 검색
	rent_calendarWrap_hover(); // 단기렌트 - 동자승 차 애니메이션
	rent_form_goDtl(); // 단기렌트 - 차량 상세로 submit
	
//	numberWithCommas(); // 3자리 단위 콤마 찍기  (특정 부분만 사용)
});

//3자리 단위 콤마 찍기
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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

//단기렌트 상세 - 결제정보 위치 fixed
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


//단기렌트 - select option 시간 삽입
function rent_optionHours(){
	if( $(".hours").length > 0 ){
		
		var add_option = "";
		
		for( var i=9; i <= 18; i++ ){
			if(i==9) i = '0' + i;
			add_option += "<option value="+ i +">" + i + "시</option>";
		}
		
		$(".hours").each(function(){
			$(this).append(add_option);
		});
	}
}


//단기렌트 탭버튼
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


//단기렌트 - 동자승 차 애니메이션
function rent_calendarWrap_hover(){
	var $el_class_calendarWrap = $(".calendarWrap").eq(0);
	var $el_class_dongja = $(".dongja").eq(0);
	var $el_class_note1 = $(".note1").eq(0);
	var $el_class_note2 = $(".note2").eq(0);
	var str_dong = "dong";
	
	$el_class_calendarWrap.on({
		mouseenter:function(){
			$el_class_dongja.addClass("dongja_aniOn");
			$el_class_note1.addClass("dongja_aniOn_note1");
			$el_class_note2.addClass("dongja_aniOn_note2");
			$el_class_dongja.find(".dongja_char").attr("src", $el_class_dongja.find(".dongja_char").attr("src").replace(str_dong, str_dong + "_hover2"));
		},
		mouseleave:function(){
			$el_class_dongja.removeClass("dongja_aniOn");
			$el_class_note1.removeClass("dongja_aniOn_note1");
			$el_class_note2.removeClass("dongja_aniOn_note2");
			$el_class_dongja.find(".dongja_char").attr("src", $el_class_dongja.find(".dongja_char").attr("src").replace(str_dong + "_hover2", str_dong));
		}
	});
}


//단기렌트 - 차량 검색
function rent_carSearch(){
	$(".btn_carSearch").on("click", function(){
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

		if( minDateVal == "" ){ // 대여일 선택 안한 경우
			
			if( maxDateVal != "" ){ // 대여일 선택 안한 경우2
				alert("대여일을 먼저 선택해주세요");
			}else{
				alert("차량 검색할 날짜를 선택해주세요");
			}
			return false;
			
		}else{     // 대여일 선택
			
			if( maxDateVal == "" ){ // 대여일만 선택한 경우
//				alert("대여일 선택");
				var params = {
					minYear:minYear,
					minMonth:minMonth,
					minDay:minDay,
					minHour:minHourVal
				};
				
			}else{ // 대여일 + 반납일 선택한 경우
//				alert("대여일 + 반납일 선택");
				var params = {
					minYear:minYear,
					minMonth:minMonth,
					minDay:minDay,
					minHour:minHourVal,
					maxYear:maxYear,
					maxMonth:maxMonth,
					maxDay:maxDay,
					maxHour:maxHourVal
				};
			}
			
			$.ajax({
				type:"POST",
				url:"rent.do",
				data:JSON.stringify(params),
				dataType:"json",
				contentType:"application/json",
				success:function(json){
					console.log(json[0]);

					var add_html = "";
					for( var i=0; i<json.length; i++ ){
						add_html += '<li data-kindItem="'+ json[i].kind.code +'">';
						add_html += '<a href="rentDtl.do" class="btn_carChoice">';
						add_html += '<div class="img" title="'+ json[i].name +'">';
						add_html += '<img src="./images/rentcar/'+ json[i].kind.code +'/'+ json[i].image +'" alt="'+ json[i].name +'">';
						add_html += '</div>';
						add_html += '<img src="./images/brand/'+ json[i].brand.image +'" class="brand_logo" alt="'+ json[i].brand.name +'">';
						add_html += '<div class="text">';
						add_html += '<h4 class="carName">'+ json[i].name +'</h4>';
						add_html += '<p class="price">렌탈1일기준<span> ';
						add_html += numberWithCommas(json[i].kind.fare) +'원';
						add_html += '</span></p></div>';
						add_html += '<input type="hidden" name="carNo" value="' + json[i].no + '">';
						add_html += '</a></li>';
					}
					
					$(".rentcarList>ul").empty().append(add_html);
					insertBg();
					
					alert("원하시는 날짜의 차량을 검색했어요 :)");
					var pos = $(".rentcarList_tabBtn").offset().top - 50;
					$("html, body").stop().animate({scrollTop:pos}, 500); // 차량리스트 위치로 이동
				},
				error:function(e){ // 에러날경우 에러메시지 보기
					alert("AJAX 에러");
					console.log(e.responseText);
				}
			});
		};
	});
};

// 단기렌트 - 차량 상세로 submit
function rent_form_goDtl(){
	if( $(".btn_goDtl").length > 0 ){
		$(".btn_goDtl").on("click", function(){
			var carNo = $(this).find(".carNo").val();
			location.href='rentDtl.do?carNo=' + encodeURIComponent(carNo);
		});
	}
}
