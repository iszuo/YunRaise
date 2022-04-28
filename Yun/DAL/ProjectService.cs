using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using Models;

namespace DAL
{
    public class ProjectService
    {
        // 获取当前登录账号的id
        public static object userId(string userName)
        {
            string sql = "select UserId from Users where Phone = '" + userName + "'";
            if (DBHelper.GetDataTable(sql).Rows.Count > 0)
            {
                return int.Parse(DBHelper.GetDataTable(sql).Rows[0][0].ToString());
            }
            return null;
        }


        // 发布项目时检查该项目名称时候已经被注册
        public static bool addProject(string Proname)
        {
            string sql = "select Proname from Project where Proname = '" + Proname + "'";
            if (DBHelper.GetDataTable(sql).Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        // 新建项目信息
        public static bool addProject(string UserId ,string Proname,string Amount,string Prodays,string Type, string Proaddress, string Proimg,string Protitle,string Prophone,string Donprice)
        {
            // 获取当前时间
            DateTime t = DateTime.Now;
            // 项目开始时间
            string StartT = t.ToString("yyyy-MM-dd");  // 2008 - 09 - 04
            // 项目结束的时间
            string EndT = t.AddDays(double.Parse(Prodays)).ToShortDateString();

            string sql = "insert into Project(UserId ,Proname ,Amount ,Prodays ,[Type] ,Proaddress ,Proimg ,Protext ,Prophone ,Donprice,StartTime,EndTime,Percentage) values('" + UserId + "', '" + Proname + "', '" + Amount + "', '" + Prodays + "', '" + Type + "', '" + Proaddress + "', '" + Proimg + "', '" + Protitle + "', '" + Prophone + "', '" + Donprice + "','" + StartT + "','" + EndT + "','0')";
            if (DBHelper.ExecuteNonQuery(sql) > 0)
            {
                return true;
            }
            return false;
        }

        // 新建发起人信息
        public static bool addAuthor(string usersID, string Messname, string Messaddress, string Messphone, string Bankname, string Bankcard)
        {
            string sql = "insert into Message values('" + usersID + "','" + Messname + "','" + Messaddress + "','" + Messphone + "','" + Bankname + "','" + Bankcard + "')";
            if (DBHelper.ExecuteNonQuery(sql) > 0)
            {
                return true;
            }
            return false;
        }

        // 获取个人创建的项目
        public static List<Project> PersonCreate(string UserId)
        {
            List<Project> creates = new List<Project>();
            string sql = "select Proimg, Proname, StartTime,EndTime,Amount,Donprice,[Percentage] from Project where UserID='" + UserId + "'";
            DataTable ds = DBHelper.GetDataTable(sql);
            for (int i = 0; i < ds.Rows.Count; i++)
            {
                Project pj = new Project();
                pj.Proimg = ds.Rows[i][0].ToString();
                pj.Proname = ds.Rows[i][1].ToString();
                pj.StartTime = ds.Rows[i][2].ToString();
                pj.EndTime = ds.Rows[i][3].ToString();
                pj.Amount = ds.Rows[i][4].ToString();
                pj.Donprice = ds.Rows[i][5].ToString();
                pj.Percentage = ds.Rows[i][6].ToString();
                creates.Add(pj);
            }
            return creates;
        }
        // 获取个人创建的项目的状态
        public static List<Project> PersonCreate(string UserId,string State)
        {
            List<Project> creates = new List<Project>();
            string sql = "select Proimg, Proname, StartTime,EndTime,Amount,Donprice from Project where UserID='" + UserId + "' and  State='" + State + "'";
            DataTable ds = DBHelper.GetDataTable(sql);
            for (int i = 0; i < ds.Rows.Count; i++)
            {
                Project pj = new Project();
                pj.Proimg = ds.Rows[i][0].ToString();
                pj.Proname = ds.Rows[i][1].ToString();
                pj.StartTime = ds.Rows[i][2].ToString();
                pj.EndTime = ds.Rows[i][3].ToString();
                pj.Amount = ds.Rows[i][4].ToString();
                pj.Donprice = ds.Rows[i][5].ToString();
                creates.Add(pj);
            }
            return creates;
        }

        // 获取个人捐献的项目
        public static List<Project> PersonHelp(string UserId)
        {
            List<Project> creates = new List<Project>();
            string sql = "select p.Proimg,p.Proname,d.Dontime,p.EndTime,p.Amount,d.Donprice from Project p, Donate d,Users u where p.ProID=d.ProID and d.UsersID=u.UserId and u.UserId='" + UserId + "'";
            DataTable ds = DBHelper.GetDataTable(sql);
            for (int i = 0; i < ds.Rows.Count; i++)
            {
                Project pj = new Project();
                pj.Proimg = ds.Rows[i][0].ToString();
                pj.Proname = ds.Rows[i][1].ToString();
                pj.Dontime = ds.Rows[i][2].ToString();
                pj.EndTime = ds.Rows[i][3].ToString();
                pj.Amount = ds.Rows[i][4].ToString();
                pj.Donprice = ds.Rows[i][5].ToString();
                creates.Add(pj);
            }
            return creates;
        }

        // 删除个人发布的项目
        public static bool delProject(string title)
        {
            string sql1 = "select ProID from project where Proname='" + title + "'";            // 获取删除项目的id
            string proid = DBHelper.GetDataTable(sql1).Rows[0][0].ToString();
            string sql2 = "delete project where proname='" + title + "'";                       // 删除项目表中的信息
            string sql3 = "delete Donate where ProID='" + proid + "'";                          // 删除捐献表中的信息
            if (DBHelper.ExecuteNonQuery(sql3) > 0 || DBHelper.ExecuteNonQuery(sql2) > 0)
            {
                return true;
            }
            return false;

        }

        // 展示首页信息
        public static List<Project_User> ShowProject()
        {
            List<Project_User> project = new List<Project_User>();
            string sql = "select p.Proimg,p.Proname,u.Portrait,u.Username,p.Amount,p.[Percentage],p.[State] from Project p, Users u where p.UserID=u.UserId";
            DataTable ds = DBHelper.GetDataTable(sql);
            for (int i = 0; i < ds.Rows.Count; i++)
            {
                Project_User pu = new Project_User();
                pu.Proimg = ds.Rows[i][0].ToString();
                pu.Proname = ds.Rows[i][1].ToString();
                string str1 = ds.Rows[i][2].ToString().Substring(1);
                string str2 = ".." + str1;
                pu.Portrait = str2;
                pu.Username = ds.Rows[i][3].ToString();
                pu.Amount = ds.Rows[i][4].ToString();
                pu.Percentage = ds.Rows[i][5].ToString();
                pu.State = ds.Rows[i][6].ToString();
                project.Add(pu);
            }
            return project;
        }
        // 按照项目名称查找
        public static List<Project_User> ShowProject(string title)
        {
            List<Project_User> project = new List<Project_User>();
            string sql = "select p.Proimg,p.Proname,u.Portrait,u.Username,p.Amount,p.[Percentage],p.[State] from Project p, Users u where p.UserID=u.UserId and p.Proname='" + title + "'";
            DataTable ds = DBHelper.GetDataTable(sql);
            for (int i = 0; i < ds.Rows.Count; i++)
            {
                Project_User pu = new Project_User();
                pu.Proimg = ds.Rows[i][0].ToString();
                pu.Proname = ds.Rows[i][1].ToString();
                string str1 = ds.Rows[i][2].ToString().Substring(1);
                string str2 = ".." + str1;
                pu.Portrait = str2;
                pu.Username = ds.Rows[i][3].ToString();
                pu.Amount = ds.Rows[i][4].ToString();
                pu.Percentage = ds.Rows[i][5].ToString();
                pu.State = ds.Rows[i][6].ToString();
                project.Add(pu);
            }
            return project;
        }


        // 详情页信息展示
        public static List<details> ShowDetails(string title)
        {
            List<details> dtls = new List<details>();
            // 查询项目信息
            string sql = "select p.Proname,p.Proimg,u.username,u.Portrait,p.type,p.Donprice,p.Percentage,p.Amount,p.endtime,p.Protext,p.state from users u,Project p where u.userid=p.userid and p.Proname='"+title+"'";
            DataTable ds = DBHelper.GetDataTable(sql);
            // 查询项目资助的人数
            string sql2 = "select count(*) from donate d left JOIN Project p on d.ProID=p.ProID  where p.Proname='" + title + "'";
            DataTable ds2 = DBHelper.GetDataTable(sql2);
            //创建集合
            details dtl = new details();
            // 对人数进行判断 如果没有捐献默认为0
            if (ds2.Rows.Count < 0)
            {
                dtl.Num = "0";
            }
            else
            {
                // 项目资助人数
                dtl.Num = ds2.Rows[0][0].ToString();
            }
            dtl.Proname = ds.Rows[0][0].ToString();
            dtl.Proimg = ds.Rows[0][1].ToString();
            dtl.Username = ds.Rows[0][2].ToString();
            // 头像   新创建用户头像默认为空，显示信息时必须给默认空值，否则无法正常显示
            string userImg = ds.Rows[0][3].ToString();
            if (userImg == "")
            {
                dtl.Portrait = "";
            }
            else
            {
                string str1 = ds.Rows[0][3].ToString().Substring(1);
                string str2 = ".." + str1;
                dtl.Portrait = str2;
            }
            dtl.Type = ds.Rows[0][4].ToString();
            dtl.Donprice = ds.Rows[0][5].ToString(); 
            dtl.Percentage = ds.Rows[0][6].ToString();
            dtl.Amount = ds.Rows[0][7].ToString();
            /**
             *  计算项目结束日期
             */
            // 初始化时间格式
            TimeSpan ts3 = new TimeSpan(7, 18, 23, 41, 576);
            // 分别获取结束时间的   年月日
            string year = ds.Rows[0][8].ToString().Substring(0,4);
            string month = ds.Rows[0][8].ToString().Substring(5,2);
            string day = ds.Rows[0][8].ToString().Substring(8, 2);
            // 转换时间格式
            DateTime dt1 = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
            // 获取当前时间
            DateTime dt2 = DateTime.Now;
            ts3 = dt1 - dt2;
            // 输出项目倒计时
            string days = ts3.Days + "天";
            //string days = ts3.Days + "天：" + ts3.Hours + "小时：" + ts3.Minutes + "分钟：" + ts3.Seconds + "秒";
            dtl.Endtime = days;
            dtl.Protext = ds.Rows[0][9].ToString();
            // 项目状态
            dtl.State = ds.Rows[0][10].ToString();
            dtls.Add(dtl);
            return dtls;
        }

        // 总的项目数量
        public static int projectNum()
        {
            string sql = "select ProID from Project";
            int num = DBHelper.GetDataTable(sql).Rows.Count;
            return num;
        }
        // 总的捐献人数
        public static int projectPeoNum()
        {
            string sql = "select DonId from Donate";
            int num = DBHelper.GetDataTable(sql).Rows.Count;
            return num;
        }
        // 总金额
        public static double projectMoney()
        {
            string sql = "select Donprice from Donate";
            DataTable ds = DBHelper.GetDataTable(sql);
            double money = 0;
            for (int i = 0; i < ds.Rows.Count; i++)
            {
                money += double.Parse(ds.Rows[i][0].ToString());
            }
            return money;
        }

        // 分页查询数据
        public static List<Project_User> pagesel(string tp,string state,string pg)
        {

            List<Project_User> project = new List<Project_User>();
            if (tp == "全部")
            {
                tp = "%";
            }
            if(state == "所有项目")
            {
                state = "%";
            }
            string sql = "select top 8 p.proid,p.Proimg,p.Proname,u.Portrait,u.Username,p.Amount,p.[Percentage],p.[State] from Project p left join Users u on p.UserID=u.UserId where p.Type like '" + tp + "' and p.state like '" + state + "' and p.ProID not in(select top ((" + pg + "-1)*8) ProID from Project where Type like '" + tp + "' and state like '" + state + "')";
            DataTable ds = DBHelper.GetDataTable(sql);
            if (ds != null)
            {
                for (int i = 0; i < ds.Rows.Count; i++)
                {
                    Project_User pu = new Project_User();
                    pu.Proimg = ds.Rows[i][1].ToString();
                    pu.Proname = ds.Rows[i][2].ToString();
                    // 头像   新创建用户头像默认为空，显示信息时必须给默认空值，否则无法正常显示
                    string userImg = ds.Rows[i][3].ToString();
                    if (userImg == "")
                    {
                        pu.Portrait = "";
                    }
                    else
                    {
                        string str1 = userImg.Substring(1);
                        string str2 = ".." + str1;
                        pu.Portrait = str2;
                    }
                    pu.Username = ds.Rows[i][4].ToString();
                    pu.Amount = ds.Rows[i][5].ToString();
                    pu.Percentage = ds.Rows[i][6].ToString();
                    pu.State = ds.Rows[i][7].ToString();
                    project.Add(pu);
                }
                return project;
            }
            return null;
        }

        // 页码
        public static double pagesel(string tp, string state)
        {
            if (tp == "全部")
            {
                tp = "%";
            }
            if (state == "所有项目")
            {
                state = "%";
            }
            string sql = "select ProID from Project where type like '" + tp + "' and state like '" + state + "'";
            double page = DBHelper.GetDataTable(sql).Rows.Count;                // 获取一共有多少条信息
            if (page != 0)                                                      // 没有查询到默认为  1
            {
                double page2 = Math.Ceiling(page / 8);                          // 一页8条信息，判断需要几页    进一取整
                return page2;
            }
            return 1;

        }


    }
}
