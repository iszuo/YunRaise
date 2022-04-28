using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yun.webform
{
    public partial class project_res : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Btn_pro_Click(object sender, EventArgs e)
        {
            // 判断是否已经登录账号
            if (Session["username"] == null)
            {
                Response.Write("<script>alert('请登录账号后再进行。') </script> ");
            }
            else
            {
                Response.Write("<script>window.location='project_res_frm.aspx';</script> ");
            }
        }
    }
}