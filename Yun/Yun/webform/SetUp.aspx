<%@ Page Title="个人设置" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetUp.aspx.cs" Inherits="Yun.webform.SetUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSheet" runat="server">

    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <link href="../Content/pages/setup.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="center" style="background-color: rgb(249,249,249);">
        <div class="container">
            <div style="margin-top: 70px;">
                <h1>个人设置</h1>
            </div>
            <div id="set">
                <!-- 左侧导航 -->
                <div id="set_left" class="col-md-3">
                    <div class="set_left set_left_a now">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        &nbsp;
							<span>资料修改</span>
                    </div>
                    <div class="set_left set_left_b">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                        &nbsp;
							<span>密码修改</span>
                    </div>
                    <div class="set_left  set_left_c">
                        <i class="fa fa-picture-o" aria-hidden="true"></i>
                        &nbsp;
							<span>头像修改</span>
                    </div>
                </div>

                <!-- 资料修改_A -->
                <div id="set_right" class="col-md-9 set_right_aa" style="display: block;">
                    <table>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;手机号：</td>
                            <td>
                                <span id="UserPhone" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;用户名：</td>
                            <td>

                                <span id="UserName" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                            <td>
                                <span id="UserSex" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;所在地：</td>
                            <td>
                                <span id="UserAddress" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                            <td>
                                <span id="UserEmail" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>个人说明：</td>
                            <td>
                                <span id="UserShow" style="display: block; width: 330px;" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button id="revise" type="button" class="btn btn-primary" style="display: block;">修改</button>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- 资料修改_B -->
                <div id="set_right" class="col-md-9 set_right_ab" style="display: none;">
                    <table>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;手机号：</td>
                            <td>
                                <span id="phone"  runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;用户名：</td>
                            <td>
                                <input type="text" id="name" runat="server"/>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                            <td>
                                <input type="text" id="sex" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;所在地：</td>
                            <td>
                                <input type="text" id="address" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                            <td>
                                <input type="text" id="email" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>个人说明：</td>
                            <td>
                                <textarea id="show" runat="server" placeholder="您的介绍可更有效的帮助支持者了解您和了解项目的背景" style="width: 430px; height: 100px; resize: none;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button id="GoBack" type="button" class="btn btn-primary">返回</button>
                                <asp:Button ID="Keep" runat="server" Text="保存" class="btn btn-success" style="position: relative; left: 100px;" OnClick="Keep_Click" />
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- 密码修改 -->
                <div id="set_right" class="col-md-9 set_right_b" style="display: none;">
                    <table>
                        <tr>
                            <td>当前登录用户名：</td>
                            <td>
                                <span id="name_b"  runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>当前登录手机号：</td>
                            <td>
                                <span id="phone_b" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>请输入原始密码：</td>
                            <td>
                                <input id="pwd_a" type="password" runat="server">
                            </td>
                        </tr>
                        <tr>
                            <td>请输入新密码：</td>
                            <td>
                                <input id="pwd_b" type="password" runat="server">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="KeepPwd" runat="server" Text="保存" class="btn btn-success" OnClick="KeepPwd_Click1" />
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- 头像修改 -->
                <div id="set_right" class="col-md-9 set_right_c" style="display: none;">

                    <div style="position: absolute; left: 50px; top: 50px;">
                        <h4>当前头像</h4>
                        <asp:Image ID="pic_a" runat="server" width="350px" height="350px" />
                    </div>
                    <div style="position: absolute; right: 90px; top: 50px;">
                        <asp:Button ID="UpPic" runat="server" Text="点击上传" class="btn btn-info" style="position: absolute; top: 180px; left: 70px;" OnClick="UpPic_Click" />
                        <asp:FileUpload ID="FileUpload1" runat="server" style="position:relative;top:270px" />
                        <asp:HiddenField ID="Cover" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            $(".set_left_a").click(function () {
                $(this).siblings().removeClass("now");
                $(this).addClass("now");
                $(".set_right_aa").css("display", "block");
                $(".set_right_ab").css("display", "none");
                $(".set_right_b").css("display", "none");
                $(".set_right_c").css("display", "none");
            });

            $(".set_left_b").click(function () {
                $(this).siblings().removeClass("now");
                $(this).addClass("now");
                $(".set_right_aa").css("display", "none");
                $(".set_right_ab").css("display", "none");
                $(".set_right_b").css("display", "block");
                $(".set_right_c").css("display", "none");
            });

            $(".set_left_c").click(function () {
                $(this).siblings().removeClass("now");
                $(this).addClass("now");
                $(".set_right_aa").css("display", "none");
                $(".set_right_ab").css("display", "none");
                $(".set_right_b").css("display", "none");
                $(".set_right_c").css("display", "block");
            })

            // 修改资料
            $("#revise").click(function () {
                var phone = $("#MainContent_UserPhone").text();
                $("#MainContent_phone").text(phone);

                var name = $("#MainContent_UserName").text();
                $("#MainContent_name").attr("value", name);

                var sex = $("#MainContent_UserSex").text();
                $("#MainContent_sex").attr("value", sex);

                var address = $("#MainContent_UserAddress").text();
                $("#MainContent_address").attr("value", address);

                var email = $("#MainContent_UserEmail").text();
                $("#MainContent_email").attr("value", email);

                var show = $("#MainContent_UserShow").text();
                if (show != "") {
                    $("#MainContent_show").text(show);
                } 

                $(".set_right_aa").css("display", "none");
                $(".set_right_ab").css("display", "block");
            })

            // 返回上一步
            $("#GoBack").click(function () {
                $(".set_right_aa").css("display", "block");
                $(".set_right_ab").css("display", "none");
            })

        })
    </script>
</asp:Content>
