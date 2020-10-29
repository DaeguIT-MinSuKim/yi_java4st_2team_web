$(function(){
	$.datepicker.regional['ko'] = {
		closeText: '창닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘선택',
		monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: ''
	};

	$.datepicker.setDefaults($.datepicker.regional['ko']);

	$('.calendar.prev, .calendar.next').datepicker({
//		showOn: 'text',
//		buttonImage: '../images/common/icon_date.png', //이미지 url
//		imgW:'35',
//		imgH:'35',
		buttonImageOnly: true,
		buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true, // 오늘 날짜선택
		minDate: 0, // 오늘 날짜부터 선택 가능
	});

	$('.calendar.start, .calendar.end').datepicker({
//		showOn: 'text',
//		buttonImage: '../images/common/icon_date.png', //이미지 url
//		imgW:'35',
//		imgH:'35',
		buttonImageOnly: true,
		buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true, // 오늘 날짜선택
	});
	
	//날짜 선택시 전날선택 안되게 막기
	$('.calendar.prev').datepicker("option", "maxDate", $(".calendar.next").val());
	$('.calendar.prev').datepicker("option", "onClose", function ( selectedDate ) {
        $(".calendar.next").datepicker("option", "minDate", selectedDate );
    });
	
//	$(".calendar.next").datepicker("option", "minDate", $(".calendar.prev").val());
	$(".calendar.next").datepicker("option", "onClose", function ( selectedDate ) {
		$('.calendar.prev').datepicker("option", "maxDate", selectedDate );
		
			
		// 대여 날짜 15일 이상이면 장기렌트로 유도하는 글자 표시
		var dayChk = parseInt($("#set_day>span").text());
		if(dayChk >= 15){ 
			$(".payBox .text").show();
		}else{
			$(".payBox .text").hide();
		}
    });

	$('.calendar.start').datepicker("option", "maxDate", $(".calendar.end").val());
	$('.calendar.start').datepicker("option", "onClose", function ( selectedDate ) {
        $(".calendar.end").datepicker("option", "minDate", selectedDate );
    });
	$(".calendar.end").datepicker("option", "onClose", function ( selectedDate ) {
		$('.calendar.start').datepicker("option", "maxDate", selectedDate );
    });
	
	
	
	// 단기렌트 상세에서 반납일 인풋만 있을 경우
	if( $(".calendar.next").length > 0 && $(".calendar.prev").length == 0 ){
		
		// 한 차량에 대한 최대 대여일이 없을 경우
		if( $("#get_maxDateLimit").val()==null || $("#get_maxDateLimit").val()=="" ){
			$(".calendar.next").datepicker("option", "minDate", $(".date_minDateVal").text());
		}else{ // 있을 경우
			$(".calendar.next").datepicker("option", "minDate", $(".date_minDateVal").text());
			$(".calendar.next").datepicker("option", "maxDate", $("#get_maxDateLimit").val().split("T")[0]);
		}
		
	}
	
	
	
});