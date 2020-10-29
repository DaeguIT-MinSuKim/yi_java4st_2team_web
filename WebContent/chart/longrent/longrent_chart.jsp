<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ColumnChart1</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
$(function(){

	//구글 시각화 API를 로딩하는 메소드
	google.charts.load('current', {
		packages : [ 'corechart' ]
	});
	// 구글 시각화 API가 로딩이 완료되면,
	// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드
	// 화면이 실행될때 함께 실행된다.
	 google.charts.setOnLoadCallback(drawChart);

	/* 30초마다 재갱신
	 google.charts.setOnLoadCallback(function(){
	 setInterval(columnChart1(),30000);
	 }); */
	 
	 
	 	
	// 묶은 세로 막대형 차트 1
	function drawChart() {
		// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
		var dataTable = google.visualization.arrayToDataTable(${jsonArray});
		
		// 옵션객체 준비
		var options = {
			title : '장기렌트 월별 문의 건수 ',
			height : 500,
			width : '100%',
			hAxis : {
				title : '월 단위',
				titleTextStyle : {
					color : 'black'
				}
			},
			series:{
				0:{
					 color: '#6085AC'
				}
			}	
		};
		
		// 차트를 그릴 영역인 div 객체를 가져옴
		var objDiv = document.getElementById('column_chart_div1');
		// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환
		var chart = new google.visualization.ColumnChart(objDiv);
		// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드
		chart.draw(dataTable, options);
	}; // drawColumnChart1()의 끝

	
	// 버튼 동작
	$(document).ready(function() {
		$('button').on('click', function() {
			$.ajax({
				url :'longRentChart.do',
				success : function(result) {
					columnChart1(result);
				}
			});
		});
	});
	
});	
</script>
</head>
<body>
	<div id="adimn_content">
		<div class="admin_page">
			<!-- <button type="button" id="btn">버튼</button> -->
			<button type="button" id="line_chart"
				onclick="location.href='longRentLineChart.do'">월별 라인차트 보기</button>
			<button type="button" id="line_chart" onclick="location.href='longRentHourChart.do'">시간별 막대차트 보기</button>
			<div id="column_chart_div1" style="width: 900px; height: 500px;"></div>
		</div>
	</div>
</body>
</html>