/* **********************************************************
- ie8 지원하지 않음
- gnb 모션에 transform 사용
********************************************************** */
$(window).load(function(){
	$("nav.mobile").css({visibility:"visible"});
});
$(document).ready(function(){
	// 가속도
	var easingType1 = "easeInOutExpo";
	var easingType2 = "easeInOutCubic";

	var onmenu;//활성 메뉴
	var nowmenu;//현재 클릭 메뉴
	var speed = 300;//gnb 열림,닫힘 시간 / 1초=1000

	$("nav.pc .gnb").clone().appendTo($("nav.mobile"));
	$("nav.mobile").css({visibility:"hidden"});
	$("nav.mobile .gnb").removeAttr("data-orgH data-maxH data-gap data-leftPos");

	/* ********************* PC ******************** */
$(function pcFn(){
		/* ON 메뉴 찾기 */
		onmenu = $("nav.pc .gnb>ul>li.on").index();
		if(onmenu<0){
			onmenu = "null";
		}

		var orgH = $("nav.pc .gnb").attr("data-orgH");
		var navH = $("nav.pc .gnb").attr("data-maxH");
		var leftPos = $("nav.pc .gnb").attr("data-leftPos");
		var gap = $("nav.pc .gnb").attr("data-gap");

		$("nav.pc").css({height:orgH});
		$("nav.pc .gnb").css({height:"",left:leftPos});
		$("nav.pc .gnb>ul>li").each(function(){
			var device = $(this).attr("data-device");
			if(device == "mobile"){
				$(this).css({display:"none"});
			}else{
				// $(this).css({paddingRight:gap}).children("ul").css({width:$(this).outerWidth()-20});
				$("nav.pc").css({visibility:"visible"});
			}
		});
		
		
		$('nav.pc .gnb>ul>li>ul').css({display:'none'});
		$('nav.pc .gnb>ul>li:first-child>ul').css({display:'block'});
		
		$('nav.pc .gnb>ul>li>a').on("mouseenter focusin", function(){
			$(this).next().css({display:'block'});
			$(this).parent().siblings().children('ul').css({display:'none'});
		});
		$('nav.pc').on("mouseenter focusin",function(){//열림
			$('nav.pc').addClass('on');
			$(this).stop().animate({height:navH}, speed);
			return false;
		}).on("mouseleave focusout",function(){//닫힘
			$('nav.pc').removeClass('on');
			$(this).stop().animate({height:orgH}, speed);
			return false;
		});
		/* //대현 170529 -> 판교노인종합복지관용으로 수정 */
		
	});//end pc
	/* ********************* 모바일 ******************** */
	
	$('nav.mobile .gnb img').css({display:'none'}); // 모바일에서 메뉴 아이콘 없애기 - 판교노인종합복지관용 추가
	
	
	$("nav.mobile .gnb>ul>li>a").each(function(){
		$("nav.mobile .gnb>ul>li>a").attr("href", "#void");
	});
	
	
	$(function mobileFn(){
		// pc용 dom을 복제해서 사용함.
		$("nav.mobile").removeAttr("style");
		$("nav.mobile .gnb").removeAttr("style");

		var winH;
		var winW;
		var gnbState=false;//gnb 열림상태
		var gnbPos;//gnb 열림,닫힘 위치
		var closePos;//gnb 닫힐 때 이동위치
		var $dep1 = $("nav.mobile .gnb>ul>li");


		$(window).on("resize",function(){
			winH = $(window).height();
			winW = $(window).width();
			closePos = $("nav.mobile").width()+20;//닫힘위치
			$("nav.mobile").css({left:-closePos});
			$("nav.mobile .gnb").css({height:winH - 50});

			// 열린상태이면...(가로,세로 모드로 돌렸을 때 대응)
			if(gnbState==true){
				$("nav.mobile").css({left:-closePos});
				gnbPos = closePos;
				gnbActionFn(gnbPos,0);
			}else{
				$("nav.mobile").stop().css({
					left:-closePos,
					"transition-duration":0+"s",
					"-ms-transition-duration":0+"s",
					"-webkit-transition-duration":0+"s",
					"-moz-transition-duration":0+"s"
				});
			}
		}).trigger("resize");

		function gnbActionFn(gnbPos,speed){
			$("nav.mobile").stop()
			.css({
				"transform":"translateX("+gnbPos+"px)",
				"-ms-transform":"translateX("+gnbPos+"px)",
				"-webkit-transform":"translateX("+gnbPos+"px)",
				"-moz-transform":"translateX("+gnbPos+"px)",
				"transition-duration":speed/1000+"s",
				"-ms-transition-duration":speed/1000+"s",
				"-webkit-transition-duration":speed/1000+"s",
				"-moz-transition-duration":speed/1000+"s"
			});
			return false;
		};

		// gnb 열기
		function openFn(){
			if(gnbState==false){
				gnbState = null;//버튼을 연타할 경우를 대비...
				$("html,body").css({position:"fixed"});
				$dep1.removeClass("on").children("ul").css({display:"none"});
				$dep1.eq(onmenu).addClass("on").children("ul").css({display:"block"});

				gnbPos=closePos;
				$("nav.mobile").stop().css({visibility:"visible"});
				gnbActionFn(gnbPos,speed);
				$(".gnbCover").delay(speed).fadeIn(speed,function(){
					gnbState = true;
					return false;
				});
			};
			return false;
		};//end openFn

		// gnb 닫기
		function closeFn(){
			if(gnbState==true){
				gnbState = null;//버튼을 연타할 경우를 대비...
				$("html,body").css({position:"static"});

				gnbPos = 0;
				gnbActionFn(gnbPos,speed);
				$(".gnbCover").delay(speed).fadeOut(speed,function(){
					$dep1.children("a").css({backgroundColor:"",color:""});
					gnbState = false;
					return false;
				});
			};
		};// end closeFn

		$(".gnbView").on("click touchstart focusin", function(){openFn();return false;});
		$(".gnbCover").on("click touchstart", function(){closeFn(); return false;});
		$(".gnbClose").on("click touchstart", function(){closeFn();return false;});

		// gnb 버튼제어
		$dep1.each(function(index){
			if($dep1.eq(index).hasClass("on")){
				onmenu = $(this).index();
				return false;
			};
		});

		$dep1.children("a").on("click",function(){
			if($(this).siblings().length>0){
				if(!$(this).parent().hasClass("on")){
					$dep1.removeClass("on").children("ul").slideUp(300);
					$(this).parent().addClass("on");
					$(this).next("ul").stop().slideDown(300);
				};
			}else{
				self.location.href = $(this).attr("href");
			};
		});
		
	

	});//end mobile

});//end document.ready
// 헤더메뉴 버튼 이미지on,off
$(document).ready(function(){
	$("nav.pc .gnb ul li ul li").mouseenter(function() {
		$(this).find('img').attr('src',$(this).find('img').attr('src').replace('_off.png','_on.png'));
	})
	$("nav.pc .gnb ul li ul li").mouseleave(function(){
		$(this).find('img').attr('src',$(this).find('img').attr('src').replace('_on.png','_off.png'));
	});
});