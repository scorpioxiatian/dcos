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
.body .table{ position:relative; float:left;  margin: 20px 0px 0px 0px;}
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
			startList = function() 
			{  
				if (document.all&&document.getElementById) 
				{  
					navRoot = document.getElementById("nav");  
					for (var i=0; i<navRoot.childNodes.length; i++) 
					{  
						node = navRoot.childNodes[i];  
						if (node.nodeName=="LI") 
						{  
							node.onmouseover=function() 
							{  
							this.className+=" over";  
						  	};  
							node.onmouseout=function() 
							{  
							this.className=this.className.replace(" over", "");  
							};  
					
					  	}  
					}  
				} 
			};
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
<script type="text/javascript">

				function vmcreate() {
					var c,vname,pname,s,h,m;
					
					var v=$("#createvm").children('option:selected').val();//这就是selected的值
					
					
					if(0!=v){
						c='VMCluster01';
						vname='hw117-001';
						pname='hw117';
						s='active';
					}
					
					if(1==v){
						h="1核";m="1024M";
					}else if(2==v){
						h="2核";m="2048M";
					}else if(3==v){
						h="4核";m="4096M";
					}
					
				
				var t = "<tr scope='col'>"
					+"<td scope='col'>"+c+"</td>"
				    +"<td width='115' align='center' scope='col'>"+vname+"</td>"
				    
				    +"<td width='60' align='center' scope='col'>"+pname+"</td>"
				    +"<td width='60' align='center' scope='col'>"+s+"</td>"
				    +"<td width='60' align='center' scope='col'>"+h+"</td>"
				    +"<td width='60' align='center' scope='col'>"+m+"</td>"
				    
				    +"<td width='200' scope='col'><a href='#'>暂停</a><a href='#'>恢复</a><a href='#'>重启</a><a href='#'>销毁</a></td>"
				    +"<td width='220' scope='col'><select ><option selected='selected'>512M内存</option> <option >1024M内存</option> <option >2048M内存</option><option >4096M内存</option></select></td>"
				    +"<td width='60' scope='col'><input type='submit' value='提交' ></td>"		
				    +"</tr>";
				  //alert(t);
				  document.getElementById("temp").append = t;
				 
					
	};

</script>
<div class="body">
	 <div>当前位置：<a href="#">资源管理<a/>>><a href="#">虚拟机资源</a>
	   	<hr width="630px" align="left">
	 </div>
 	<div>
 		<select id='createvm'>
 			<option value='0' selected>----选择虚拟机模板---</option>
 			<option value="1">Falvor1(1核1024M)</option>
 			<option value="2">Falvor2(2核2048M)</option>
 			<option value="3">Falvor3(4核4096M)</option>
 		</select>
 		<img src="img/jt.jpg" width="20" height="20">    
 		<input type="button" id="new" value="新建虚拟机" onclick="vmcreate()">
 	</div>

 <script>
 	var cpu,mem,hostname;
 	function question(name)
 	{
 		alert(name);
 		hostname = name;
 		cpu = document.getElementById("cpu"+hostname).value; 
 	 	mem =document.getElementById( "mem"+hostname ).value;
 	 	alert("cpu:"+cpu+"--mem:"+mem);
 //		if(confirm("确定更改么？")){
// 			alert("updateVM?hostname="+hostname+"&mem="+mem+"&cpu="+cpu);
 			document.form1.action="updateVM?hostname="+hostname+"&mem="+mem+"&cpu="+cpu; 
 			
 //			alert(document.getElementById("form1").action);
// 		    document.form1.submit(); 
 			
 		 
 //		}
 //		else{return false;}
 		
 	}
 	
</script>

 	<div class="table">
 		<h3>虚拟机信息</h3>
		 <table id='temp' width="631" height="50" border="0" >
			  <tr bgcolor="#578DCE">
			  	<th scope="col"><b>分区</b></th>
			    <th width="115" scope="col"><b>虚拟机名</b></th>
			    <th width="60" scope="col"><b>节点</b></th>
			    <th width="60" scope="col"><b>状态</b></th>
			    <th width="60" scope="col"><b>处理器</b></th>
			    <th width="60" scope="col"><b>内存</b></th>
			    <th width="200" scope="col"><b>控制</b></th>
			    <th width="220" scope="col"><b>调整</b></th>
			    <th width="60" scope="col"><b></b></th>
			  
			  </tr>

			<c:if test="${!empty listVM }">
			<form name="form1" id="form1" method="post" action="">
			<c:forEach items="${listVM }" var="vm">

			
				<tr>
					<td>VMCluster01</td>
					<td id="id"  align="center">${vm.vm_hostname }</td>
					<td align="center">${vm.pm.pm_name }</td>
					<td>${vm.vm_state }</td>
					<td id="cpu_${vm.vm_hostname }"  align="center">${vm.vm_cpu }核</td>
					<td id="mem_${vm.vm_hostname }"  align="center">${vm.vm_mem }M</td>
					<td>
					<div style="text-align:center;">
						<a href="callPauseVM?hostname=${vm.vm_hostname }&size=10&pageno=${ pageno}" align="center">暂停</a>
						<a href="callSuspendVM?hostname=${vm.vm_hostname }&size=10&pageno=${ pageno}" align="center">恢复</a>
						<a href="#">重启</a>
						<a href="#">销毁</a>
					</div>
					</td>
					<td>
					    <div style="text-align:center;">
						<select id="cpu${vm.vm_hostname }" >
						  <option value ="1" selected="selected">单核</option>
						  <option value ="2">双核</option>
						  <option value="4">四核</option>
						</select>
						<select id="mem${vm.vm_hostname }">
						  <option value ="512" selected="selected">512M内存</option>
						  <option value ="1024">1024M内存</option>
						  <option value="2048">2048M内存</option>
						  <option value="4096">4096M内存</option>
						</select>
						</div>
					</td>
					<td>
						 <div style="text-align:center;">
						<input type="submit" value="提交" onclick="question('${vm.vm_hostname }')">
						</div>
					</td>

				</tr>		
			
			</c:forEach>
		</form>	
	</c:if>
		</table>
		<table ></table>
		<table>
		<tr>
			<td >当前第${pageno }页</td>
			<td>共${totalPageNo }页</td>
			<td>共${totalRecord }条记录</td>
			<td><a href="getSourceVM?size=10&pageno=1">首页</a></td>
			<td><a href="getSourceVM?size=10&pageno=${ pageno-1}"+>上一页</a></td>
			<td><a href="getSourceVM?size=10&pageno=${pageno+1 }"+>下一页</a></td>
			<td><a href="getSourceVM?size=10&pageno=${totalPageNo }"+>尾页</a></td>
		
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