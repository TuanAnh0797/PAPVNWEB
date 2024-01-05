using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Runtime.InteropServices.ComTypes;

namespace PAPVN
{
    public class DBConnect
    {
        //public static string connection_string = "Server=192.168.3.178;Port=3306;Database=dataplc;User=TA;Password=123456;AllowLoadLocalInfile=true;";

        public static string connection_string = "Server=127.0.0.1;Port=3306;Database=dataplc;User=TA;Password=123456;AllowLoadLocalInfile=true;";

        //public static string connection_string = "Data Source=DESKTOP-CEVMTEM\\SQLEXPRESS;Initial Catalog=DataQCCheck;Integrated Security=True";

        public static DataTable StoreFillDT(string query_object, CommandType type, params object[] obj)
        {
            using (MySqlConnection conn = new MySqlConnection(connection_string))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(query_object, conn);
                cmd.CommandType = type;
                MySqlCommandBuilder.DeriveParameters(cmd);
                for (int i = 1; i <= obj.Length; i++)
                {
                    cmd.Parameters[i - 1].Value = obj[i - 1];
                }
                MySqlDataAdapter dap = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dap.Fill(dt);
                conn.Close();
                return dt;
            }
        }
        public static DataSet StoreFillDS(string query_object, CommandType type, params object[] obj)
        {
            using (MySqlConnection conn = new MySqlConnection(connection_string))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(query_object, conn);
                cmd.CommandType = type;
                MySqlCommandBuilder.DeriveParameters(cmd);
                for (int i = 1; i <= obj.Length; i++)
                {
                    cmd.Parameters[i - 1].Value = obj[i - 1];
                }
                MySqlDataAdapter dap = new MySqlDataAdapter(cmd);
                DataSet dt = new DataSet();
                dap.Fill(dt);
                conn.Close();
                return dt;
            }
        }
        public static object getscalra(string query_object, CommandType type, params object[] obj)
        {
            using (MySqlConnection conn = new MySqlConnection(connection_string))
            {
                Object data;
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(query_object, conn);
                cmd.CommandType = type;
                MySqlCommandBuilder.DeriveParameters(cmd);
                for (int i = 1; i <= obj.Length; i++)
                {
                    cmd.Parameters[i - 1].Value = obj[i - 1];
                }
                data = cmd.ExecuteScalar();
                conn.Close();
                return data;
            }
        }
        public static int exnonquery(string query_object, CommandType type, params object[] obj)
        {
            using (MySqlConnection conn = new MySqlConnection(connection_string))
            {
                int data;
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(query_object, conn);
                cmd.CommandType = type;
                MySqlCommandBuilder.DeriveParameters(cmd);
                for (int i = 1; i <= obj.Length; i++)
                {
                    cmd.Parameters[i - 1].Value = obj[i - 1];
                }
                data = cmd.ExecuteNonQuery();
                conn.Close();
                return data;
            }
        }
    }
}
