using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySqlX.XDevAPI.Relational;
using MySql.Data.MySqlClient;
using static Org.BouncyCastle.Math.EC.ECCurve;
using System.Data.SqlClient;
using MySqlConnector;

namespace PAPVN
{
    public partial class UploadPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddataplan();
            }
            //else
            //{

            //}
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "Lỗi", true);
           
        }

        protected void Importdata_Click(object sender, EventArgs e)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".xlsx")
            {
                //getting the path of the file 
                string path = Server.MapPath("~/DataPlan/" + FileUpload1.FileName);
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
            string connectionString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={filePath};Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1;\"";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                // Lấy tên các sheet trong file Excel
                DataTable dtSheet = connection.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                if (dtSheet != null)
                {
                    //foreach (DataRow row in dtSheet.Rows)
                    //{
                    //    string sheetName = row["TABLE_NAME"].ToString();

                    // Đọc dữ liệu từ mỗi sheet
                    string query = $"SELECT * FROM [Daily revise(3S)_Final$]";
                  
                    using (OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        GetDataPlan(dt);
                    }
                  
                    //}
                }
            }
        }
       
        private void GetDataPlan(DataTable dt)
        {
            TimeSpan subtime = DateTime.Parse(dateto.Value) - DateTime.Parse(datefrom.Value);
            double timesec = subtime.TotalSeconds;
            int indexcolumn = (DateTime.Now.Day - 1) * 5 + 18;
            var datarow = from row in dt.AsEnumerable()
                          where row.Table.Rows.IndexOf(row) > 10 && row[indexcolumn].ToString() != "" && !row[indexcolumn].ToString().Contains("-") && row[indexcolumn].ToString() != "0" && Int32.TryParse(row[indexcolumn].ToString(), out int rs) && row[0].ToString().Contains("NR-")
                          select new
                          {
                              Model = row[0].ToString(),
                              Quantity = Int32.Parse(row[indexcolumn].ToString()),
                              QuantityPerSec = Int32.Parse(row[indexcolumn].ToString()) / timesec,
                              TotalTime = timesec,
                              TimeStart = datefrom.Value,
                              TimeEnd = dateto.Value
                          };


            DataTable datahavequantity = new DataTable();
            datahavequantity.Columns.Add("Model", typeof(string));
            datahavequantity.Columns.Add("Quantity", typeof(int));
            datahavequantity.Columns.Add("QuantityPerSec", typeof(float));
            datahavequantity.Columns.Add("TotalTime", typeof(double));
            datahavequantity.Columns.Add("TimeStart", typeof(string));
            datahavequantity.Columns.Add("TimeEnd", typeof(string));

            // Thêm dữ liệu vào DataTable
            foreach (var item in datarow)
            {
                datahavequantity.Rows.Add(item.Model, item.Quantity,item.QuantityPerSec,item.TotalTime,item.TimeStart,item.TimeEnd);
            }
            DBConnect.exnonquery("ClearAllPlan", CommandType.StoredProcedure);
            SaveMySql(datahavequantity);
            loaddataplan();



        }
        public void SaveMySql(DataTable data)
        {
            using (MySqlConnector.MySqlConnection connection = new MySqlConnector.MySqlConnection(DBConnect.connection_string))
            {
                connection.Open();
                try
                {
                    var bulkCopy = new MySqlBulkCopy(connection);
                    bulkCopy.DestinationTableName = "dataplan";
                    var result = bulkCopy.WriteToServer(data);
                }
                catch (Exception)
                {

                }
               
                connection.Close();
            }
        }
        private void loaddataplan()
        {
            string HTML = "";
            DataTable dt = DBConnect.StoreFillDT("LoadDataPlan", CommandType.StoredProcedure);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                HTML+= $"<tr> " +
                     $"<td> {dt.Rows[i]["Model"]} </td>" +
                     $"<td> {dt.Rows[i]["Quantity"]} </td>" +
                     $"<td> {dt.Rows[i]["TimeStart"]} </td>" +
                      $"<td> {dt.Rows[i]["TimeEnd"]} </td>" +
                     $"</tr>";
            }
            dt_plan.InnerHtml = HTML;

        }
    }

}