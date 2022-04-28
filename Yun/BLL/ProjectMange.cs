using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using DAL;

namespace BLL
{
    public class ProjectMange
    {
        // 获取当前登录账号的id
        public static object userId(string userName)
        {
            return ProjectService.userId(userName);
        }


        // 发布项目时检查该项目名称时候已经被注册
        public static bool addProject(string Proname)
        {
            return ProjectService.addProject(Proname);
        }

        // 新建项目信息
        public static bool addProject(string UserId, string Proname, string Amount, string Prodays, string Type, string Proaddress, string Proimg, string Protitle, string Prophone, string Donprice)
        {
            return ProjectService.addProject(UserId, Proname, Amount, Prodays, Type, Proaddress, Proimg, Protitle, Prophone, Donprice);
        }

        // 新建发起人信息
        public static bool addAuthor(string usersID, string Messname, string Messaddress, string Messphone, string Bankname, string Bankcard)
        {
            return ProjectService.addAuthor(usersID, Messname, Messaddress, Messphone, Bankname, Bankcard);
        }

        // 获取个人创建的项目
        public static List<Project> PersonCreate(string UserId)
        {
            return ProjectService.PersonCreate(UserId);
        }
        // 获取个人创建的项目的状态
        public static List<Project> PersonCreate(string UserId, string State)
        {
            return ProjectService.PersonCreate(UserId, State);
        }


        // 获取个人捐献的项目
        public static List<Project> PersonHelp(string UserId)
        {
            return ProjectService.PersonHelp(UserId);
        }

        // 删除个人发布的项目
        public static bool delProject(string title)
        {
            return ProjectService.delProject(title);
        }


        // 展示首页信息
        public static List<Project_User> ShowProject()
        {
            return ProjectService.ShowProject();
        }
        // 按照项目名称查找
        public static List<Project_User> ShowProject(string title)
        {
            return ProjectService.ShowProject(title);
        }


        // 详情页信息展示
        public static List<details> ShowDetails(string title)
        {
            return ProjectService.ShowDetails(title);
        }


        // 项目捐献
        public static bool submit(string usernamae, string title, string money, string phone)
        {
            return DonateService.submit(usernamae,title,money,phone);
        }


        // 分页查询
        public static List<Project_User> pagesel(string tp, string state, string pg)
        {
            return ProjectService.pagesel(tp,state,pg);
        }


        // 页码
        public static double pagesel(string tp, string state)
        {
            return ProjectService.pagesel(tp, state);

        }

        // 总的项目数量
        public static int projectNum()
        {
            return ProjectService.projectNum();
        }
        // 总的捐献人数
        public static int projectPeoNum()
        {
            return ProjectService.projectPeoNum();
        }
        // 总金额
        public static double projectMoney()
        {
            return ProjectService.projectMoney();
        }



    }
}
