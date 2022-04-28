<%@ Page Title="我的众筹" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyGive.aspx.cs" Inherits="Yun.webform.MyGive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSheet" runat="server">

    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/pages/mygive.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<div id="center" style="background-color: rgb(245,245,245); border-bottom: 1px solid rgb(200,200,200);">
        <div class="container">
            <div style="margin-top: 70px; margin-bottom: 30px;">
                <h1>我的众筹</h1>
            </div>

            <!-- 头像+信息 -->
            <div style="height: 250px;">
                <div class="col-md-3" id="give_pic">
                    <asp:Image ID="UserPic" runat="server" style="width:200px;height:200px;" />
                </div>
                <div id="give_msg" class="col-md-9">
                    <h3 runat="server" id="UserName"></h3>
                    <p>性别：<span runat="server" id="UserSex"></span></p>
                    <p>个人说明：<span runat="server" id="UserText"></span></p>
                    <p>所在地区：<span runat="server" id="UserAddress" ></span></p>
                </div>
            </div>

            <!-- 亮个导航 -->
            <div id="give_nav">
                <div id="give_start" class="col-md-6 start_up">
                    发起的项目
                </div>
                <div id="give_up" class="col-md-6 up_start">
                    支持的项目
                </div>
            </div>
        </div>
    </div>

    <!-- 发起的项目 -->
    <div id="center_a" class="center_ab" style="display: block;">
        <div class="container">
            <!-- 众筹状态 -->
            <div class="col-md-12 btn_a" style="height: 80px;">
                <asp:Button ID="ever" runat="server" Text="所有" OnClick="ever_Click" />
                <asp:Button ID="ing" runat="server" Text="众筹中" OnClick="ing_Click" />
                <asp:Button ID="success" runat="server" Text="已完成" OnClick="success_Click" />
                <asp:Button ID="feil" runat="server" Text="已失败" OnClick="feil_Click" />
            </div>
            
            <!-- 标题 -->
            <div id="gv_a_title" class="col-md-12">
                <div class="col-md-5">项目名称</div>
                <div class="col-md-2">发布日期</div>
                <div class="col-md-2">截止日期</div>
                <div class="col-md-1">目标</div>
                <div class="col-md-1">进度</div>
                <div class="col-md-1">状态</div>
            </div>

            <!-- 内容 -->
            <div>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div id="gv_a_content" class="col-md-12">
                            <div class="col-md-1">
                                <img src="<%# Eval("Proimg") %>" width="100px" height="100px">
                            </div>
                            <div class="col-md-4">
                                <span style="position:relative;left:30px;">
                                    <%# Eval("Proname") %>
                                </span>
                            </div>
                            <div class="col-md-2">
                                <span>
                                    <%# Eval("StartTime") %>
                                </span>
                            </div>
                            <div class="col-md-2">
                                <span>
                                    <%# Eval("EndTime") %>
                                </span>
                            </div>
                            <%--项目需要筹集的金额--%>
                            <div class="col-md-1" style="position: relative;">
                                <span id="SumMoney" class="gv_a_content_money_a" runat="server"><%# Eval("Amount") %></span>
                                <span class="gv_a_content_money_b">元</span>
                            </div>
                            <%--已捐献金额--%>
                            <div class="col-md-1" style="position: relative;">
                                <span class="gv_a_content_btn_a"><span><%# Eval("Donprice") %></span>元</span>
                                <span class="gv_a_content_btn_b"><span><%# Eval("Percentage") %></span>%</span>
                            </div>
                            <div class="col-md-1" style="position: relative;">
                                <a class="gv_a_content_btn_a" href='?title=<%# Eval("Proname") %>'>删除</a>
                                <a class="gv_a_content_btn_b" href="details_page.aspx?title=<%# Eval("Proname") %>">浏览</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        
        </div>
    </div>

    <!-- 支持的项目 -->
    <div id="center_b" class="center_ab" style="display: none;">
        <div class="container">

            <!-- 标题 -->
            <div id="gv_a_title" class="col-md-12" style="margin-top:30px;">
                <div class="col-md-6">项目名称</div>
                <div class="col-md-2">资助日期</div>
                <div class="col-md-2">截止日期</div>
                <div class="col-md-1">目标</div>
                <div class="col-md-1">资助金额</div>
                
            </div>

            <!-- 内容 -->
             <div>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div id="gv_a_content" class="col-md-12">
                            <div class="col-md-1">
                                <img src="<%# Eval("Proimg") %>" width="100px" height="100px">
                            </div>
                            <div class="col-md-5">
                                <span style="position:relative;left:30px;">
                                    <%# Eval("Proname") %>
                                </span>
                            </div>
                            <div class="col-md-2">
                                <span>
                                    <%# Eval("Dontime") %>
                                </span>
                            </div>
                            <div class="col-md-2">
                                <span>
                                    <%# Eval("EndTime") %>
                                </span>
                            </div>
                            <div class="col-md-1" style="position: relative;">
                                <span class="gv_a_content_money_a"><%# Eval("Amount") %></span>
                                <span class="gv_a_content_money_b">元</span>
                            </div>
                            <div class="col-md-1" style="position: relative;">
                                    <span class="gv_a_content_money_a" style="left:20px;"><%# Eval("Donprice") %></span>
                                    <span class="gv_a_content_money_b" style="left:75px;">元</span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            // 支持的项目
            $("#give_start").click(function () {
                $(this).addClass("start_up");
                $("#give_up").removeClass("start_up").addClass("up_start");
                $("#center_a").css("display", "block");
                $("#center_b").css("display", "none");
            })

            // 发起的项目
            $("#give_up").click(function () {
                $(this).addClass("start_up");
                $("#give_start").removeClass("start_up").addClass("up_start");
                $("#center_a").css("display", "none");
                $("#center_b").css("display", "block");
            })

        })
    </script>

</asp:Content>
