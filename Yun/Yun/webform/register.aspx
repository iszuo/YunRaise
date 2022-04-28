<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Yun.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云筹网 - 注册</title>
    <link href="../layer/theme/default/layer.css" rel="stylesheet" />
    <script src="../layer/layer.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link rel="icon" href="../img/云筹网Logo_lg2.png" type="image/gif" />

    
    <link href="../Content/pages/register.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <!-- 顶部 -->
		<div id="register_top">
			<div class="container">
				<div class="col-md-6 register_top_left">
					<a href="index.aspx">
						<img src="../img/200，80.png" />
					</a>
				</div>
				<div class="col-md-6 register_top_right">
					<span>已有账号 <a href="login.aspx">直接登录</a></span>
				</div>
			</div>
		</div>
		<!-- 中间 -->
		<div id="register_center">
			<div class="container">
				<!-- 轮播 -->
				<div class="col-md-5">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							<!-- 图片 -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="../img/log_reg/slide_new_1.png" />
								</div>
								<div class="item">
									<img src="../img/log_reg/slide_new_2.png" />
								</div>
								<div class="item">
									<img src="../img/log_reg/slide_new_3.png" />
								</div>
							</div>
						</div>
				</div>
				
				<!-- 注册表单 -->
				<div class="col-md-7">
					<div class="register_menu">
						<p class="register_title">
							用户注册
						</p>
						<p>
							昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：<input runat="server" type="text" name="" id="name" value="" placeholder="请输入昵称" />
							<label id="name_msg" runat="server"></label>
						</p>
						<p>
							电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input runat="server" type="text" name="" id="tel" value=""  placeholder="请输入账号"/>
							<label id="tel_msg" runat="server"></label>
						</p>
						<p>
							邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input runat="server" type="text" name="" id="email" value=""  placeholder="请输入邮箱"/>
							<label id="eml_msg" runat="server"></label>
						</p>
						<p>
							密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input runat="server" type="password" name="" id="pwd" value=""  placeholder="请输入密码"/>
							<label id="pwd_msg" runat="server"></label>
						</p>
						<p>
							确认密码：<input runat="server" type="password" id="pwd2" value=""  placeholder="请再次输入密码"/>
							<label id="pwd2_msg" runat="server"></label>
						</p>
						<p>
							验&nbsp;&nbsp;证&nbsp;&nbsp;码：<input runat="server" type="password" id="Verify" value=""  placeholder="请输入验证码" style="width:110px;"/>
							<asp:LinkButton ID="LinkButton1" runat="server" Style="position:relative;left:10px;">
								<img src="../Verify.ashx" width="100" />
							</asp:LinkButton>
						</p>
						<p>
							<asp:Button ID="Button1" runat="server" Text="点 击 注 册" class="btn btn-primary btn-reg" OnClick="Register_Click" />
						</p>
						<span>
							<input type="checkbox" checked="checked" name="" id="" value="" />阅读并同意云筹网的《<a id="protocol" href="#" style="color: green;">服务协议</a>》
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div id="register_bottom">
			<span>&copy;河北投资有限公司&nbsp;&nbsp;yunchou.com 版权所有 冀ICP备149821932号</span>
		</div>
    </form>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$("#name").blur(function(){
			CheckName();
		})
        $("#tel").blur(function(){
            CheckTel();
		})
        $("#email").blur(function () {
            CheckEmail();
        })
		$("#pwd").blur(function(){
			CheckPwd();
		})
		$("#pwd2").blur(function(){
			CheckPwd2();
		})
		
		// 昵称
		function CheckName(){
			if($("#name").val().trim() == ""){
				$("#name_msg").text("昵称不能为空！");
				return false;
			}else if($("#name").val().trim().length < 2){
				$("#name_msg").text("昵称长度必须大于2位！");
			}else{
				$("#name_msg").text("");
				return true;
			}
		}
		
		// 电话
		function CheckTel() {
			var tel_reg = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
            if($("#tel").val().trim() == ""){
                $("#tel_msg").text("电话不能为空！");
				return false;
			} else if (!tel_reg.test($("#tel").val().trim())) {
                $("#tel_msg").text("请输入正确的手机号！");
				return false;
			}else{
                $("#tel_msg").text("");
				return true;
			}
		}

		// 邮箱
		function CheckEmail() {
            if ($("#email").val().trim() == "") {
                $("#eml_msg").text("邮箱不能为空！");
                return false;
            } else {
                $("#tel_msg").text("");
                return true;
            }
        }



		// 密码
		function CheckPwd(){
			if($("#pwd").val().trim() == ""){
				$("#pwd_msg").text("密码不能为空！");
				return false;
			}else if($("#pwd").val().trim().length < 6){
				$("#pwd_msg").text("密码长度必须大于6位！");
				return false;
			}else{
				$("#pwd_msg").text("");
				return true;
			}
		}

		// 确认密码
		function CheckPwd2(){
			if($("#pwd2").val().trim() == ""){
				$("#pwd2_msg").text("确认密码不能为空！");
				return false;
			}else if($("#pwd2").val().trim() != $("#pwd").val().trim()){
				$("#pwd2_msg").text("两次密码不符！");
				return false;
			}else{
				$("#pwd2_msg").text("");
				return true;
			}
		}
		
		// 判断验证是否通过
		 $("#form1").submit(function(e){
             if (CheckName() & CheckTel() & CheckPwd() & CheckPwd2()){
                
		 	}else{
		 		return false;
		 	}
		 })
	})
</script>
