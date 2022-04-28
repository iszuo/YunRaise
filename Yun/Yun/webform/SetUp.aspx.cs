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
    public partial class SetUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 个人信息
            if (Session["phone"] == null)
            {
                Response.Write("<script>alert('请先登录');window.location='login.aspx';</script>")
            }
            this.UserPhone.InnerText = Session["phone"].ToString();
            this.UserName.InnerText = Session["username"].ToString();
            this.UserSex.InnerText = Session["sex"].ToString();
            this.UserAddress.InnerText = Session["address"].ToString();
            this.UserEmail.InnerText = Session["email"].ToString();
            this.UserShow.InnerText = Session["usertext"].ToString();

            // 密码
            this.name_b.InnerText = Session["username"].ToString();
            this.phone_b.InnerText = Session["phone"].ToString();
            this.pwd_a.Value = Session["password"].ToString();

            // 头像
            this.pic_a.ImageUrl = Session["portrait"].ToString();
        }


        // 修改个人信息
        protected void Keep_Click(object sender, EventArgs e)
        {
            string name = this.name.Value.Trim().ToString();
            string sex = this.sex.Value.Trim().ToString();
            string address = this.address.Value.Trim().ToString();
            string email = this.email.Value.Trim().ToString();
            string show = this.show.Value.Trim().ToString();
            string phone = Session["phone"].ToString();
            if (UserMange.UpdateUser(name, sex, address, email, show, phone))
            {
                Session["username"] = name;
                Session["sex"] = sex;
                Session["address"] = address;
                Session["email"] = email;
                Session["usertext"] = show;
                Session["phone"] = phone;
                Response.Write("<script>alert('修改成功。');window.location='SetUp.aspx';</script> ");

            }
        }

        // 修改密码
        protected void KeepPwd_Click1(object sender, EventArgs e)
        {
            string name = this.name_b.InnerText;
            string phone = this.phone_b.InnerText;
            string pwd_a = this.pwd_a.Value.Trim().ToString();
            string pwd_b = this.pwd_b.Value.Trim().ToString();
            if (UserMange.SetPwd(pwd_a, pwd_b, phone, name))
            {
                Response.Write("<script>alert('修改成功。');window.location='SetUp.aspx';</script> ");
            }
            else
            {
                Response.Write("<script>alert('原密码错误，请重新输入。');window.location='SetUp.aspx';</script> ");
            }
        }

        // 修改头像
        protected void UpPic_Click(object sender, EventArgs e)
        {

            string pic = this.pic_a.ImageUrl;
            string phone = Session["phone"].ToString();

            if (FileUpload1.HasFile)
            {
                //获取上传文件的文件名
                string fileName = FileUpload1.FileName;
                //获取上传文件的文件后缀名
                string fileFix = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();

                if (fileFix != "jpg" && fileFix != "jpeg" && fileFix != "png" && fileFix == "")
                {
                    Response.Write("<script>alert('图片格式错误');</script> ");
                }
                else
                {
                    // 获取时间戳
                    TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
                    string tim = Convert.ToInt64(ts.TotalSeconds).ToString();
                    // 重新给图片命名
                    this.Cover.Value = tim + "." + fileFix;

                    if (UserMange.UpdatePic("~/UpPic/" + this.Cover.Value, phone))
                    {
                        // 更新session中的图片名称
                        Session["portrait"] = "~/UpPic/" + this.Cover.Value;
                        // 将图片保存到本地
                        FileUpload1.SaveAs(Server.MapPath("~/UpPic/") + this.Cover.Value);
                        Response.Write("<script>alert('头像更换成功。');window.location='SetUp.aspx';</script> ");
                    }
                }
            }
        }

    }
}