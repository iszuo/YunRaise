using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Security.Cryptography;
using BLL;
using Models;

namespace Yun
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 当url中存在手机号的时候，直接把tel上的手机号赋值给账号栏
            if(Request.QueryString["tel"] != null)
            {
                this.account.Value = Request.QueryString["tel"];
            }
        }

        // 登录按钮
        protected void Login_Click(object sender, EventArgs e)
        {
            string account = this.account.Value.ToString().Trim();
            string password = this.pwd.Value.ToString().Trim();
            User us = UserMange.Login(account, password);
            if (us != null)
            {
                // 将登录的用户的信息保存道session
                Session["phone"] = us.Phone;
                Session["password"] = us.Password;
                Session["username"] = us.Username;
                Session["sex"] = us.Sex;
                Session["address"] = us.Address;
                Session["email"] = us.Email;
                Session["usertext"] = us.Usertext;
                Session["portrait"] = us.Portrait;
                //Response.Write("<script>alert('登录成功。');window.location='index.aspx';</script> ");
                Response.Redirect("index.aspx");
            }
            else
            {
                Response.Write("<script>if (1 > 0){alert('用户名或密码错误。')}else{window.location='index.aspx'};</script> ");
            }
        }
    }
}