<%@ Page Title="详细信息" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="details_page.aspx.cs" Inherits="Yun.webform.details_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSheet" runat="server">

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <link href="../Content/pages/details_page.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" OnLoad="Page_Load">
        <ItemTemplate>
            <!-- 项目信息显示 -->
            <div id="center_top" style="background-color: rgb(20,240,240);">

                <div class="container">
                    <!-- 左侧项目主图 -->
                    <div class="col-md-8 short-cut" style="position:relative;">
                        <a href="javascript:void(history.back())">
                            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true" style="font-size:30px;position:absolute;top:10px;"></span>
                        </a>
                        <h3 runat="server" class="title"><span><%# Eval("Proname") %></span></h3>
                        <div class="video">
                            <img id="big_logo" width="100%" src="<%# Eval("Proimg") %>" alt="">
                        </div>
                        <div class="short-intro">
                            <span id="cont_match_short"></span>
                        </div>
                    </div>
                    <!-- 右侧项目状态 -->
                    <div class="col-md-4">
                        <!-- 发起人信息 -->
                        <div class="col-md-12 sponsor-info clearfix" style="margin: 70px 0px 20px 0px;">
                            <div class="col-md-12 " style="position: relative;">
                                <!-- 发起人姓名 -->
                                <span class="team"><%# Eval("Username") %></span>

                                <p class="sponsor-l">发起了这个项目</p>

                                <p class="tags clearfix">
                                    <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                                    项目类别：<span><%# Eval("Type") %></span>
                                </p>
                                <!-- 发起人头像 -->
                                <img src="<%# Eval("Portrait") %>">
                            </div>
                        </div>

                        <!-- 项目状态  -->
                        <div class="col-md-12">
                            <!-- 金额状态 -->
                            <div class="center-top">
                                <!-- 当前已经筹款的金额 -->
                                <div class="col1 project-goal">
                                    <h2>已筹¥<span><%# Eval("Donprice") %></span></h2>

                                    <div class="progress" style="margin: 30px 0px;">
                                        <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="80"
                                            aria-valuemin="0" aria-valuemax="100" style="width: <%# Eval("Percentage") %>%">
                                        </div>
                                    </div>

                                    <p class="txt clearfloat">
                                        <span class="goal-money">目标金额 ¥<span><%# Eval("Amount") %></span></span>
                                        <span class="percent" style="float: right;"><%# Eval("Percentage") %>%</span>
                                    </p>
                                </div>
                                <div class="col2 remain-time" style="margin: 50px 0px;position:relative;">
                                    <h3><%# Eval("Endtime") %></h3>
                                    <p style="margin-top: 9px;">剩余时间</p>
                                </div>
                                <div class="col3 support-people">
                                    <h3><span><%# Eval("Num") %></span>人</h3>
                                    <p style="margin-top: 9px;">支持人数</p>
                                </div>
                            </div>
        </ItemTemplate>
    </asp:Repeater>

    <!-- 项目捐献按钮 -->
    <div class="buttons clearfloat" style="border-bottom: 1px solid black;">


        <!-- 支持按钮 -->
        <button id="zhichi" runat="server" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="display:block;">
            <span class="glyphicon glyphicon-heart" style="color: red;"></span>进行中
        </button>
        <!-- 完成按钮 -->
        <button id="wancheng" runat="server" type="button" class="btn btn-success btn-lg" style="display:none;background-color: #337ab7;">
            <span class="glyphicon glyphicon-heart" style="color: red;"></span>已完成
        </button>
        <!-- 成功按钮 -->
        <button id="chenggong" runat="server" type="button" class="btn btn-info btn-lg" style="display:none;background-color: #5bc0de;">
            <span class="glyphicon glyphicon-heart" style="color: red;"></span>已失败
        </button>
        



        <!-- 提示信息 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">捐款信息</h4>
                    </div>
                    <div class="modal-body" style="margin-left: 50px;">
                        <p>
                            捐款金额：<input id="money" type="text" placeholder="请输入捐款金额" runat="server">
                        </p>
                        <p>
                            联系方式：<input id="phone" type="text" placeholder="请输入您的手机号" runat="server">
                        </p>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="sub" runat="server" Text="提交" class="btn btn-default" OnClick="sub_Click" />
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 分享 -->
    <div id="share" style="height: 40px; padding: 51px 0 51px;">
        <span style="margin-right: 30px; line-height: 40px; font-size: 16px;">分享项目到</span>

        <ul class="bd-share bdsharebuttonbox md-share" style="white-space: nowrap;">
            <li class="weibo">
                <p style="background: rgb(188, 191, 195);"><i class="fa fa-weibo" aria-hidden="true"></i></p>
                <a href="javascript:;" class="bds_tsina tsina icon" data-cmd="tsina" title="分享到新浪微博"></a>
            </li>
            <li class="qq">
                <p style="background: rgb(188, 191, 195);"><i class="fa fa-qq" aria-hidden="true"></i></p>
                <a href="javascript:;" class="bds_sqq qzone icon" data-cmd="qzone" title="分享到QQ好友"></a>
            </li>
            <li class="wechat">
                <p style="background: rgb(188, 191, 195);"><i class="fa fa-weixin" aria-hidden="true"></i></p>
                <a href="javascript:;" class="wechat-share icon" title="分享到微信"></a>
            </li>

        </ul>

    </div>
    </div>

				</div>
			</div>
		</div>

		<!-- 项目详情显示按钮 -->
    <div class="project-nav clearfix">
        <div class="container project-nav-wrap">
            <div class="nav-wrap-inner">
                <ul class="nav-left">
                    <li class="active">项目详情</li>
                </ul>


                <div></div>
            </div>

        </div>
    </div>

    <!-- 项目详情显示 -->
    <div class="project-main" style="margin-bottom: 100px;">
        <div class="container main-wrap clearfix">
            <div id="main-left" class="col-md-8">
                <div class="project-content" id="projectDetail">
                    <h3 class="tit">项目详情</h3>
                    <asp:Repeater ID="Repeater2" runat="server" OnLoad="Page_Load">
                        <ItemTemplate>
                            <div id="cont_match_htmlstr" class="content-wrap html-from-editor">
                                <p><%# Eval("Protext") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>



            <div id="main-right" class="col-md-4">
                <div class="risk-prompt">
                    <h3 class="tit">风险提示</h3>
                    <p class="first">1.点击“确认支付”，即表明您已阅读并同意<a href="#">《支持者协议》</a>及<a href="#">《隐私政策》</a>，并自愿承担众筹相应风险。</p>
                    <p class="short" style="display: none;">
                        <span>2.您参与众筹是支持将创意变为现实的过程，而不是直接的商品交易，因此存在一定风险。请您根据自己的判断选择、支持众筹项目。众筹存在于发起人与支持者... </span>
                        <a href="javascript:;" class="showall">显示全部<i class="iconfont icon-downmore"></i></a>
                    </p>
                    <p class="gt3 active">2.您参与众筹是支持将创意变为现实的过程，而不是直接的商品交易，因此存在一定风险。请您根据自己的判断选择、支持众筹项目。众筹存在于发起人与支持者之间，摩点网作为第三方平台，只提供网络空间、技术支持等服务。众筹的回报产品和承诺由发起人提供和作出，发起者和支持者应依法承担使用摩点产品产生的法律后果。</p>
                    <p class="gt3 active">3.众筹项目的回报发放及其他后续服务事项均由发起人负责。如果发生发起人无法发放回报、延迟发放回报、不提供回报后续服务等情形，您需要直接和发起人协商解决。</p>
                    <p class="gt3 active">
                        <span>4.由于发起人能力和经验不足、市场风险、法律风险等各种因素，众筹可能失败。对于在众筹期限届满前失败的项目，您支持项目的款项会全部原路退还给您；对于众筹成功的项目，支持者不能通过摩点平台申请退款，若此时支持者因任何原因希望退款，需直接与发起者协商，若发
								起者同意退款，需直接向支持者退回款项，摩点不会从可结算款项中扣除该部分退款金额。您对项目发起人的无偿支持以及额外打赏，一旦众筹成功将不予退款，但众筹失败的情况除外。</span>
                        <span class="packup-wrap"><a href="javascript:;" class="packup">收起全部<i class="iconfont icon-upmore"></i></a></span>
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
