<%@ Page Title="发布项目" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="project_res_frm.aspx.cs" Inherits="Yun.webform.project_res_frm" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSheet" runat="server">

    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <link href="../Content/pages/project_res_frm.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="center" style="background-color: rgb(249,249,249);">
        <div class="container">
            <!-- 三个导航 -->
            <div style="margin-bottom: 30px; position: relative; left: -25px;">
                <ul id="nav">
                    <li class="current">①项目信息</li>
                    <li runat="server" id="scd">②发起人信息</li>
                    <li runat="server" id="trd">③完成</li>
                </ul>
            </div>

            <!-- 项目信息 -->
            <div id="prj_msg" class="prj_msg" runat="server" style="display: block;">
                <!-- 左侧表单 -->
                <div class="col-md-9 msg">
                    <div class="content-title">
                        <span>项目信息</span>
                    </div>
                    <div style="padding: 0px 0px 50px 70px; position: relative;">
                        <p style="position: relative;">
                            项目名称：<input runat="server" type="text" id="project_name" placeholder="名称不可超过10个" />
                            <span class="hint project_name_hint"></span>
                            <asp:HiddenField ID="project_name_hint_b" runat="server" />
                        </p>
                        <p style="position: relative;">
                            筹集金额：<input runat="server" type="text" oninput="value=value.replace(/[^\d]/g,'')" id="raise_money" placeholder="不少于500元" />&nbsp;&nbsp;&nbsp;&nbsp;元
						    <span class="hint raise_money_hint"></span>
                            <asp:HiddenField ID="raise_money_hint_b" runat="server" />

                            <!-- 提示信息 -->
                            <asp:Label ID="Label1" runat="server" Text="" style="position:absolute;right:10px;top:5px"></asp:Label>
                        </p>
                        <p style="position: relative;">
                            筹集天数：<input runat="server" type="text" oninput="value=value.replace(/[^\d]/g,'')" id="raise_day" placeholder="10 — 90天" />&nbsp;&nbsp;&nbsp;&nbsp;天
							<span class="hint raise_day_hint"></span>
                            <asp:HiddenField ID="raise_day_hint_a" runat="server" />
                        </p>
                        <p>
                            项目封面：
                            <asp:Button ID="UpCover" runat="server" class="btn btn-info" Text="上传封面" OnClick="UpCover_Click" CausesValidation="False" />
                            <span style="font-size: 10px; color: gray;">支持jpg、jpeg、png格式，大小不超过5M。建议尺寸：600 x 450px</span>
                            <asp:FileUpload ID="FileUpload1" runat="server" style="position:relative;left:85px;top:10px" />
                            <asp:HiddenField ID="Cover" runat="server" />
                        </p>
                        <p>
                            项目地点：<input runat="server" type="text" id="Project_Place" placeholder="例：河北省邯郸市" />
                        </p>
                        <p>
                            类别：
                                <asp:HiddenField ID="tpe" runat="server" />
								<div class="btn-group" data-toggle="buttons" style="position: absolute; top: 320px; left: 177px;">
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton1" runat="server" Text="科技" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="艺术" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton3" runat="server" Text="设计" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton4" runat="server" Text="音乐" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton5" runat="server" Text="影视" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton6" runat="server" Text="出版" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton7" runat="server" Text="动漫" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton8" runat="server" Text="公益" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton9" runat="server" Text="公开课" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                    <label class="btn btn-primary">
                                        <asp:RadioButton ID="RadioButton10" runat="server" Text="农业" OnCheckedChanged="Radio_CheckedChanged" />
                                    </label>
                                </div>
                        </p>
                        <p style="position: relative;">
                            <span style="position: relative; bottom: 285px;">项目简介：</span>
                            <textarea runat="server" id="show" placeholder="介绍一下本项目" style="height: 300px; width: 500px; resize: none;"></textarea>
                        </p>
                        <p>
                            <asp:Button ID="Button1" runat="server" class="btn btn-warning next" Text="下一步" OnClick="next_Click" />
                        </p>
                    </div>
                </div>
                <!-- 右侧提示信息 -->
                <div class="col-md-3" style="height: 500px; padding-left: 0px; padding-right: 0px;">
                    <div class="msg_show">
                        <div class="msg_show_top">
                            <span id="hint" runat="server">缩略图</span>
                            <asp:Image ID="UpPic" runat="server" height="200px" width="228px" />
                        </div>
                        <div class="msg_show_btm">
                            <span id="MainContent_project_name_hint_a" runat="server" style="margin-bottom: 25px;"></span>
                            <br>
                            <span>
                                目标：<span id="MainContent_raise_day_hint_b" runat="server">___</span>天&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ￥<span  id="MainContent_raise_money_hint_a" runat="server">___</span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 发起人信息 -->
            <div id="ite_msg" class="ite_msg" runat="server" style="display: none;">
                <div class="col-md-9 msg">
                    <!-- 左侧表单 -->
                    <div class="content-title">
                        <span>发起人信息</span>
                    </div>
                    <div style="padding: 0px 0px 50px 70px;">
                        <p>
                            真实姓名：<input runat="server" type="text" id="ite_name" placeholder="请输入您的姓名" />
                        </p>
                        <p>
                            所在地：&nbsp;&nbsp;&nbsp;
							<input runat="server" type="text" id="seat" placeholder="例：河北省邯郸市" />
                        </p>
                        <p>
                            移动电话：<input runat="server" type="text" id="ite_tel" placeholder="请输入您的11位电话号码" />
                        </p>
                        <p>
                            <h3>补充打款信息</h3>
                        </p>
                        <p>
                            银行名称：<input runat="server" type="text" id="ite_bank" placeholder="请输入您的银行名称" />
                        </p>
                        <p>
                            银行卡号：<input runat="server" type="text" id="ite_card" placeholder="请输入您的卡号" />
                        </p>
                        <p>
                            <button runat="server" type="button" class="btn btn-warning previous">上一步</button>
                            <asp:Button ID="sub" class="btn btn-warning sub" runat="server" Text="提&nbsp;&nbsp;交" OnClick="sub_Click" />
                        </p>
                    </div>
                </div>
                <!-- 右侧提示信息 -->
                <div class="col-md-3" style="height: 200px; padding-left: 0px; padding-right: 0px;">
                    <div class="ite_msg_show" style="border: 1px solid rgba(150,150,150,.5); height: auto;">
                        <div class="content-title">
                            <span>温馨提示</span>
                        </div>
                        <div class="itm_msg_show_btm">
                            <span>请仔细填写本页信息，确保项目成功后快速并准确的为您打款。</span>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 发布成功 -->
            <div id="success" runat="server" class="success" style="display: none;">
                <div class="col-md-12" style="padding: 0px; margin: 60px 0px 200px 0px; background-color: white; border-radius: 10px;">
                    <div class="content" style="border: 1px solid rgba(150,150,150,.5); border-radius: 5px; overflow: hidden;">
                        <div class="content-title">
                            <span>发布成功</span>
                        </div>
                        <div style="overflow: hidden;">
                            <div class="col-md-4" style="float: left;">
                                <img src="../img/tree.png">
                            </div>
                            <div class="content-word col-md-8" style="font-size: 20px; padding: 30px;">
                                <h1 style="position: relative; left: 250px;">发布成功</h1>
                                <div id="" style="">
                                    <i style="font-size: 35px;">你的“<span style="color: red;">梦想</span>”</i>
                                    <br>
                                    <i style="font-size: 40px;">将会马上<span style="color: red;">实现</span></i>
                                    <br>
                                    <p style="padding-top: 30px;">
                                        <asp:Button ID="Button2" runat="server" Text="返回首页" class="btn btn-danger" style="position: relative; left: 280px;" OnClick="Button2_Click" />
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <script type="text/javascript">
        $(function () {
            /**
             * 项目信息   
             */
            // 项目名称
            $("#MainContent_project_name").blur(function () {
                if ($(this).val().trim() == "" || $(this).val().trim().length > 10) {
                    $(".project_name_hint").text("请输入正确的用户名");
                } else {
                    $(".project_name_hint").text("")
                    $(".msg_show_btm").children("span:eq(0)").text($(this).val().trim())
                }
            });
            // 筹集金额
            $("#MainContent_raise_money").blur(function () {
                if ($(this).val().trim() < 500) {
                    $(".raise_money_hint").text("请输入正确的筹集金额")
                } else {
                    $(".raise_money_hint").text("")
                    $(".msg_show_btm").children("span:eq(1)").children("span:eq(1)").text($(this).val().trim())
                }
            })
            // 筹集天数
            $("#MainContent_raise_day").blur(function () {
                if ($(this).val().trim() < 10 || $(this).val().trim() > 90) {
                    $(".raise_day_hint").text("请输入正确的筹集天数")
                } else {
                    $(".raise_day_hint").text("")
                    $(".msg_show_btm").children("span:eq(1)").children("span:eq(0)").text($(this).val().trim())
                }
            });

            /**
             * 发起信息    上一步
             */
            $(".previous").click(function () {
                // 移除第二个导航中的背景色
                $("#nav").children("li:eq(1)").removeClass("current");
                // 改变表单中的内容，改为  “项目信息”  列表
                $(".prj_msg").css("display", "block");
                $(".ite_msg").css("display", "none");
            });
        });
    </script>
</asp:Content>
