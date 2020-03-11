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
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="line1" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('line1'));

        // 指定图表的配置项和数据
        var option = {
       	    title: {
       	        text: '湖北 新增确诊趋势',
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
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('line2'));

        // 指定图表的配置项和数据
        var option = {
       	    title: {
       	        text: '湖北 累计确诊趋势',
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
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('line3'));

        // 指定图表的配置项和数据
        var option = {
       	    title: {
       	        text: '湖北 累计治愈/死亡趋势',
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