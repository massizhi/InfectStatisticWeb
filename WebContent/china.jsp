<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pojo.Info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入 ECharts 文件 -->
<script src="echarts.min.js"></script>
<script src="china.js"></script>
<title>china</title>
</head>
<body>
<%
	//out.println(request.getAttribute("haha"));
	//未选择时间时，输出信息如下。
	if (request.getAttribute("info")==null) {
	%>
	<table>
		<tr>
		<td><%="现有确诊" %></td><td><%="现有疑似" %></td><td><%="现有重症" %></td>
		</tr>
		<tr>
		<td><%="13904" %></td><td><%="1724" %></td><td><%="---" %></td>
		</tr>
		<tr>
		<td><%="昨日+2461" %></td><td><%="昨日+277" %></td><td><%="昨日---" %></td>
		</tr>
		
		<tr>
		<td><%="累计确诊" %></td><td><%="累计治愈" %></td><td><%="累计死亡" %></td>
		</tr>
		<tr>
		<td><%="14503" %></td><td><%="295" %></td><td><%="304" %></td>
		</tr>
		<tr>
		<td><%="昨日+2586" %></td><td><%="昨日+80" %></td><td><%="昨日+45" %></td>
		</tr>
	</table>
	<%}
	else {
		
	%>		
	<%} 
