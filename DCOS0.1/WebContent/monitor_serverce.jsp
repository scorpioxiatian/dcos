<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script src="js/global.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DCOS</title>
<style>
.all {
	width: 100%;
	height: 100%;
}

.ground {
	width: 100%;
	height: 100%;
	background-color: #1852EB；;
}

.wrapper {
	position: relative;
	margin: 0px 20px 0px 0px;
}

.scoprio {
	position: relative;
	padding: 10px 0px 0px 0px;
	width: 100%;
	height: 100%;
}

.sidebar {
	min-height: 700px;
	position: relative;
	z-index: 10;
	left: 10px;
	top: 5px;
	width: 150px;
	height: 100%;
	padding: 0px 20px 0px 10px;
	background-color: #B3E0E6;
	float: right;
}

.sidebar .nContainer {
   height: 200px;
	float: left;
}

.sidebar .navigation {
	width: 220px;
	margin: 10px 0px 20px;
	padding: 0px;
	list-style: none;
	float: left;
	position: relative;
}

.body {
	position: relative;
	margin: 10px 140px 0px 10px;
	padding: 0px 0px 0px 20px;
	background-color: #FFF;
	float: right;
	width: 55%;
}

.body .table {
	position: relative;
	float: left;
	margin: 20px 0px 0px 0px;
}

.body .table1 {
	position: relative;
	float: left;
	margin: 20px 0px 0px 0px;
}

.picture {
	position: relative;
	margin: 10px 0px 0px 10px;
	padding: 10px;
	float: left;
}

.picture .picture-1 {
	width: 200px;
	height: 200px;
	float: left;
	margin: 0px 0px 0px 30px;
}

.grid_3 {
	position: relative;
	float: left;
	width: 600px;
}

.box-head {
	background: url(img/grad-overlay-s.png) #3367BA;
	border-radius: 2px;
	max-height: 40px;
	width:630px;
}

.box-head:hover {
	background: url(img/grad-overlay-s.png) #5D93D3;
}

.box-head h2 {
	padding: 5px 5px;
	color: #ddd;
	font-size: 16px;
	font-weight: 600;
	text-shadow: 0 1px 0 #222;
}

.body .buttom1 {
	width: 100px;
	margin: 140px 0px 0px 490px;
	position: absolute;
}

.body .buttom1 a {
	text-height: auto;
	text-align: right
}

.body .buttom2 {
	width: 100px;
	margin: 300px 0px 0px 490px;
	position: absolute;
}

.body .buttom2 a {
	text-height: auto;
	text-align: right
}

.body .buttom3 {
	width: 100px;
	margin: 460px 0px 0px 490px;
	position: absolute;
}

.body .buttom3 a {
	text-height: auto;
	text-align: right
}

.body .buttom4 {
	width: 100px;
	margin: 615px 0px 0px 490px;
	position: absolute;
}

.body .buttom4 a {
	text-height: auto;
	text-align: right
}

.left {
	position: relative;
	margin: 20px 20px 0px 0px;
}

.left a {
	font-size: 24px;
	font-weight: bold;
	color: #00F;
	text-height: auto;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
}

b {
	font-size: 11px;
	font-weight: 100;
	text-align: center;
}

ul {
	margin: 10px 0px 0px 0px;
	padding: 0px;
	list-style: none;
	width: 150px; /* Width of Menu Items */
	border-bottom: 1px solid #ccc;
}

ul li {
	position: relative;
	padding: 5px 0px 0px 0px;
}

li ul {
	position: absolute;
	left: 150px; /* Set 1px less than menu width */
	top: 0;
	display: none;
}

ul li a {
	display: block;
	text-decoration: none;
	color: #000;
	background: url(img/1.jpg) repeat-x;
	padding: 0px;
	border: 1px solid #ccc; /* IE6 Bug */
	border-bottom: 0;
}

/* Holly Hack. IE Requirement */
* html ul li {
	float: left;
	height: 1%;
}

* html ul li a {
	height: 1%;
}
/* End */
li:hover ul,li.over ul {
	display: block;
} /* The magic */
</style>

