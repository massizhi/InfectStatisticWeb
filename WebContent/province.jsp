<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page  import="pojo.GetInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入 ECharts 文件 -->
<script src="echarts.min.js"></script>
<script src="webjs.js"></script>
<link rel="stylesheet" href="webcss.css"> 
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>province</title>
</head>
<body>
<div class="headimg" align="center" style="background-image:url(pictures/66.PNG)">
    <br /><br /><br />
        <h1><%=request.getAttribute("provinceInfo") %>省疫情数据分析</h1>
    </div>
    <div id="nav">
        <ul>
            <li><a href="#data">省份疫情</a></li>
            <li><a href="#usemask">防护信息</a></li>
            <li><a href="#post">疫情动态</a></li>
            <li><a href="#incorrect">各类榜单</a></li>
            <li><a href="#function">其他功能</a></li>
        </ul>
    </div>  
    <div id="box">
		<div id="img1" class="slide"></div>
		<div id="img2" class="slide"></div>
		<div id="img3" class="slide"></div>
    </div>
    
	<!--选择日期 -->
	<div class="btn-group" style="margin-left:550px;" id="data" align="center">
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
	<sub>默认为2020-02-02</sub>
	
	<div align="center" style="font-size:30px;">
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
	</div>
	
	<div class="country" style="background-color:transparent">
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
	</div>
	<div id="slogan">
        <h3>居家隔离，减少外出，就是最好的防护。</h3>
        <h3 class="special">每个有责任感、有爱心的公民都是疫情防控链条上的一环。</h3>
        <h3 class="special">人人皆防线，戴口罩、勤洗手就是美德的体现。</h3>
        <h3 class="special">加强防控，一起加油。众志成城，抗击疫情。</h3>
    </div>
    <div id="container1">
    <h2 class="title" style="margin-left: 80px;">常见问题</h2>
    <div id="question">     
        <p><a href="http://www.wenming.cn/specials/zyq2020/xbk/202002/t20200210_5412751.shtml" target="_blank">疫情当前坐飞机的有关问题</a></p>
        <p><a href="http://newpaper.dahe.cn/hnrbncb/html/2020-02/10/content_402119.htm" target="_blank">如何判断自己是普通流感还是感染了新冠肺炎？</a></p>
        <p><a href="https://www.thepaper.cn/newsDetail_forward_6139233" target="_blank">疫情何时归零？</a></p>
        <p><a href="https://tech.sina.cn/2020-02-05/detail-iimxxste9039146.d.html?ivk_sa=1023197a" target="_blank">面对疫情，普通民众如何自我心理调节？</a></p>
        <p><a href="http://www.pdsedu.gov.cn/ztzl/kjfyzl/yqwd/content_75014" target="_blank">新冠肺炎比非典更“温和”吗，二者有什么区别？</a></p>
        <p><a href="http://www.mnw.cn/news/shehui/2244280-2.html" target="_blank">新型冠状病毒的潜伏期多长？</a></p>
        <p><a href="http://www.pdsedu.gov.cn/ztzl/kjfyzl/yqwd/content_75015" target="_blank">新型冠状病毒是由SARS冠状病毒进化而来的吗？</a></p>
        <p><a href="https://baijiahao.baidu.com/s?id=1659079276697361915&wfr=spider&for=pc" target="_blank">疫情防控法律知识？</a></p>
        <p><a href="http://news.voc.com.cn/zhuanti/tyzt/20200129221821632.html" target="_blank">查看更多>></a></p>  
    </div>
    <h2 class="title add">口罩使用</h2>
    <div id="usemask">    
        <select id="mask" onchange="mask()">
            <option value="1">口罩分类</option>
            <option value="2">预防新冠需用的口罩</option>
            <option value="3">一次性医用口罩的戴法</option>
            <option value="4">头戴式口罩佩戴步骤</option>
            <option value="5">使用过的口罩处理方法</option>
        </select>
        <p id="1" style="display: block;">
            1、医用外科口罩（阻挡70%的细菌）<br />
            2、N95口罩（阻挡95%的细菌）<br />
            3、普通棉纱口罩（阻挡36%的细菌）<br />
        </p>
        <p id="2"> 要想预防新型肺炎，专家建议公众配戴——医用外科口罩或N95口罩！棉布口罩就不要用了。<br />
            其中，医用外科口罩一般药店有销，N95口罩目前只能在某些特药商店或医药器械公司购买到。<br />
            对于普通市民来说，如果是去公共场所、不与病人接触，佩戴医用外科口罩足以，不必过度防护。如果会接触病人，则要佩戴防生物的N95口罩。<br />
            常用的N95口罩实际上分为两种，一种是防生物口罩（蓝绿色），型号1860或9132；一种是防尘口罩（白色），型号8210。如果大家有购买需求，也应选择防生物的医用防护口罩。
        </p>
        <p id="3"> 一次性医用口罩的佩戴：<br />
            一次性医用口罩有三层，且有里外之分，浅色面有吸湿功能，应该贴着嘴鼻，使深色面朝外。<br />
            有金属片的一边朝上，切记不要戴反。根据自己的脸型，将折面充分展开，把鼻、嘴、下颌完全包住，然后压紧鼻夹，使口罩与面部完全贴合。
        </p>
        <p id="4">
            头戴式口罩佩戴步骤：<br />
       单手捧口罩本体，指尖位于鼻夹位置，让两根头带自由地悬垂在手背下方，鼻夹朝上、口罩扣住下巴，将上头带戴在头顶位置，下头带戴在颈部。<br />
       用双手食指，从鼻夹中部开始，向两侧一边移动一边向下按压鼻夹，塑造鼻梁形状。
        </p>
        <p id="5">
            对于疑似患有传染病的民众，应在就诊或接受调查处置时，将使用过的口罩交给相应工作人员，作为医疗废物进行处理。<br />
            对于存在发热、咳嗽、咳痰、打喷嚏等症状的民众，或接触过此类人群的民众，推荐将口罩先丢至垃圾桶，再使用5%的84消毒液按照1：99配比后，撒至口罩上进行处理。如无消毒液，也可使用密封袋/保鲜袋，将口罩密封后丢入垃圾桶。对于普通民众，因风险较低，使用过的口罩可以直接丢入垃圾桶。<br />
            在处理完口罩后，一定记得认真洗手。
        </p>
    </div>
   </div>
   <h2 class="title">实时动态</h2>
   <div id="post">
       <p style="font-size: smaller;"><br /><br />02月25日  23:10</p>
       <h4><a href="http://baijiahao.baidu.com/s?id=1659519361271804110" target="_blank">“第17号通告”宣布无效后，湖北省委书记应勇赶赴高速收费站</a></h4>
       <p style="font-size: smaller;">02月25日  22:37</p>
       <h4><a href="http://baijiahao.baidu.com/s?id=1659519769980429112" target="_blank">新冠肺炎中老年高发，为什么湖北多位年轻的医生去世？</a></h4>
       <p style="font-size: smaller;">02月25日  22:07</p>
       <h4><a href="http://baijiahao.baidu.com/s?id=1659517892295438744" target="_blank">国务院通知：建议教师戴口罩授课，学生自带餐具，教室宿舍需定期消毒</a></h4>
       <p style="font-size: smaller;">02月25日  21:25</p>
       <h4><a href="http://baijiahao.baidu.com/s?id=1659515237556183327" target="_blank">意大利确诊新型冠状病毒肺炎病例增至283例其中7人死亡</a></h4>
       <p style="font-size: smaller;">02月25日  20:30</p>
       <h4><a href="http://baijiahao.baidu.com/s?id=1659502777910018693" target="_blank">中方是否会对日韩采取禁止人员入境等措施？外交部回应</a></h4>      
   </div>
   <p class="totop"><br /><a href="#nav">回到顶部</a></p>
   <h2 class="title">谣言粉碎</h2>
   <div id="incorrect">
       <br />
       <p>1.<em>谣言</em><a href="https://m.baidu.com/s?word=4%E6%9C%88%E5%BA%95%E5%89%8D%E7%A6%81%E5%8A%9E%E9%9B%86%E8%81%9A%E6%80%A7%E8%B5%9B%E4%BA%8B&sa=osari_yaoyan_1&mmsuse=sarifrom@osari_pc_3" target="_blank">四月底前禁办集聚性赛事 877332</a></p>
       <p>2.<em>谣言</em><a href="https://m.baidu.com/s?word=CN95%E8%AE%A4%E8%AF%81%E8%BD%A6%E5%8F%AF%E8%BF%87%E6%BB%A4%E7%97%85%E6%AF%92&sa=osari_yaoyan_2&mmsuse=sarifrom@osari_pc_3" target="_blank">CN95认证车可过滤病毒 756731</a></p>
       <p>3.<em>谣言</em><a href="https://m.baidu.com/s?word=%E5%8C%97%E4%BA%AC%E8%A6%81%E5%BB%BA%E6%96%B9%E8%88%B1%E5%8C%BB%E9%99%A2&sa=osari_yaoyan_3&mmsuse=sarifrom@osari_pc_3" target="_blank">北京要建方舱医院 502467</a></p>
       <p>4.<em>谣言</em><a href="https://m.baidu.com/s?word=%E6%AD%A6%E6%B1%89%E5%85%BB%E8%80%81%E9%99%A2%E7%99%BE%E4%BD%99%E8%80%81%E4%BA%BA%E5%85%A8%E6%84%9F%E6%9F%93&sa=osari_yaoyan_4&mmsuse=sarifrom@osari_pc_3" target="_blank">武汉养老院百余名老人均感染 487634</a></p>
       <p>5.<em>谣言</em><a href="https://m.baidu.com/s?word=%E6%B8%A9%E5%B7%9E%E5%8F%91%E7%94%9F%E7%88%86%E5%8F%91%E6%80%A7%E6%84%9F%E6%9F%93&sa=osari_yaoyan_5&mmsuse=sarifrom@osari_pc_3" target="_blank">温州发生爆炸性感染 378436</a></p>
   </div>
   <h2 class="title">今日疫情热搜</h2>
   <div id="hotsearch">
        <p><em>1.</em><a href="#country" target="_blank">新型肺炎实时动态 1123174</a></p>
        <p><em style="color: orange;">2.</em><a href="https://www.weibo.com/" target="_blank">北京东城出现武汉来京病例 584478</a></p>
        <p><em style="color: yellow;">3.</em><a href="https://www.weibo.com/" target="_blank">香港一佛堂跪毯查出新冠病毒 400527</a></p>
        <p><em style="color: gray;">4.</em><a href="https://www.weibo.com/" target="_blank">建议开学后老师戴口罩上课 393265</a></p>
        <p><em style="color: gray;">5.</em><a href="https://www.weibo.com/" target="_blank">美国口罩出现2亿7千万缺口 295110</a></p>
        <p style="text-align: center;margin-left: 0;"><a href="https://www.weibo.com/" target="_blank">查看更多>></a></p>
   </div>
   <p class="totop"><br /><a href="#nav">回到顶部</a></p>
   <h2 class="title">其他功能</h2>
   <div id="function">
   <a href="#save"><img src="pictures/120.png" style="width: 150px ;height: 150px; " /></a><a href="https://www.weibo.com/" target="_blank"><img src="pictures/weibo.png" style="width: 150px ;height: 150px;" /></a><a href="https://hao.360.com/?h_lnk" target="_blank"><img src="pictures/浏览.png" style="width: 150px ;height: 150px; " /></a>
   <a href="#container4"><img src="pictures/gouwu.png" style="width: 150px ;height: 150px;" /></a><a href="#report"><img src="pictures/jub.png" style="width: 150px ;height: 150px;" /></a><a href="#container2"><img src="pictures/aixin.png" style="width: 150px ;height: 150px; " /></a>
   </div>
   <h2 class="title" id="save">救护</h2>
   <div id="container3">      
        <p id="button1"><a href="#">拨打120</a></p>
        <p id="button2"><a href="map.html" target="_blank">查找附近医院</a></p>
        <p id="button3"><a href="#">查找附近病患</a></p>
   </div>
   <h2 class="title">举报</h2>
   <div id="report">
        <form action="" method="get" id="subreport">
            <p>举报人姓名：<input type="text" name="reporter" /><br /><br />
            被举报者状态：<select id="status">
                <option value="sp">疑似患者</option>
                <option value="highprice">高价出售口罩</option>
                <option value="fake">售卖假口罩</option>
                <option value="high">生活用品高价</option>
                <option value="hubei">从湖北回来</option>
                <option value="other">其他</option>
            </select><br /><br />
            被举报原因：<textarea rows="4" cols="20" style="vertical-align:top"></textarea><br /><br />
            举报人电话：<input type="text" name="tel" /><br /><br />
            被举报人所在位置：<textarea rows="4" cols="20" style="vertical-align:top"></textarea><br />
            </p><input type="submit" value="提交" style="margin-left: 270px;"/>
        </form>
   </div>
   <p class="totop"><br /><a href="#nav">回到顶部</a></p>
   <h2 class="title">爱心</h2>
   <div id="container2">
        <p id="button4"><a href="#donatemask">捐赠口罩</a></p>
        <p id="button5"><a href="#">捐献现金</a></p>
        <p id="button6"><a href="#">捐赠物资</a></p>
        <p id="button7"><a href="#volunteer">志愿者</a></p>
    </div>
    <div class="donatemask">
        <form action="" method="get" id="subdonate">
            <p>捐赠人姓名：<input type="text" name="reporter" /><br /><br />
            捐赠口罩种类：<select id="type">
                <option value="n95">N95</option>
                <option value="normal">普通医用口罩</option>
                <option value="cloth">棉布口罩</option>
                <option value="operation">外科手术口罩</option>
                <option value="dust">防尘口罩</option>
                <option value="other">其他</option>
            </select><br /><br />
            备注：<textarea rows="4" cols="20" style="vertical-align:top"></textarea><br /><br />
            捐赠人电话：<input type="text" name="tel" /><br /><br />
            捐赠去向：<textarea rows="4" cols="20" style="vertical-align:top"></textarea><br />
            </p><input type="submit" value="提交" style="margin-left: 270px;"/>
        </form>
   </div>
   <div class="donatemask" id="volunteer">
    <form action="" method="get" id="subdonate">
        <p>申请人姓名：<input type="text" name="reporter" /><br /><br />
        家庭住址：<textarea rows="4" cols="20" style="vertical-align:top"></textarea><br /><br />
        申请人电话：<input type="text" name="tel" /><br /><br />
        特长/志愿方向：<textarea rows="4" cols="20" style="vertical-align:top"></textarea><br />
        </p><input type="submit" value="提交" style="margin-left: 270px;"/>
    </form>
   </div>
   <h2 class="title">购物</h2>
   <div id="container4">
        <p class="button8"><a href="#donatemask">口罩</a></p>
        <p class="button9"><a href="#">超市</a></p>
        <p class="button10"><a href="#">消毒物品</a></p>
    </div>
    <div class="sell">
        <h3>口罩到货药店</h3>
        <table border="1" cellspacing="0">
            <tr>
                <th>药店名</th>
                <th>地理位置</th>
                <th>到货口罩型号</th>
                <th>到货口罩数量</th>
                <th>口罩价格（元/只）</th>
            </tr>
            <tr>
                <td>众友药店</td>
                <td>鼓楼区XX街道XX号</td>
                <td>N95</td>
                <td>100</td>
                <td>30</td>
            </tr>
            <tr>
                <td>一心堂</td>
                <td>闽侯县XX街道XX号</td>
                <td>N95</td>
                <td>390</td>
                <td>27</td>
            </tr>
            <tr>
                <td>同仁堂</td>
                <td>晋安区XX街道XX号</td>
                <td>普通医用口罩</td>
                <td>300</td>
                <td>20</td>
                </tr>
            <tr>
                <td>老百姓大药房</td>
                <td>台江区XX街道XX号</td>
                <td>普通医用口罩</td>
                <td>500</td>
                <td>15</td>
            </tr>
            <tr>
                <td>益丰大药房</td>
                <td>仓山区XX街道XX号</td>
                <td>N95</td>
                <td>420</td>
                <td>30</td>
            </tr>
            <tr>
                <td><a href="https://www.baidu.com/s?tn=news&rtt=1&bsst=1&wd=%E8%8D%AF%E5%BA%97%E5%94%AE%E5%8D%96%E5%8F%A3%E7%BD%A9&cl=2&origin=ps" target="_blank">...</a></td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
            </table>
            <p><a href="https://www.baidu.com/s?tn=news&rtt=1&bsst=1&wd=%E8%8D%AF%E5%BA%97%E5%94%AE%E5%8D%96%E5%8F%A3%E7%BD%A9&cl=2&origin=ps" target="_blank">查看更多</a></p>
    </div>
    <p class="totop"><br /><a href="#nav">回到顶部</a></p>
</body>
</html>
</body>
</html>