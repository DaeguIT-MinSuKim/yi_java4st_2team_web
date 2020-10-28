<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
            backgroundColor:'#808F97', //배경색
            title: '장기렌트 월별 건수', // 타이틀
            pointSize:14,
            titleTextStyle: { 
                color: 'white' // 타이틀 색
            },
            hAxis:{  // 가로
                textStyle:{
                    fontSize:14,
                    color:'white'
                },
                baselineColor:'white' // 수직 왼쪽 선
            },
            vAxis:{ // 세로 
                textStyle:{
                    fontSize:14,
                    color:'white'
                },
                gridlines: { // 중간의 선
                    color: '#8898A1'
                },
                baselineColor:'8898A1' // 하단 선
                
            },
            legend:{ // 항목
                textStyle:{
                    fontSize:14,
                    color:'white'
                }
            },
            series: { // 선색
                0: {
                    color: '#F0A57C'
                },
                1: {
                    color: '#91FFC3'
                }
            }
        };
        
 
        var domElem = document.getElementById ( "chart_div" );
        
        var chart = new google.visualization.LineChart(domElem);
        chart.draw(data, options);
        
	};        
</script>
</head>
<body>
    <div id="chart_div"></div>
</body>
</html>