<script>
	$(function() {

		$("#tomcat_selected").change(
				function() {
					
					Highcharts.setOptions({
						global : {
							useUTC : false
						}
					});

					var count = 0;
					$('#mem'+count).highcharts(
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE               
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second             
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(); // current time         
												var y ;
												if(count == 0){
													y= parseInt(document.getElementById("mastermemu").firstChild.nodeValue);//获取节点值	
												}
												else{
													y= parseInt(document.getElementById("slavememu"+count).firstChild.nodeValue);//获取节点值
												}
												
												series.addPoint([ x, y ], true,
														true);
											}, 5000);
										}
									}
								},
								title : {
									text : '内存监控'
								},
								xAxis : {
									title : {
										text : '时间'
									},
									type : 'datetime',
									tickPixelInterval : 50
								},
								yAxis : {
									title : {
										text : '内存使用率（100%）'
									},
									tickInterval : 10,
									max : 100,
									min : 0,
									plotLines : [ {
										value : 0,
										width : 1,
										color : '#808080'
									} ]
								},
								tooltip : {
									formatter : function() {
										return '<b>'
												+ this.series.name
												+ '</b><br/>'
												+ Highcharts.dateFormat(
														'%Y-%m-%d %H:%M:%S',
														this.x)
												+ '<br/>'
												+ Highcharts.numberFormat(
														this.y, 2);
									}
								},
								legend : {
									enabled : false
								},
								exporting : {
									enabled : false
								},

								series : [ {
									name : 'MEM使用率',
									data : (function() {
										// generate an array of random data                             
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -19; i <= 0; i++) {
											data.push({
												x : time + i * 5000,
												y : 0
											});
										}
										return data;
									})()
								} ]
							});
					$('#cpu'+count).highcharts(
							{

								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE               
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second             
											var series = this.series[0];
											setInterval(
													function() {
														var x = (new Date())
																.getTime();// current time         
														var y = parseInt(document.getElementById("mastercpuu").firstChild.nodeValue);//获取节点值
														series.addPoint(
																		[x,	y ],
																		true,
																		true);
													}, 5000);
										}
									}
								},
								title : {
									text : 'CPU监控'
								},
								xAxis : {
									title : {
										text : '时间'
									},
									type : 'datetime',
									tickPixelInterval : 50
								},
								yAxis : {
									title : {
										text : 'CPU使用率（100%）'
									},
									tickInterval : 10,
									max : 100,
									min : 0,
									plotLines : [ {
										value : 0,
										width : 1,
										color : '#808080'
									} ]
								},
								tooltip : {
									formatter : function() {
										return '<b>'
												+ this.series.name
												+ '</b><br/>'
												+ Highcharts
														.dateFormat(
																'%Y-%m-%d %H:%M:%S',
																this.x)
												+ '<br/>'
												+ Highcharts
														.numberFormat(
																this.y,
																2);
									}
								},
								legend : {
									enabled : false
								},
								exporting : {
									enabled : false
								},

								series : [ {
									name : 'CPU使用率',
									data : (function() {
										// generate an array of random data                             
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -19; i <= 0; i++) {
											data
													.push({
														x : time
																+ i
																* 5000,
														y : 0
													});
										}
										return data;
									})()
								} ]
							});
					$('#container').highcharts(
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE               
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second             
											var series = this.series[0];

											setInterval(function() {
												var x = (new Date()).getTime(); // current time
												var y = parseInt(document.getElementById("totaltime").firstChild.nodeValue);//获取节点值
												//var y = Math.random() * 1000;

												series.addPoint([ x, y ], true,
														true);
											}, 5000);
										}
									}
								},
								title : {
									text : '应用实时监控图'
								},
								xAxis : {
									title : {
										text : '时间'
									},
									type : 'datetime',
									tickPixelInterval : 50
								},
								yAxis : {
									title : {
										text : '总响应时间'
									},
									tickInterval : 100,
									max : 500,
									min : 0,
									plotLines : [ {
										value : 0,
										width : 1,
										color : '#808080'
									} ]
								},
								tooltip : {
									formatter : function() {
										return '<b>'
												+ this.series.name
												+ '</b><br/>'
												+ Highcharts.dateFormat(
														'%Y-%m-%d %H:%M:%S',
														this.x)
												+ '<br/>'
												+ Highcharts.numberFormat(
														this.y, 2);
									}
								},
								legend : {
									enabled : false
								},
								exporting : {
									enabled : false
								},
								series : [ {
									name : '最新响应时间',
									data : (function() {
										// generate an array of random data                             
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -19; i <= 0; i++) {
											data.push({
												x : time + i * 5000,
												y : Math.random()
											});
										}
										return data;
									})()
								} ]
							});
					
				});

	});
