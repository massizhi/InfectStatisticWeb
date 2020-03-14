<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入 ECharts 文件 -->
<script src="echarts.min.js"></script>
<title>province</title>
</head>
<body>
	<!--选择日期 -->
	<div class="btn-group">
		<button class="btn btn-default">请选择日期</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-02-02">2020-02-02</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-02-01">2020-02-01</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-31">2020-01-31</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-30">2020-01-30</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-29">2020-01-29</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-28">2020-01-28</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-27">2020-01-27</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-26">2020-01-26</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-25">2020-01-25</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-24">2020-01-24</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-23">2020-01-23</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-22">2020-01-22</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-21">2020-01-21</a></li>
			<li><a href="/InfectStatisticWeb/updateInfo?flag=2020-01-20">2020-01-20</a></li>
		</ul>
	</div>
	
	<%--显示疫情数据信息 --%>
	<table>
		<tr>
		<td><%="现有确诊" %></td><td><%="累计确诊" %></td><td><%="累计治愈" %></td><td><%="累计死亡" %></td>
		</tr>
		<tr>
		<td><%="" %></td><td><%="" %></td><td><%="" %></td><td><%="" %></td>
		</tr>
		<tr>
		<td><%="昨日" %></td><td><%="昨日" %></td><td><%="昨日" %></td><td><%="昨日" %></td>
		</tr>		
	</table>
	
	<%--显示疫情图像信息 --%>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="line1" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
    	var province = window.localStorage.getItem("selectedProvince");
    	//document.write(window.localStorage.getItem("selectedProvince"));
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('line1'));

        // 指定图表的配置项和数据
        var option = {
       	    title: {
       	        text: province+" 新增确诊趋势",
       	        subtext: '单位：例'
       	    },
       	    tooltip: {
       	        trigger: 'axis'
       	    },
       	    xAxis: {
       	        type: 'category',
       	        boundaryGap: false,
       	        data: ['00:00', '01:15', '02:30', '03:45', '05:00', '06:15', '07:30', '08:45', '10:00', '11:15', '12:30', '13:45', '15:00', '16:15', '17:30', '18:45', '20:00', '21:15', '22:30', '23:45']
       	    },
       	    yAxis: {
       	        type: 'value',
       	        axisLabel: {
       	            formatter: '{value}'
       	        },
       	        axisPointer: {
       	            snap: true
       	        }
       	    },
       	    series: [
       	        {
       	            name: '新增确诊',
       	            type: 'line',
       	            smooth: true,
       	            data: [300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600, 750, 800, 700, 600, 400],       	            
       	        }
       	    ]
       	};
        myChart.setOption(option);
	</script>
	
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="line2" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
    	var province = window.localStorage.getItem("selectedProvince");
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('line2'));

        // 指定图表的配置项和数据
        var option = {
       	    title: {
       	    	text: province+' 累计确诊趋势',
       	        subtext: '单位：例'
       	    },
       	    tooltip: {
       	        trigger: 'axis'
       	    },
       	    xAxis: {
       	        type: 'category',
       	        boundaryGap: false,
       	        data: ['00:00', '01:15', '02:30', '03:45', '05:00', '06:15', '07:30', '08:45', '10:00', '11:15', '12:30', '13:45', '15:00', '16:15', '17:30', '18:45', '20:00', '21:15', '22:30', '23:45']
       	    },
       	    yAxis: {
       	        type: 'value',
       	        axisLabel: {
       	            formatter: '{value}'
       	        },
       	        axisPointer: {
       	            snap: true
       	        }
       	    },
       	    series: [
       	        {
       	            name: '累计确诊',
       	            type: 'line',
       	            smooth: true,
       	            data: [300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600, 750, 800, 700, 600, 400],       	            
       	        }
       	    ]
       	};
        myChart.setOption(option);
	</script>
	
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="line3" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
    	var province = window.localStorage.getItem("selectedProvince");
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('line3'));

        // 指定图表的配置项和数据
        var option = {
       	    title: {
       	    	text: province+' 累计治愈/死亡趋势',
       	        subtext: '单位：例'
       	    },
       	    tooltip: {
       	        trigger: 'axis'
       	    },
	       	legend: {
	            data: ['治愈', '死亡'],
       	 		x:'right'
	        },
       	    xAxis: {
       	        type: 'category',
       	        boundaryGap: false,
       	        data: ['00:00', '01:15', '02:30', '03:45', '05:00', '06:15', '07:30', '08:45', '10:00', '11:15', '12:30', '13:45', '15:00', '16:15', '17:30', '18:45', '20:00', '21:15', '22:30', '23:45']
       	    },
       	    yAxis: {
       	        type: 'value',
       	        axisLabel: {
       	            formatter: '{value}'
       	        },
       	        axisPointer: {
       	            snap: true
       	        }
       	    },
       	    series: [
       	        {
       	            name: '治愈',
       	            type: 'line',
       	            smooth: true,
       	            data: [100, 527, 245, 201, 10, 2, 145, 432, 483, 452, 453, 123, 453, 123, 45, 12, 45, 12, 3, 3],       	            
       	        },
       	     	{
    	            name: '死亡',
    	            type: 'line',
    	            smooth: true,
    	            data: [300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600, 750, 800, 700, 600, 400],       	            
    	        }
       	    ]
       	};
        myChart.setOption(option);
	</script>
</body>
</html>