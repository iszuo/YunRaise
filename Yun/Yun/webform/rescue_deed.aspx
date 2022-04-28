<%@ Page Title="浏览项目" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rescue_deed.aspx.cs" Inherits="Yun.webform.rescue_deed" %>


<asp:Content ID="Content1" ContentPlaceHolderID="StyleSheet" runat="server">

	<script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <link href="../Content/pages/rescue_deed.css" rel="stylesheet" />


    <style>
        #tp ul li a{
            display:block;
            width:60px;
            height:40px;
        }
        #state .state label{
            color:black;
        }
        #state .state:hover{
            text-decoration:none;
        }
        #state .state:hover label{
            color:white;
        }
        .pages {
		    clear: both;
		    text-align: right;
		    float: right;
		}
		.pages a, .pages span {
		    float: left;
		    display: inline-block;
		    height: 34px;
		    line-height: 34px;
		    padding: 0 15px;
		    font-size: 12px;
		    font-weight: bolder;
		    background-color: #F5F5F5;
		    border-radius: 200px;
		    margin: 0 3px;
		    color: #888;
		}
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

			<div id="center" style="background-color: rgb(230,230,230,);">
			<div class="container">
				<!-- 类别 -->
				<div id="tp" class="col-md-12">
					<ul>
						<li><a href="?tp=全部&state=所有项目&pg=1">全部</a></li>
						<li><a href="?tp=科技&state=所有项目&pg=1">科技</a></li>
						<li><a href="?tp=艺术&state=所有项目&pg=1">艺术</a></li>
						<li><a href="?tp=设计&state=所有项目&pg=1">设计</a></li>
						<li><a href="?tp=音乐&state=所有项目&pg=1">音乐</a></li>
						<li><a href="?tp=影视&state=所有项目&pg=1">影视</a></li>
						<li><a href="?tp=出版&state=所有项目&pg=1">出版</a></li>
						<li><a href="?tp=动漫&state=所有项目&pg=1">动漫</a></li>
						<li><a href="?tp=公益&state=所有项目&pg=1">公益</a></li>
						<li><a href="?tp=公开课&state=所有项目&pg=1">公开课</a></li>
						<li><a href="?tp=农业&state=所有项目&pg=1">农业</a></li>
					</ul>
				</div>
				
				<!-- 项目状态 -->
				<div id="state">
					<div>
                        <a class="state" href="?tp=<%= tpa %>&state=所有项目&pg=1">
                            <label class="btn btn-primary active">
                                所有项目
                            </label>
                        </a>
                        <a class="state" href="?tp=<%= tpa %>&state=众筹中&pg=1">
                            <label class="btn btn-primary active">
                                众筹中
                            </label>
                        </a>
                        <a class="state" href="?tp=<%= tpa %>&state=已成功&pg=1">
                            <label class="btn btn-primary active">
                                已成功
                            </label>
                        </a>
					</div>
				</div>
				 
				<!-- 项目展示 -->
				<div style="position: relative;">
					<ul class="pro_ul" style="padding-bottom:80px;">
						
						<asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li style="width: 255px; height: 455px; list-style-type: none;">
                                <!-- 项目图片 -->
                                <a href="details_page.aspx?title=<%# Eval("Proname") %>">
                                    <img src="<%# Eval("Proimg") %>" width="255px" height="255px" style="border-bottom:1px solid rgb(230,230,230);">
                                </a>
                                <div class="pro_txt_field">
                                    <!-- 项目标题 -->
                                    <a href="details_page.aspx?title=<%# Eval("Proname") %>">
                                        <h4 class="pro_title"><%# Eval("Proname") %></h4>
                                    </a>
                                    <!-- 发布人头像和信息 -->
                                    <div class="author">
                                        <img src="<%# Eval("Portrait") %>" class="au_logo">
                                        <p><%# Eval("Username") %></p>
                                    </div>
                                    <!-- 捐献金额    已捐金额 -->
                                    <div class="status_ex">
                                        <div class="left">
                                            <p class="status_title">&yen;<span><%# Eval("Amount") %></span></p>
                                        </div>
                                        <div class="right">
                                            <p class="right percent"><span><%# Eval("Percentage") %>%</span></p>
                                        </div>
                                    </div>
                                    <!-- 进度条 -->
                                    <div class="yyue_line" style="background-color: rgb(240,240,240);">
                                        <p class="progress-now" pro_id="119082" style="width: <%# Eval("Percentage") %>%;"></p>
                                    </div>
                                    <!-- 项目状态 -->
                                    <div class="gray_ex">
                                        <span><%# Eval("State") %></span>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
						<%--<button id="show_more" type="button" class="btn btn-default">查看更多</button>--%>
                        <%--分页的页码--%>
                        <div id="aa"  runat="server" class="pages" style="margin:20px 29px;position:relative;top:50px;">            
							<a href="?tp=<%= tpa %>&state=<%= state %>&pg=1">首页</a>
                            <!-- 页码 -->
						    <a id="bb" href="?tp=<%= tpa %>&state=<%= state %>&pg=<%= endpg %>">尾页</a>
						</div>


					</ul>
				</div>
				
				<!-- 分页 -->
			</div>
		</div>

    <script>
        $(function () {
            var page = <%= endpg %>             // 总页数
            paging();
            function paging() {
                for (var i = 0; i < page; i++) {
                    var a = i + 1;
                    var $a = "<a href='?tp=<%= tpa %>&state=<%= state %>&pg=" + a + "'>" + a + "</a>";
                    $("#bb").before($a);
                }
            }
        })
    </script>



</asp:Content>
