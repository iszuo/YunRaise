using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;

namespace Yun.webform
{
    public partial class MyGive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
             //初始化个人信息
             this.UserPic.ImageUrl = Session["portrait"].ToString();
             this.UserName.InnerText = Session["username"].ToString();
             this.UserSex.InnerText = Session["sex"].ToString();
             this.UserText.InnerText = Session["usertext"].ToString();
             this.UserAddress.InnerText = Session["address"].ToString();
          
             //个人创建的项目
             //获取当前登录账号的id
             string phone = Session["phone"].ToString();
             string userId = ProjectMange.userId(phone).ToString();
             //将当前登录账号的所发布的项目输出到页面
             this.Repeater1.DataSource = ProjectMange.PersonCreate(userId);
             Repeater1.DataBind();
          
             //支持的项目
             this.Repeater2.DataSource = ProjectMange.PersonHelp(userId);
             Repeater2.DataBind();
          
             //删除项目
             del();
        }

        // 显示出个人所发布的项目
        public void state(string state)
        {
            // 获取当前登录账号的id
            string phone = Session["phone"].ToString();
            string userId = ProjectMange.userId(phone).ToString();
            // 将当前登录账号的所发布的项目输出到页面
            this.Repeater1.DataSource = ProjectMange.PersonCreate(userId, state);
            Repeater1.DataBind();
        }

        // 删除项目
        public void del()
        {
            string title = Request.QueryString["title"];
            if (title != null)
            {
                if (ProjectMange.delProject(title))
                {
                    Response.Write("<script> alert('删除成功！');window.location='Mygive.aspx';</script>");
                }
                else
                {
                    Response.Write("<script> alert('删除失败！');</script>");
                }
            }
        }

        // 所有
        protected void ever_Click(object sender, EventArgs e)
        {
            // 个人创建的项目
            // 获取当前登录账号的id
            string phone = Session["phone"].ToString();
            string userId = ProjectMange.userId(phone).ToString();
            // 将当前登录账号的所发布的项目输出到页面
            this.Repeater1.DataSource = ProjectMange.PersonCreate(userId);
            Repeater1.DataBind();
        }

        // 进行中
        protected void ing_Click(object sender, EventArgs e)
        {
            string a = this.ing.Text;
            state(a);

        }

        // 已成功
        protected void success_Click(object sender, EventArgs e)
        {
            string a = this.success.Text;
            state(a);
        }

        // 已失败
        protected void feil_Click(object sender, EventArgs e)
        {
            string a = this.feil.Text;
            state(a);
        }


        
      
    }
}