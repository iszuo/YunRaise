using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Project_User
    {
        string proimg;              // 项目图片
        string proname ;            // 项目标题
        string portrait;            // 发布人头像
        string username;            // 发布人昵称
        string amount;              // 项目金额
        string percentage;          // 捐献进度
        string state;               // 众筹状态

        public string Proimg { get => proimg; set => proimg = value; }
        public string Proname { get => proname; set => proname = value; }
        public string Portrait { get => portrait; set => portrait = value; }
        public string Username { get => username; set => username = value; }
        public string Amount { get => amount; set => amount = value; }
        public string Percentage { get => percentage; set => percentage = value; }
        public string State { get => state; set => state = value; }
    }
}
