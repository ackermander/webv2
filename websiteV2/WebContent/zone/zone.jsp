<%@page import="ce.acmd.things.clazz.simple.account.SimpleAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="../jquery-1.12.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#mask").focus(function(){
		var title_text = $(this).val();
		if(title_text == ""||title_text == null){
			$(".title-hint").hide();
		}
	})
	$("#mask").blur(function(){
		var title_text = $("#mask").val();
		if(title_text == ""||title_text == null){
			$(".title-hint").show();
		}
	})
	
	var html = $("#essay-content").html();
	html = "<p><br></p>";
	$("#essay-content").html(html);
	$("#essay-content").keyup(function(){
		if(event.keyCode == 13 || event.keyCode == 8){
			var inner = $(this).html();
			if(inner == null || inner == "") inner = "<p><br></p>";
			inner = inner.replace(/<div>/g,"<p>");
			inner = inner.replace(/<\/P>/g,"<p>");
			$("#essay-content").html(inner);
			//改变光标位置到文本的最后.
			var range = window.getSelection();
			range.selectAllChildren(this);
			range.collapseToEnd();
		}
	});
	$("#sub").click(function() {
		var text = $("#essay-content").html();
		var title = $("#mask").val();
		$.ajax({
			type:"post",
			url:"essay-submit",
			data:{essay_content:text,essay_title:title},
			success:function(resp){
				if(resp == "OK"){
					alert("ok");
				}
			}
		})
	})
	$(".title-hint").click(function(){
		$("#mask").focus();
	})
	$("#lab-note").click(function(){
		$("#all-comments").hide();
		$("#admin").show();
		$("#lab-note").css("background-color", "#ccc");
		$("#lab-com").css("background-color", "#fff");
	})
	$("#lab-com").click(function(){
		$("#admin").hide();
		$("#all-comments").show();
		$("#lab-com").css("background-color", "#ccc");
		$("#lab-note").css("background-color", "#fff");
	})
})
</script>
<style type="text/css">
	.title-hint{
		position: absolute;
	}
	p{
		margin: 5px 0px;
	}
	.lab{
		margin: 10px auto;
		cursor: pointer;
	}
</style>
<title><s:property value="#session.loginAcc.nikename"/></title>
</head>
<body>
<%
//SimpleAccount simpleAccount = new SimpleAccount();
//simpleAccount.setAuthorityLev(0);
//simpleAccount.setNikename("ackermander");
//session.setAttribute("loginAcc", simpleAccount); 
%>
<s:if test="#session.loginAcc == null ">
	不要擅自闯入他人的空间.即将回到上一页.
<script type="text/javascript">
	$(function(){
		var start = new Date().getTime();
		setInterval(function() {
				end = new Date().getTime() - start;
	if(end > 3000)
		window.history.back(-1);
		}, 1000) 
	})
</script>
</s:if>
<s:else>

<div style="width: 100%">
	<div style="width: 1366px;margin: 0px auto;height: 10px;">
		<div style="width: 350px;height: 10px;margin: 0px 5px;position: fixed;background-color: ;border-radius: 4px;">
			<div style="height: 100px;background-color: ;">
				<div class="lab" id="lab-com" style="background-color: #ccc;">
					管理自己的评论
				</div>
				<s:if test="#session.loginAcc.authorityLev == 0">
					<div class="lab" id="lab-note">
						管理自己的文章
					</div>
				</s:if>
			</div>
		</div>
		<div style="width: 999px;height: 10px;margin: 0px 5px;float: right;background-color: ;border-radius: 4px;">
			<div id="all-comments">
				<s:iterator value="#request.comments" status="stat">
					<div class="a-comment">
						<div id="comment-<s:property value='header'/>-index" style="display: none;">
							<s:property value="#stat.index"/>
						</div>
						<p style="font-size: 10px;color: #aaa;" class="comment-info">时间:<s:property value="date"/></p>
						<p id="comment-<s:property value='header'/>-content"><s:property value="commentContent"/></p>
						<hr>
					</div>
				</s:iterator>
			</div>
			<s:if test="#session.loginAcc.authorityLev == 0">
			<!-- /*** essay manage part only visiable for administrator ***/ -->
			<!-- /*** has been published essays start here ***/ -->
				<div id="admin" style="display: none;">
					<div id="all-essay">
						<s:iterator value="#request.essays" status="stat">
							<div class="published">
								<div id='<s:property value='header'/>'>
									<span id='<s:property value='header'/>-comments-size' style="display:none;"><s:property value="comments.size"/></span> 
									<span id='<s:property value='header'/>-index' style="display:none;">
										<s:property value="#stat.index"/>
									</span>
									<h2 id="<s:property value='header'/>-mask"><s:property value="header"/></h2>
									<p style="font-size: 10px;color: #aaa;" class="info">
										发表时间:<span id="<s:property value='header'/>-date"><s:property value="date"/></span>
									</p>
									<p id="<s:property value='header'/>-content" class="essay-content"><s:property value="content"/></p>
									
								</div>
							</div>
							<hr>
						</s:iterator>
					<!-- /*** has been published essays end here ***/ -->
					</div>
					<!-- /*** 网页的文章提交部分开始 ***/ -->
					<div style="margin-top: 100px;">
						<div id="essay-header-content" style="font-size: 25px;position: relative;text-align: center;">
							<div class="title-hint" style="height:10px; top: ;display: block;left: 70px;color: #ccc;">在这里键入标题</div>
							<input id="mask" type="text" name="title" style="height:30px;font-size: 25px;width: 90%;margin: 0px auto;" >
						</div>
						<div id="write-essay-content" style="margin: 10px 0px;">
							<div id="essay-content" class="edit-div" contenteditable="true" style="heigth: 80px;width: 90%;margin: 0px auto;border-style: solid;border-width: 1px;border-color: #ccc;border-radius: 11px;">
								
							</div>
						</div>
						<div id="submit-content">
							<div id="center-sub" style="margin: 0px auto;width: 90%">
								<input type="button" id="sub" value="sub" style="float: right;">
							</div>
						</div>
					<!-- /*** 网页的文章提交部分结束 ***/ -->
					<!-- /*** Administrator visiable ***/ -->
				</div>
			</s:if>
			</div>
		</div>
	</div>
</div>
</s:else>
</body>
</html>