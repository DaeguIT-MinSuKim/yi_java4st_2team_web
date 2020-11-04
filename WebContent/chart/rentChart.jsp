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
		var memberByAgeOptions = {
				title : '연령별 대여비율',
				height : '100%',
				width : '100%',
				pieHole: 0.4,
				hAxis : {
					title : '연령별',
					titleTextStyle : {
						color : 'black'
					}
				}	
			};
		
		var carByYearlyOptions = {
				title : '연도별 대여횟수',
				height : '100%',
				width : '100%',
				hAxis : {
					title : '연도별',
					titleTextStyle : {
						color : 'black'
					}
				}	
			};
		
		// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
		var memberByAgeTable = google.visualization.arrayToDataTable(${memberByAge});
		
		var carByYearlyTable = google.visualization.arrayToDataTable(${carByYearly});
		
		// 차트를 그릴 영역인 div 객체를 가져옴
		// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환
		// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드
		var objDiv = document.getElementById('chart_memberByAge');
		var chart = new google.visualization.PieChart(objDiv);
		chart.draw(memberByAgeTable, memberByAgeOptions);

		var objDiv = document.getElementById('chart_carByYearly');
		var chart = new google.visualization.ColumnChart(objDiv);
		chart.draw(carByYearlyTable, carByYearlyOptions);
		
	};
});	
</script>
  <script>

  var chartDrowFun = {

    chartDrow : function(){
        var chartData = '';

        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
        var chartDateformat 	= 'yyyy년MM월';
        //라인차트의 라인 수
        var chartLineCount    = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount	= 5;

        function drawDashboard() {

          var data = new google.visualization.DataTable();
          //그래프에 표시할 컬럼 추가
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '남성');
          data.addColumn('number'   , '여성');
          data.addColumn('number'   , '전체');

          //그래프에 표시할 데이터
          var dataRow = [];

          for(var i=1; i < ${carByMonthly}.length; i++){ //랜덤 데이터 생성
            var man     = ${carByMonthly}[i][1];
            var woman   = ${carByMonthly}[i][2];
            var total   = man + woman;
            console.log(man, woman, total);
            
            var year = ${carByMonthly}[i][0].substring(0,4);
    		var month = Number(${carByMonthly}[i][0].substring(5,8)) -1;
    		console.log(year, month);
    		
            dataRow = [new Date(year, month), man, woman , total];
            data.addRow(dataRow);
          }


            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              title : '월별 대여횟수',
                              height		  : 400,
                              width			  : '100%',
                              legend		  : { position: "top", textStyle: {fontSize: 13}},
                              pointSize		: 5,
                              tooltip		  : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis			  : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']}}
                                                                },textStyle: {fontSize:12}},
                vAxis			  : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation		: {startup: true,duration: 1000,easing: 'in' },
                annotations	: {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                              }
                            }
              }
            });

            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']}}
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
            });

            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);

            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data);

        }
          google.charts.setOnLoadCallback(drawDashboard);

      }
    }

$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
});
  </script>
</head>
<body>
	<div id="adimn_content">
		<div class="admin_page">

			<%@ include file="/admin/include/tab_common.jsp"%>
			<script>
				$(function() {
					$(".chart_tab>a").eq(1).addClass("active");
				});
			</script>

			<table>
				<tr>
					<td><div id="chart_memberByAge"
							style="width: 600px; height: 300px;"></div></td>
					<td><div id="chart_carByYearly"
							style="width: 1000px; height: 300px;"></div></td>
				</tr>
			</table>
			<div id="Line_Controls_Chart">
				<!-- 라인 차트 생성할 영역 -->
				<div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
				<!-- 컨트롤바를 생성할 영역 -->
				<div id="controlsArea" style="padding: 0px 20px 0px 0px;"></div>
			</div>
		</div>
	</div>
</body>
</html>