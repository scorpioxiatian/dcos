<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DCOS</title>
<style> 
.all{width:100%;height:100%;}
.ground{width:100%; height:100%; background-color:#1852EB；;}
.wrapper{position: relative; margin: 0px 20px 0px 0px;}
.scoprio{position:relative;padding:10px 0px 0px 0px;width:100%;height:100%;}
.sidebar{min-height: 700px; position:relative; z-index: 10; left: -9px; top: 5px; width: 150px; height:100%; padding: 0px 20px 0px 10px; background-color:#B3E0E6;float:right;}
.sidebar .nContainer{float: left;}
.sidebar .navigation{width: 220px; margin: 10px 0px 20px; padding: 0px; list-style: none;  float: left; position: relative;}									
.body{position: relative; margin: 10px 140px 0px 10px; padding: 0px 0px 0px 20px; background-color:#FFF;float:right;width:55%;}
.body .table{ position:relative; float:left;  margin: 10px 0px 0px 0px;}
.body .table1{ position:relative; float:left;  margin: 20px 0px 0px 0px;}
.picture{position:relative; margin:0px 0px 0px 0px; padding:10px; float:left;}
.picture .picture-1{ width:300px; height:300px;float:left;}
.body .buttom1{width:100px; margin:140px 0px 0px 490px; position:absolute;}
.body .buttom1 a{ text-height:auto; text-align:right}
.body .buttom2{width:100px; margin:300px 0px 0px 490px; position:absolute;}
.body .buttom2 a{ text-height:auto; text-align:right}
.body .buttom3{width:100px; margin:460px 0px 0px 490px; position:absolute;}
.body .buttom3 a{ text-height:auto; text-align:right}
.body .buttom4{width:100px; margin:615px 0px 0px 490px; position:absolute;}
.body .buttom4 a{ text-height:auto; text-align:right}
.left{ position: relative; margin: 20px 20px 0px 0px;  }  
.left a{
	font-size: 24px;
	font-weight: bold;
	color: #00F;
	text-height: auto;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
} 
b{
	font-size: 13px;
	font-weight: 100;
	text-align: center;
}

ul {  
margin: 10px 0px 0px 0px;  padding:0px;  list-style: none;  width: 150px; /* Width of Menu Items */  border-bottom: 1px solid #ccc;}  
ul li {  
				position: relative;
				padding:5px 0px 0px 0px ;
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
				color:#000;  
				background:url(img/1.jpg) repeat-x;  
				padding: 0px;  
				border: 1px solid #ccc; /* IE6 Bug */  
				border-bottom: 0;  
				}  
				  
			/* Holly Hack. IE Requirement */  
			* html ul li { float: left; height: 1%; }  
			* html ul li a { height: 1%; }  
			/* End */  
			  
			li:hover ul, li.over ul { display: block; } /* The magic */ 
</style>
<script type="text/javascript" src="js\jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js\highcharts.js"></script>
<script type="text/javascript" src="js\exporting.js"></script>
<script>
$(function () {                                                                     
    $(document).ready(function() {                                                  
        Highcharts.setOptions({                                                     
            global: {                                                               
                useUTC: false                                                       
            }                                                                       
        });                                                                         
                                                                                    
        var chart;                                                                  
        $('#container').highcharts({                                                


            chart: {                                                                
                type: 'spline',                                                     
                animation: Highcharts.svg, // don't animate in old IE               
                marginRight: 10,                                                    
                events: {                                                           
                    load: function() {                                              
                                                                                    
                        // set up the updating of the chart each second             
                        var series = this.series[0];                                
                        setInterval(function() {                                    
                            var x = (new Date()).getTime(), // current time         
                                y = Math.random();                                  
                            series.addPoint([x, y], true, true);                    
                        }, 1000);                                                   
                    }                                                               
                }                                                                   
            },                                                                      
            title: {                                                                
                text: 'CPU监控'                                            
            },                                                                      
            xAxis: {
				title:{
					text:'时间'},                                                                
                type: 'datetime',                                                   
                tickPixelInterval: 50                                              
            },                                                                      
            yAxis: {                                                                
                title: {                                                            
                    text: 'CPU使用率（100%）'                                                   
                }, 
				tickInterval: 0.1, 
				max:1,
				min:0,                                                                 
                plotLines: [{                                                       
                    value: 0,                                                       
                    width: 1,                                                       
                    color: '#808080'                                                
                }]                                                                  
            },                                                                      
            tooltip: {                                                              
                formatter: function() {                                             
                        return '<b>'+ this.series.name +'</b><br/>'+                
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);                         
                }                                                                   
            },                                                                      
            legend: {                                                               
                enabled: false                                                      
            },                                                                      
            exporting: {                                                            
                enabled: false                                                      

            },                                                                      

            series: [{                                                              
                name: 'Random data',                                                
                data: (function() {                                                 
                    // generate an array of random data                             
                    var data = [],                                                  
                        time = (new Date()).getTime(),                              
                        i;                                                          
                                                                                    
                    for (i = -19; i <= 0; i++) {                                    
                        data.push({                                                 
                            x: time + i * 1000,                                     
                            y: Math.random()                                        
                        });                                                         
                    }                                                               
                    return data;                                                    
                })()                                                                
            }]                                                                      
        });                                                                         
    });                                                                             
                                                                                    
});                                                                                 				                                                                                				
</script>
<script>
$(function () {                                                                     
    $(document).ready(function() {                                                  
        Highcharts.setOptions({                                                     
            global: {                                                               
                useUTC: false                                                       
            }                                                                       
        });                                                                         
                                                                                    
        var chart;                                                                  
        $('#container1').highcharts({                                                


            chart: {                                                                
                type: 'spline',                                                     
                animation: Highcharts.svg, // don't animate in old IE               
                marginRight: 10,                                                    
                events: {                                                           
                    load: function() {                                              
                                                                                    
                        // set up the updating of the chart each second             
                        var series = this.series[0];                                
                        setInterval(function() {                                    
                            var x = (new Date()).getTime(), // current time         
                                y = Math.random();                                  
                            series.addPoint([x, y], true, true);                    
                        }, 1000);                                                   
                    }                                                               
                }                                                                   
            },                                                                      
            title: {                                                                
                text: '内存监控'                                            
            },                                                                      
            xAxis: {
				title:{
					text:'时间'},                                                                
                type: 'datetime',                                                   
                tickPixelInterval: 50                                              
            },                                                                      
            yAxis: {                                                                
                title: {                                                            
                    text: '内存使用率（100%）'                                                   
                }, 
				tickInterval: 0.1, 
				max:1,
				min:0,                                                                 
                plotLines: [{                                                       
                    value: 0,                                                       
                    width: 1,                                                       
                    color: '#808080'                                                
                }]                                                                  
            },                                                                      
            tooltip: {                                                              
                formatter: function() {                                             
                        return '<b>'+ this.series.name +'</b><br/>'+                
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);                         
                }                                                                   
            },                                                                      
            legend: {                                                               
                enabled: false                                                      
            },                                                                      
            exporting: {                                                            
                enabled: false                                                      
            },                                                                      

            series: [{                                                              
                name: 'Random data',                                                
                data: (function() {                                                 
                    // generate an array of random data                             
                    var data = [],                                                  
                        time = (new Date()).getTime(),                              
                        i;                                                          
                                                                                    
                    for (i = -19; i <= 0; i++) {                                    
                        data.push({                                                 
                            x: time + i * 1000,                                     
                            y: Math.random()                                        
                        });                                                         
                    }                                                               
                    return data;                                                    
                })()                                                                
            }]                                                                      
        });                                                                         
    });                                                                             
                                                                                    
});                                                                                 				                                                                                				
</script>
<script>/**
 * Skies theme for Highcharts JS
 * @author Torstein Honsi
 */

Highcharts.theme = {
	colors: ["#514F78", "#42A07B", "#9B5E4A", "#72727F", "#1F949A", "#82914E", "#86777F", "#42A07B"],
	chart: {
		className: 'skies',
		borderWidth: 0,
		plotShadow: true,
		plotBackgroundImage: 'http://www.highcharts.com/demo/gfx/skies.jpg',
		plotBackgroundColor: {
			linearGradient: [0, 0, 250, 500],
			stops: [
				[0, 'rgba(255, 255, 255, 1)'],
				[1, 'rgba(255, 255, 255, 0)']
			]
		},
		plotBorderWidth: 1
	},
	title: {
		style: {
			color: '#3E576F',
			font: '16px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
		}
	},
	subtitle: {
		style: {
			color: '#6D869F',
			font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
		}
	},
	xAxis: {
		gridLineWidth: 0,
		lineColor: '#C0D0E0',
		tickColor: '#C0D0E0',
		labels: {
			style: {
				color: '#666',
				fontWeight: 'bold'
			}
		},
		title: {
			style: {
				color: '#666',
				font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			}
		}
	},
	yAxis: {
		alternateGridColor: 'rgba(255, 255, 255, .5)',
		lineColor: '#C0D0E0',
		tickColor: '#C0D0E0',
		tickWidth: 1,
		labels: {
			style: {
				color: '#666',
				fontWeight: 'bold'
			}
		},
		title: {
			style: {
				color: '#666',
				font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			}
		}
	},
	legend: {
		itemStyle: {
			font: '9pt Trebuchet MS, Verdana, sans-serif',
			color: '#3E576F'
		},
		itemHoverStyle: {
			color: 'black'
		},
		itemHiddenStyle: {
			color: 'silver'
		}
	},
	labels: {
		style: {
			color: '#3E576F'
		}
	}
};

// Apply the theme
var highchartsOptions = Highcharts.setOptions(Highcharts.theme);</script>
<script type="text/javascript">
			startList = function() {  
			if (document.all&&document.getElementById) {  
			navRoot = document.getElementById("nav");  
			for (i=0; i<navRoot.childNodes.length; i++) {  
			node = navRoot.childNodes[i];  
			if (node.nodeName=="LI") {  
			node.onmouseover=function() {  
			this.className+=" over";  
			  }  
			  node.onmouseout=function() {  
			  this.className=this.className.replace(" over", "");  
			   }  
			
			  }  
			 }  
			} 
			}
			window.onload=startList;  

	</script>

</head>
<body>
	

<div class="ground">
<div class="scoprio">
		<table width="800" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="800" height="132" valign="bottom"
					background="img/header.jpg" border="0">
					<table border="0" width="799" height="132">
						<tr>
							<td width="793" height="100" align="center" valign="middle">
						    <p><img src="img/s.png" width="75" height="73"/><font size="12" color="white">DCOS</font><font size="2" color="white">Data Center Operating System</font></p></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
</div>
<div class="body">
 <div>当前位置：<a href="#">监控<a/>>><a href="#">dcos监控</a>>>虚拟机
   <hr width="593px" align="left"></div>
 <div class="table"><h3>虚拟机信息</h3>
 <table width="613" height="74" border="0" >
  <tr bgcolor="#578DCE">
    <th width="120" scope="col"><b>虚拟机名</b></th>
    <th width="120" scope="col"><b>主机名</b></th>
    <th width="138" scope="col"><b>虚拟机内存</b></th>
    <th width="120" scope="col"><b>虚拟机CPU</b></th>
    <th width="120" scope="col"><b>状态</b></th>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
</table>
</div>
 <div class="picture">
  <div id="container" class="picture-1" ></div>
   <div id="container1"  class="picture-1"></div>
 </div>
</div>
</div>
<div class="sidebar">
<div class="nContainer"> 
<div class="left"><a>管理菜单</a></div>

			<ul id="nav">   
              <li><a href="getOverview"><img src="img/j.png" width="20" height="20">全局视图</a></li>  
			  <li><a href="#"><img src="img/j.png" width="20" height="20">资源管理</a>   
				<ul>   
					   <li><a href="#" ><img src="img/j.png" width="20" height="20">物理机资源</a></li>  
					   <li><a href="#"><img src="img/j.png" width="20" height="20">虚拟机资源</a></li>  
				</ul>   
			  </li> 
  			  <li><a href="#"><img src="img/j.png" width="20" height="20">监控</a>
                <ul>   
					   <li><a href="#" ><img src="img/j.png" width="20" height="20">dcos监控</a></li>  
					   <li><a href="#"><img src="img/j.png" width="20" height="20">应用监控</a></li>  
				</ul>   
              </li>  
			  <li><a href="#"><img src="img/j.png" width="20" height="20">用户管理  </a> 
				<ul>   
				  <li><a href="#"><img src="img/j.png" width="20" height="20">用户审核</a></li>   
				  <li><a href="#"><img src="img/j.png" width="20" height="20">用户信息</a></li>   
				</ul>   
			  </li> 
              
			</ul>                
  </div>   
</div>

</body>
</html>