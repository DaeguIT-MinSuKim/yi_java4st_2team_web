$(function(){
	
	// 단기렌트
	rent_btnNotice(); //단기렌트 상세 - 버튼 '렌트시 유의사항 보기'
	rent_payBox(); //단기렌트 상세 - 결제정보 위치 fixed
	rent_tabBtn(); // 단기렌트 탭버튼
	rent_optionHours(); // 단기렌트 - selectBox option 시간 삽입
	rent_carSearch(); // 단기렌트 - 차량 검색
	rent_calendarWrap_hover(); // 단기렌트 - 동자승 차 애니메이션
	rentDetail_priceChange(); // 단기렌트 상세 - 실시간으로 최종금액 계산 + 결제정보 변경
	
	rent_form_goDtl(); // 단기렌트 - 차량 상세로 submit (차량리스트 호출 시 동시 실행함)
//	numberWithCommas(); // 3자리 단위 콤마 찍기  (특정 부분만 사용)
	btn_payBox_submit(); // 단기렌트 최종 예약하기
	
	main_carRent() // 메인 - 자동차 렌트
	memberRent_delete(); // 렌트 리스트 - 렌트 예약 취소
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
			
			if( maxDateVal != "" ){ // 반납일부터 선택한 경우
				alert("차량 대여일도 선택해주세요");
			}else{ // 대여일 선택 안한 경우
				alert("차량 검색할 날짜를 선택해주세요");
			}
			
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
//					console.log(json[0]);

					var add_html = "";
					for( var i=0; i<json.length; i++ ){
						add_html += '<li data-kindItem="'+ json[i].kind.code +'">';
						add_html += '<a href="javascript:;" class="btn_goDtl active">';
						add_html += '<div class="img" title="'+ json[i].name +'">';
						add_html += '<img src="./images/rentcar/'+ json[i].kind.code +'/'+ json[i].image +'" alt="'+ json[i].name +'">';
						add_html += '</div>';
						add_html += '<img src="./images/brand/'+ json[i].brand.image +'" class="brand_logo" alt="'+ json[i].brand.name +'">';
						add_html += '<div class="text">';
						add_html += '<h4 class="carName">'+ json[i].name +'</h4>';
						add_html += '<p class="price">렌탈1일기준<span> ';
						add_html += numberWithCommas(json[i].kind.fare) +'원';
						add_html += '</span></p></div>';
						add_html += '<input type="hidden" name="carNo" class="carNo" value="' + json[i].no + '">';
						add_html += '</a></li>';
					}
					
					$(".rentcarList>ul").empty().append(add_html);
					insertBg();

					// 토스트팝업창 띄우기
					var $el_class_popupToast = $(".popup_toast").eq(0);
					$el_class_popupToast.show();
					setTimeout(function(){
						$el_class_popupToast.hide();
					},1000);
					
					// 차량리스트 위치로 이동
					var pos = $(".rentcarList_tabBtn").offset().top - 50;
					$("html, body").stop().animate({scrollTop:pos}, 500);
					
					// 차량리스트의 각 차량에 링크를 재부여 (ajax로 차량리스트를 다시 뿌려서...각 차량의 클릭이벤트가 사라졌기 때문)
					rent_form_goDtl();
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
		$(".btn_goDtl").on("click", function(e){
			e.preventDefault();
			
			if( $(this).hasClass("active") ){ // 아직 날짜를 선택안한 상황일 경우
				var carNo = $(this).find(".carNo").val();
				var minDate = $(".calendar.prev").val();
				var maxDate = $(".calendar.next").val();
				var minHour = $(".hours.prev").val();
				var maxHour = $(".hours.next").val();
				
				maxHour = maxDate=="" ?	maxHour = "" : '&maxHour=' + maxHour;
				maxDate = maxDate=="" ? maxDate = '&maxDate=0' : '&maxDate=' + maxDate;
				
				location.href='rentDtl.do'
					+ '?carNo=' + carNo 
					+ '&minDate=' + minDate 
					+ '&minHour=' + minHour
					+ maxDate
					+ maxHour;
					
			}else{
				alert("대여할 날짜를 먼저 선택해주세요");
				return false;		
			}
		});
	}
}

