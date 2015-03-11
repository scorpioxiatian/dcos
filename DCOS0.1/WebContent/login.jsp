<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.7.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<style>
.body{ position:absolute;width:100%;height:100%; margin:0px; background-image:url(img/20096921452031677802.jpg); background-repeat:no-repeat;  }
.middle{position:relative;margin:85px 0px 0px 325px;width:670px;}
.logo{ position:relative;margin:0px 0px 0px 180px; width:79px;height:auto;float:left;}
.deng{position:relative;margin:0px 0px 0px 0px;width:410px;height:76px; padding:15px 0px 0px 0px;float:left;}
.deng a{ font-size:36px; text-height:font-size; text-align:center;color:#FFF; font-family:"Arial Black", Gadget, sans-serif;}
.login{position:relative;width:250px;height:145px;margin:60px 0px 0px 240px; float:left;}
.login .pass{ position:relative;margin:10px 0px;}
.login .button1{position:relative;width:60px;height:31px;margin:5px 0px 0px 60px; background-image:url(img/button.jpg); background-repeat:no-repeat; display:block;float:left;padding:3px 0px 0px;}
.login .button2{position:relative;width:60px;height:31px;margin:5px 0px 0px 20px;; background-image:url(img/button.jpg); background-repeat:no-repeat; display:block;float:left;padding:3px 0px 0px;}
.login a{ font-size:14px; color:#FFF; font-weight:bold;}
.login b{ font-size:12px;color:#FFF; font-family:Arial, Helvetica, sans-serif;}
.login c{font-size:16px;color:#000; font-family:Tahoma, Geneva, sans-serif; font-weight:100; display:block; text-align:center;}
.bottom{position:relative;width:250px;height:auto;float:left; padding:0px 0px 0px 50px;}
</style>
</head>
<body>
	<form name="form" action="loginCheck" method="get">
	<div class="body">
		<div class="middle">
			<div class="logo"><img src="img/s.png" width="79" height="76" /></div>
			<div class="deng"><a>DCOS登入系统</a></div>
			<div class="login">
				<div><a>用户名：</a><input type="text" name="username"　width="150px" height="25"></div>
				<div class="pass"><a> 密　码：</a><input type="password" name="password" width="150px" height="25"></div>
			    <div class="button1"><a href="javascript:form.submit();"><c>登入</c></a></div>
			    <div class="button2"><a href="#"><c>取消</c></a></div>
			   <div class="bottom"><a href="#"><b>注册</b></a>　　　　　　<a href="#"><b>忘记密码？</b></a></div>
			</div>
		</div>
	</div>
	</form>
		

</body>
</html>