/* ************************ COMMON **************************** */
//ie8 콘솔로그 오류 제거
var console = window.console || {log:function(){}};

// 가속도
var easingType1 = "easeInOutExpo";
var easingType2 = "easeInOutCubic";

// 최상단 올리기
$(document).ready(function () {
	$(window).scroll(function(){
		var scTop = $(window).scrollTop();
		if (scTop > $("header").outerHeight()) {
			$("#gotop").fadeIn(300);
		} else {
			$("#gotop").fadeOut(300);
		}
	});
	$("#gotop").click(function(){
		$("html, body").stop().animate({scrollTop:0}, 500);
		return false;
	});
});

// 접속한 기기가 PC인지 Mobile인지 체크
var deviceCk = "win16|win32|win64|mac|macintel";
var device;
if(navigator.platform){
	if( deviceCk.indexOf(navigator.platform.toLowerCase())<0 ){
		device = "mobile";
	}else{
		device = "pc";
		$("[href*='tel:']").contents().unwrap(); //PC면 tel링크 안 먹게 하기.
		$("area[href*='tel:']").remove();
	}
}

// 높이를 화면 100%로 만들기
$(document).ready(function(){
	$(window).resize(function(){
		if(device == "pc"){
			$(".screenH").css({minHeight:$(window).height()});
		}else{
			$(".screenH").css({minHeight:screen.height});
		}
	});$(window).resize();
});

// 가로크기 기준으로 정사각형 만들기
$(document).ready(function(){
	if($("*").hasClass("square")){
		var maxW;
		$(window).resize(function(){
			$(".square").children().css({height:""});
			$(".square ").each(function(idx){
				maxW = $(".square:eq("+idx+")").children().outerWidth();
				$(".square:eq("+idx+")").children().css({height:maxW});
			});
		});
		return false;
	}
});

// 자식들 높이 같게 만들기
$(window).load(function(){
	if($("*").hasClass("sameH")){
		var maxH;
		$(window).resize(function(){
			 $(".sameH").children().css({minHeight:""});
			 $(".sameH").each(function(idx){
				var itemH = $(".sameH:eq("+idx+")").children().map(function(){
					return $(this).height();
				}).get(),
				maxH = Math.max.apply(null, itemH);
				$(".sameH:eq("+idx+")").children().css({minHeight:maxH});				
				$(".sameH:eq("+idx+")").children().children().css({height:$(".sameH:eq("+idx+")").children().height()});				
			 });
		});
		$(window).resize();
		return false;
	};
});

// 자식들 높이 같게 만들기 + 자식 첫번째 요소 높이 100%
// 태블릿 이상에서 적용
$(document).ready(function(){
	if($("*").hasClass("sameH_maxH")){
		var maxH;
		$(window).resize(function(){
			$(".sameH_maxH").children().css({minHeight:""});
			// $(".sameH_maxH").children().children().css({minHeight:""});
			if($(window).width()>767){
				$(".sameH_maxH").each(function(idx){
					var itemH = $(".sameH_maxH:eq("+idx+")").children().map(function(){
						return $(this).height() + 1;
					}).get(),
					maxH = Math.max.apply(null, itemH);
					$(".sameH_maxH:eq("+idx+")").children().css({minHeight:maxH, overflow:"hidden"});
					// $(".sameH_maxH:eq("+idx+")").children().children().css({minHeight:maxH, overflow:"hidden"});
					console.log(idx+"번째 : "+maxH);
				});
			}
		});
		return false;
	};
});

// 부모 높이와 같게 만들기
$(window).load(function(){
	if($("*").hasClass("momH")){
		var maxH;
		$(window).resize(function(){
			 $(".momH").css({minHeight:""});
			 $(".momH").each(function(idx){
				maxH = $(".momH:eq("+idx+")").parent().height();
				$(".momH:eq("+idx+")").css({minHeight:maxH});
				//console.log(idx+"번째 : "+maxH);
			 });
		});
		 $(window).resize();
		return false;
	};
});

// 갤러리 가로크기 기준으로 이미지 높이 정사각형으로 만들기
$(document).ready(function(){
	if($("*").hasClass("imgfull")){
		$(".imgfull").css({maxWidth:"",minWidth:"",maxHeight:"",minHeight:""});
		$(".imgfull .img").css({maxWidth:"",minWidth:"",maxHeight:"",minHeight:""});
		var maxW;
		$(window).resize(function(){
			maxW = $(".imgfull .img").eq(0).width();
			$(".imgfull .img").css({height:maxW,overflow:"hidden"});
		});
		return false;
	}
});


