<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
  <html>
  <head>
  	<title>ACKERMANDER | index</title>
    <style>
    body{ 
    	height:100%;
    	margin: 0;
    	font-family:'Microsoft YaHei','Bangers','Helvetica Neue','Arial';
    }
    div#log{ 
    	width:100%;
    	height:100%;
    	margin-left:0px;
    	position:fixed;
    	background-color:;
    }
    img{
    	width: 100%;
    	height: 100%;
    	position:absolute;
    }
    img#morp-buff{
    	margin-left:;
    }
    a.my{
    	margin: 10px 10px;
    	display:inline-block;
		padding:10px 100px;
		text-decoration:none;
		border:2px solid #fff;
		border-radius:200px;
		color:#000;
		font-size:20px;
		-webkit-transition:all .4s ease-in;
		-moz-transition:all .4s ease-in;
		-o-transition:all .4s ease-in;
		-ms-transition:all .4s ease-in;
		transition:all .4s ease-in;
    }
    a.my:hover{
    	background: #fff;
    	opacity: .5;
    	color: #000;
    }
    #designer{
    	margin: 10px 10px;
    	display:inline-block;
		padding:3px 50px;
		text-decoration:none;
		border:2px solid #eee;
		border-radius:200px;
		color:#eee;
		font-size:20px;
		-webkit-transition:all .4s ease-in;
		-moz-transition:all .4s ease-in;
		-o-transition:all .4s ease-in;
		-ms-transition:all .4s ease-in;
		transition:all .4s ease-in;
    }
    #designer:hover{
    	background: #eee;
    	opacity: .5;
    	color: #000;
    }
    </style>
    <script src="jquery-1.12.3.js"></script>
  <script>
		$(function(){
			$("a.my").click(function(){
			})
			$("a#designer").click(function(){
			})
		})	
   // $(function(){       
  	//  	$("a").click(function(){
   //   	  alert("WELCOME TO WUZHENCHANG'S WEBSITE" + "\r" + "WARN:ONLY THIS WEBPAGE BE DESIGNED NO LINK TO OTHER WEBSITE,THANKS." + "\r" + "警告:我只设计了这个页面没有其他的了！");
  	//  });
   // });
	//$(function(){
	//    window.onresize = function () {
	//		$("a").css("margin-left", $(window).width()*0.4 - 50 + "px");	
	//    };
	//})
 </script>
  </head>
  <body>
  <div>
  	<img alt="" src="./back1.png">
  </div>
	<div id="text" style="text-align: center;position:absolute;width:100%;padding:110px 0px">
		<div id="header">
			<h1 id="head" style="margin-top:10px;color:#FFF;position:relative;text-align: center;">WELCOME! ${sessionScope.loginAcc.nikename}</h1>
		</div>
		<div style="width:100%"><a class="my" id="self" href="">ACKERMANDER</a></div>
		<div style="width:100%"><a class="my" id="note" href="/websiteV2/Note/note.jsp">Note</a></div>
	</div>

    </body>
  </html>