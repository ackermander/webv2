<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ackermander#register</title>
	<script type="text/javascript" src="../jquery-1.12.3.js"></script>
	<script type="text/javascript" src="./CloudThunder.js"></script>
	<script type="text/javascript" src="./register.js"></script>
	<script type="text/javascript">
		$(function(){
				$("#MainContent").css("height", $(window).height() + "px");
				$(window).resize(function(){
					$("#MainContent").css("height", $(window).height() + "px");
					for(var i = 0; i < $("canvas").size(); i++) {
           				$("canvas")[i].width = $(window).width();
					}
				})
				$("#login-bt").click(function() {
					window.location.href="/websiteV2/Register/register.jsp?login=login";
				})
		})
	</script>
	<style type="text/css">
		a{
			text-decoration: none;
		}
		body{
			margin:0;
			font-family:'Microsoft YaHei';
			font-size: 12px	;
			background: #ccc;
			overflow: auto;
		}
		#MainContent {
			z-index: 1;
			width: 100%;
			position: absolute;
		}
		#RegisterContent{
			opacity: .7;
			z-index: 3;
			width:300px;
			height: 400px;
			margin:auto;
			background: #e4e4e4;
			border-style: solid;
			border-radius: 9px;
			border-color: #e4e4e4;
			border-width: 1px;
			top: 0;
			bottom: 0;
			right: 0;
			left: 0;
			position: absolute;
		}
		input.in {
			background-color: #e4e4e4;
		    border-radius: 0;
		    margin: 4px 1px;
		    border-left: 0;
		    border-right: 0;
		    border-top: 0;
		    border-bottom-color: #0033cc;
		    border-bottom-width: 1px;
		}
		input.bt {
			width : 200px;
		    background: rgba(54,58,210,.4);
		    border-radius: 3px;
		    font-family: 'Microsoft YaHei';
		    font-size: 14px;
		    border: 0;
		    color: white;
		   	margin: 2px 0px;
		}
		canvas{
			z-index: -1;
			position: fixed;
		}
		p{
			text-align: center;
		}
	</style>
</head>
<body>
	<div id="MainContent">
		<div id="RegisterContent">
			<s:if test="#parameters.login==null">
				<div>
					<h1 align="center" style="margin: 10px 0 0 0">注册一个账号</h1>
					<h5 align="center" style="margin: 1px">register a account</h5>
				</div>
			</s:if>
			<s:else>
				<div>
					<h1 align="center" style="margin: 10px 0 0 0">账号登录</h1>
					<h5 align="center" style="margin: 1px">WELCOME TO HERE!</h5>
				</div>
			</s:else>
			<hr>
			<s:if test="#parameters.login==null">
				<form method="post" action="registe">
					<!-- 
					<table>
						<tr>
							<div align="center">账号:<input id="name" class="in" type="text" name="usnm"></div>
						</tr>
						<tr>
							<div align="center">密码:<input id="word" class="in" type="password" name="pswd"></div>
						</tr>
						<tr>
							<div align="center">确认密码:<input id="nike" class="in" type="text" name="conf"></div>
						</tr>
				
						<div align="center">
							<input type="submit" class="bt" value="注册">
						</div>
					</table>
					 -->
					<table align="center">
						<tr >
							<td>账号:</td>
							<td><input id="name" class="in" type="text" name="usnm"></td>
						</tr>
						<tr >
							<td>密码:</td>
							<td><input id="word" class="in" type="password" name="pswd"></td>
						</tr>
						<tr >
							<td>确认密码:</td>
							<td><input id="conf" class="in" type="password" name="conf"></td>
						</tr>
					</table>
						<div align="center">
							<input type="submit" class="bt" id="reg" value="注册">
							<input type="button" class="bt" id="login-bt" value="去登录">
						</div>
				</form>
			</s:if>
			<s:else>
				<form method="post" action="login-validate">
					<div align="center">账号:<input id="usnm" class="in" type="text" name="usnm"></div>
					<div align="center">密码:<input id="pswd" class="in" type="password" name="pswd"></div>
					<div align="center">
						<input type="submit" class="bt" value="登录">
					</div>
				</form>
			</s:else>
			<div style="height: 40px;"><p id="text"></p></div>
		</div>
	</div>
	<canvas></canvas>
	<canvas></canvas>
	<canvas></canvas>
	<canvas></canvas>
	<canvas></canvas>
</body>
</html>