// 단기렌트 상세 - 실시간으로 최종금액 계산 + 결제정보 변경
function rentDetail_priceChange(){
	if( $(".page_listdDtl").length > 0 ){
	
		// 값 가져올 변수
		var $get_ins = $("#get_insurance");
		var $get_opt = $("#get_option");
		var $get_dis = $("#get_discount");
		var $get_carFare = $("#get_carFare");
		
		// 값 넣을 변수
		var $set_ins = $("#set_insurance");
		var $set_opt = $("#set_option");
		var $set_dis = $("#set_discount");
		var $set_day = $("#set_day>span");
		var $set_total = $("#set_total>span");
	
		// 그 외
		var $el_id_optResultPrice = $("#optResultPrice"); // 총 합산할 금액 input
	
		// 반납일 선택 시 실행
		$(".calendar.next").change(function(){
			calculator();		
		});
		
		// 보험 (라디오버튼)
		$get_ins.find("input").on("click", function(){
			var val_name = $get_ins.find("input:checked").next("span").text();
			var val_price = $get_ins.find("input:checked").attr("data-insprice");
			
			$set_ins.text(val_name);
			$(".set_insurance").text(val_price);
			calculator();
			
			val_name = null;
		});
		
		
		// 옵션 (체크버튼)
		$get_opt.find("input").on("click", function(){
			
			// 옵션명 변수
			var get_name = "";
			var chk_name = "";
			
			// 금액 변수
			var chk_price = 0;
			var get_price = 0;
			
			$el_id_optResultPrice.val(0); // 계산 값 초기화
			
			for(var i=0; i < $get_opt.find("label").length; i++){
				chk_name = $get_opt.find("label").eq(i).find("input:checked").next("span").text();
				
				// 글자넣을 부분이 비어있지 않거나, 옵션이 비어있지 않을때 "," 를 앞에 붙여줌
				if( get_name!="" && chk_name!="" ){ chk_name = "," + chk_name }
				get_name += chk_name;
				
				// 총 옵션 금액 계산
				chk_price = $get_opt.find("label").eq(i).find("input:checked").attr("data-optPrice");
				get_price += !isNaN(chk_price) ? parseInt(chk_price) : parseInt(chk_price = 0); // 숫자가 아닌경우에 0으로 처리
			}
			get_name = get_name=="" ? get_name="선택안함" : get_name;
			$set_opt.text(get_name); // 조합된 옵션명 화면에 뿌림
			$el_id_optResultPrice.val(get_price); // 총금액 값 input에 넣음
			$(".set_option").text(get_price);
	
			calculator();
			
			get_name = null;
			chk_name = null;
			chk_price = null;
			get_price = null;
		});
		
		// 할인/쿠폰 (셀렉박스)
		$get_dis.find("select").change(function(){
			$set_dis.text($(this).find("option:selected").text());
			$(".set_discount").text("-" + $(this).find("option:selected").val());
			calculator();
		});
		
		
		
		// 총 렌트대여날짜 계산하기 (반납일 - 대여일)
		function calculator_date(){
			var $get_minDate = $("#get_minDate").text();
			var $get_maxDate = $("#get_maxDate").length ? $("#get_maxDate").text() : $(".calendar.next").val();
			var result_day = 1;
			
			if( $get_maxDate=="" ){ 
				result_day = 1; // 반납일 선택 안했으면 날짜계산 X
			}else{
				var minArr = $get_minDate.split("-");
				var maxArr = $get_maxDate.split("-");
				var minDate = new Date(minArr[0], minArr[1], minArr[2]);
				var maxDate = new Date(maxArr[0], maxArr[1], maxArr[2]);
				var date = parseInt(maxDate - minDate);
				var day = 1000 * 60 * 60 * 24;

				result_day = parseInt(date/day); // 차이 일수
				result_day = result_day==0 ? result_day=1 : result_day; // 차이일수가 0도 1로 계산.
			}
			$set_day.text(result_day);
			$(".set_day").text(result_day);
		}
		
		// 총 금액 계산
		function calculator(){
			var insPay = parseInt($get_ins.find("input:checked").attr("data-insPrice"));
			var optPay = parseInt($el_id_optResultPrice.val());
			var disPay = parseInt($get_dis.find("select").val());
			
			// 숫자가 맞는지 체크
			insPay = !isNaN(insPay) ? insPay : insPay=0;
			optPay = !isNaN(optPay) ? optPay : optPay=0;
			disPay = !isNaN(disPay) ? disPay : disPay=0;
			
			// 렌트 총 날짜 * 금액 계산
			calculator_date();
			var carPay = parseInt($get_carFare.val()) * parseInt($set_day.text());
			var total = (insPay + optPay + carPay) - disPay ; // 총금액
			
			$set_total.attr("data-total", total); // 결제금액 DB로 가져갈때를 위해 삽입
			$set_total.text(numberWithCommas(total)); // 총 결제 금액 화면에 뿌림 

			insPay = null;
			optPay = null;
			disPay = null;
			carPay = null;
			total = null;
		} 
		calculator();
	}
}

