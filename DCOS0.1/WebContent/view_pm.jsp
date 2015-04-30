<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DCOS</title>
<!--  <link href="css/style.css" rel="stylesheet" type="text/css" /> -->
<style>
.all{width:100%;height:100%;}
.ground{width:100%; height:100%; background-color:#1852EB；;}
.wrapper{position: relative; margin: 0px 20px 0px 0px;}
.scoprio{position:relative;padding:10px 0px 0px 0px;width:100%;height:100%;}
.sidebar{min-height: 700px; position:relative; z-index: 10; left: 10px; top: 5px; width: 150px; height:100%; padding: 0px 20px 0px 10px; background-color:#B3E0E6;float:right;}
.sidebar .nContainer{float: left;}
.sidebar .navigation{width: 220px; margin: 10px 0px 20px; padding: 0px; list-style: none;  float: left; position: relative;}
.body{position: relative; margin: 10px 140px 0px 10px; padding: 0px 0px 0px 20px; background-color:#FFF;float:right;width:55%;}
.body .table1{ position:absolute; float:right;  margin: 10px 0px 0px 0px;}
.body .table2{ position: absolute;float: right;margin: 165px 0px 0px 0px;left: 20px;top: 17px;}
.body .table3{ position:absolute;float:right;margin:325px 0px 0px 0px;}
.body .table4{ position:absolute;float:right;margin:480px 0px 0px 0px;}
.body .buttom1{width:100px; margin:140px 0px 0px 490px; position:absolute;}
.body .buttom1 a{ text-height:auto; text-align:right}
.body .buttom2{width:100px; margin:300px 0px 0px 490px; position:absolute;}
.body .buttom2 a{ text-height:auto; text-align:right}
.body .buttom3{width:100px; margin:460px 0px 0px 490px; position:absolute;}
.body .buttom3 a{ text-height:auto; text-align:right}
.body .buttom4{width:100px; margin:615px 0px 0px 490px; position:absolute;}
.body .buttom4 a{ text-height:auto; text-align:right}
.left{ position: relative; margin: 20px 20px 0px 0px;  }
.left a{ font-size:24px; font-weight:bold; color:#F90; text-height:auto; text-align:center; }
b{
	font-size: 13px;
	font-weight: 100;
	text-align: center;
}

ul {
margin: 10px 0px 0px 0px;  padding: 0;  list-style: none;  width: 150px; /* Width of Menu Items */  border-bottom: 1px solid #ccc;}
ul li {
				position: relative;
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
				padding: 5px;
				border: 1px solid #ccc; /* IE6 Bug */
				border-bottom: 0;
				}

			/* Holly Hack. IE Requirement */
			* html ul li { float: left; height: 1%; }
			* html ul li a { height: 1%; }
			/* End */

			li:hover ul, li.over ul { display: block; } /* The magic */
</style>

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
		<table width="850" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="850" height="132" valign="bottom"
					background="img/header1.jpg" border="0">
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
<div>当前位置：<a href="getOverview">全局视图</a>>主机全局概况</div>
<div class="table1">
	<table width="591" border="0">
	  <tr bgcolor="#578DCE" >
	    <td width="92" align="center"><b>主机名</b></td>
	    <td width="84" align="center"><b>主机IP</b></td>

	    <td width="88" align="center"><b>核数</b></td>
	    <td width="104" align="center"><b>已使用核数</b></td>
	  </tr>
		<c:if test="${!empty pmList }">

					<c:forEach items="${pmList }" var="pm">
						<tr>
							<td align="center">${pm.pm_name }</td>
							<td align="center">${pm.pm_ip }</td>

							<td align="center">${pm.cores }</td>
							<td align="center">${pm.cores_used }</td>
						</tr>
					</c:forEach>
				</c:if>
	</table>
	<table>
		<tr>
			<td >当前第${pageno }页</td>
			<td>共${totalPageNo }页</td>
			<td>共${totalRecord }条记录</td>
			<td><a href="get_pm_view?size=10&pageno=1">首页</a></td>
			<td><a href="get_pm_view?size=10&pageno=${ pageno-1}"+>上一页</a></td>
			<td><a href="get_pm_view?size=10&pageno=${pageno+1 }"+>下一页</a></td>
			<td><a href="get_pm_view?size=10&pageno=${totalPageNo }"+>尾页</a></td>

		</tr>
	</table>
</div>
</div>
</div>
<div class="sidebar">
<div class="nContainer">
<div class="left"><a>管理菜单</a></div>

			<ul id="nav">
              <li><a href="getOverview"><img src="img/j.png" width="20" height="15">全局视图</a></li>
			  <li><a href="#"><img src="img/j.png" width="20" height="15">资源管理</a>
				<ul>
					   <li><a href="getSourcePM?size=10&pageno=1" ><img src="img/j.png" width="15" height="20">物理机资源</a></li>
					   <li><a href="getSourceVM?size=10&pageno=1"><img src="img/j.png" width="15" height="20">虚拟机资源</a></li>
				</ul>
			  </li>
  			  <li><a href="#"><img src="img/j.png" width="20" height="15">监控</a>
                <ul>
					   <li><a href="error.jsp" ><img src="img/j.png" width="20" height="15">dcos监控</a></li>
					   <li><a href="getAllTomcat"><img src="img/j.png" width="20" height="15">应用监控</a></li>
				</ul>
              </li>
			  <li><a href="#"><img src="img/j.png" width="20" height="15">用户管理  </a>
				<ul>
				  <li><a href="error.jsp"><img src="img/j.png" width="20" height="15">用户审核</a></li>
				  <li><a href="error.jsp"><img src="img/j.png" width="20" height="15">用户信息</a></li>
				</ul>
			  </li>

			</ul>
       </div>
</div>
</div>

</body>
</html>
