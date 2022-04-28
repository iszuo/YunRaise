<script type="text/javascript">
    window.location = function(){
		// 显示按钮
	var btn1 = document.getElementById('aside-buttons');
			window.onscroll = function(){
				var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
				if(scrollTop>500){
		btn1.style.display = 'block';
				}else{
		btn1.style.display = 'none';
				}
			}
			// 一键返回顶部
			var btn2 = document.getElementById('returnTop');
			btn2.onclick = function(){
		document.body.scrollTop = 0;
				document.documentElement.scrollTop = 0;
			}
			// 显示客服
			$(".kefu_inlet").mouseover(function(){
		$(".img_vx").css("display", "block");
			})
			$(".kefu_inlet").mouseout(function(){
		$(".img_vx").css("display", "none");
			})
    }

</script>