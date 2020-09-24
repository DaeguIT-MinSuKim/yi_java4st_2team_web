/* *****************************************************************
슬라이더 좌우/상하/패이드 인아웃
EBI-정팀장 2016.08
*******************************************************************
일반 : normal
상하 : updown
패이드인아웃 : fade
*******************************************************************
- ebi.slider.css 파일필요.
- 버튼이미지는 images/slider/ 폴더로 독립해서 사용하기
- 페이징 버튼, 방향 아이콘은 ebi.slider.css 에서 수정.
***************************************************************** */

$(document).ready(function(){
	

	if($("*").hasClass("slider")){
		var countNow = new Array; //현재 보고 있는 카운터
		var countPrev = new Array; //이전에 봤던 카운터
		var sType = new Array; // 슬라이더 타입
		var sTime = new Array; // 지연시간
		var sBtn = new Array; // 좌우 버튼 (css에서 정의해서 사용)
		var sPage = new Array; // 페이지 버튼 (css에서 정의해서 사용)
		var sSpeed = new Array; // 전환 속도
		var timer = new Array; //전환 지연시간
		var sMax = new Array; // 전체 아이템 갯수
		var arrow = new Array; // 정방향, 역방향
		var clickNow = new Array; //페이지 버튼 클릭한 인덱스
		var clickState = new Array; //페이지 버튼 클릭한 상태인지 아닌지 체크 true, false
		var stopState = new Array; //플레이 스톱
		var easing = "easeInOutCubic"; //easing 타입

		$(".slider").each(function(idx){
			sType[idx] = $(this).attr("data-type");
			sTime[idx] = Number($(this).attr("data-time"));
			sMax[idx] = Number($(this).find(".sliderObj").children().length -1);
			sSpeed[idx] = Number($(this).attr("data-speed"));
			sBtn[idx] = $(this).attr("data-btn");
			sPage[idx] = $(this).attr("data-page");
			arrow[idx] = "next"; //정방향 기본
			clickState[idx] = false; //페이지 버튼 클릭 아님이 기본
			stopState[idx] = false; //플레이가 기본값. 스톱이 기본
			countNow[idx] = 0;
			// $('.sliderObj li a').find('img').attr('src').replace('_day.png', '_night.png');

			if(sMax[idx] == 0){ //아이템 갯수가 1개면 좌우버튼, 내비아이콘 없애기
				$(this).find(".sliderPage").css({display:"none"});
				$(this).find(".sliderBtn").css({display:"none"});
			}
			$(this).find(".sliderObj").addClass(sType[idx]); //슬라이더 타입 클래스 넣기
			$(this).find(".sliderButton").addClass(sBtn[idx]); //버튼 타입 클래스 넣기
			$(this).find(".sliderPage").addClass(sPage[idx]); //페이지 타입 클래스 넣기
			$(this).find(".sliderObj").children().each(function(i){ //li에 배경으로 이미지 넣기
				
				/* 대현 170525 추가 -> 오전8시~오후 7시 사이엔 슬라이드 이미지 변경하기 (판교노인종합복지관) */
				today = new Date();
				var hour = today.getHours();
				if(hour > 8 && hour < 19){
					$(this).find("img").attr("src", $(this).find('img').attr('src').replace('_night.png','_day.png'));
				}else{
					$(this).find("img").attr("src", $(this).find('img').attr('src').replace('_day.png','_night.png'));
				}
				/* //대현 170525 추가 -> 오전8시~오후 7시 사이엔 슬라이드 이미지 변경하기 (판교노인종합복지관) */
				
				$(this).css({backgroundImage:"url("+$(this).find("img").attr("src")+")"});
				$(this).parent().siblings(".sliderPage").children("div").append("<a href='#void'><span>"+(i+1)+"</span></a>"); //페이지 버튼 생성
			});
			$(".slider").eq(idx).find(".sliderPage").children("div").children().eq(0).addClass("on"); //페이지 버튼 첫번째 클래스 on

			function sliderFn(){
				if(!$(".slider").eq(idx).find(".sliderObj").children().is(":animated") && (sMax[idx] > 0)){ //애니메이션 중인 아이템이 없고, 아이템 갯수가 2개 이상일 때 동작
					clearInterval(timer[idx]);
					$item = $(".slider").eq(idx).find(".sliderObj").children();
					$page = $(".slider").eq(idx).find(".sliderPage").children("div").children();					
					if(!clickState[idx]){ //페이지 버튼 클릭한게 아니면 (일반적인 상황)
						if(arrow[idx] == "next"){ // 정방향 일 때
							if(countNow[idx] < sMax[idx]){
								countPrev[idx] = countNow[idx];
								countNow[idx]++;
							}else if(countNow[idx] = sMax[idx]){
								countPrev[idx] = countNow[idx];
								countNow[idx] = 0;
							};
						}else{ //역방향 일 때
							if(countNow[idx] > 0){
								countPrev[idx] = countNow[idx];
								countNow[idx]--;
							}else if(countNow[idx] == 0){
								countPrev[idx] = countNow[idx];
								countNow[idx] = sMax[idx];
							};
						}
					}else{ //페이지버튼을 클릭 한 경우라면...
						countPrev[idx] = countNow[idx];
						countNow[idx] = clickNow[idx]+1;
						clickState[idx] = false;
					}
					$page.eq(countPrev[idx]).removeClass("on"); //내비아이콘의 온 없애고
					$page.eq(countNow[idx]).addClass("on"); //현재 카운터에 온 넣기

					////////////////////////////////////////////////////////// 좌우 슬라이드
					if(sType[idx] =="normal"){
						if(arrow[idx] == "next"){ //정방향
							$item.eq(countPrev[idx]).stop().animate({left:"-100%"},sSpeed[idx],easing,function(){
								$(this).css({left:"100%"});
							});
							$item.eq(countNow[idx]).css({left:"100%"});
						}else{ //역방향
							$item.eq(countPrev[idx]).stop().animate({left:"100%"},sSpeed[idx],easing,function(){
								$(this).css({left:"-100%"});
								arrow[idx] = "next";
							});
							$item.eq(countNow[idx]).css({left:"-100%"});
						}
						$item.eq(countNow[idx]).animate({left:"0"},sSpeed[idx],easing);
						if(!stopState[idx]){ //스톱모드가 아닐 때만 타이머 작동.
							timer[idx] = setInterval(sliderFn, sTime[idx]);
						}
					}
					
					////////////////////////////////////////////////////////// 상하 슬라이드
					if(sType[idx] =="updown"){
						if(arrow[idx] == "next"){ //정방향
							$item.eq(countPrev[idx]).stop().animate({top:"-100%"},sSpeed[idx],easing,function(){
								$(this).css({top:"100%"});
							});
							$item.eq(countNow[idx]).css({top:"100%"});
						}else{ //역방향
							$item.eq(countPrev[idx]).stop().animate({top:"100%"},sSpeed[idx],easing,function(){
								$(this).css({top:"-100%"});
								arrow[idx] = "next";
							});
							$item.eq(countNow[idx]).css({top:"-100%"});
						}
						$item.eq(countNow[idx]).animate({top:"0"},sSpeed[idx],easing);
						if(!stopState[idx]){ //스톱모드가 아닐 때만 타이머 작동.
							timer[idx] = setInterval(sliderFn, sTime[idx]);
						}
					}
					
					////////////////////////////////////////////////////////// 패이드 인 아웃
					if(sType[idx] =="fade"){
						$item.eq(countNow[idx]).css({opacity:"1"});
						$item.eq(countPrev[idx]).css({opacity:"0"});
						if(!stopState[idx]){ //스톱모드가 아닐 때만 타이머 작동.
							timer[idx] = setInterval(sliderFn, sTime[idx]);
						}
					}
				}; //animated

			}; //sliderFn
			timer[idx] = setInterval(sliderFn, sTime[idx]);

			//좌,우 버튼
			$(this).find(".bPrev").click(function(){
				arrow[idx] = "prev";				
				sliderFn();
			});
			$(this).find(".bNext").click(function(){
				arrow[idx] = "next";
				sliderFn();
			});
			//페이지 버튼
			$(this).find(".sliderPage>div>a").click(function(){
				if($(this).index() != countNow[idx]){ // 현재 페이지를 또 클릭하는지 체크
					if($(this).index() > countNow[idx]){
						arrow[idx] = "next";
					}else{
						arrow[idx] = "prev";
					}
					clickNow[idx] = $(this).index()-1;
					clickState[idx] = true;
					sliderFn();
				};
			});			
			//플레이 스톱 버튼
			$(this).find(".sliderPage .bState").click(function(){
				if($(this).hasClass("play")){
					$(this).removeClass("play");
					stopState[idx] = false;
					timer[idx] = setInterval(sliderFn, sTime[idx]);
				}else{
					$(this).addClass("play");
					stopState[idx] = true;
					clearInterval(timer[idx]);
				}
			});

		}); //slider each
	}; //hasClass 'slider'
});