</script>
<script language="javascript">
	var XMLHttpReq, hostname;
	//创建XMLHttpRequest对象       
	function createXMLHttpRequest() {
		if (window.XMLHttpRequest) { //Mozilla 浏览器
			XMLHttpReq = new XMLHttpRequest();
		} else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
	}
	function beforeSend(name) {
		this.hostname = name;
		sendRequest();
	}
	//发送请求函数
	function sendRequest() {
		createXMLHttpRequest();
		var url = "getMonitor?hostname=" + hostname;
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
		XMLHttpReq.send(null); // 发送请求
	}
	// 处理返回信息函数
	function processResponse() {
		if (XMLHttpReq.readyState == 4) { // 判断对象状态
			if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
				DisplayHot();
				setTimeout("sendRequest()", 5000);
			} else { //页面不正常
				window.alert("您所请求的页面有异常。");
			}
		}
	}
	function DisplayHot() {
// 		timetomcat = XMLHttpReq.responseXML.getElementsByTagName("timetomcat");
// 		document.getElementById("master_vm").innerHTML = timetomcat[1].firstChild.nodeValue; 
		
		
 		mastername = XMLHttpReq.responseXML.getElementsByTagName("mastername");
 		mastercpu = XMLHttpReq.responseXML.getElementsByTagName("mastercpu");
 		mastermem = XMLHttpReq.responseXML.getElementsByTagName("mastermem");
 		totaltime = XMLHttpReq.responseXML.getElementsByTagName("totaltime");
 		mastercpuu = XMLHttpReq.responseXML.getElementsByTagName("mastercpuu");
 		mastermemu = XMLHttpReq.responseXML.getElementsByTagName("mastermemu");
 		
 		slavenamep = XMLHttpReq.responseXML.getElementsByTagName("slavenamep");
 		slavename = XMLHttpReq.responseXML.getElementsByTagName("slavename");
 		slavecpu = XMLHttpReq.responseXML.getElementsByTagName("slavecpu");
 		slavemem = XMLHttpReq.responseXML.getElementsByTagName("slavemem");
 		slavecpuu = XMLHttpReq.responseXML.getElementsByTagName("slavecpuu");
 		slavememu = XMLHttpReq.responseXML.getElementsByTagName("slavememu");
 		
 		
 		
		var txt1 = "";
		var txt2 = "";
		for(var i=0; i<totaltime.length;i++){
			txt1= txt1 + "<tr><td width='100' align='center' id='mastername'>"+mastername[i].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center'>"+mastercpu[i].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center'>"+mastermem[i].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center' id='totaltime'>"+totaltime[i].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center' id='mastercpuu'>"+mastercpuu[i].childNodes[0].nodeValue+"%</td>"
							+"<td width='100' align='center' id='mastermemu'>"+mastermemu[i].childNodes[0].nodeValue+"%</td></tr>";
			
		}
		var slavenum =slavename.length;
		for(var j=0; j<slavename.length;j++){
			txt2= txt2 + "<tr><td width='100' align='center'>"+slavenamep[j].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center'>"+slavename[j].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center'>"+slavecpu[j].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center'>"+slavemem[j].childNodes[0].nodeValue+"</td>"
							+"<td width='100' align='center' id='slavecpuu"+(j+1)+"'>"+slavecpuu[j].childNodes[0].nodeValue+"%</td>"
							+"<td width='100' align='center' id='slavememu"+(j+1)+"'>"+slavememu[j].childNodes[0].nodeValue+"%</td></tr>";
		}
		
		document.getElementById("master_vm").innerHTML = txt1;
		document.getElementById("slave_vm").innerHTML = txt2;
// 		document.getElementById("mastertime").innerHTML = "<div id='container' style='min-width: 600px; height: 300px'></div>";
	}
