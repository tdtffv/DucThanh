using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.EntityFramework;

namespace ATBM_CK
{
    class BienToanCuc
    {
        //Hàm connect database
        public static OracleConnection GetConnect(string username, string pass)
        {
            string Server = "Data Source=(DESCRIPTION =(ADDRESS_LIST=(ADDRESS = (PROTOCOL = TCP)(HOST = " +
                "localhost)(PORT = 1521)))(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = " +
                "xe)));Password=" + pass + ";User ID=" + username;
            OracleConnection conn = new OracleConnection(Server);
            return conn;
        }
        //Lưu thông tin user
        public static string Username="";
        public static string Password="";
        public static string flag = "";
    }
}
