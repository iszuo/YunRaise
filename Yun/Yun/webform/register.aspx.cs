using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using BLL;
using DAL;
// 手机号正则表达式
using System.Text.RegularExpressions;

namespace Yun
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // 验证用户名
        public bool CheckName()
        {
            if (this.name.Value.ToString().Trim() == "")
            {
                this.name_msg.InnerText = "昵称不能为空！";
                return false;
            }else if(this.name.Value.ToString().Trim().Length < 2)
            {
                this.name_msg.InnerText = "昵称长度必须大于2位！";
                return false;
            }
            else
            {
                this.name_msg.InnerText = "";
                return true;
            }
        }

        // 验证手机号
        public bool CheckTel()
        {
            // 手机号正则表达式
            Regex rx = new Regex(@"^0{0,1}(13[4-9]|15[7-9]|15[0-2]|18[7-8])[0-9]{8}$");
            if (this.tel.Value.ToString().Trim() == "")
            {
                this.tel_msg.InnerText = "手机号不能为空！";
                return false;
            }
            else if (!rx.IsMatch(this.tel.Value.ToString().Trim()))
            {
                this.tel_msg.InnerText = "手机号格式不正确！";
                return false;
            }
            else
            {
                this.tel_msg.InnerText = "";
                return true;
            }
        }

        // 验证密码
        public bool CheckPwd()
        {
            if (this.pwd.Value.ToString().Trim() == "")
            {
                this.pwd_msg.InnerText = "密码不能为空！";
                return false;
            }
            else if (this.pwd.Value.ToString().Trim().Length < 6)
            {
                this.pwd_msg.InnerText = "密码长度必须大于6位！";
                return false;
            }
            else
            {
                this.pwd_msg.InnerText = "";
                return true;
            }
        }

        // 验证确认密码
        public bool CheckPwd2()
        {
            if (this.pwd2.Value.ToString().Trim() == "")
            {
                this.pwd2_msg.InnerText = "确认密码不能为空！";
                return false;
            }
            else if (this.pwd2.Value.ToString().Trim() != this.pwd.Value.ToString().Trim())
            {
                this.pwd2_msg.InnerText = "两次密码不一致！";
                return false;
            }
            else
            {
                this.pwd2_msg.InnerText = "";
                return true;
            }
        }

        // 注册按钮
        protected void Register_Click(object sender, EventArgs e)
        {
            string phone = this.tel.Value.ToString();
            string password = this.pwd.Value.ToString();
            string account = this.name.Value.ToString();
            string email = this.email.Value.ToString();
            if (this.Verify.Value == Session["vcode"].ToString())
            {
                if (CheckName() & CheckTel() & CheckPwd() & CheckPwd2())
                {
                    if (UserMange.Register(phone))
                    {
                        Response.Write("<script>alert('该手机已经被注册'); </script> ");
                    }
                    else if (UserMange.Register(phone, password, account, email))
                    {
                        Response.Write("<script>alert('注册成功。');window.location='Login.aspx?tel=" + phone + "'; </script> ");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('验证码输入错误'); </script> ");

            }

        }


    }
}