</script>
<script>
	/**
	 * Skies theme for Highcharts JS
	 * @author Torstein Honsi
	 */

	Highcharts.theme = {
		colors : [ "#514F78", "#42A07B", "#9B5E4A", "#72727F", "#1F949A",
				"#82914E", "#86777F", "#42A07B" ],
		chart : {
			className : 'skies',
			borderWidth : 0,
			plotShadow : true,
			plotBackgroundImage : 'http://www.highcharts.com/demo/gfx/skies.jpg',
			plotBackgroundColor : {
				linearGradient : [ 0, 0, 250, 500 ],
				stops : [ [ 0, 'rgba(255, 255, 255, 1)' ],
						[ 1, 'rgba(255, 255, 255, 0)' ] ]
			},
			plotBorderWidth : 1
		},
		title : {
			style : {
				color : '#3E576F',
				font : '16px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			}
		},
		subtitle : {
			style : {
				color : '#6D869F',
				font : '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			}
		},
		xAxis : {
			gridLineWidth : 0,
			lineColor : '#C0D0E0',
			tickColor : '#C0D0E0',
			labels : {
				style : {
					color : '#666',
					fontWeight : 'bold'
				}
			},
			title : {
				style : {
					color : '#666',
					font : '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
				}
			}
		},
		yAxis : {
			alternateGridColor : 'rgba(255, 255, 255, .5)',
			lineColor : '#C0D0E0',
			tickColor : '#C0D0E0',
			tickWidth : 1,
			labels : {
				style : {
					color : '#666',
					fontWeight : 'bold'
				}
			},
			title : {
				style : {
					color : '#666',
					font : '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
				}
			}
		},
		legend : {
			itemStyle : {
				font : '9pt Trebuchet MS, Verdana, sans-serif',
				color : '#3E576F'
			},
			itemHoverStyle : {
				color : 'black'
			},
			itemHiddenStyle : {
				color : 'silver'
			}
		},
		labels : {
			style : {
				color : '#3E576F'
			}
		}
	};

	// Apply the theme
	var highchartsOptions = Highcharts.setOptions(Highcharts.theme);
</script>
<script type="text/javascript">
	startList = function() {
		if (document.all && document.getElementById) {
			navRoot = document.getElementById("nav");
			for ( var i = 0; i < navRoot.childNodes.length; i++) {
				node = navRoot.childNodes[i];
				if (node.nodeName == "LI") {
					node.onmouseover = function() {
						this.className += " over";
					};
					node.onmouseout = function() {
						this.className = this.className.replace(" over", "");
					};

				}
			}
		}
	}
	window.onload = startList;
</script>

</head>
<body>


	<div class="ground">
		<div class="scoprio">
			<table width="850" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="850" height="132" valign="bottom"
						background="img/header1.jpg" border="0">
						<table border="0" width="799" height="132">
							<tr>
								<td width="793" height="100" align="center" valign="middle">
									<p>
										<img src="img/s.png" width="75" height="73" /><font size="12"
											color="white">DCOS</font><font size="2" color="white">Data
											Center Operating System</font>
									</p>
								</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</div>
		<script language="javascript" type="text/javascript">
			$(document).ready(function(){
				$('#tomcat_selected').change(function(){
					var p1=$(this).children('option:selected').val();//这就是selected的值
					beforeSend(p1);
				});
				
			});
		</script> 
		<div class="body"> 
			<div>
				当前位置：<a href="#">监控<a />>>应用监控
					<hr width="593px" align="left">
			</div>

			<h3>tomcat主机：	
			<c:if test="${!empty listTomcat }">
				<select name="tomcat_selected" id="tomcat_selected"   onchange="beforeSend(this.value)">
					<option selected>----选择虚拟机---</option>
					<c:forEach items="${listTomcat }" var="tomcat">
						<option value="${tomcat }">${tomcat }</option>
					</c:forEach>
				</select>
			</c:if>
			</h3>	
			<div class="grid_3">
				<div class="box-head">
					<h2>Master-vm</h2>
				</div>
				<div class="box-content">
					<table width="600" border="0" >
						<tr>
							<td width='100' align='center'><b>虚拟机名</b></td>
							<td width='100' align='center'><b>CPU核数</b></td>
							<td width='100' align='center'><b>内存大小</b></td>
							<td width='100' align='center'><b>响应时间</b></td>
							<td width='100' align='center'><b>CPU使用率</b></td>
							<td width='100' align='center'><b>内存使用率</b></td>
						</tr>
					<table width="600" border="0" id="master_vm">	
					</table>

					<div class="picture" id='monitormaster'>
							<div id="cpu0" class="picture-1"></div>
							<div id="mem0" class="picture-1"></div>
					</div>
				</div>
			</div>
			<div class="grid_3">
				<div class="box-head">
					<h2>Slave-vm</h2>
				</div>
				<div class="box-content">
					<table width="600" border="0">
						<tr>
							<td width='100' align='center'><b>主机名</b></td>
							<td width='100' align='center'><b>虚拟机名</b></td>
							<td width='100' align='center'><b>CPU核数</b></td>
							<td width='100' align='center'><b>内存大小</b></td>
							<td width='100' align='center'><b>CPU使用率</b></td>
							<td width='100' align='center'><b>内存使用率</b></td>
						</tr>
					<table width="600" border="0" id="slave_vm">
					</table>
				</div>
			</div>
			<div class="grid_3">
				<div class="box-head">
					<h2>Hodoop-vm</h2>
				</div>
				<div class="box-content">
					<table width="600" border="0">
						<tr>
							<td width='100' align='center'><b>主机名</b></td>
							<td width='100' align='center'><b>虚拟机名</b></td>
							<td width='100' align='center'><b>CPU核数</b></td>
							<td width='100' align='center'><b>内存大小</b></td>
							<td width='100' align='center'><b>CPU使用率</b></td>
							<td width='100' align='center'><b>内存使用率</b></td>
						</tr>

					</table>
				</div>
			</div>
			<div class="grid_3">
				<div class="box-head">
					<h2>tomcat响应时间</h2>
				</div>
				<div class="box-content">
					<div class="picture" id='mastertime'>
						<div id='container' style='min-width: 600px; height: 300px'></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	</div>

	</div>
	</div>
	<div class="sidebar">
		<div class="nContainer">
			<div class="left">
				<a>管理菜单</a>
			</div>

			<ul id="nav">
				<li><a href="getOverview"><img src="img/j.png" width="20"
						height="20">全局视图</a></li>
				<li><a href="#"><img src="img/j.png" width="20" height="20">资源管理</a>
					<ul>
						<li><a href="#"><img src="img/j.png" width="20"
								height="20">物理机资源</a></li>
						<li><a href="#"><img src="img/j.png" width="20"
								height="20">虚拟机资源</a></li>
					</ul></li>
				<li><a href="#"><img src="img/j.png" width="20" height="20">监控</a>
					<ul>
						<li><a href="error.jsp"><img src="img/j.png" width="20"
								height="20">dcos监控</a></li>
						<li><a href="#"><img src="img/j.png" width="20"
								height="20">应用监控</a></li>
					</ul></li>
				<li><a href="#"><img src="img/j.png" width="20" height="20">用户管理
				</a>
					<ul>
						<li><a href="error.jsp"><img src="img/j.png" width="20"
								height="20">用户审核</a></li>
						<li><a href="error.jsp"><img src="img/j.png" width="20"
								height="20">用户信息</a></li>
					</ul></li>

			</ul>
		</div>
	</div>

</body>
</html>