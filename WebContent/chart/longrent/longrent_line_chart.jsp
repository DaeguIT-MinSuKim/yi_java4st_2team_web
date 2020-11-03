<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ include file="/admin/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	
	function drawChart() {
  	var data = google.visualization.arrayToDataTable(${jsonArray});

  	var options = {
            backgroundColor:'#FFFFFF', //배경색
            title: '장기렌트 월별 문의 건수', // 타이틀
            pointSize:14,
            titleTextStyle: { 
                color: 'black' // 타이틀 색
            },
            hAxis:{  // 가로
            	title : '월 단위',
                textStyle:{
                    fontSize:14,
                    color:'black'
                },
                baselineColor:'black' // 수직 왼쪽 선
            },
            vAxis:{ // 세로 
            	gridlines:{
            		count:10
            	},
            	
                textStyle:{
                    fontSize:14,
                    color:'black'
                },
                gridlines: { // 중간의 선
                    color: '#8898A1'
                },
                baselineColor:'8898A1' // 하단 선
                
            },
            legend:{ // 항목
                textStyle:{
                    fontSize:14,
                    color:'black'
                }
            },
            series: { // 선색
                0: {
                    color: '#6085AC'
                },
                1: {
                    color: '#6085AC'
                }
            }
        };
        
 
        var domElem = document.getElementById ( "chart_div" );
        
        var chart = new google.visualization.LineChart(domElem);
        chart.draw(data, options);
        
	};      

	$(function(){
		$("#admin_gnb > ul > li:eq(7)").addClass("on");
	})
</script>
</head>
<body>
	<div id="adimn_content">
		<div class="admin_page">
			<button type="button" id="line_chart" onclick="location.href='longRentChart.do'">월별 막대차트 보기</button>
			<button type="button" id="line_chart" onclick="location.href='longRentHourChart.do'">시간별 막대차트 보기</button>
			<div id="chart_div" style="width: 900px; height: 500px;"></div>
		</div>
	</div>
</body>
</html>