<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/admin/include/header.jsp"%>

	<!-- // header -->
	<head>
	<script type="text/javascript">
		function printClock() {
		    
		    var clock = document.getElementById("clock");            // 출력할 장소 선택
		    var currentDate = new Date();                                     // 현재시간
		    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
		    var amPm = 'AM'; // 초기값 AM
		    var currentHours = addZeros(currentDate.getHours(),2); 
		    var currentMinute = addZeros(currentDate.getMinutes() ,2);
		    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
		    
		    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		    	amPm = 'PM';
		    	currentHours = addZeros(currentHours - 12,2);
		    }
		
		    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
		       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
		    }
		    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
		    
		    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
		}
		
		function addZeros(num, digit) { // 자릿수 맞춰주기
			  var zero = '';
			  num = num.toString();
			  if (num.length < digit) {
			    for (i = 0; i < digit - num.length; i++) {
			      zero += '0';
			    }
			  }
			  return zero + num;
		}
	</script>
	</head>
	
	<body onload="printClock()">
		<div id="adimn_content">
			<h2>관리자 페이지</h2>
			<div class="admin_page" style="text-align: center;">
				<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/_MZxoeKCDeo?rel=0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
				<h1>안녕하세요 관리자님!!</h1><div style="margin:auto; /* border:1px solid #dedede; */ width:600px; height:250px; line-height:250px; color:#666; font-size:100px; text-align:center;" id="clock">현재시간</div>

			</div>
			
		</div>
	</body>

<%@ include file="/admin/include/footer.jsp"%>