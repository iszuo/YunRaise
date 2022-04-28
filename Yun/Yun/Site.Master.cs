using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;

namespace Yun
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断是否已经登录账号
            if (Session["username"] != null)
            {
                // 登录后隐藏“登录注册”按钮
                this.unlogin.Style["display"] = "none";
                // 显示“个人信息按钮”
                this.logined.Style["display"] = "block";
                // 把用户的名字赋值到按钮中
                this.login_name.InnerText = Session["username"].ToString();
                this.UserPic.ImageUrl = Session["portrait"].ToString();
            }
        }

        // 退出登录
        protected void Quit_Login_Click(object sender, EventArgs e)
        {
            // 移除当前所保存的session
            Session.Clear();
            // 登录后隐藏“登录注册”按钮
            this.unlogin.Style["display"] = "block";
            // 显示“个人信息按钮”
            this.logined.Style["display"] = "none";
            //退出后返回首页
            Response.Write("<script>alert('成功退出。');window.location='index.aspx';</script> ");

        }

    }
}