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
    public partial class project_res_frm : System.Web.UI.Page
    {

        // 类别     单选按钮全局变量
        string rbtStr = "";
        string UserId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //获取当前登录账号的id
            UserId = ProjectMange.userId(Session["phone"].ToString()).ToString();
        }

        // 类别     判断当前选中的类别
        protected void Radio_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rbt = sender as RadioButton;
            //判断是否被选中
            if (rbt.Checked == true)
            {
                 rbtStr = rbt.Text;
                this.tpe.Value = rbtStr;
            }
        }

        /**
         *  获取    项目名称、筹集金额、筹集天数    中输入的内容
         */
        public bool name_money_day()
        {
            // 项目名称
            string pjt_name = this.project_name.Value.ToString().Trim();
            this.project_name_hint_b.Value = pjt_name;
            this.MainContent_project_name_hint_a.InnerText = project_name_hint_b.Value;
            // 筹集金额
            string ric_money = this.raise_money.Value.ToString().Trim();
            this.raise_money_hint_b.Value = ric_money;
            this.MainContent_raise_money_hint_a.InnerText = raise_money_hint_b.Value;
            // 筹集天数
            string ric_day = this.raise_day.Value.ToString().Trim();
            this.raise_day_hint_a.Value = ric_day;
            this.MainContent_raise_day_hint_b.InnerText = raise_day_hint_a.Value;
            if (pjt_name != "" && ric_money != "" && ric_day != "")
            {
                if(pjt_name.Length > 10)
                {
                    this.Label1.Text = "项目名字不能大于10位！";
                    return false;
                }
                else if (int.Parse(ric_money) < 500)
                {
                    this.Label1.Text = "筹集金额必须大于500元！";
                    return false;
                }
                else if (int.Parse(ric_day) < 10 || int.Parse(ric_day) > 90)
                {
                    this.Label1.Text = "筹集天数必须在10天到90天之内！";
                    return false;
                }
                return true;
            }
            return false;
        }

        //上传封面
        protected void UpCover_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                //获取上传文件的文件名
                string fileName = FileUpload1.FileName;
                //获取上传文件的文件后缀名
                string fileFix = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();

                if (fileFix != "jpg" && fileFix != "jpeg" && fileFix != "png" && fileFix == "")
                {
                    Response.Write("<script>alert('图片格式错误');</script> ");
                    name_money_day();
                }
                else
                {
                    //获取时间戳
                    TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
                    string tim = Convert.ToInt64(ts.TotalSeconds).ToString();
                    // 重新给图片命名
                    this.Cover.Value = tim + "." + fileFix;
                    //将图片保存到本地
                    FileUpload1.SaveAs(Server.MapPath("~/UpCover/") + this.Cover.Value);
                    this.UpPic.ImageUrl = "~/UpCover/" + this.Cover.Value;
                    //Response.Write("<script>alert('图片上传成功');</script> ");
                    this.hint.Style["display"] = "none";
                    name_money_day();

                }
            }
        }

        // 下一步
        protected void next_Click(object sender, EventArgs e)
        {
            name_money_day();
            // 类别
            string rS = rbtStr;
            // 项目地点
            string pjt_plc = this.Project_Place.Value.ToString().Trim();
            // 图片名称
            string pic = this.Cover.Value;
            // 项目简介
            string show = this.show.Value.ToString().Trim();
            if(name_money_day() && tpe.Value != "" && pjt_plc != "" && pic != "" && show != "")
            {
                this.scd.Attributes.Add("class", "current");
                this.prj_msg.Style["display"] = "none";
                this.ite_msg.Style["display"] = "block";
            }
            else
            {
                //Response.Write("<script>alert('信息不完整。');</script> ");
                this.Label1.Text = "信息不完整，请确认信息完整后再点击下一步。";
            }
        }

        // 提交
        protected void sub_Click(object sender, EventArgs e)
        {
            //项目信息
            // 项目名称
            string pjt_name = this.project_name.Value.ToString().Trim();
            // 筹集金额
            string ric_money = this.raise_money.Value.ToString().Trim();
            // 筹集天数
            string ric_day = this.raise_day.Value.ToString().Trim();
            // 项目地点
            string pjt_plc = this.Project_Place.Value.ToString().Trim();
            // 图片名称
            string pic = "../UpCover/" + this.Cover.Value;
            // 项目简介
            string show = this.show.Value.ToString().Trim();



            //发起人信息
            // 姓名
            string name = this.ite_name.Value.ToString().Trim();
            // 所在地
            string seat = this.seat.Value.ToString().Trim();
            // 手机号
            string tel = this.ite_tel.Value.ToString().Trim();
            // 银行名称
            string bank = this.ite_bank.Value.ToString().Trim();
            // 银行卡号
            string card = this.ite_card.Value.ToString().Trim();
            

            //将项目信息和发起人信息保存到数据库
            if (ProjectMange.addProject(UserId, pjt_name, ric_money, ric_day, this.tpe.Value, pjt_plc, pic, show, tel, "0") && ProjectMange.addAuthor(UserId,name,seat,tel,bank,card))
            {
                //Response.Write("<script>alert('登录成功。');window.location='index.aspx';</script> ");
                this.trd.Attributes.Add("class", "current");
                this.ite_msg.Style["display"] = "none";
                this.success.Style["display"] = "block";
            }
            else
            {
                Response.Write("<script>alert('所填写信息有误请重新填写。');</script> ");
            }


        }
       
        //发布成功返回首页按钮
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.location='index.aspx';</script> ");
        }
    }
}