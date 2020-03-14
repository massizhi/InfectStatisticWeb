<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入 ECharts 文件 -->
<script src="echarts.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>province</title>
</head>
<body>
	<!--选择日期 -->
	<div class="btn-group">
		<button class="btn btn-default">请选择日期</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-02-02&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-02-02</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-02-01&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-02-01</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-31&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-31</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-30&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-30</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-29&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-29</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-28&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-28</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-27&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-27</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-26&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-26</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-25&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-25</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-24&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-24</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-23&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-23</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-22&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-22</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-21&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-21</a></li>
			<li><a href="/InfectStatisticWeb/updateProvinceInfo?flagp=2020-01-20&selectedp=<%=request.getAttribute("provinceInfo") %>">2020-01-20</a></li>
		</ul>
	</div>
	<%--显示疫情数据信息 --%>
	<%
		//out.println(request.getAttribute("haha"));
		//未选择时间时，输出信息如下。
		if (request.getAttribute("infop1")==null) {
		%>
			<table>
				<tr>
				<td><%="现有确诊" %></td><td><%="累计确诊" %></td><td><%="累计治愈" %></td><td><%="累计死亡" %></td>
				</tr>
				<tr>
				<td><%="---" %></td><td><%="---" %></td><td><%="---" %></td><td><%="---" %></td>
				</tr>
				<tr>
				<td><%="昨日---" %></td><td><%="昨日---" %></td><td><%="昨日+" %></td><td><%="昨日---" %></td>
				</tr>		
			</table>
		<%}
		else {
		%>	
			<table>
				<tr>
				<td><%="现有确诊" %></td><td><%="累计确诊" %></td><td><%="累计治愈" %></td><td><%="累计死亡" %></td>
				</tr>
				<tr>
				<td><%=request.getAttribute("infop1") %></td><td><%=request.getAttribute("infop2") %></td>
				<td><%=request.getAttribute("infop3") %></td><td><%=request.getAttribute("infop4") %></td>
				</tr>
				<tr>
				<td><%="昨日+"+request.getAttribute("infop5") %></td><td><%="昨日+"+request.getAttribute("infop6") %></td>
				<td><%="昨日+"+request.getAttribute("infop7") %></td><td><%="昨日+"+request.getAttribute("infop8") %></td>
				</tr>
			</table>			
		<%} 	
	%>
	
	<%--显示疫情图像信息 --%>
	<div class="tabbable" id="tabs-102457">
		<ul class="nav nav-tabs">
			<li class="active">
				 <a href="#panel-55437" data-toggle="tab">新增确诊趋势</a>
			</li>
			<li>
				 <a href="#panel-278576" data-toggle="tab">累计确诊趋势</a>
			</li>
			<li>
				 <a href="#panel-123456" data-toggle="tab">累计治愈/死亡</a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="panel-55437">
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
			       	        data: ['1.19', '1.20', '1.21', '1.22', '1.23', '1.24', '1.25', '1.26', '1.27', '1.28'
			       	        	, '1.29', '1.30', '1.31', '2.1', '2.2']
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
			       	            data: [300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600],       	            
			       	        }
			       	    ]
			       	};
			        myChart.setOption(option);
				</script>
			</div>
			<div class="tab-pane" id="panel-278576">
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
			       	     data: ['1.19', '1.20', '1.21', '1.22', '1.23', '1.24', '1.25', '1.26', '1.27', '1.28'
			       	        	, '1.29', '1.30', '1.31', '2.1', '2.2']
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
			       	         data: [300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600],      	            
			       	        }
			       	    ]
			       	};
			        myChart.setOption(option);
				</script>
			</div>
			<div class="tab-pane" id="panel-123456">
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
			       	     data: ['1.19', '1.20', '1.21', '1.22', '1.23', '1.24', '1.25', '1.26', '1.27', '1.28'
			       	        	, '1.29', '1.30', '1.31', '2.1', '2.2']
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
			       	            data: [100, 527, 245, 201, 10, 2, 145, 432, 483, 475, 453, 123, 453, 123, 45],       	            
			       	        },
			       	     	{
			    	            name: '死亡',
			    	            type: 'line',
			    	            smooth: true,
			    	            data: [300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600],      	            
			    	        }
			       	    ]
			       	};
			        myChart.setOption(option);
				</script>
			</div>
		</div>
	</div>
</body>
</html>