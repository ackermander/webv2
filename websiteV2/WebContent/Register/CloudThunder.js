$(function(){
			var canvas_1 = $("canvas")[4];
			var canvas_2 = $("canvas")[2];
			var canvas_3 = $("canvas")[0];
			var brush_1 = canvas_1.getContext("2d");
			var brush_2 = canvas_2.getContext("2d");
			var brush_3 = canvas_3.getContext("2d");
			canvas_1.width = $(window).width();
			canvas_1.height = 110;
			canvas_2.width = $(window).width();
			canvas_2.height = 110;
			canvas_3.width = $(window).width();
			canvas_3.height = 110;
			var cloudLay_1 = [];
			var cloudLay_2 = [];
			var cloudLay_3 = [];
			var canvas_4 = $("canvas")[1];
			var canvas_5 = $("canvas")[3];
			canvas_4.width = $(window).width();
			canvas_4.height = 110;
			canvas_5.width = $(window).width();
			canvas_5.height = 110;
			var brush_4 = canvas_4.getContext("2d");
			var brush_5 = canvas_5.getContext("2d");
			$(window).resize(function(){
					canvas_1.width = $(window).width();
					canvas_1.height = 110;
					canvas_2.width = $(window).width();
					canvas_2.height = 110;
					canvas_3.width = $(window).width();
					canvas_3.height = 110;
				})
			var resultRad_1 = 0;
			var resultRad_2 = 0;
			for(var i = 0; i < 300; i++){
				if(i == 0){
					cloudLay_1.push({
						"center":{
							"x": 0,
							"y": 0
						},
						"radius": Math.round(Math.random() * 10000 % 40 + 10)
					});
					cloudLay_2.push({
						"center":{
							"x": 0,
							"y": 10
						},
						"radius": Math.round(Math.random() * 10000 % 50 + 10)
					});
					cloudLay_3.push({
						"center":{
							"x": 0,
							"y": 20
						},
						"radius": Math.round(Math.random() * 10000 % 60 + 10)
					});
				}else{
					cloudLay_1.push({
						"center":{
							"x": cloudLay_1[i-1].center.x + cloudLay_1[i-1].radius,
							"y": 0
						},
						"radius": Math.round(Math.random() * 10000 % 40 + 10)
					});
					cloudLay_2.push({
						"center":{
							"x": cloudLay_2[i-1].center.x + cloudLay_2[i-1].radius,
							"y": 10
						},
						"radius": Math.round(Math.random() * 10000 % 50 + 10)
					});
					cloudLay_3.push({
						"center":{
							"x": cloudLay_3[i-1].center.x + cloudLay_3[i-1].radius,
							"y": 20
						},
						"radius": Math.round(Math.random() * 10000 % 60 + 10)
					});
					resultRad_1 += cloudLay_1[i].radius;
					resultRad_2 += cloudLay_3[i].radius;
				}
			}
			var PaintFunc_1 = function(){
				//被注释掉的方法是不合标准的.
				// $(cloudLay_1).each(function(){
				// 	var obj = this;
				// 	brush_1.beginPath();
				// 	brush_1.shadowBlur = 20;
				// 	brush_1.shadowColor = "#444";
				// 	brush_1.arc(obj.center.x, obj.center.y, obj.radius, 0, Math.PI);
				// 	brush_1.fillStyle = "#444";
				// 	brush_1.fill();
				// 	brush_1.closePath();
				// })	
				brush_1.clearRect(0, 0, $(window).width(), $(window).height());
				brush_1.beginPath();
				for(var i = 0; i < 300; i++){
					// brush_1.globalAlpha = .7;
					brush_1.arc(cloudLay_1[i].center.x, cloudLay_1[i].center.y, cloudLay_1[i].radius, 0, Math.PI);
					//不能使用 $(window).width()
					//吧所有的半径相加减去最小半径.
					if(cloudLay_1[i].center.x <= resultRad_1 - 50){
						cloudLay_1[i].center.x += .6;
					} else {
						cloudLay_1[i].center.x = -50;
					}
				}
				brush_1.shadowColor = "#000";
				brush_1.shadowBlur = 20;
				brush_1.fillStyle = "#444";
				brush_1.fill();
				brush_1.closePath();
			}
			var PaintFunc_2 = function(){
				brush_2.clearRect(0, 0, $(window).width(), $(window).height());
				brush_2.beginPath();
				for(var i = 0; i < 300; i++){
					// brush_2.globalAlpha = .7;
					brush_2.arc(cloudLay_2[i].center.x, cloudLay_2[i].center.y, cloudLay_2[i].radius, 0, Math.PI);
					if(cloudLay_2[i].center.x >= -60){
						cloudLay_2[i].center.x -= .3;
					}else{
						cloudLay_2[i].center.x = $(window).width() + 60;
					}
				}
				brush_2.shadowColor = "#000";
				brush_2.shadowBlur = 20;
				brush_2.fillStyle = "#444";
				brush_2.fill();
				brush_2.closePath();
			}
			var PaintFunc_3 = function(){
				brush_3.clearRect(0, 0, $(window).width(), $(window).height());
				brush_3.beginPath();
				for(var i = 0; i < 300; i++){
					// brush_3.globalAlpha = .8;
					// brush_3.arc(100, 0, 100, 0, Math.PI);
					brush_3.arc(cloudLay_3[i].center.x, cloudLay_3[i].center.y, cloudLay_3[i].radius, 0, Math.PI);
					if(cloudLay_3[i].center.x <= resultRad_2 - 70){
						cloudLay_3[i].center.x += .1;
					} else {
						cloudLay_3[i].center.x = -70;
					}
				}
				brush_3.shadowColor = "#000";
				brush_3.shadowBlur = 20;
				brush_3.fillStyle = "#444";
				brush_3.fill();
				brush_3.closePath();
			}
			
			var interval_2 = setInterval(function(){PaintFunc_1();}, 1000/60);
			var interval_3 = setInterval(function(){PaintFunc_2();}, 1000/60);
			var interval_4 = setInterval(function(){PaintFunc_3();}, 1000/60);
		})