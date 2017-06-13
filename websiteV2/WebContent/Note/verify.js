$(function() {
	var flag_partVer = false;

	// $("#ur").focusout(function(){
	// $.ajax({
	// type:"GET",
	// url:"./UsernameVerServlet",
	// data:{signin:"partVerify",username:$("#ur")[0].value},
	// success:function(msg){
	// if(msg == "POK"){
	// flag_partVer = true;
	// }
	// }
	// });
	// });
	$("#sign").click(function() {
		$.ajax({
			type : "GET",
			url : "./UsernameVerServlet",
			data : {
				signin : "partVerify",
				username : $("#ur")[0].value
			},
			success : function(msg) {
				if (msg = "POK") {
					return true;
				} else {
					alert("您输入的账号或者密码有错.")
					return false;
				}
			}
		});
		return false;
	})
})