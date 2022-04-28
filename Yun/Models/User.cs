using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class User
    {
        string phone;
        string username;
        string password;
        string sex;
        string address;    // 地址
        string email;
        string usertext;   // 个人说明
        string portrait;   // 头像

        public string Phone { get => phone; set => phone = value; }
        public string Username { get => username; set => username = value; }
        public string Sex { get => sex; set => sex = value; }
        public string Address { get => address; set => address = value; }
        public string Email { get => email; set => email = value; }
        public string Usertext { get => usertext; set => usertext = value; }
        public string Password { get => password; set => password = value; }
        public string Portrait { get => portrait; set => portrait = value; }
    }
}