%>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="china1" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('china1'));

        // 指定图表的配置项和数据
        var option = {
        title : {
            text: '',
            subtext: '当前现有确诊病例数，排除治愈、死亡。',
            x:'center'
        },
        tooltip : {//提示框组件。
            trigger: 'item'
        },
        visualMap: {
            type: 'piecewise',
            pieces: [
                {min: 1500,color: '#6D000E'},
                {min: 900, max: 1500,color: '#A30014'},
                {min: 310, max: 1000,color: '#B8741A'},
                {min: 200, max: 300,color: '#F59A23'},
                {min: 1, max: 200,color: '#FACD91'},
                {max: 0,color: '#F2F2F2'}
              	//label: '';
            ]
        },
        series: [
            {
                name: '确诊病例',
                type: 'map',
                mapType: 'china',
                label: {
                    show: true,
                    color: '#000000',
                    fontSize:10
                },
                data: [
                    {name: '北京',value: 5},
                    {name: '天津',value: Math.round(Math.random()*2000)},
                    {name: '上海',value: Math.round(Math.random()*2000)},
                    {name: '重庆',value: Math.round(Math.random()*2000)},
                    {name: '河北',value: 0},
                    {name: '河南',value: Math.round(Math.random()*2000)},
                    {name: '云南',value: 123},
                    {name: '辽宁',value: 305},
                    {name: '黑龙江',value: Math.round(Math.random()*2000)},
                    {name: '湖南',value: 200},
                    {name: '安徽',value: Math.round(Math.random()*2000)},
                    {name: '山东',value: Math.round(Math.random()*2000)},
                    {name: '新疆',value: Math.round(Math.random()*2000)},
                    {name: '江苏',value: Math.round(Math.random()*2000)},
                    {name: '浙江',value: Math.round(Math.random()*2000)},
                    {name: '江西',value: Math.round(Math.random()*2000)},
                    {name: '湖北',value: Math.round(Math.random()*2000)},
                    {name: '广西',value: Math.round(Math.random()*2000)},
                    {name: '甘肃',value: Math.round(Math.random()*2000)},
                    {name: '山西',value: Math.round(Math.random()*2000)},
                    {name: '内蒙古',value: Math.round(Math.random()*2000)},
                    {name: '陕西',value: Math.round(Math.random()*2000)},
                    {name: '吉林',value: Math.round(Math.random()*2000)},
                    {name: '福建',value: Math.round(Math.random()*2000)},
                    {name: '贵州',value: Math.round(Math.random()*2000)},
                    {name: '广东',value: Math.round(Math.random()*2000)},
                    {name: '青海',value: Math.round(Math.random()*2000)},
                    {name: '西藏',value: Math.round(Math.random()*2000)},
                    {name: '四川',value: Math.round(Math.random()*2000)},
                    {name: '宁夏',value: Math.round(Math.random()*2000)},
                    {name: '海南',value: Math.round(Math.random()*2000)},
                    {name: '台湾',value: Math.round(Math.random()*2000)},
                    {name: '香港',value: Math.round(Math.random()*2000)},
                    {name: '澳门',value: Math.round(Math.random()*2000)}
                ]
            }
        ]
    };
    myChart.setOption(option);
    myChart.on('click', function (params) {
        var dataIndex = params.dataIndex;
        //console.log(params);
        //window.open('https://www.baidu.com/s?wd=' + encodeURIComponent(params.name));
        window.localStorage.setItem("selectedProvince", params.name);
        window.open('province.jsp');
    });
	</script>
	
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="china2" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('china2'));

        // 指定图表的配置项和数据
        var option = {
        title : {
            text: '',
            subtext: '累计确诊病例数，包含治愈、死亡。',
            x:'center'
        },
        tooltip : {//提示框组件。
            trigger: 'item'
        },
        visualMap: {
            type: 'piecewise',
            pieces: [
                {min: 1500,color: '#6D000E'},
                {min: 900, max: 1500,color: '#A30014'},
                {min: 310, max: 1000,color: '#B8741A'},
                {min: 200, max: 300,color: '#F59A23'},
                {min: 1, max: 200,color: '#FACD91'},
                {max: 0,color: '#F2F2F2'}
              	//label: '';
            ],
        },
        series: [
            {
                name: '确诊病例',
                type: 'map',
                mapType: 'china',
                label: {
                    show: true,
                    color: '#000000',
                    fontSize:10
                },
                data: [
                    {name: '北京',value: 5},
                    {name: '天津',value: Math.round(Math.random()*2000)},
                    {name: '上海',value: Math.round(Math.random()*2000)},
                    {name: '重庆',value: Math.round(Math.random()*2000)},
                    {name: '河北',value: 0},
                    {name: '河南',value: Math.round(Math.random()*2000)},
                    {name: '云南',value: 123},
                    {name: '辽宁',value: 305},
                    {name: '黑龙江',value: Math.round(Math.random()*2000)},
                    {name: '湖南',value: 200},
                    {name: '安徽',value: Math.round(Math.random()*2000)},
                    {name: '山东',value: Math.round(Math.random()*2000)},
                    {name: '新疆',value: Math.round(Math.random()*2000)},
                    {name: '江苏',value: Math.round(Math.random()*2000)},
                    {name: '浙江',value: Math.round(Math.random()*2000)},
                    {name: '江西',value: Math.round(Math.random()*2000)},
                    {name: '湖北',value: Math.round(Math.random()*2000)},
                    {name: '广西',value: Math.round(Math.random()*2000)},
                    {name: '甘肃',value: Math.round(Math.random()*2000)},
                    {name: '山西',value: Math.round(Math.random()*2000)},
                    {name: '内蒙古',value: Math.round(Math.random()*2000)},
                    {name: '陕西',value: Math.round(Math.random()*2000)},
                    {name: '吉林',value: Math.round(Math.random()*2000)},
                    {name: '福建',value: Math.round(Math.random()*2000)},
                    {name: '贵州',value: Math.round(Math.random()*2000)},
                    {name: '广东',value: Math.round(Math.random()*2000)},
                    {name: '青海',value: Math.round(Math.random()*2000)},
                    {name: '西藏',value: Math.round(Math.random()*2000)},
                    {name: '四川',value: Math.round(Math.random()*2000)},
                    {name: '宁夏',value: Math.round(Math.random()*2000)},
                    {name: '海南',value: Math.round(Math.random()*2000)},
                    {name: '台湾',value: Math.round(Math.random()*2000)},
                    {name: '香港',value: Math.round(Math.random()*2000)},
                    {name: '澳门',value: Math.round(Math.random()*2000)}
                ]
            }
        ]
    };
    myChart.setOption(option);
    myChart.on('mouseover', function (params) {
        var dataIndex = params.dataIndex;
        console.log(params);
    });
	</script>
	
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="line" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('line'));

        // 指定图表的配置项和数据
        var option = {
       	    title: {
       	        text: '全国新增确诊病例',
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
       	            name: '新增确诊：',
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