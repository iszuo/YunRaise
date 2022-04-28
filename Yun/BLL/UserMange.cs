using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using DAL;

namespace BLL
{
    public class UserMange
    {
        //注册时验证当前手机号是否被注册
        public static bool Register(string Phone)
        {
            return UserService.Register(Phone);
        }

        //注册方法
        public static bool Register(string Phone, string Password, string Username,string email)
        {
            return UserService.Register(Phone, Password, Username, email);
        }

        // 登录方法
        public static User Login(string phone,string password)
        {
            return UserService.Login(phone, password);
        }

        // 更改用户信息
        public static bool UpdateUser(string name, string sex, string address, string email, string show, string phone)
        {
            return UserService.UpdateUser(name, sex, address, email, show, phone);
        }

        // 更改密码
        public static bool SetPwd(string pwd_a,string pwd_b, string phone, string name)
        {
            return UserService.SetPwd(pwd_a,pwd_b, phone, name);
        }

        // 更换头像
        public static bool UpdatePic(string pic, string phone)
        {
            return UserService.UpdatePic(pic, phone);
        }

        // 更改密码   查询有没有当前账号
        public static bool updatepwd(string phone, string email)
        {
            return UserService.updatepwd(phone,email);
        }
        // 更改密码   更改密码
        public static bool updatepwd(string phone, string email, string pwd)
        {
            return UserService.updatepwd(phone, email,pwd);

        }



    }
}
