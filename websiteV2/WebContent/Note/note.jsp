<%@page import="ce.acmd.things.clazz.simple.account.SimpleAccount"%>
<%@page import="java.util.List"%>
<%@page import="ce.acmd.things.clazz.Essay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>ACKERMANDER#note</title>
<meta charset="utf-8">
<link rel="stylesheet" href="../font/css/font-awesome.min.css" />
<script type="text/javascript" src="./jquery-1.12.3.js"></script>
<script type="text/javascript" src="./FloatPoint.js"></script>
<script type="text/javascript" src="./normal.js"></script>
<style type="text/css">
body {
	margin: 0;
	background: black; //
	background: #ff3300;
	font-family: 'Microsoft YaHei';
	font-size: 12px;
	overflow: auto;
}

div#mainContent {
	width: 100%;
	z-index: 0;
	position: absolute; //
	background: #ff3300;
}

div#secondContent {
	z-index: 2;
	width: 1366px;
	margin: 0 auto;
}

div#note {
	z-index: 3;
	width: 100%;
	height:;
	background: #fff;
	float: left;
	border-color: rgba(255, 34, 51, 1);
	border-width: 1px;
	border-style: solid;
	margin: 77px 2px;
	border-radius: 5px;
	transition: all .4s ease-in;
	overflow: auto;
}

//
修改滚动条的样式 . #note::-webkit-scrollbar {
	width: 8px; //
	竖直的滚动条宽度 height: 8px;
	//
	水平的宽度
}

#note::-webkit-scrollbar-thumb {
	background-color: #544; //
	块部分 border-radius: 6px;
}

#note::-webkit-scrollbar-track {
	background-color: #fdd; //
	通道部分 border-radius: 6px;
}

body::-webkit-scrollbar {
	width: 8px;
	height: 8px;
}

body::-webkit-scrollbar-thumb {
	background-color: #544;
	border-radius: 6px;
}

body::-webkit-scrollbar-track {
	background-color: #fdd;
	border-radius: 6px;
}

#right {
	width: 25%;
	float: right;
}

div.stl:hover {
	/*		border-style:solid; 
		border-color: #0033cc;*/ //
	box-shadow: #00e 0 0 2px 2px;
}

div.essay {
	cursor: pointer;
	//
	修改hover是指针样式
	.
}

canvas {
	z-index: -1;
	position: absolute;
}

input.in {
	border-radius: 0;
	margin: 4px 1px;
	border-left: 0;
	border-right: 0;
	border-top: 0;
	border-bottom-color: #0033cc;
	border-bottom-width: 1px;
}

input.bt {
	background: rgba(54, 58, 210, .4);
	border-radius: 3px;
	font-family: 'Microsoft YaHei';
	font-size: 12px;
	border: 0;
	color: white;
}

p {
	margin: 0;
	text-indent: 2em;
}

a.header {
	font-weight: bold;
	font-size: 18px;
	color: black;
	text-decoration: none;
}

.btd {
	margin: 2px 0;
}

.bt {
	width: 200px;
}

#signed {
	text-indent: 0;
	text-align: center;
	font-size: 20px;
	margin: 10px 0;
}

ul#left_head_content {
	margin: 0px;
	padding: 0px;
	height: 42px;
	background: white;
}

ul.right-head-content {
	margin: 0px;
	padding: 0px;
	height: 42px;
	background: white;
}

ul#left_head_content li {
	margin: 0px;
	list-style-type: none;
	padding: 0 10px;
	float: left;
	height: 42px;
	line-height: 42px;
}

ul.right-head-content li {
	margin: 0px;
	list-style-type: none;
	padding: 0 10px;
	float: left;
	height: 42px;
	line-height: 42px;
}

div#head_main {
	width: 100%;
	z-index: 0;
	background-color: white;
}

div#head_second {
	width: 1366px;
	margin: 0px auto;
}

canvas {
	position: absolute;
}

.mask {
	height: 42px;
}

a {
	text-decoration: none;
}

