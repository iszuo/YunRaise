using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using Models;

namespace Yun.webform
{
    public partial class details_page : System.Web.UI.Page
    {
        string title;
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
            title = Request.QueryString["title"];
            List<details> aa = ProjectMange.ShowDetails(title);
            string money1 = aa[0].Amount.ToString();           // 项目总金额
            string money2 = aa[0].Donprice.ToString();         // 捐献的金额
            string state = aa[0].State;                        // 项目状态
            if (state == "已失败")                                         // 显示失败的按钮
            {
                this.zhichi.Style["display"] = "none";
                this.wancheng.Style["display"] = "none";
                this.chenggong.Style["display"] = "block";
            }else if (double.Parse(money2) >= double.Parse(money1) || state == "已成功")        // 显示成功的按钮
            {
                this.zhichi.Style["display"] = "none";
                this.wancheng.Style["display"] = "block";
                this.chenggong.Style["display"] = "none";
            }
        }

        public void show()
        {
            title = Request.QueryString["title"];
            this.Repeater1.DataSource = ProjectMange.ShowDetails(title);
            Repeater1.DataBind();
            this.Repeater2.DataSource = ProjectMange.ShowDetails(title);
            Repeater2.DataBind();
        }

        protected void sub_Click(object sender, EventArgs e)
        {
            if (Session["phone"] != null)
            {
                // 获取用户手机号
                string userphone = Session["phone"].ToString();
                // 获取当前项目的标题
                string title = Request.QueryString["title"];
                string money = this.money.Value.ToString();         // 捐献者捐献的金额
                string phone = this.phone.Value.ToString();         // 捐献者手机号

                if (ProjectMange.submit(userphone, title, money, phone))
                {
                    Response.Write("<script>alert('捐献成功')</script>");
                    this.money.Value = "";
                    this.phone.Value = "";
                    show();
                }
            }
            else
            {
                Response.Write("<script>alert('请先登录')</script>");
                this.money.Value = "";
                this.phone.Value = "";

            }


        }
    }
}