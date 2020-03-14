<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page  import="pojo.GetInfo" %>
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
			       	            data: [<%GetInfo temp1=new GetInfo();
			       	            String pro=(String)request.getAttribute("provinceInfo");
			       	         	String[] args1={"2020-01-19","2",pro,"4","ip"};%>
			       				<%=temp1.getInfo(args1) %>,
			       				<%GetInfo temp2=new GetInfo();
			       				String[] args2={"2020-01-20","2",pro,"4","ip"};%>
			       				<%=temp2.getInfo(args2) %>,
			       				<%GetInfo temp3=new GetInfo();
			       				String[] args3={"2020-01-21","2",pro,"4","ip"};%>
			       				<%=temp3.getInfo(args3) %>,
			       				<%GetInfo temp4=new GetInfo();
			       				String[] args4={"2020-01-22","2",pro,"4","ip"};%>
			       				<%=temp4.getInfo(args4) %>,
			       				<%GetInfo temp5=new GetInfo();
			       				String[] args5={"2020-01-23","2",pro,"4","ip"};%>
			       				<%=temp5.getInfo(args5) %>,
			       				<%GetInfo temp6=new GetInfo();
			       				String[] args6={"2020-01-24","2",pro,"4","ip"};%>
			       				<%=temp6.getInfo(args6) %>,
			       				<%GetInfo temp7=new GetInfo();
			       				String[] args7={"2020-01-25","2",pro,"4","ip"};%>
			       				<%=temp7.getInfo(args7) %>,
			       				<%GetInfo temp8=new GetInfo();
			       				String[] args8={"2020-01-26","2",pro,"4","ip"};%>
			       				<%=temp8.getInfo(args8) %>,
			       				<%GetInfo temp9=new GetInfo();
			       				String[] args9={"2020-01-27","2",pro,"4","ip"};%>
			       				<%=temp9.getInfo(args9) %>,
			       				<%GetInfo temp10=new GetInfo();
			       				String[] args10={"2020-01-28","2",pro,"4","ip"};%>
			       				<%=temp10.getInfo(args10) %>,
			       				<%GetInfo temp11=new GetInfo();
			       				String[] args11={"2020-01-29","2",pro,"4","ip"};%>
			       				<%=temp11.getInfo(args11) %>,
			       				<%GetInfo temp12=new GetInfo();
			       				String[] args12={"2020-01-30","2",pro,"4","ip"};%>
			       				<%=temp12.getInfo(args12) %>,
			       				<%GetInfo temp13=new GetInfo();
			       				String[] args13={"2020-01-31","2",pro,"4","ip"};%>
			       				<%=temp13.getInfo(args13) %>,
			       				<%GetInfo temp14=new GetInfo();
			       				String[] args14={"2020-02-01","2",pro,"4","ip"};%>
			       				<%=temp14.getInfo(args14) %>,
			       				<%GetInfo temp15=new GetInfo();
			       				String[] args15={"2020-02-02","2",pro,"4","ip"};%>
			       				<%=temp15.getInfo(args15) %>
								]
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
			       	         data: [<%GetInfo _temp1=new GetInfo();
			       	            String _pro=(String)request.getAttribute("provinceInfo");
			       	         	String[] _args1={"2020-01-19","2",_pro,"3","ip"};%>
			       				<%=_temp1.getInfo(_args1) %>,
			       				<%GetInfo _temp2=new GetInfo();
			       				String[] _args2={"2020-01-20","2",_pro,"3","ip"};%>
			       				<%=_temp2.getInfo(_args2) %>,
			       				<%GetInfo _temp3=new GetInfo();
			       				String[] _args3={"2020-01-21","2",_pro,"3","ip"};%>
			       				<%=_temp3.getInfo(_args3) %>,
			       				<%GetInfo _temp4=new GetInfo();
			       				String[] _args4={"2020-01-22","2",_pro,"3","ip"};%>
			       				<%=_temp4.getInfo(_args4) %>,
			       				<%GetInfo _temp5=new GetInfo();
			       				String[] _args5={"2020-01-23","2",_pro,"3","ip"};%>
			       				<%=_temp5.getInfo(_args5) %>,
			       				<%GetInfo _temp6=new GetInfo();
			       				String[] _args6={"2020-01-24","2",_pro,"3","ip"};%>
			       				<%=_temp6.getInfo(_args6) %>,
			       				<%GetInfo _temp7=new GetInfo();
			       				String[] _args7={"2020-01-25","2",_pro,"3","ip"};%>
			       				<%=_temp7.getInfo(_args7) %>,
			       				<%GetInfo _temp8=new GetInfo();
			       				String[] _args8={"2020-01-26","2",_pro,"3","ip"};%>
			       				<%=_temp8.getInfo(_args8) %>,
			       				<%GetInfo _temp9=new GetInfo();
			       				String[] _args9={"2020-01-27","2",_pro,"3","ip"};%>
			       				<%=_temp9.getInfo(_args9) %>,
			       				<%GetInfo _temp10=new GetInfo();
			       				String[] _args10={"2020-01-28","2",_pro,"3","ip"};%>
			       				<%=_temp10.getInfo(_args10) %>,
			       				<%GetInfo _temp11=new GetInfo();
			       				String[] _args11={"2020-01-29","2",_pro,"3","ip"};%>
			       				<%=_temp11.getInfo(_args11) %>,
			       				<%GetInfo _temp12=new GetInfo();
			       				String[] _args12={"2020-01-30","2",_pro,"3","ip"};%>
			       				<%=_temp12.getInfo(_args12) %>,
			       				<%GetInfo _temp13=new GetInfo();
			       				String[] _args13={"2020-01-31","2",_pro,"3","ip"};%>
			       				<%=_temp13.getInfo(_args13) %>,
			       				<%GetInfo _temp14=new GetInfo();
			       				String[] _args14={"2020-02-01","2",_pro,"3","ip"};%>
			       				<%=_temp14.getInfo(_args14) %>,
			       				<%GetInfo _temp15=new GetInfo();
			       				String[] _args15={"2020-02-02","2",_pro,"3","ip"};%>
			       				<%=_temp15.getInfo(_args15) %>
								]          
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
			       	         data: [<%GetInfo temp1q=new GetInfo();
			       	            String proq=(String)request.getAttribute("provinceInfo");
			       	         	String[] args1q={"2020-01-19","2",proq,"3","cure"};%>
			       				<%=temp1q.getInfo(args1q) %>,
			       				<%GetInfo temp2q=new GetInfo();
			       				String[] args2q={"2020-01-20","2",proq,"3","cure"};%>
			       				<%=temp2q.getInfo(args2q) %>,
			       				<%GetInfo temp3q=new GetInfo();
			       				String[] args3q={"2020-01-21","2",proq,"3","cure"};%>
			       				<%=temp3q.getInfo(args3q) %>,
			       				<%GetInfo temp4q=new GetInfo();
			       				String[] args4q={"2020-01-22","2",proq,"3","cure"};%>
			       				<%=temp4q.getInfo(args4q) %>,
			       				<%GetInfo temp5q=new GetInfo();
			       				String[] args5q={"2020-01-23","2",proq,"3","cure"};%>
			       				<%=temp5q.getInfo(args5q) %>,
			       				<%GetInfo temp6q=new GetInfo();
			       				String[] args6q={"2020-01-24","2",proq,"3","cure"};%>
			       				<%=temp6q.getInfo(args6q) %>,
			       				<%GetInfo temp7q=new GetInfo();
			       				String[] args7q={"2020-01-25","2",proq,"3","cure"};%>
			       				<%=temp7q.getInfo(args7q) %>,
			       				<%GetInfo temp8q=new GetInfo();
			       				String[] args8q={"2020-01-26","2",proq,"3","cure"};%>
			       				<%=temp8q.getInfo(args8q) %>,
			       				<%GetInfo temp9q=new GetInfo();
			       				String[] args9q={"2020-01-27","2",proq,"3","cure"};%>
			       				<%=temp9q.getInfo(args9q) %>,
			       				<%GetInfo temp10q=new GetInfo();
			       				String[] args10q={"2020-01-28","2",proq,"3","cure"};%>
			       				<%=temp10q.getInfo(args10q) %>,
			       				<%GetInfo temp11q=new GetInfo();
			       				String[] args11q={"2020-01-29","2",proq,"3","cure"};%>
			       				<%=temp11q.getInfo(args11q) %>,
			       				<%GetInfo temp12q=new GetInfo();
			       				String[] args12q={"2020-01-30","2",proq,"3","cure"};%>
			       				<%=temp12q.getInfo(args12q) %>,
			       				<%GetInfo temp13q=new GetInfo();
			       				String[] args13q={"2020-01-31","2",proq,"3","cure"};%>
			       				<%=temp13q.getInfo(args13q) %>,
			       				<%GetInfo temp14q=new GetInfo();
			       				String[] args14q={"2020-02-01","2",proq,"3","cure"};%>
			       				<%=temp14q.getInfo(args14q) %>,
			       				<%GetInfo temp15q=new GetInfo();
			       				String[] args15q={"2020-02-02","2",proq,"3","cure"};%>
			       				<%=temp15q.getInfo(args15q) %>
								]  	            
			       	        },
			       	     	{
			    	            name: '死亡',
			    	            type: 'line',
			    	            smooth: true,
			    	            data: [<%GetInfo temp1w=new GetInfo();
			       	            String prow=(String)request.getAttribute("provinceInfo");
			       	         	String[] args1w={"2020-01-19","2",prow,"4","dead"};%>
			       				<%=temp1w.getInfo(args1w) %>,
			       				<%GetInfo temp2w=new GetInfo();
			       				String[] args2w={"2020-01-20","2",prow,"4","dead"};%>
			       				<%=temp2w.getInfo(args2w) %>,
			       				<%GetInfo temp3w=new GetInfo();
			       				String[] args3w={"2020-01-21","2",prow,"4","dead"};%>
			       				<%=temp3w.getInfo(args3w) %>,
			       				<%GetInfo temp4w=new GetInfo();
			       				String[] args4w={"2020-01-22","2",prow,"4","dead"};%>
			       				<%=temp4w.getInfo(args4w) %>,
			       				<%GetInfo temp5w=new GetInfo();
			       				String[] args5w={"2020-01-23","2",prow,"4","dead"};%>
			       				<%=temp5w.getInfo(args5w) %>,
			       				<%GetInfo temp6w=new GetInfo();
			       				String[] args6w={"2020-01-24","2",prow,"4","dead"};%>
			       				<%=temp6w.getInfo(args6w) %>,
			       				<%GetInfo temp7w=new GetInfo();
			       				String[] args7w={"2020-01-25","2",prow,"4","dead"};%>
			       				<%=temp7w.getInfo(args7w) %>,
			       				<%GetInfo temp8w=new GetInfo();
			       				String[] args8w={"2020-01-26","2",prow,"4","dead"};%>
			       				<%=temp8w.getInfo(args8w) %>,
			       				<%GetInfo temp9w=new GetInfo();
			       				String[] args9w={"2020-01-27","2",prow,"4","dead"};%>
			       				<%=temp9w.getInfo(args9w) %>,
			       				<%GetInfo temp10w=new GetInfo();
			       				String[] args10w={"2020-01-28","2",prow,"4","dead"};%>
			       				<%=temp10w.getInfo(args10w) %>,
			       				<%GetInfo temp11w=new GetInfo();
			       				String[] args11w={"2020-01-29","2",prow,"4","dead"};%>
			       				<%=temp11w.getInfo(args11w) %>,
			       				<%GetInfo temp12w=new GetInfo();
			       				String[] args12w={"2020-01-30","2",prow,"4","dead"};%>
			       				<%=temp12w.getInfo(args12w) %>,
			       				<%GetInfo temp13w=new GetInfo();
			       				String[] args13w={"2020-01-31","2",prow,"4","dead"};%>
			       				<%=temp13w.getInfo(args13w) %>,
			       				<%GetInfo temp14w=new GetInfo();
			       				String[] args14w={"2020-02-01","2",prow,"4","dead"};%>
			       				<%=temp14w.getInfo(args14w) %>,
			       				<%GetInfo temp15w=new GetInfo();
			       				String[] args15w={"2020-02-02","2",prow,"4","dead"};%>
			       				<%=temp15w.getInfo(args15w) %>
								]          
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