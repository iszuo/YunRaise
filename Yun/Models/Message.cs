using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Message
    {
        string messname;            // 发布者姓名
        string messaddress;         // 发布者地址
        string messphone;           // 发布者电话
        string bankname;            // 银行名称
        string bankcard;            // 银行卡卡号

        public string Messname { get => messname; set => messname = value; }
        public string Messaddress { get => messaddress; set => messaddress = value; }
        public string Messphone { get => messphone; set => messphone = value; }
        public string Bankname { get => bankname; set => bankname = value; }
        public string Bankcard { get => bankcard; set => bankcard = value; }
    }
}
