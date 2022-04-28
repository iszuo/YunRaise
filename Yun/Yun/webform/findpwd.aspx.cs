using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using Models;
using BLL;

namespace Yun.webform
{
    public partial class findpwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // 初始化验证码
        static string cood = createrandom(6);
        string cood2 = cood;

        // 发送验证码
        protected void send_Click(object sender, EventArgs e)
        {
            string phone = this.phone.Value;                    // 手机号
            string email = this.email.Value;                    // 邮箱
            if (phone != "" && email != "")
            {
                if (UserMange.updatepwd(phone, email))
                {
                    //实例化一个发送邮件类。
                    MailMessage mailMessage = new MailMessage();
                    //发件人邮箱地址，方法重载不同，可以根据需求自行选择。
                    mailMessage.From = new MailAddress("1073520602@qq.com");
                    //收件人邮箱地址。
                    mailMessage.To.Add(new MailAddress(this.email.Value));
                    //邮件标题。
                    mailMessage.Subject = "这是你的验证码为：";
                    //邮件内容。
                    mailMessage.Body = "你的验证码是：" + cood;
                    //实例化一个SmtpClient类。
                    SmtpClient client = new SmtpClient();
                    //在这里我使用的是qq邮箱，所以是smtp.qq.com，如果你使用的是126邮箱，那么就是smtp.126.com。
                    client.Host = "smtp.qq.com";
                    //使用安全加密连接。
                    client.EnableSsl = true;
                    //不和请求一块发送。
                    client.UseDefaultCredentials = false;
                    //验证发件人身份(发件人的邮箱，邮箱里的生成授权码);
                    client.Credentials = new NetworkCredential("1073520602@qq.com", "meumiycwxrhwbdie");
                    //发送
                    client.Send(mailMessage);
                    Response.Write("<script>alert('发送成功')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('所填信息不完整。'); </script> ");
            }
        }

        //生成6位数字和大写字母的验证码
        private static string createrandom(int codelengh)
        {
            int rep = 0;
            string str = string.Empty;
            long num2 = DateTime.Now.Ticks + rep;
            rep++;
            Random random = new Random(((int)(((ulong)num2) & 0xffffffffL)) | ((int)(num2 >> rep)));
            for (int i = 0; i < codelengh; i++)
            {
                char ch;
                int num = random.Next();
                if ((num % 2) == 0)
                {
                    ch = (char)(0x30 + ((ushort)(num % 10)));
                }
                else
                {
                    ch = (char)(0x41 + ((ushort)(num % 0x1a)));
                }
                str = str + ch.ToString();
            }
            return str;
        }

        // 提交修改按钮
        protected void update_Click(object sender, EventArgs e)
        {
            string phone = this.phone.Value;                    // 手机号
            string email = this.email.Value;                    // 邮箱
            string newpwd = this.newpwd.Value;                  // 新密码
            if (cood2 == this.verifycode.Value.ToUpper())
            {
                if (UserMange.updatepwd(phone,email,newpwd))
                {
                    Response.Write("<script>alert('修改成功。');window.location='login.aspx'; </script> ");
                }
                else
                {
                    Response.Write("<script>alert('修改失败。'); </script> ");
                }
            }
            else
            {
                Response.Write("<script>alert('验证码错误。'); </script> ");
            }

        }

    }
}