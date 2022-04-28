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
    public partial class rescue_deed : System.Web.UI.Page
    {
        public string tpa;          // 项目类别
        public string state;        // 项目状态
        public string pg;           // 页码
        public double endpg;        // 最后一页


        protected void Page_Load(object sender, EventArgs e)
        {
            tpa = Request.QueryString["tp"];
            state = Request.QueryString["state"];
            pg = Request.QueryString["pg"];
            endpg = ProjectMange.pagesel(tpa, state);           
            // 展示数据
            this.Repeater1.DataSource = ProjectMange.pagesel(tpa,state,pg);
            Repeater1.DataBind();
        }



    }
}