// 갤러리등 이미지를 부모의 BG로 깔아버리고 안 보이게 하기
$(document).ready(function(){
	if($("*").hasClass("insertBg")){
		$(".insertBg img").css({display:"none"});//실제 img는 안보이게 처리

		$(".insertBg .img").each(function(){//이미지를 배경으로 집어 넣기
			$(this).css({backgroundImage:"url("+$(this).find("img").attr("src")+")"});
		});
		$(".insertBg").each(function(idx){//한 페이지에 다수의 insertBg가 있을 수 있으므로 개별적으로 처리함.
			if($(this).attr("data-ratioH")){
				$(window).resize(function(){//리사이즈에 대응
					var ratio = $(".insertBg:eq("+idx+")").attr("data-ratioH");//세로비율 찾고
					var imgW = $(".insertBg:eq("+idx+") .img:first").width();
					$(".insertBg:eq("+idx+") .img").css({height:parseInt(imgW*(ratio/100))+"px"});
//					console.log("insertBg 이미지 넓이 = "+imgW);
				});$(window).resize();
			};
		});
	
		/*
		$(".insertBg .img").css({//모든 img클래스에 동일한 스타일
			display:"block",overflow:"hidden",
			backgroundRepeat:"no-repeat",backgroundPosition:"50%",backgroundSize:"cover"
		});
		*/
		//목록 이미지 업로드 하지 않았을때 적용
		$(".insertBg .img").each(function(idx){			//목록이미지 없으면
			if(0<$(".insertBg .img:eq("+idx+") img.nonImg").length) {
				$(".insertBg .img:eq("+idx+")").css({//모든 img클래스에 동일한 스타일
					display:"block",overflow:"hidden",
					backgroundRepeat:"no-repeat",backgroundPosition:"50%"
				});
			}else{
				$(".insertBg .img:eq("+idx+")").css({//모든 img클래스에 동일한 스타일
					display:"block",overflow:"hidden",
					backgroundRepeat:"no-repeat",backgroundPosition:"50%",backgroundSize:"cover"
				});
			}
		});
	};
});

// 이미지를 부모의 배경으로 깔아버리기
$(document).ready(function(){
	if($("*").hasClass("momBg")){
		$(".momBg img").css({display:"none"});//실제 img는 안보이게 처리
		$(".momBg").css({//모든 img클래스에 동일한 스타일			
			backgroundRepeat:"no-repeat",backgroundPosition:"50%",backgroundSize:"cover"		
		});
		$(".momBg").each(function(){//이미지를 배경으로 집어 넣기
			$(this).css({backgroundImage:"url("+$(this).children("img").attr("src")+")"});
		});
	};
});


// 이미지 확대 (인증서 등 활용)
// 동일한 이미지를 사용하므로 큰 이미지 하나만 사용.
$(document).ready(function(){
	$(".imgOpen").fadeOut(1);
	$(".imgOpen").css({zIndex:"999999",position:"fixed",left:"0",top:"0",width:"100%",height:"100%", overflow:"hidden",backgroundColor:"rgba(0,0,0,.7)"});
	$(".imgOpen>div").css({display:"table",width:"100%",height:"100%",padding:"30px"});
	$(".imgOpen>div>div").css({display:"table-cell",width:"100%",height:"100%",textAlign:"center",verticalAlign:"middle"});

	$(".imgPop a").click(function(){
		scrollYpos = $(window).scrollTop();
		$("html,body").css({position:"fixed",overflow:"hidden",width:"100%",top:-scrollYpos});
		var imgName = $(this).find("img").attr("src");
		$(".imgOpen").css({height:"100%"}).fadeIn(100);
		$(".imgOpen img").attr("src",imgName).css({maxHeight:"100%",cursor:"pointer"});
	});

	$(".imgOpen").click(function(){
		$(this).fadeOut(100);
		$("html,body").css({position:"",overflow:""}).scrollTop(scrollYpos);
	});
});

//첨부파일
$(document).ready(function(){
	var fileTarget = $(".filebox .upload-hidden");
	fileTarget.on("change", function(){ //값이 변경되면
		if(window.FileReader){ //modern browser
			var filename = $(this)[0].files[0].name;
		}else { //old IE
			var filename = $(this).val().split("/").pop().split("\\").pop(); //파일명만 추출
		} //추출한 파일명 삽입
		$(this).siblings(".upload-name").val(filename);
	});
});

// 엘리먼트를 비율에 맞춰서 조정하기
$(document).ready(function(){
	if($("*").hasClass("ratio")){
		$(window).resize(function(){//리사이즈에 대응
			$(".ratio").each(function(idx){//여러 개 일수 있으므로 개별적으로 처리함
				var ratio = $(".ratio").eq(idx).attr("data-ratioH");
				var objW = $(".ratio").eq(idx).width();
				$(".ratio").eq(idx).css({height:parseInt(objW*(ratio/100))+"px"});
			});
		});$(window).resize();
	};
});
