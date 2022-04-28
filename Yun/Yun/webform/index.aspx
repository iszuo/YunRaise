<%@ Page Title="首页" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Yun._Default" %>

<asp:Content ID="StyleContent" ContentPlaceHolderID="StyleSheet" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <link href="../Content/pages/index.css" rel="stylesheet" />
    <style>
        #show_more {
            width: 500px;
            height: 50px;
            position: absolute;
            bottom: 0px;
            left: 350px;
            margin-bottom: 40px;
            font-size: 20px;
            letter-spacing: 15px;
            padding:0px;
        }

            #show_more:hover {
                background-color: rgb(200,200,200);
                color: white;
                box-shadow: 0xp 0px 5px 0px rgb(200,200,200);
                transition: all .2s linear;
            }
            #show_more:hover a{
                text-decoration:none;
            }
        #show_more a{
             display:block;
             width:500px;
             height:50px;
             text-align:center;
             line-height:50px;
             color:black
        }

    </style>


</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="center" style="background-color: rgb(230,230,230,);">
        <div class="container">
            <!-- 轮播图 -->
            <div id="Rim">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../img/pic/carousel_img1.jpg" width="1142px">
                        </div>
                        <div class="item">
                            <img src="../img/pic/carousel_img2.jpg" width="1142px">
                        </div>
                        <div class="item">
                            <img src="../img/pic/carousel_img3.jpg" width="1142px">
                        </div>
                        <div class="item">
                            <img src="../img/pic/carousel_img4.jpg" width="1142px">
                        </div>
                        <div class="item">
                            <img src="../img/pic/carousel_img5.jpg" width="1142px">
                        </div>
                        <div class="item">
                            <img src="../img/pic/carousel_img6.jpg" width="1142px">
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

            <!-- 项目展示 -->
            <div id="item_show" style="position: relative;">
                <h3>热门项目</h3>
                <ul class="pro_ul" style="padding-bottom:130px;">
                    <%--展示项目--%>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li style="width: 255px; height: 455px; list-style-type: none;">
                                <!-- 项目图片 -->
                                <a href="details_page.aspx?title=<%# Eval("Proname") %>">
                                    <img src="<%# Eval("Proimg") %>">
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
						<button id="show_more" type="button" class="btn btn-default show_more" style="padding:0px;">
                            <a href="rescue_deed.aspx?tp=全部&state=所有项目&pg=1">查看更多</a>
						</button>
                </ul>
            </div>

            <!-- 底部信息展示 -->
            <div id="msg_show">
                <h3 style="margin: 25px; font-weight: 600;">我们已经做到···</h3>
                <!-- 左 -->
                <div id="msg_show_left" class="col-md-8">
                    <div class="col-md-4">
                        <img src="../img/bottom/left/bottom_money.png" />
                        <h2>6,276,680元</h2>
                        <h5>爱情保险</h5>
                    </div>
                    <div class="col-md-4">
                        <img src="../img/bottom/left/bottom_hour.png" />
                        <h2>2小时</h2>
                        <h5>湖北首个众筹项目路演会…</h5>
                    </div>
                    <div class="col-md-4">
                        <img src="../img/bottom/left/bottom_people.png" />
                        <h2>39569人</h2>
                        <h5>2013快乐男生主题电…</h5>
                    </div>
                </div>
                <!-- 右 -->
                <div id="msg_show_right" class="col-md-4">
                    <div>
                        <img src="../img/bottom/right/right_1.png" />
                        <div>
                            <h5>项目总数</h5>
                            <h3 style="color: rgb(238,94,86);"><%= num1 %>个</h3>
                        </div>
                    </div>
                    <div>
                        <img src="../img/bottom/right/right_2.png" />
                        <div>
                            <h5>累计支持人</h5>
                            <h3 style="color: rgb(169,143,172);"><%= num2 %>人</h3>
                        </div>
                    </div>
                    <div>
                        <img src="../img/bottom/right/right_3.png" />
                        <div>
                            <h5>累计筹资金额</h5>
                            <h3 style="color: rgb(254,163,74);">&yen;<%= num3 %>元</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
