$(function(){
			var canvas1 = $("canvas").get(0);
			canvas1.width =document.body.clientWidth;
			canvas1.height = $(window).height();
			var canvas2 = $("canvas").get(1);
			canvas2.width = $(window).width();
			canvas2.height = $(window).height();
			var canvas3 = $("canvas").get(2);
			canvas3.width = $(window).width();
			canvas3.height = $(window).height();
			var draw1 = canvas3.getContext("2d");
			var draw2 = canvas2.getContext("2d");
			var draw3 = canvas1.getContext("2d");
			var count1 = 1;
			var count2 = 3;
			var count3 = 5;
			var circles3 = [];
			var circles2 = [];
			var circles1 = [];
			while(count3 --) {
				circles3.push({
					"position":{
						"x":Math.round(Math.random() * 1000000) % ($(window).width() * 1),
						"y":Math.round(Math.random() * 1000000) % ($(window).height() * 1)
					},
					"radius":Math.round(Math.random() * 1000) % 20 + 25,
					"count":0
				});
			}
			while(count2 --) {
				circles2.push({
					"position":{
						"x":Math.round(Math.random() * 1000000) % ($(window).width() * 1),
						"y":Math.round(Math.random() * 1000000) % ($(window).height() * 1)
					},
					"radius":Math.round(Math.random() * 1000) % 20 + 25,
					"count":0
				});
			}
			while(count1 --) {
				circles1.push({
					"position":{
						"x":Math.round(Math.random() * 1000000) % ($(window).width() * 1),
						"y":Math.round(Math.random() * 1000000) % ($(window).height() * 1)
					},
					"radius":Math.round(Math.random() * 1000) % 20 + 25,
					"count":0
				});
			}
			var drawCirFun = function(e, cir, obj) {
				e.clearRect(obj.position.x - obj.count, obj.position.y - obj.count, 2 * obj.count, 2 * obj.count);
				e.beginPath();
				e.arc(obj.position.x, obj.position.y, obj.count, 0, 2 * Math.PI);
				obj.count += 0.5;
				e.globalAlpha = 1 - (obj.count/obj.radius);
				if(obj.count == obj.radius) {
					obj.count = 0;
					e.fillStyle = "rgba(" + 255 + "," + 255 + "," + 255 + ",1)";
					e.fill();
					e.closePath();
					obj.position.x = Math.round(Math.random() * 1000000) % ($(window).width() * 1);
					obj.position.y = Math.round(Math.random() * 1000000) % ($(window).height() * 1);
					obj.radius = Math.round(Math.random() * 1000) % 20 + 25;
				}
				e.fillStyle = "rgba(" + 255 + "," + 255 + "," + 255 + ",1)";
				e.fill();
				e.closePath();
			}
			var CanvasFun1 = function() {
				draw1.clearRect(0, 0,  $(window).width(), $(window).height());
				$(circles1).each(function(){
					var obj = this;
					var cir = setInterval(function(){drawCirFun(draw1, cir, obj);}, 1000/15);
				})
				
			}
			var CanvasFun2 = function(){
				draw2.clearRect(0, 0, $(window).width(), $(window).height());
				$(circles2).each(function(){
					var obj = this;
					var cir = setInterval(function(){drawCirFun(draw2, cir, obj);}, 1000/15);
				})
			}
			var CanvasFun3 = function(){
				draw3.clearRect(0, 0, $(window).width(), $(window).height());
				$(circles3).each(function(){
					var obj = this;
					var cir = setInterval(function(){drawCirFun(draw3, cir, obj);}, 1000/15);
				})
			}
			CanvasFun1();
			CanvasFun2();
			CanvasFun3();
});