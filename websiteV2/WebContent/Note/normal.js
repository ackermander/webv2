window.onload = function(){
			var maxwidth = $(window).width();
			var other = window.screen.width;
			var head_main_width = $("#head_main");
			$(function(){
				var height;
				if($(window).height() < 705)
					height = 705;
				else
					height = $(window).height();
				if($(window).width() < 1366){
					head_main_width.css("width", 1380 + "px");
				}
			//	$("#mainContent").css("height", height + "px");
			//	$("#secondContent").css("height", height + "px");
				$(window).resize(function(){
					if($(window).width() < 1366){
						head_main_width.css("width", 1380 + "px");
					} else {
						head_main_width.css("width", "100%");
					}
					for(var i = 0; i < $("canvas").size(); i++) {
           				$("canvas")[i].height = $(window).height();
           				$("canvas")[i].width = $(window).width();
           				
					}
				});
      		});

		}