.bt {
	width: 150px;
	height: 20px;
	background: rgba(54, 58, 210, .4);
	border-radius: 3px;
	font-family: 'Microsoft YaHei';
	font-size: 14px;
	border: 0;
	color: white;
	margin: 2px 0px;
	border-radius: 3px;
	font-family: 'Microsoft YaHei';
	font-size: 14px;
	border: 0;
	color: white;
	background: rgba(54, 58, 210, .4);
}
</style>
</head>
<body>
	<canvas></canvas>
	<canvas></canvas>
	<canvas></canvas>
	<%
		//	List<Essay> essays =(List<Essay>) request.getAttribute("essays");
	%>
	<div id="head_main" class="mask">
		<div id="head_second" class="mask">
			<div id="left_head" style="float: left;" class="mask">
				<ul id="left_head_content" class="mask">
					<li style="font-size: 14px; font-weight: bold;" class="mask">Note</li>
				</ul>
			</div>
			<div style="float: right; height: 42px;">
				<s:if test="#session.loginAcc!=null">
					<ul class="right-head-content">
						<li><a href="../zone/zone.jsp" id="login-acc"><s:property value="#session.loginAcc.nikename" /></a></li>
						<li><a href="../Note/note.jsp?logout=logout">登出</a></li>
					</ul>
				</s:if>
				<s:else>
					<ul class="right-head-content">
						<li><a href="../Register/register.jsp?login=login">登录</a></li>
						<li><a href="../Register/register.jsp">注册</a></li>
					</ul>
				</s:else>
			</div>
		</div>
	</div>

	<div id="mainContent">
		<div id="secondContent">
			<div class="stl" id="note">
				<div class="essays">
					<ul style="list-style-type: none; padding: 0;">
						<div id="container">
							<s:iterator value="#request.essays" status="stat">
								<li>
									<div class="essay">
										<div id="<s:property value="header"/>">
											<span id="<s:property value='header'/>-comments-size" style="display: none;"><s:property value="comments.size"/></span>
											<span id="index" style="display: none;"><s:property
													value="#stat.index" /></span> <a class="header"><s:property
													value="header" /></a>
											<p style="font-size: 10px; color: #aaa;" class="info">
												作者:<span id="author"><s:property
														value="eOwner.nikename" /></span>&nbsp;&nbsp; 时间:<span id="date"><s:property
														value="date" /></span>
											</p>
											<p class="content-essay">
												<s:property value="content" />
											</p>
											<hr>
											<div id="essay-comments-container" style="display: none;">
												<div style="text-align: center;">评论区</div>
												<hr>
												<s:bean name="ce.acmd.struts.tag.sort.SortId" id="sortcomment"></s:bean>
												<s:sort comparator="sortcomment" source="#request.essays[#stat.index].comments" var="after"></s:sort>
												<s:iterator value="#attr.after"
													status="sta" >
													<div class="comments">
														<div class="index-<s:property value='header'/>" style="display: none;"><s:property
																value=""/></div>
														<span class="floor-span" style="font-size: 14px;">第<s:property
																value="#sta.count" />楼
														</span>
														<p style="font-size: 10px; color: #aaa;" class="info">
															作者:<span id="author"><s:property
																	value="author" /></span>&nbsp;&nbsp; 时间:<span
																id="date"><s:property value="date" /></span>
														</p>
														<p id="content">
															<s:property value="commentContent" />
														</p>
														<hr>
													</div>
												</s:iterator>

											</div>
										</div>
									</div>
								</li>
							</s:iterator>
							<!-- 
							<ul style="list-style-type: none;padding: 0;">
								<li>
									<div class="essay">
										<a class="header" href=""></a>
										<p style="font-size:10px;color:#aaa"></p>
										<p></p>
										<br>
										<hr>
									</div>
								</li>								
							</ul>
							 -->
							<p style="text-align: center; font-size: 13px;">没有更多了...</p>
						</div>
						<div id="see-an-essay" style="display: none;">
							<div id="back" style="margin: 0px 10px;">
								<div id="back-left">
									<i id="icon-s" class="icon-chevron-left icon-2x"><span
										style="position: relative; left: 10px;">返回浏览</span></i> <i
										id="icon-c" class="icon-chevron-sign-left icon-2x"
										style="display: none;"><span
										style="position: relative; left: 5px;">返回浏览</span></i>

								</div>
							</div>
							<div id="<s:property value="header"/>">
								<h1 id="an-essay-header" style="text-align: center;"></h1>
								<p style="font-size: 10px; color: #aaa; text-align: center;">
									作者:<span id="an-essay-author"></span>&nbsp;&nbsp; 时间:<span
										id="an-essay-date">sdf</span>
								</p>
								<p id="an-essay-content"></p>
								<br>
								<hr>
								<div id="an-essay-comments"></div>
								<s:if test="#session.loginAcc != null">
									<div >
										<hr>
										<div>发表评论</div>
										<div>
											<textarea id="com-text" rows="5"
												style="width: 98%; margin: 10px;"></textarea>
										</div>
										<div>
											<input type="button" id="submit" class="bt sub-btn"
												style="margin-left: 1209px;" value="提交评论">
										</div>
									</div>
								</s:if>
							</div>
						</div>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("p.content-essay").each(function(){
		var content = $(this).text();
		$(this).html(content);
	});
})
</script>
<script type="text/javascript">
	$("i#icon-s").hover(function() {
		$("#icon-c").show();
		$("#icon-s").hide();
	});
	$("#icon-c").hover(function() {
	}, function() {
		$("#icon-c").hide();
		$("#icon-s").show();
	})
	var floorchar;
	var essay_flag;
	var last_comment;
	var flag = true;
	$(".essay")
			.click(
					function() {
						//alert($(this).children().children(".comment").text());
						var index = $(this).children().children("#index")
								.text();
						var header = $(this).children().children(".header")
								.text();
						if(header != essay_flag)
							flag = true;
						if(flag == true){
							var comIndex = $(this).children().children("span").html();
							floorchar = parseInt(comIndex);
							
							flag = false;							
						}
						essay_flag = header;
						var author = $(this).children().children(".info")
								.children("#author").text();
						var date = $(this).children().children(".info")
								.children("#date").text();
						var content = $(this).children().children(".content-essay")
								.html();
						var comment = $(this).children().children(
								"#essay-comments-container").html();
						last_comment =$(this).children().children(
						"#essay-comments-container").children(".comments:last-child");
						var behidden = $("#see-an-essay");
						behidden.children().children("#an-essay-comments")
								.html(comment);
						behidden.children().children("h1").text(header);
						behidden.children().children("p").children(
								"#an-essay-author").text(author);
						behidden.children().children("p").children(
								"#an-essay-date").text(date);
						behidden.children().children("#an-essay-content").html(
								content);

						var container = $("#container");
						container.hide();
						var anesssay = $("#see-an-essay");
						anesssay.show();
					})
	$("#icon-c").click(function() {
		var container = $("#container");
		container.show();
		var anesssay = $("#see-an-essay");
		anesssay.hide();
	})
	$(".sub-btn").click(function() {
			$.ajax({
			type : "GET",
			url : "comment-submit",
			data : {
				comment : $("#com-text").val(),
				header : $("#an-essay-header").text()
			},
			success : function(msg) {
				floorchar += 1;				
				var author = $("#login-acc").text();
				var now = new Date();
				var year = now.getFullYear() - 2000;
				var month = now.getMonth() + 1;
				var day = now.getDate();
				var date_string = year + "-" + month + "-" +day;
				var comment = $("textarea").val();
				if (msg == "OK") {
					
					$("textarea").val("");
					$(".comments :last").append("<div class='comments'>"+
							"<span id='index' style='display: none;'>"+
							index +"</span>"+
					"<span id='floor' style='font-size: 14px;'>第"+ floorchar +
							"楼"+
					"</span>"+
					"<p style='font-size: 10px; color: #aaa;' class='info'>"+
						"作者:<span id='author'>"+author+
								"</span>&nbsp;&nbsp; 时间:<span"+
							"id='date'>"+ date_string +"</span>"+
					"</p>"+
					"<p id='content'>" + comment + "</p>"+
					"<hr>"+
				"</div>");
					last_comment.append("<div class='comments'>"+
							"<span id='index' style='display: none;'>"+
							index +"</span>"+
					"<span id='floor' style='font-size: 14px;'>第"+ floorchar +
							"楼"+
					"</span>"+
					"<p style='font-size: 10px; color: #aaa;' class='info'>"+
						"作者:<span id='author'>"+author+
								"</span>&nbsp;&nbsp; 时间:<span"+
							"id='date'>"+ date_string +"</span>"+
					"</p>"+
					"<p id='content'>" + comment + "</p>"+
					"<hr>"+
				"</div>")
				} else {
					alert(msg);
					alert("shibai");
				}
			}
		})
	})
	
</script>
</html>