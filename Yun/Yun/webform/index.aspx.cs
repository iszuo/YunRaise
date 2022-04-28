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
    public partial class _Default : Page
    {
        public int num1;        // 项目数量
        public int num2;        // 资助数量
        public double num3;        // 金额
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Repeater1.DataSource = ProjectMange.pagesel("%", "%", "1");
                Repeater1.DataBind();
            }
            num1 = ProjectMange.projectNum();
            num2 = ProjectMange.projectPeoNum();
            num3 = ProjectMange.projectMoney();
        }
    }
}