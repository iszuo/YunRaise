using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace DAL
{
    public class UserService
    {
        // 注册时验证当前手机号是否被注册
        public static bool Register(string Phone)
        {
            string sql = "select Phone from Users where phone = '" + Phone + "'";
            if(DBHelper.GetDataTable(sql).Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        // 注册方法
        public static bool Register(string Phone,string Password,string Username, string email)
        {
            string sql = "insert into Users(Phone,Password,Username,Email) values('" + Phone + "','" + Password + "','" + Username + "','" + email + "')";
            if (DBHelper.ExecuteNonQuery(sql) > 0)
            {
                return true;
            }
            return false;
        }

        // 登录方法    登录之后获取到这个人的所有信息
        public static User Login(string phone, string password)
        {
            string sql = "select * from Users where Phone = '" + phone + "' and Password = '" + password + "'";
            if(DBHelper.GetDataTable(sql).Rows.Count > 0)
            {
                User use = new User();
                use.Phone = phone;
                use.Password = password;
                use.Username = DBHelper.GetDataTable(sql).Rows[0][3].ToString();
                use.Sex = DBHelper.GetDataTable(sql).Rows[0][4].ToString();
                use.Address = DBHelper.GetDataTable(sql).Rows[0][5].ToString();
                use.Email = DBHelper.GetDataTable(sql).Rows[0][6].ToString();
                use.Usertext = DBHelper.GetDataTable(sql).Rows[0][7].ToString();
                use.Portrait = DBHelper.GetDataTable(sql).Rows[0][8].ToString();
                return use;
            }
            return null;
        }

        // 更改个人信息
        public static bool UpdateUser(string name,string sex,string address,string email,string show,string phone)
        {
            string sql = "update Users set Username = '" + name + "',sex='" + sex + "',[Address]='" + address + "',Email='" + email + "',Usertext='" + show + "' where Phone='" + phone + "'";
            if (DBHelper.ExecuteNonQuery(sql) > 0)
            {
                return true;
            }
            return false;
        }

        // 更改密码
        public static bool SetPwd(string pwd_a,string pwd_b,string phone,string name)
        {
            // 查找语句
            string sql1 = "select * from users where phone='" + phone + "' and [password]='" + pwd_a + "' and username='" + name + "'";
            // 修改语句
            string sql2 = "update Users set Password = '" + pwd_b + "' where Phone='" + phone + "' and Username='" + name + "'";
            if (DBHelper.GetDataTable(sql1).Rows.Count > 0)
            {
                if (DBHelper.ExecuteNonQuery(sql2) > 0)
                {
                    return true;
                }
                return false;
            }
            return false;
        }

        // 更改头像
        public static bool UpdatePic(string pic,string phone)
        {
            string sql = "update Users set Portrait = '" + pic + "' where Phone = '" + phone + "'";
            if(DBHelper.ExecuteNonQuery(sql) > 0)
            {
                return true;
            }
            return false;
        }
       

        // 更改密码   查询有没有当前账号
        public static bool updatepwd(string phone,string email)
        {
            string sql = "select * from Users where phone='"+phone+"' and Email='"+email+"'";
            if (DBHelper.GetDataTable(sql).Rows.Count > 0)
            {
                return true;
            }
            return false;
        }
        // 更改密码   更改密码
        public static bool updatepwd(string phone, string email, string pwd)
        {
            string sql = "update Users set Password='" + pwd + "' where  phone='" + phone + "' and Email='" + email + "'";
            if (DBHelper.ExecuteNonQuery(sql) > 0)
            {
                return true;
            }
            return false;
        }



    }
}
