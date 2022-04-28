<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="findpwd.aspx.cs" Inherits="Yun.webform.findpwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云筹网 - 找回密码</title>
    <link rel="icon" href="../img/云筹网Logo_lg2.png" type="image/gif" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/pages/findpwd.css" rel="stylesheet" />
    <link href="../Content/pages/findpwd.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <!-- 顶部 -->
		<div id="register_top">
			<div class="container">
				<div class="col-md-6 register_top_left">
					<a href="index.aspx">
						<img src="../img/200，80.png">
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
									<img src="../img/log_reg/slide_new_1.png" >
								</div>
								<div class="item">
									<img src="../img/log_reg/slide_new_2.png" >
								</div>
								<div class="item">
									<img src="../img/log_reg/slide_new_3.png" >
								</div>
							</div>
						</div>
				</div>
				<!-- 注册表单 -->
				<div class="col-md-7">
					<div class="register_menu">
						<p class="register_title">
							找回密码
						</p>
						<p>
							电&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" id="phone" placeholder="请输入手机号" runat="server" />
						</p>
						
						<p>
							邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" id="email"  placeholder="请输入邮箱号" runat="server"/>
						</p>
						<p>
							新密码：<input type="password" id="newpwd"  placeholder="请输入新密码" runat="server"/>
						</p>
						<p>
							验证码：<input type="text" id="verifycode" placeholder="请输入验证码" style="width: 120px;" runat="server"/>
							<asp:Button ID="send" runat="server" Text="点击发送" class="btn btn-success" style="position: relative;left: 20px;" OnClick="send_Click" />
						</p>
						<p>
							<asp:Button ID="update" runat="server" Text="点 击 修 改" class="btn btn-primary btn-reg" OnClick="update_Click" />
						</p>
						<span>
							<input type="checkbox" checked="checked" name="" id="" />阅读并同意云筹网的《<a id="protocol" href="#" style="color: green;">服务协议</a>》
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
