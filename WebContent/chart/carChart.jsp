<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert title here</title>
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
		
		// 옵션객체 준비
		var kindOptions = {
			title : '차종별 차량비율',
			height : '100%',
			width : '100%',
			pieHole: 0.4,
			hAxis : {
				title : '차종 목록',
				titleTextStyle : {
					color : 'black'
				}
			}
		};
		
		var brandOptions = {
			title : '브랜드별 차량비율',
			height : '100%',
			width : '100%',
			pieHole: 0.4,
			hAxis : {
				title : '브랜드 목록',
				titleTextStyle : {
					color : 'black'
				}
			}
		};
		
		var kindByRentOptions = {
				title : '차종별 대여비율',
				height : '100%',
				width : '100%',
				pieHole: 0.4,
				hAxis : {
					title : '차종',
					titleTextStyle : {
						color : 'black'
					}
				}	
			};
		
		var brandByRentOptions = {
				title : '브랜드별 대여비율',
				height : '100%',
				width : '100%',
				pieHole: 0.4,
				hAxis : {
					title : '브랜드',
					titleTextStyle : {
						color : 'black'
					}
				}	
			};
		
		var carByRentOptions = {
				title : '차량 대여여부',
				height : '100%',
				width : '100%',
				pieHole: 0.4,
				hAxis : {
					title : '차량',
					titleTextStyle : {
						color : 'black'
					}
				}	
			};
		
		// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
		var kindTable = google.visualization.arrayToDataTable(${carByKind});
		var brandTable = google.visualization.arrayToDataTable(${carByBrand});
		var kindByRentTable = google.visualization.arrayToDataTable(${kindByRent});
		var brandByRentTable = google.visualization.arrayToDataTable(${brandByRent});
		var carByRentTable = google.visualization.arrayToDataTable(${carByRent});
		
		// 차트를 그릴 영역인 div 객체를 가져옴
		// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환
		// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드
		var objDiv = document.getElementById('chart_kind');
		var chart = new google.visualization.PieChart(objDiv);
		chart.draw(kindTable, kindOptions);

		var objDiv = document.getElementById('chart_brand');
		var chart = new google.visualization.PieChart(objDiv);
		chart.draw(brandTable, brandOptions);
		
		var objDiv = document.getElementById('chart_kindByRent');
		var chart = new google.visualization.PieChart(objDiv);
		chart.draw(kindByRentTable, kindByRentOptions);

		var objDiv = document.getElementById('chart_brandByRent');
		var chart = new google.visualization.PieChart(objDiv);
		chart.draw(brandByRentTable, brandByRentOptions);
		
		var objDiv = document.getElementById('chart_carByRent');
		var chart = new google.visualization.PieChart(objDiv);
		chart.draw(carByRentTable, carByRentOptions);
	};
	
	$("#admin_gnb > ul > li:eq(7)").addClass("on");
});	
</script>
</head>
<body>
	<div id="adimn_content">
		<div class="admin_page">

			<%@ include file="/admin/include/tab_common.jsp"%>
			<script>
				$(function() {
					$(".chart_tab>a").eq(2).addClass("active");
				});
			</script>

			<table>
				<tr>
					<td><div id="chart_kind" style="width: 600px; height: 400px;"></div></td>
					<td><div id="chart_brand" style="width: 600px; height: 400px;"></div></td>
					<td><div id="chart_carByRent"
							style="width: 600px; height: 400px;"></div></td>
				</tr>
				<tr>
					<td><div id="chart_kindByRent"
							style="width: 600px; height: 400px;"></div></td>
					<td><div id="chart_brandByRent"
							style="width: 600px; height: 400px;"></div></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>