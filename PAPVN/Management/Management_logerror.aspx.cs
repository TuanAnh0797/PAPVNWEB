using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySqlConnector;

namespace PAPVN.Management
{
    public partial class Management_logerror : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddata();
            }
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".xlsx")
            {
                //getting the path of the file 
                string path = Server.MapPath("~/CodeError/" + FileUpload1.FileName);
                //saving the file inside the MyFolder of the server
                FileUpload1.SaveAs(path);
                ReadExcelFile(path);
                System.IO.File.Delete(path);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('File upload phải có định dạng .xlsx')", true);
            }
        }
       
        private void ReadExcelFile(string filePath)
        {
            try
            {
                string connectionString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={filePath};Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1;\"";
                using (OleDbConnection connection = new OleDbConnection(connectionString))
                {
                    connection.Open();
                    // Lấy tên các sheet trong file Excel
                    DataTable dtSheet = connection.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    if (dtSheet != null)
                    {
                        string query = $"SELECT * FROM [ErrorCode$]";
                        using (OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);
                            Getdata(dt);
                        }
                        //}
                    }
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Daily revise"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", $"alert('File excel không tồn tại Sheet:ErrorCode')", true);
                }
            }
        }
        public void Getdata( DataTable dt)
        {
            // Đẩy dữ liệu lên server
            DBConnect dBConnect = new DBConnect();
            // Xóa kế hoạch cũ
            dBConnect.exnonquery("TA_sp_ClearAllErorCode", CommandType.StoredProcedure);
            // Đẩy kế hoạch mới
            SaveMySql(dt);
            // tải lại kế hoạch mới
            loaddata();
        }
        public void SaveMySql(DataTable data)
        {
            using (MySqlConnector.MySqlConnection connection = new MySqlConnector.MySqlConnection(DBConnect.connection_string))
            {
                connection.Open();

                try
                {
                    var bulkCopy = new MySqlBulkCopy(connection);
                    bulkCopy.DestinationTableName = "codeerror";
                    var result = bulkCopy.WriteToServer(data);
                  
                }
                catch (Exception ex)
                {

                }
                connection.Close();
            }
        }

        private void loaddata()
        {
            string HTML = "";
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("TA_sp_LoadDataError", CommandType.StoredProcedure);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
              
                    
                        HTML += $"<tr> " +
                        $"<td> {dt.Rows[i]["NameMachine"].ToString()} </td>" +
                        $"<td> {dt.Rows[i]["CodeError"].ToString()} </td>" +
                        $"<td> {dt.Rows[i]["NameError"].ToString()} </td>" +
                        $"<td> {dt.Rows[i]["TimeUpdate"].ToString()} </td>" +
                        $"</tr>";
                   
                  
              
            }
            tableBody.InnerHtml = HTML;
        }
    }
}