using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Project
    {
        string userId;          // 用户id
        string proname;         // 项目名称
        string amount;          // 目标金额
        string prodays;         // 筹集天数
        string type;            // 类别
        string proaddress;      // 项目地点
        string proimg;          // 项目封面
        string protext;         // 项目简介
        string state;           // 项目状态
        string prophone;        // 项目手机号
        string donprice;        // 已捐金额
        string startTime;       // 开始时间
        string endTime;         // 结束时间
        string percentage;      // 百分比




        string dontime;         // 项目捐献时间

        public string UserId { get => userId; set => userId = value; }

        public string Proname { get => proname; set => proname = value; }
        public string Amount { get => amount; set => amount = value; }
        public string Prodays { get => prodays; set => prodays = value; }
        public string Type { get => type; set => type = value; }
        public string Proaddress { get => proaddress; set => proaddress = value; }
        public string Proimg { get => proimg; set => proimg = value; }
        public string Protext { get => protext; set => protext = value; }
        public string State { get => state; set => state = value; }
        public string Prophone { get => prophone; set => prophone = value; }
        public string Donprice { get => donprice; set => donprice = value; }
        public string StartTime { get => startTime; set => startTime = value; }
        public string EndTime { get => endTime; set => endTime = value; }
        public string Percentage { get => percentage; set => percentage = value; }
        public string Dontime { get => dontime; set => dontime = value; }
    }
}
