using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class DonateService
    {
        // 项目捐献
        public static bool submit(string usernamae,string title,string money,string phone)
        {
            // 用户id
            string user_sql = "select userid from users where phone='" + usernamae + "'";
            string userid = DBHelper.GetDataTable(user_sql).Rows[0][0].ToString();
            // 项目id   项目捐献总金额    已经捐献的金额     项目金额百分比
            string item_sql1 = "select ProID,Amount,Donprice from Project where Proname='" + title + "'";
            DataTable ds = DBHelper.GetDataTable(item_sql1);
            string itemid = ds.Rows[0][0].ToString();                                                                       // id
            string totalmoney = ds.Rows[0][1].ToString();                                                                   // 所需要的金额
            string already = ds.Rows[0][2].ToString();                                                                      // 项目已经捐献的金额
            double total_already = double.Parse(already) + double.Parse(money);                                             // 捐献完成之后更新项目已经捐献的金额
            double percentage = Math.Round((total_already / double.Parse(totalmoney) * 100), 2);                            // 项目金额百分比

            // 更新项目当前的捐献金额    项目金额百分比
            string item_sql2 = "update Project set donprice='" + total_already + "' , Percentage='" + percentage + "' where ProID='" + itemid + "'";
            if (DBHelper.ExecuteNonQuery(item_sql2) > 0)
            {
                // 判断项目是否已经完成
                if (percentage >= 100)
                {
                    string item_sql3 = "update Project set state='已完成' where ProID='" + itemid + "'";
                    DBHelper.ExecuteNonQuery(item_sql3);
                }
                // 获取当前时间
                DateTime t = DateTime.Now;
                // 项目开始时间
                string StartT = t.ToString("yyyy-MM-dd");  // 2008 - 09 - 04
                // 向捐献表插入信息
                string sql3 = "insert into Donate values ('" + userid + "','" + itemid + "','" + money + "','" + StartT + "','" + phone + "')";
                if (DBHelper.ExecuteNonQuery(sql3) > 0)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