//메인 - 차량 예약
function main_carRent(){
	var carNo;
	
	$("#mProduct ul li").click(function(){
		$(".carNoPopup").val($(this).find(".carNo").val())
	})
	
	$(".btn_mainCarRent").on("click", function(){
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
		
		carNo = $(".carNoPopup").val().trim()

		if( minDateVal == "" ){ // 대여일 선택 안한 경우
			alert("차량 대여일을 선택해주세요");
			return false
			
		} else if( maxDateVal == "" ){
			alert("차량 반납일 선택해주세요");
			return false
			
		} else{     // 대여일 선택
			
			var params = {
				minYear:minYear,
				minMonth:minMonth,
				minDay:minDay,
				minHour:minHourVal,
				maxYear:maxYear,
				maxMonth:maxMonth,
				maxDay:maxDay,
				maxHour:maxHourVal,
				carNo:carNo
			};
			console.log(params)
			
			$.ajax({
				type:"POST",
				url:"rentDtlMain.do",
				data:JSON.stringify(params),
				dataType:"json",
				contentType:"application/json",
				success:function(json){
					console.log(json)
					if (json == "noLogin") {
						alert("로그인 후 예약이 가능합니다.");
						window.location = "login.do";
					} else {
						if (json == null){
							window.location = "rentDtl.do?carNo="+carNo+"&minDate="+minDateVal+"&minHour="+minHourVal+"&maxDate="+maxDateVal+"&maxHour="+maxHourVal;
						} else {
							alert("해당하는 차량은 예약이 불가능합니다.")
						}
					}
				},
				error:function(e){ // 에러날경우 에러메시지 보기
					alert("AJAX 에러");
					console.log(e.responseText);
				}
			});
		};
	});
};

//단기렌트 최종 예약하기
function btn_payBox_submit(){
	
	$("#btn_payBox_submit").on("click", function(){
		if(validator()){
			if( confirm("정말 예약하시겠습니까? 확인 누르기전 결제정보를 한번 더 확인해주세요.") ){
				// 렌트 INSERT용 정보
				var $get_loginUser = $("#get_loginUser").val();				// 예약자 아이디
				var $get_carNo = $("#get_carNo").val();						// 차량번호
				var $get_ins = $("#get_insurance input:checked").val();		// 보험번호
				var $get_minDate = $("#get_minDate").text();				// 대여일
				var $get_maxDate = $("#get_maxDate").length ? $("#get_maxDate").text() : $(".calendar.next").val(); // 반납일
				var $set_total = $("#set_total>span").attr("data-total");	// 총 결제금액
				var $get_eventCode = $("#get_discount option:checked").attr("data-code");		// 할인/쿠폰 번호
				var optAll = "";
				
				$get_eventCode = $get_eventCode==null ? $get_eventCode=0 : $get_eventCode;
				
				// 옵션 체크된 항목 번호 저장
				for( var i=0; i < $("#get_option input").length; i++ ){
					if( $("#get_option input").eq(i).prop("checked") ){
						optAll += String($("#get_option input").eq(i).val());
					};
				};

				if( optAll == "" ){
					optAll = 0;
				}

				// UTC 국제표준시로 변경 => (JSP localDateTime 변수에 넣으려면 이렇게 해야함)
				$get_minDate = parseInt(
						Date.UTC(
							$get_minDate.split("-")[0],
							$get_minDate.split("-")[1],
							$get_minDate.split("-")[2]
						)
				);
				$get_maxDate = parseInt(
						Date.UTC(
							$get_maxDate.split("-")[0],
							$get_maxDate.split("-")[1],
							$get_maxDate.split("-")[2]
						)
				);
				
				var params = {
					id : {
						id:$get_loginUser
					},
					carNo:{
						no:$get_carNo
					},
					insCode:{
						code:$get_ins
					},
					rent_date:$get_minDate,
					return_date:$get_maxDate,
					is_rent:'y',
					fare:$set_total,
					optAll:optAll,
					eventCode: {
						eventCode:$get_eventCode
					}
				};
				
				$.ajax({
					type:"POST",
					url:"rentEnd.do",
					data:JSON.stringify(params),
					dataType:"json",
					success:function(data){
						alert("예약이 완료되었습니다.");
						
						location.href="rentEnd.do" + // GET으로 다시 이동
							"?id="			+ $("#get_loginUser").val() +
							"&carNo="		+ $("#get_carNo").val() + 
							"&eventCode="	+ $get_eventCode;
					},
					error:function(e){ // 에러날경우 에러메시지 보기
						alert("예약을 실패했습니다. > ajax 에러");
						console.log(e.responseText);
					}
				});
			} // confirm true
		}
		
		// 예약하기 누를 시 필수항목 체크
		function validator(){
			if( $(".calendar.next").val()=="" ){
				alert("반납일을 선택해주세요.");
				return false;
			}
			return true;
		}
	});
	
}

function memberRent_delete(){
	if( $(".btn_memberRentDelete").length ){
		$(".btn_memberRentDelete").on("click", function(){
			if( confirm("이 렌트예약을 취소하시겠습니까?") ){
				var rentNo = $(this).attr("data-rentNo");
				$.ajax({
					url:"rentDelete.do?rentNo="+rentNo,
					type:"get",
					success:function(){
						alert("삭제가 완료되었습니다");
						location.href="renting.do";
					}
				});
			}
		});
	}
}


