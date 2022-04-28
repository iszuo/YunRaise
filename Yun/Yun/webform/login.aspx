<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Yun.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云筹网 - 登录</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link rel="icon" href="../img/云筹网Logo_lg2.png" type="image/gif" />

    
    <link href="../Content/pages/login.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <!-- 顶部 -->
		<div id="login_top">
			<div class="container">
				<div class="col-md-6 login_top_left">
					<a href="index.aspx">
                        <img src="../img/200，80.png" />
					</a>
				</div>
				<div class="col-md-6 login_top_right">
					<span>还没有账号？立即 <a href="register.aspx">免费注册</a></span>
				</div>
			</div>
		</div>
		<!-- 中间 -->
		<div id="login_center">
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
					<div class="login_menu">
						<p class="login_title">
							用户登录
						</p>
						<p>
							<i class="fa fa-user" aria-hidden="true"></i>
							<input runat="server" type="text" name="" id="account" value=""  placeholder="请输入账号"/>
							<label runat="server" id="account_msg"></label>
						</p>
						<p>
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input runat="server" type="password" name="" id="pwd" value=""  placeholder="请输入密码"/>
							<label runat="server" id="pwd_msg"></label>
						</p>
						
						<p style="margin: 10px 30px 15px 100px;">
							<asp:Button ID="Button1" runat="server" Text="点 击 登 录" class="btn btn-primary btn-reg" OnClick="Login_Click" />
						</p>
						<span>
							<input type="checkbox" checked="checked" name="" id="" value="" />阅读并同意云筹网的《<a id="protocol" href="#" style="color: green;">服务协议</a>》
						</span>
						<span style="position: absolute;bottom: 20px;left: 100px;">
						</span>
						<span>
							<a href="findpwd.aspx" id="forget-pwd" style="position: relative;left: 175px;top: 10px;display: block;color: gray;width: 4em;">忘记密码</a>
						</span>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="login_bottom">
			<span>&copy;河北投资有限公司&nbsp;&nbsp;yunchou.com 版权所有 冀ICP备149821932号</span>
		</div>
    </form>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$("#account").blur(function(){
			CheckAccount();
		})
		$("#pwd").blur(function(){
			CheckPwd();
		})
		
		
		// 电话
		function CheckAccount(){
			if($("#account").val().trim() == ""){
				$("#account").addClass("warning");
				$("#account-msg").text("用户名/账号不能为空！");
				return false;
			}else {
				$("#account").removeClass("warning");
				$("#account").addClass("success");
				$("#account-msg").text("");
				return true;
			}
		}
		
		// 密码
		function CheckPwd(){
			if($("#pwd").val().trim() == ""){
				$("#pwd").addClass("warning");
				$("#pwd-msg").text("密码不能为空！");
				return false;
			}else{
				$("#pwd").removeClass("warning");
				$("#pwd").addClass("success");
				$("#pwd-msg").text("");
				return true;
			}
		}
	})
</script>