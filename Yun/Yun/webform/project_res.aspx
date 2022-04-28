<%@ Page Title="发布项目" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="project_res.aspx.cs" Inherits="Yun.webform.project_res" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StyleSheet" runat="server">

    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <script type="text/javascript" src="../Scripts/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>

	<style>
		/* 隐藏导航 */
		#had_b{
			display:none;
		}
		/* 本页面的css */
		#center .content{
			border: 1px solid rgb(231,231,231);
			border-radius: 10px;
		}
		#center .content .content-title{
			border-bottom: 1px dashed rgb(231,231,231);
			padding: 15px 40px;
			font-size: 20px;
		}
	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<div id="center" style="background-color: rgb(249,249,249);">
		<div class="container">
			<div class="col-md-12" style="padding: 0px;margin: 60px 0px 200px 0px;background-color: white;border-radius: 10px;">
				<div class="content">
					<div class="content-title">
						<span>发起项目</span>
					</div>
					<div style="overflow: hidden;">
						<div class="col-md-4" style="float: left;">
							<img src="../img/tree.png" />
						</div>
						<div class="content-word col-md-8" style="font-size: 20px;padding: 30px;">
							<i style="font-size: 35px;">如果你有一个<span style="color: red;">真诚的心</span></i>
							<br>
							<i style="font-size: 40px;">那么请在这里发起<span style="color: red;">你的梦想</span></i>
							<br>
							<p style="padding-top: 30px;">云筹网是一家可以帮助您实现梦想的网站，在这里您可以发布您的梦想、
							   创意和创业计划，并通过网络平台面对公众集资，让有创造力的人可能获得他们所需要的资金，以便使他们的梦想有可能实现。
							</p>
							<p style="padding-top: 30px;">
								&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="立即发起项目" class="btn btn-danger" OnClick="Btn_pro_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" checked="checked">&nbsp;<span style="font-size: 15px;">阅读并同意众筹网的《<span style="color: red;">服务协议</span>》&nbsp;&nbsp;&nbsp;&nbsp;《<span style="color: red;">众筹公告</span>》</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</asp:Content>
