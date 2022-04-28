using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class details
    {
        string proname;         // 项目标题
        string proimg;          // 项目图片
        string username;        // 项目发起人昵称
        string portrait;        // 项目发起人头像
        string type;            // 项目类别
        string donprice;        // 项目已捐献金额
        string percentage;      // 项目捐献百分比
        string amount;          // 项目总金额
        string endtime;         // 项目结束时间
        string protext;         // 项目详情
        string num;             // 项目资助人数
        string state;           // 项目状态

        public string Proname { get => proname; set => proname = value; }
        public string Proimg { get => proimg; set => proimg = value; }
        public string Username { get => username; set => username = value; }
        public string Portrait { get => portrait; set => portrait = value; }
        public string Type { get => type; set => type = value; }
        public string Donprice { get => donprice; set => donprice = value; }
        public string Percentage { get => percentage; set => percentage = value; }
        public string Amount { get => amount; set => amount = value; }
        public string Endtime { get => endtime; set => endtime = value; }
        public string Protext { get => protext; set => protext = value; }
        public string Num { get => num; set => num = value; }
        public string State { get => state; set => state = value; }
    }
}
