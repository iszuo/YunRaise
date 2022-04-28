using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Donate
    {
        string donprice;        // 捐献金额
        string dontime;         // 捐献时间
        string donphone;        // 捐献手机号

        public string Donprice { get => donprice; set => donprice = value; }
        public string Dontime { get => dontime; set => dontime = value; }
        public string Donphone { get => donphone; set => donphone = value; }
    }
}
