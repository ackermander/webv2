$(function(){
	var flag = false;
	$("#name").blur(function(){
		var reg = /^[a-z0-9_-]{3,16}$/;
		var name = this.value;
		if(reg.test(name) == true){
			$.ajax({
				type:"POST",
				url:"check",
				data:{username:$("#name")[0].value},
				success:function(msg){
					if(msg == "OK"){
						$("<p id='text'>这个用户名已经被注册了.</p>").replaceAll("#text");
						$("#name").css("border-color", "red");
						flag = false;
					}else{
						$("<p id='text'>可以使用的一个用户名.</p>").replaceAll("#text");
						$("#name").css("border-color", "#03c")
						flag = true;
					}
				}
			})
		}else{
			$("<p id='text'>用户名应该大于3个字节小于18个字节.</p>").replaceAll("#text");
			flag = false;
		}
	})
	$("#reg").click(function(){
		if(!flag || !flag_word || !flag_confirm){
			$("<p id='text'>请输入正确的信息.</p>").replaceAll("#text");
			return false;
		}else{
			return true;
		}
	})
	var flag_word = false;
	$("#word").keyup(function(){
		var word = $("#word").val();
		var reg = /^[a-z0-9_-{};':",.]{6,18}$/;
		if(reg.test(word) != true){
			flag_word = false;
			$("<p id='text'>密码应该大于6位小于18位,且不包含特殊字符如/~?[]等.</p>").replaceAll("#text");
		}else{
			flag_word = true;
			$("<p id='text'></p>").replaceAll("#text");
		}
	})
	var flag_confirm = false;
	$("#conf").keyup(function(){
		var conf = $(this).val();
		var pswd = $("#word").val();
		if(conf == pswd){
			flag_confirm = true;
			$("<p id='text'></p>").replaceAll("#text");
		}else{
			flay_confirm = false;
			$("<p id='text'>确认密码和密码不一致了</p>").replaceAll("#text");
		}
	})
	var flag_nike = true;
	$("#nike").keyup(function(){
		var nike = $("#nike").val();
		var reg = /^[^$\s\[\]]{3,9}$/;
		if(word.length < 3){
			alert("no")
		}
		if(reg.test(nike) != true){
			flag_nike = false;
			$("<p id='text'>不要使用特殊的字符作为昵称,你又不是很可爱.</p>").replaceAll("#text");
		}else{
			flag_nike = true;
			$("<p id='text'>这个昵称可以哦.</p>").replaceAll("#text");
		}
	})
})